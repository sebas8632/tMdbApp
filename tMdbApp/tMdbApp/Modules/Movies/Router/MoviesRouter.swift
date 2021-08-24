//
//  MoviesRouter.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 22/08/21.
//

import Foundation
import JSFSNetwork

class MoviesRouter: ShowRouterProtocol {
    static func createModule() -> ShowViewController {
        
        typealias viewProtocols = ShowViewProtocol & ShowPresenterOutputProtocol
        typealias presenterProtocols = ShowPresenterInputProtocol & ShowInteractorOutputProtocol
        typealias interactorProtocols = ShowInteractorInputProtocol & ShowRemoteDataManagerOutputProtocol
        
        let view: viewProtocols = ShowViewController()
        let presenter: presenterProtocols = ShowPresenter()
        let interactor: interactorProtocols = ShowInteractor()
        let remoteDataManager: ShowRemoteDataManagerInputProtocol = ShowRemoteDataManager()
        let router: ShowRouterProtocol = MoviesRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.remoteDataManager = remoteDataManager
        remoteDataManager.interactor = interactor
        remoteDataManager.sessionProvider = URLSessionProvider()
        
        return view as! ShowViewController
    }
}
