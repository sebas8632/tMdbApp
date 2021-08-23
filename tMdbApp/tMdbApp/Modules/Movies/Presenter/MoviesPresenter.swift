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
    
    
}

extension MoviesPresenter: MoviesInteractorOutputProtocol {
    
}
