//
//  SearchProtocols.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 20/08/21.
//

import Foundation
import JSFSNetwork

protocol SearchViewInputProtocol: class {
    
    var presenter: SearchPresenterInputProtocol? { get set }

    
}

protocol SearchPresenterInputProtocol: class {
    var view: SearchPresenterOutputProtocol? { get set }
    var interactor: SearchInteractorInputProtocol? { get set }
    var router: SearchRouterProtocol? { get set }
    
    var movieList: [SearchMovieModel]? { get set }
    var seriesList: [SearchTvModel]? { get set }

    func viewDidLoad()

    func search(type: SearchType, query: String)
    func refreshSearch(type: SearchType, query: String, page: Int)
}


protocol SearchPresenterOutputProtocol: class {
    func updateTable()
    
    
}


protocol SearchInteractorInputProtocol: class {
    var presenter: SearchInteractorOutputProtocol? { get set }
    var remoteDataManager: SearchRemoteDataManagerInputProtocol? { get set }

    func search(type: SearchType, query: String, page: Int)
}


protocol SearchInteractorOutputProtocol: class {
    func didSearchMovies(movies: [SearchMovieModel])
    func didSearchSeries(series: [SearchTvModel])
}


protocol SearchRemoteDataManagerInputProtocol: class {
    var interactor: SearchRemoteDataManagerOutputProtocol? { get set }
    var sessionProvider: ProviderProtocol? { get set }
    
    func searchMovie(by query: String, page: Int)
    func searchTv(by query: String, page: Int)
}

protocol SearchRemoteDataManagerOutputProtocol: class {
    func didSearchMovie(response: SearchResponseModel<SearchMovieModel>)
    func didSearchTv(response: SearchResponseModel<SearchTvModel>)

    
}

protocol SearchRouterProtocol: class {

    static func createModule() -> SearchViewController
    
}
