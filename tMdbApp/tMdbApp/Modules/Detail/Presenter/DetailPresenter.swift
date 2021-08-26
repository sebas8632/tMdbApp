//
//  DetailPresenter.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 24/08/21.
//

import Foundation

class DetailPresenter: DetailPresenterInputProtocol {
    var view: DetailPresenterOutputProtocol?
    var interactor: DetailInteractorInputProtocol?
    var router: DetailRouterProtocol?
    
    var detailItems: [DetailViewModelItemProtocol]?
    
    func viewDidLoad() {
        interactor?.getDetails()
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    func didGetDetailViewModel(items: [DetailViewModelItemProtocol]) {
        detailItems = items
        view?.updateData()
    }

    
}
