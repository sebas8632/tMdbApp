//
//  SearchViewController.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 21/08/21.
//

import UIKit

class SearchViewController: UIViewController, SearchViewInputProtocol {
    var presenter: SearchPresenterInputProtocol?
    @IBOutlet weak var searchComponent: SearchComponentView!
    
    var searchBar: UISearchBar?
    var tableView: UITableView?
    var menuBar: MenuBarView?
    private var menuIndex: Int = 0
    
    var activityIndicator: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupUI()
        setupTableView()
        createActivityIndicator()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let indexPathForFirstRow = IndexPath(item: 0, section: 0)
        menuBar?.menuCollection.selectItem(at: indexPathForFirstRow, animated: true, scrollPosition: .left)
    }

    private func setupUI() {
        searchBar = searchComponent.searchBar
        menuBar = searchComponent.menuBarView
        tableView = searchComponent.tableView
        
        tableView?.dataSource = self
        tableView?.delegate = self
        searchBar?.delegate = self
        menuBar?.delegate = self
        
        menuBar?.items = ["Movies", "Series"]
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.isHidden = false
    }
    
    private func setupTableView() {
        tableView?.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchCell")
    }
    
    private func createActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator?.center = view.center
        view.addSubview(activityIndicator!)
    }
    
    private func createSpinnerFooter() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let spinner: UIActivityIndicatorView = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        
        return footerView
    }
}

extension SearchViewController: SearchPresenterOutputProtocol {
    
    func updateTable() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            [weak self] in
                self?.tableView?.tableFooterView = nil
                self?.tableView?.reloadData()
                self?.activityIndicator?.stopAnimating()
                UIApplication.shared.endIgnoringInteractionEvents()
        }

    }
}


// MARK: Table View Data Source
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if menuIndex == 0 {
            return presenter?.movieList?.count ?? 0
        }
        return presenter?.seriesList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchTableViewCell
        if menuIndex == 0 {
            cell.info = presenter?.movieList?[indexPath.row]
        } else {

            cell.info = presenter?.seriesList?[indexPath.row]
        }
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let presenter = presenter, let type: ShowType = ShowType(rawValue: menuIndex) else { return }
        var id: Int
        
        if type == .movie {
            guard let list = presenter.movieList else { return }
            let item: MovieModel = list[indexPath.row]
            id = item.id

        } else {
            guard let list = presenter.seriesList else { return }
            let item: SerieModel = list[indexPath.row]
            id = item.id
        }
        presenter.goToDetail(id: id, type: type, view: self)

    }
}

// MARK: Search View Delegate
extension SearchViewController: UISearchBarDelegate {

    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        let type: ShowType = ShowType(rawValue: menuIndex) ?? .movie
        if let text = searchBar.text, !text.isEmpty {
            presenter?.search(type: type, query: text)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let type: ShowType = ShowType(rawValue: menuIndex) ?? .movie
        if let text = searchBar.text, !text.isEmpty {
            activityIndicator?.startAnimating()
            UIApplication.shared.beginIgnoringInteractionEvents()
            presenter?.resetData()
            presenter?.search(type: type, query: text)
        }
    }
}

extension SearchViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        tableView?.tableFooterView = nil
        guard !(presenter?.movieList?.isEmpty ?? true) || !(presenter?.seriesList?.isEmpty ?? true) else { return }
        let position = scrollView.contentOffset.y
        if position > (tableView!.contentSize.height-50-scrollView.frame.size.height) {
          refreshSearch()
        }
    }
    
    private func refreshSearch() {
        let type: ShowType = ShowType(rawValue: menuIndex) ?? .movie
        if let text = searchBar?.text, !text.isEmpty {
            tableView?.tableFooterView = createSpinnerFooter()
            presenter?.refreshSearch(type: type, query: text)
        }
    }
}

extension SearchViewController: MenuBarDelegate {
    func menuActions(index: Int) {
        menuIndex = index
        presenter?.resetData()
        tableView?.tableFooterView = nil
        tableView?.reloadData()
    }
    
    
}
