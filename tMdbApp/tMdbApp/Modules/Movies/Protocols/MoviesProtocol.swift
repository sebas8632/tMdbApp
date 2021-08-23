//
//  MoviesProtocol.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 22/08/21.
//

import Foundation
import JSFSNetwork

protocol MoviesViewProtocol: class {
    var presenter: MoviesPresenterInputProtocol? { get set }
}

protocol MoviesPresenterInputProtocol: class {
    var view: MoviesPresenterOutputProtocol? { get set }
    var interactor: MoviesInteractorInputProtocol? { get set }
    var router: MoviesRouterProtocol? { get set }
}

protocol MoviesPresenterOutputProtocol: class {
    
}

protocol MoviesInteractorInputProtocol: class {
    var remoteDataManager: MoviesRemoteDataManagerInputProtocol? { get set }
    var presenter: MoviesInteractorOutputProtocol? { get set }
}

protocol MoviesInteractorOutputProtocol: class {
    
}

protocol MoviesRemoteDataManagerInputProtocol: class {
    var sessionProvider: URLSessionProvider? { get set }
    var interactor: MoviesRemoteDataManagerOutputProtocol? { get set }
    
}

protocol MoviesRemoteDataManagerOutputProtocol: class {
    
}

protocol MoviesRouterProtocol {
    static func createModule() -> MoviesViewController
}
