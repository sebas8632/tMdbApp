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
    }

    private func setupUI() {
        searchBar = searchComponent.searchBar
        segmentedControl = searchComponent.segmentedControl
        tableView = searchComponent.tableView
        
        tableView?.dataSource = self
        searchBar?.delegate = self
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.isHidden = false
        self.title = "Search"
    }
    
    private func setupTableView() {
        tableView?.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
    }

}

extension SearchViewController: SearchPresenterOutputProtocol {
    func updateTable() {
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieTableViewCell
        if segmentedControl?.selectedSegmentIndex == 0 {
            cell.movieInfo = presenter?.movieList?[indexPath.row]
        } else {
            cell.serieInfo = presenter?.seriesList?[indexPath.row]
        }
        return cell
    }
    
    
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
            presenter?.search(type: type, query: text)
        }
    }
}
