//
//  SearchRouter.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 20/08/21.
//

import Foundation
import JSFSNetwork
import UIKit
class SearchRouter: SearchRouterProtocol {
    
    static func createModule() -> SearchViewController {
        
        typealias ViewProtocols = SearchViewInputProtocol & SearchPresenterOutputProtocol
        typealias PresenterProtocols = SearchPresenterInputProtocol  & SearchInteractorOutputProtocol
        typealias InteractorProtocols = SearchInteractorInputProtocol & SearchRemoteDataManagerOutputProtocol
        
        let view:  ViewProtocols = SearchViewController()
        let presenter: PresenterProtocols = SearchPresenter()
        let interactor: InteractorProtocols = SearchInteractor()
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
    
    func presentDetail(id: Int, type: ShowType, view: UIViewController) {
        let viewController = view as? SearchViewController
        let detailViewController: DetailViewController = DetailRouter.createModule(idShow: id, type: type)
        viewController?.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
