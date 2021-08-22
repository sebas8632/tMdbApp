//
//  SearchPresenter.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 20/08/21.
//

import Foundation

class SearchPresenter: SearchPresenterInputProtocol {

    var view: SearchPresenterOutputProtocol?
    var interactor: SearchInteractorInputProtocol?
    var router: SearchRouterProtocol?
    
    var movieList: [SearchMovieModel]? = []
    var seriesList: [SearchTvModel]? = []
    func viewDidLoad() {
        // TODO
    }
    
    func search(type: SearchType, query: String) {
        interactor?.search(type: type, query: query, page: 1)
    }
    
    func refreshSearch(type: SearchType, query: String, page: Int) {
        // TODO
    }
    
}


extension SearchPresenter: SearchInteractorOutputProtocol {
    func didSearchMovies(movies: [SearchMovieModel]) {
        movieList? = movies
        view?.updateTable()
    }
    
    func didSearchSeries(series: [SearchTvModel]) {
        seriesList? = series
        
        view?.updateTable()
    }
    
    
}
