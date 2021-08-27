//
//  MoviesPresenter.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 22/08/21.
//

import Foundation
import UIKit
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
    
    
    func goToDetail(id: Int, type: ShowType, view: UIViewController) {
        router?.presentDetail(id: id, type: type, view: view)
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
    
    func didGetSeries(popularSeries: [ShowContentProtocol], topRatedSeries: [ShowContentProtocol]) {
        self.populars = popularSeries
        self.topRated = topRatedSeries
        
        series = [CategoryItem(category: .popular, items: popularSeries),
                  CategoryItem(category: .topRated, items: topRatedSeries)
        ]
        view?.updateInitialData(type: .serie)
    }
    
}
