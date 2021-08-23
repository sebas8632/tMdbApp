//
//  MoviesPresenter.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 22/08/21.
//

import Foundation

class MoviesPresenter: MoviesPresenterInputProtocol {
    var view: MoviesPresenterOutputProtocol?
    var interactor: MoviesInteractorInputProtocol?
    var router: MoviesRouterProtocol?
    
    var popularMovies: [MovieModel]?
    var topRatedMovies: [MovieModel]?
    var upcomingMovies: [MovieModel]?
    
    func getMovies() {
        interactor?.getMovies()
    }
}

extension MoviesPresenter: MoviesInteractorOutputProtocol {
    func didGetMovies(popularMovies: [MovieModel], topRatedMovies: [MovieModel], upcomingMovies: [MovieModel]) {
        self.popularMovies = popularMovies
        self.topRatedMovies = topRatedMovies
        self.upcomingMovies = upcomingMovies
        view?.updateInitialData()
    }
    
    
}
