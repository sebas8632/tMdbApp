//
//  SearchProtocols.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 20/08/21.
//

import Foundation
import JSFSNetwork
import UIKit
protocol SearchViewInputProtocol: class {
    
    var presenter: SearchPresenterInputProtocol? { get set }

    
}

protocol SearchPresenterInputProtocol: class {
    var view: SearchPresenterOutputProtocol? { get set }
    var interactor: SearchInteractorInputProtocol? { get set }
    var router: SearchRouterProtocol? { get set }
    
    var movieList: [MovieModel]? { get set }
    var seriesList: [SerieModel]? { get set }
    var actualPage: Int? { get set }
    
    func search(type: ShowType, query: String)
    func refreshSearch(type: ShowType, query: String)
    func resetData()
    
    func goToDetail(id: Int, type: ShowType, view: UIViewController)
}


protocol SearchPresenterOutputProtocol: class {
    func updateTable()    
    
}


protocol SearchInteractorInputProtocol: class {
    var presenter: SearchInteractorOutputProtocol? { get set }
    var remoteDataManager: SearchRemoteDataManagerInputProtocol? { get set }
    var totalPages: Int? { get set }

    func search(type: ShowType, query: String, page: Int)
    func refreshSearch(type: ShowType, query: String, page: Int)
}


protocol SearchInteractorOutputProtocol: class {
    func didSearchMovies(movies: [MovieModel], actualPage: Int)
    func didSearchSeries(series: [SerieModel], actualPage: Int)
}


protocol SearchRemoteDataManagerInputProtocol: class {
    var interactor: SearchRemoteDataManagerOutputProtocol? { get set }
    var sessionProvider: ProviderProtocol? { get set }
    var isPaginating: Bool? { get set }
    
    func searchMovie(by query: String, page: Int)
    func searchSerie(by query: String, page: Int)
}

protocol SearchRemoteDataManagerOutputProtocol: class {
    func didSearchMovie(response: ResponseModel<MovieModel>)
    func didSearchTv(response: ResponseModel<SerieModel>)

    
}

protocol SearchRouterProtocol: class {
    static func createModule() -> SearchViewController
    func presentDetail(id: Int, type: ShowType, view: UIViewController)

}
