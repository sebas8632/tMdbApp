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
    
    var movieList: [MovieModel]? = []
    var seriesList: [TvModel]? = []
    var actualPage: Int? = 1

    func viewDidLoad() {
        // TODO
    }
    
    func search(type: SearchType, query: String) {
        interactor?.search(type: type, query: query, page: actualPage ?? 1)
    }
    
    func refreshSearch(type: SearchType, query: String) {
        interactor?.refreshSearch(type: type, query: query, page: actualPage ?? 1)
    }
    
    func resetData() {
        movieList = []
        seriesList = []
        actualPage = 1
    }
    
}


extension SearchPresenter: SearchInteractorOutputProtocol {
    func didSearchMovies(movies: [MovieModel], actualPage: Int) {
        if actualPage != 1 {
            self.actualPage = actualPage + 1
            movieList?.append(contentsOf: movies)
        } else {
            movieList? = movies
            self.actualPage! += 1
        }
        view?.updateTable()
    }
    
    func didSearchSeries(series: [TvModel], actualPage: Int) {
        if actualPage != 1 {
            self.actualPage = actualPage + 1
            seriesList?.append(contentsOf: series)
        } else {
            seriesList? = series
            self.actualPage! += 1
        }
        view?.updateTable()
    }
    
    
}
