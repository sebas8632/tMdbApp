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
    
    var segmentedControl: UISegmentedControl?
    var searchBar: UISearchBar?
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupUI()
        setupTableView()
        setupSegmentedControl()
    }

    private func setupUI() {
        searchBar = searchComponent.searchBar
        segmentedControl = searchComponent.segmentedControl
        tableView = searchComponent.tableView
        
        tableView?.dataSource = self
        tableView?.delegate = self
        searchBar?.delegate = self
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.isHidden = false
    }
    
    private func setupTableView() {
        tableView?.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchCell")
    }
    
    private func setupSegmentedControl() {
        segmentedControl?.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)

    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
            presenter?.resetData()
            tableView?.tableFooterView = nil
            tableView?.reloadData()
        
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
            self.tableView?.tableFooterView = nil
            self.tableView?.reloadData()            
    }
    
    
}


// MARK: Table View Data Source
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedControl?.selectedSegmentIndex == 0 {
            return presenter?.movieList?.count ?? 0
        }
        return presenter?.seriesList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchTableViewCell
        if segmentedControl?.selectedSegmentIndex == 0 {
            cell.info = presenter?.movieList?[indexPath.row]
        } else {
            cell.info = presenter?.seriesList?[indexPath.row]
        }
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    
}

// MARK: Search View Delegate
extension SearchViewController: UISearchBarDelegate {

    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        let type: SearchType = SearchType(rawValue: segmentedControl.hashValue) ?? .movie
        if let text = searchBar.text, !text.isEmpty {
            presenter?.search(type: type, query: text)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let type: SearchType = SearchType(rawValue: segmentedControl?.selectedSegmentIndex ?? 0) ?? .movie
        if let text = searchBar.text, !text.isEmpty {
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
        let type: SearchType = SearchType(rawValue: segmentedControl?.selectedSegmentIndex ?? 0) ?? .movie
        if let text = searchBar?.text, !text.isEmpty {
            tableView?.tableFooterView = createSpinnerFooter()
            presenter?.refreshSearch(type: type, query: text)
        }
    }
}
