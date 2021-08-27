//
//  MockSearchRemoteDataManagerInput.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 26/08/21.
//

import Foundation
import JSFSNetwork
@testable import tMdbApp

struct SearchRemoteDataManagerInputCalls {
    var didSearchMovie: Bool = false
    var didSearchSerie: Bool = false
}

class MockSearchRemoteDataManagerInput: SearchRemoteDataManagerInputProtocol {
    var interactor: SearchRemoteDataManagerOutputProtocol?
    var sessionProvider: ProviderProtocol?
    
    var isPaginating: Bool?
    lazy var calls = SearchRemoteDataManagerInputCalls()
    
    func searchMovie(by query: String, page: Int) {
        calls.didSearchMovie = true
        sessionProvider?.request(type: ResponseModel<MovieModel>.self, service: SearchService.searchMovie(query: query, page: page), completion: { [weak self] (result) in
            switch result {
            case .success( let response):
                self?.interactor?.didSearchMovie(response: response)
            case .failure(_):
                break
            }
        })
    }
    
    func searchSerie(by query: String, page: Int) {
        calls.didSearchSerie = true
        sessionProvider?.request(type: ResponseModel<SerieModel>.self, service: SearchService.searchTv(query: query, page: page), completion: {[weak self] (result) in
            switch result {
            case .success(let response):
                self?.interactor?.didSearchTv(response: response)
            case .failure(_):
                break
            }
        })
    }
}
