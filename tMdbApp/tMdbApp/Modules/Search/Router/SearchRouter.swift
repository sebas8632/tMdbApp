//
//  SearchRouter.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 20/08/21.
//

import Foundation
import JSFSNetwork
class SearchRouter: SearchRouterProtocol {
    static func createModule() -> SearchViewController {
        let view: SearchViewInputProtocol & SearchPresenterOutputProtocol = SearchViewController()
        let presenter: SearchPresenterInputProtocol  & SearchInteractorOutputProtocol = SearchPresenter()
        let interactor: SearchInteractorInputProtocol & SearchRemoteDataManagerOutputProtocol = SearchInteractor()
        let remoteDataManager: SearchRemoteDataManagerInputProtocol = SearchRemoteDataManager()
        let router: SearchRouterProtocol = SearchRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.remoteDataManager = remoteDataManager
        remoteDataManager.interactor = interactor
        remoteDataManager.sessionProvider = URLSessionProvider()
        
        return view as! SearchViewController
    }
    
    
}
