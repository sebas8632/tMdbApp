//
//  MockSearchRemoteDataManagerInput.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 26/08/21.
//

import Foundation
import JSFSNetwork
@testable import tMdbApp


class MockSearchRemoteDataManagerInput: SearchRemoteDataManagerInputProtocol {
    var interactor: SearchRemoteDataManagerOutputProtocol?
    
    var sessionProvider: ProviderProtocol?
    
    var isPaginating: Bool?
    
    func searchMovie(by query: String, page: Int) {
        // TODO
    }
    
    func searchSerie(by query: String, page: Int) {
        // TODO
    }
}
