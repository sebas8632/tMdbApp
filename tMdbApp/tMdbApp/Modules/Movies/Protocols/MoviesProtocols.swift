//
//  MoviesProtocol.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 22/08/21.
//

import Foundation
import JSFSNetwork

protocol MoviesViewProtocol: class {
    var presenter: MoviesPresenterInputProtocol? { get set }
}

protocol MoviesPresenterInputProtocol: class {
    var view: MoviesPresenterOutputProtocol? { get set }
    var interactor: MoviesInteractorInputProtocol? { get set }
    var router: MoviesRouterProtocol? { get set }
    
    var popularMovies: [MovieModel]? { get set }
    var topRatedMovies: [MovieModel]? { get set }
    var upcomingMovies: [MovieModel]? { get set }
    
    func getMovies()
}

protocol MoviesPresenterOutputProtocol: class {
    func updateInitialData()
}

protocol MoviesInteractorInputProtocol: class {
    var remoteDataManager: MoviesRemoteDataManagerInputProtocol? { get set }
    var presenter: MoviesInteractorOutputProtocol? { get set }

    var popularMovies: [MovieModel]? { get set }
    var topRatedMovies: [MovieModel]? { get set }
    var upcomingMovies: [MovieModel]? { get set }
    
    func getMovies()
}

protocol MoviesInteractorOutputProtocol: class {
    
    func didGetMovies(popularMovies: [MovieModel],
                      topRatedMovies: [MovieModel],
                      upcomingMovies: [MovieModel])
}

protocol MoviesRemoteDataManagerInputProtocol: class {
    var sessionProvider: URLSessionProvider? { get set }
    var interactor: MoviesRemoteDataManagerOutputProtocol? { get set }

    func searchPopularMovies(group: DispatchGroup)
    func searchTopRatedMovies(group: DispatchGroup)
    func searchUpcomingMovies(group: DispatchGroup)

}

protocol MoviesRemoteDataManagerOutputProtocol: class {
    
    func didSearchPopularMovies(movies: [MovieModel])
    func didSearchTopRatedMovies(movies: [MovieModel])
    func didSearchUpcomingMovies(movies: [MovieModel])
}

protocol MoviesRouterProtocol {
    static func createModule() -> MoviesViewController
}
