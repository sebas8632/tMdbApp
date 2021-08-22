//
//  HomePresenter.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 21/08/21.
//

import Foundation

class HomePresenter: HomePresenterInputProtocol {

    var router: HomeRouterProtocol?
    
    func goToSearchView(from: HomeViewProtocol) {
        router?.presentSearchView(from: from)
    }
    
    func goToMoviewView(from: HomeViewProtocol) {
        router?.presentMoviesView(from: from)
    }
    
    func goToTVViews(from: HomeViewProtocol) {
        router?.presentTvView(from: from)
    }
    
}
