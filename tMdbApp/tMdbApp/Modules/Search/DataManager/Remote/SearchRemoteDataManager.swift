//
//  SearchRemoteDataManager.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 20/08/21.
//

import Foundation
import JSFSNetwork
class SearchRemoteDataManager: SearchRemoteDataManagerInputProtocol {
    var isPaginating: Bool?

    var sessionProvider: ProviderProtocol?
    var interactor: SearchRemoteDataManagerOutputProtocol?
    
    func searchMovie(by query: String, page: Int) {
        sessionProvider?.request(type: ResponseModel<MovieModel>.self, service: SearchService.searchMovie(query: query, page: page), completion: {[weak self] (result) in
            switch result {
            case .success(let result):
                    self?.interactor?.didSearchMovie(response: result)
            case .failure(let networkError):
                    print(networkError)
            }
        })
    }
    
    func searchSerie(by query: String, page: Int) {
        sessionProvider?.request(type: ResponseModel<SerieModel>.self, service: SearchService.searchTv(query: query, page: page), completion: { [weak self] (result) in
            switch result {
            case .success(let result):
                self?.interactor?.didSearchTv(response: result)
            case .failure(let networkError):
                print(networkError)
            }
        })
    }

}
