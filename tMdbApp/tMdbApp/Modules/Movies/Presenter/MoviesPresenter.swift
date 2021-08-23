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
    
    var popularMovies: [SearchMovieModel]?
    var topRatedMovies: [SearchMovieModel]?
    var upcomingMovies: [SearchMovieModel]?
    
    func getMovies() {
        interactor?.getMovies()
    }
}

extension MoviesPresenter: MoviesInteractorOutputProtocol {
    func didGetMovies(popularMovies: [SearchMovieModel], topRatedMovies: [SearchMovieModel], upcomingMovies: [SearchMovieModel]) {
        self.popularMovies = popularMovies
        self.topRatedMovies = topRatedMovies
        self.upcomingMovies = upcomingMovies
        view?.updateInitialData()
    }
    
    
}
