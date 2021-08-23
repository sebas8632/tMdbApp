//
//  MoviesRouter.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 22/08/21.
//

import Foundation
import JSFSNetwork

class MoviesRouter: MoviesRouterProtocol {
    static func createModule() -> MoviesViewController {
        
        let view: MoviesViewProtocol & MoviesPresenterOutputProtocol = MoviesViewController()
        let presenter: MoviesPresenterInputProtocol & MoviesInteractorOutputProtocol = MoviesPresenter()
        let interactor: MoviesInteractorInputProtocol & MoviesRemoteDataManagerOutputProtocol = MoviesInteractor()
        let remoteDataManager: MoviesRemoteDataManagerInputProtocol = MoviesRemoteDataManager()
        let router: MoviesRouterProtocol = MoviesRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.remoteDataManager = remoteDataManager
        remoteDataManager.interactor = interactor
        remoteDataManager.sessionProvider = URLSessionProvider()
        
        return view as! MoviesViewController
    }
}
