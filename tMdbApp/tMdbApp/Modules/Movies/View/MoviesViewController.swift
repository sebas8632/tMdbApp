//
//  MoviesViewController.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 22/08/21.
//

import UIKit

class MoviesViewController: UIViewController, MoviesViewProtocol {
    var presenter: MoviesPresenterInputProtocol?
    @IBOutlet weak var showComponentView: ShowComponentView!
    var menuBar: MenuBarView?
    
    var movies: [SearchMovieModel] = [SearchMovieModel(id: 1, title: "Pelicula de prueba", posterPath: nil, releaseDate: "hoy", voteAverage: 2.0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showComponentView.menuBarView.items = ["Popular", "Top Rated", "Upcoming"]
        showComponentView.menuBarView.delegate = self
        setupTableView()
        menuBar = showComponentView.menuBarView
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let indexPathForFirstRow = IndexPath(item: 0, section: 0)
        showComponentView.menuBarView.menuCollection.selectItem(at: indexPathForFirstRow, animated: true, scrollPosition: .left)
    }

    private func setupTableView() {
        showComponentView.contentTableView.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchCell")
        showComponentView.contentTableView.dataSource = self
    }
}

extension MoviesViewController: MoviesPresenterOutputProtocol { }

extension MoviesViewController: MenuBarDelegate {
    func menuActions(index: Int) {
        let category: SearchCategory = SearchCategory(rawValue: index) ?? .popular
        // TODO
    }
}

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchTableViewCell
        let movie = movies[indexPath.row]
        cell.movieInfo = movie
        return cell
    }
}
