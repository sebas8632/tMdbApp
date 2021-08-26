//
//  DetailProtocols.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 24/08/21.
//

import Foundation
import JSFSNetwork

protocol  DetailViewProtocol: class {
    var presenter: DetailPresenterInputProtocol? { get set }
}

protocol DetailPresenterInputProtocol: class {
    var view: DetailPresenterOutputProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    var router: DetailRouterProtocol? { get set }
    
    var detailItems: [DetailViewModelItemProtocol]? { get set }

    
    func viewDidLoad()
    
}

protocol DetailPresenterOutputProtocol: class {
    func updateData()
}

protocol DetailInteractorInputProtocol: class {
    var presenter: DetailInteractorOutputProtocol? { get set }
    var remoteDataManager: DetailRemoteDataManagerInputProtocol? { get set }
    var detailViewModelMapper: DetailViewModelMapperProtocol? { get set }
    var idShow: Int? { get set }
    var type: ShowType? { get set }
    
    func getDetails()

}

protocol DetailInteractorOutputProtocol: class {
    func didGetDetailViewModel(items: [DetailViewModelItemProtocol])

}

protocol DetailRemoteDataManagerInputProtocol: class {
    var sessionProvider: ProviderProtocol? { get set }
    var interactor: DetailRemoteDataManagerOutputProtocol? { get set }
    
    func fetchMovieDetail(idShow: Int)

}

protocol DetailRemoteDataManagerOutputProtocol: class {
    func didFetchMovieDetail(movieDetail: MovieDetailModel)
}

protocol DetailRouterProtocol: class {
    static func createModule(idShow: Int, type: ShowType) -> DetailViewController
}
