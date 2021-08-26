//
//  MoviesViewController.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 22/08/21.
//

import UIKit

class ShowViewController: UIViewController, ShowViewProtocol {
    var presenter: ShowPresenterInputProtocol?
    @IBOutlet weak var showComponentView: ShowComponentView!
    var menuBar: MenuBarView?
    
    var items: [CategoryItem]?
    
    private var indexType: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showComponentView.menuBarView.items = ["Movies", "Series"]
        showComponentView.menuBarView.delegate = self
        setupTableView()
        menuBar = showComponentView.menuBarView
        presenter?.getMovies()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let indexPathForFirstRow = IndexPath(item: 0, section: 0)
        showComponentView.menuBarView.menuCollection.selectItem(at: indexPathForFirstRow, animated: true, scrollPosition: .left)
    }
    
    private func setupTableView() {
        showComponentView.contentTableView.register(UINib(nibName: "ItemTableCell", bundle: nil), forCellReuseIdentifier: "ItemTableCell")
        showComponentView.contentTableView.dataSource = self
        showComponentView.contentTableView.delegate = self
    }
}

// MARK: Presenter Output

extension ShowViewController: ShowPresenterOutputProtocol {
    func updateInitialData(type: ShowType) {
        
        switch type {
        case .movie:
            items = presenter?.movies
        case .serie:
            items = presenter?.series
        }
        showComponentView.contentTableView.reloadData()
    }
}

// MARK: Table View Data Source

extension ShowViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableCell") as! ItemTableCell
        let item = items?[indexPath.row]
        cell.category = item?.category
        cell.items = item?.items
        cell.actionsDelegate = self
        return cell
    }
}

// MARK: Table View Delegate

extension ShowViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(260)
    }
}

// MARK: Menu Bar Delegate

extension ShowViewController: MenuBarDelegate {
    func menuActions(index: Int) {
        indexType = index
        let type: ShowType = ShowType(rawValue: index) ?? .movie
        
        switch type {
        case .movie:
            presenter?.getMovies()
            items = presenter?.movies
        case .serie:
            presenter?.getSeries()
            items = presenter?.series
        }
        showComponentView.contentTableView.reloadData()
    }
}

extension ShowViewController: CollectionDelegate {
    func showDetail(by id: Int) {
        guard let type = ShowType(rawValue: indexType) else { return }
        presenter?.goToDetail(id: id, type: type)
    }
}
