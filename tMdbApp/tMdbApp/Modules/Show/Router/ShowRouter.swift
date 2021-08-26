//
//  MoviesRouter.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 22/08/21.
//

import Foundation
import JSFSNetwork
import UIKit

class ShowRouter: ShowRouterProtocol {
    
    static func createModule() -> ShowViewController {
        
        typealias viewProtocols = ShowViewProtocol & ShowPresenterOutputProtocol
        typealias presenterProtocols = ShowPresenterInputProtocol & ShowInteractorOutputProtocol
        typealias interactorProtocols = ShowInteractorInputProtocol & ShowRemoteDataManagerOutputProtocol
        
        let view: viewProtocols = ShowViewController()
        let presenter: presenterProtocols = ShowPresenter()
        let interactor: interactorProtocols = ShowInteractor()
        let remoteDataManager: ShowRemoteDataManagerInputProtocol = ShowRemoteDataManager()
        let router: ShowRouterProtocol = ShowRouter()
        
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
    
    func presentDetail(id: Int, type: ShowType, view: UIViewController) {
        let viewController = view as? ShowViewController
        let detailViewController: DetailViewController = DetailRouter.createModule(idShow: id, type: type)
        viewController?.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
