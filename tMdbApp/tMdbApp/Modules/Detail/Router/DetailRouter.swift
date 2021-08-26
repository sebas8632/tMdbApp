//
//  DetailRouter.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 24/08/21.
//

import Foundation
import JSFSNetwork

class DetailRouter: DetailRouterProtocol {
    static func createModule(idShow: Int, type: ShowType) -> DetailViewController {
        typealias ViewProtocols = DetailViewProtocol & DetailPresenterOutputProtocol
        typealias PresenterProtocols = DetailPresenterInputProtocol & DetailInteractorOutputProtocol
        typealias InteractorProtocols = DetailInteractorInputProtocol & DetailRemoteDataManagerOutputProtocol
        
        let view: ViewProtocols = DetailViewController()
        let presenter: PresenterProtocols = DetailPresenter()
        let interactor: InteractorProtocols = DetailInteractor()
        let remoteDataManager: DetailRemoteDataManagerInputProtocol = DetailRemoteDataManager()
        let router: DetailRouterProtocol = DetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.remoteDataManager = remoteDataManager
        interactor.idShow = idShow
        interactor.type = type
        interactor.detailViewModelMapper = DetailViewModelMapper()
        remoteDataManager.sessionProvider = URLSessionProvider()
        remoteDataManager.interactor = interactor
        
        return view as! DetailViewController
    }
    
    
}
