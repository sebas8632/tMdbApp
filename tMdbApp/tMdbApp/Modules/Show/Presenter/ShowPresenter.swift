//
//  MoviesPresenter.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 22/08/21.
//

import Foundation

class ShowPresenter: ShowPresenterInputProtocol {
    
    var view: ShowPresenterOutputProtocol?
    var interactor: ShowInteractorInputProtocol?
    var router: ShowRouterProtocol?
    
    var populars: [ShowContentProtocol]?
    var topRated: [ShowContentProtocol]?
    var upcoming: [ShowContentProtocol]?
    
    var movies: [CategoryItem]? = []
    var series: [CategoryItem]? = []
    
    func getMovies() {
        interactor?.getMovies()
    }
    
    func getSeries() {
        interactor?.getSeries()
    }
    
    
    func goToDetail(id: Int, type: ShowType) {
        router?.presentDetail(id: id, type: type, view: view as! ShowViewController)
    }
}

extension ShowPresenter: ShowInteractorOutputProtocol {
    
    func didGetMovies(popularMovies: [ShowContentProtocol], topRatedMovies: [ShowContentProtocol], upcomingMovies: [ShowContentProtocol]) {
        self.populars = popularMovies
        self.topRated = topRatedMovies
        self.upcoming = upcomingMovies
        
        movies = [CategoryItem(category: .popular, items: popularMovies),
                  CategoryItem(category: .topRated, items: topRatedMovies),
                  CategoryItem(category: .upcoming, items: upcomingMovies)
        ]
        view?.updateInitialData(type: .movie)
    }
    
    func didGetSeries(popularSeries: [ShowContentProtocol], topRatedSeries: [ShowContentProtocol], upcomingSeries: [ShowContentProtocol]) {
        self.populars = popularSeries
        self.topRated = topRatedSeries
        self.upcoming = upcomingSeries
        
        series = [CategoryItem(category: .popular, items: popularSeries),
                  CategoryItem(category: .topRated, items: topRatedSeries),
                  CategoryItem(category: .upcoming, items: upcomingSeries)
        ]
        view?.updateInitialData(type: .serie)
    }
    
}
