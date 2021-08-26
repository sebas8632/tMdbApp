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
    var seriesList: [SerieModel]? = []
    var actualPage: Int? = 1

    func viewDidLoad() {
        // TODO
    }
    
    func search(type: ShowType, query: String) {
        interactor?.search(type: type, query: query, page: actualPage ?? 1)
    }
    
    func refreshSearch(type: ShowType, query: String) {
        interactor?.refreshSearch(type: type, query: query, page: actualPage ?? 1)
    }
    
    func resetData() {
        movieList = []
        seriesList = []
        actualPage = 1
    }
    
    func goToDetail(id: Int, type: ShowType) {
        router?.presentDetail(id: id, type: type, view: view as! SearchViewController)
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
    
    func didSearchSeries(series: [SerieModel], actualPage: Int) {
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
