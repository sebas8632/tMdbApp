//
//  MoviesProtocol.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 22/08/21.
//

import Foundation
import JSFSNetwork
import UIKit

protocol ShowViewProtocol: class {
    var presenter: ShowPresenterInputProtocol? { get set }
}

protocol ShowPresenterInputProtocol: class {
    var view: ShowPresenterOutputProtocol? { get set }
    var interactor: ShowInteractorInputProtocol? { get set }
    var router: ShowRouterProtocol? { get set }
    
    var populars: [ShowContentProtocol]? { get set }
    var topRated: [ShowContentProtocol]? { get set }
    var upcoming: [ShowContentProtocol]? { get set }

    var movies: [CategoryItem]? { get set }
    var series: [CategoryItem]? { get set }

    func getMovies()
    func getSeries()
    func goToDetail(id: Int, type: ShowType)
}

protocol ShowPresenterOutputProtocol: class {
    func updateInitialData(type: ShowType)
}

protocol ShowInteractorInputProtocol: class {
    var remoteDataManager: ShowRemoteDataManagerInputProtocol? { get set }
    var presenter: ShowInteractorOutputProtocol? { get set }

    var populars: [ShowContentProtocol]? { get set }
    var topRated: [ShowContentProtocol]? { get set }
    var upcoming: [ShowContentProtocol]? { get set }
    
    func getMovies()
    func getSeries()
    
}

protocol ShowInteractorOutputProtocol: class {
    
    func didGetMovies(popularMovies: [ShowContentProtocol],
                      topRatedMovies: [ShowContentProtocol],
                      upcomingMovies: [ShowContentProtocol])
    
    func didGetSeries(popularSeries: [ShowContentProtocol],
                      topRatedSeries: [ShowContentProtocol])
}

protocol ShowRemoteDataManagerInputProtocol: class {
    var sessionProvider: URLSessionProvider? { get set }
    var interactor: ShowRemoteDataManagerOutputProtocol? { get set }

    func searchPopularMovies(group: DispatchGroup)
    func searchTopRatedMovies(group: DispatchGroup)
    func searchUpcomingMovies(group: DispatchGroup)
    
    func searchPopularSeries(group: DispatchGroup)
    func searchTopRatedSeries(group: DispatchGroup)

}

protocol ShowRemoteDataManagerOutputProtocol: class {
    
    func didSearchPopularMovies(movies: [MovieModel])
    func didSearchTopRatedMovies(movies: [MovieModel])
    func didSearchUpcomingMovies(movies: [MovieModel])
    
    func didSearchPopularSeries(series: [SerieModel])
    func didSearchTopRatedSeries(series: [SerieModel])
}

protocol ShowRouterProtocol {
    static func createModule() -> ShowViewController
    func presentDetail(id: Int, type: ShowType, view: UIViewController)
}
