//
//  HomeRouter.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 21/08/21.
//

import Foundation
class HomeRouter: HomeRouterProtocol {
    static func createModule() -> MainViewController {
        let view: HomeViewProtocol  = MainViewController()
        let presenter: HomePresenterInputProtocol = HomePresenter()
        let router: HomeRouter = HomeRouter()
        
        view.presenter = presenter
        presenter.router = router
        
        return view as! MainViewController
    }
    
    func presentSearchView(from view: HomeViewProtocol) {
        let viewController = view as? MainViewController
        let searchVC: SearchViewController = SearchRouter.createModule()
        viewController?.navigationController?.pushViewController(searchVC, animated: true)
    }
    
    func presentMoviesView(from view: HomeViewProtocol) {
        
    }
    
    func presentTvView(from view: HomeViewProtocol) {
        
    }
    
    
}
