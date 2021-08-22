//
//  HomeProtocols.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 21/08/21.
//

import Foundation

protocol HomeViewProtocol: class {
    var presenter: HomePresenterInputProtocol? { get set }
}

protocol HomePresenterInputProtocol: class {
    var router: HomeRouterProtocol? { get set }
    
    func goToSearchView(from: HomeViewProtocol)
    func goToMoviewView(from: HomeViewProtocol)
    func goToTVViews(from: HomeViewProtocol)
}

protocol HomeRouterProtocol: class {
    static func createModule() -> MainViewController
    func presentSearchView(from view: HomeViewProtocol)
    func presentMoviesView(from view: HomeViewProtocol)
    func presentTvView(from view: HomeViewProtocol)
}
