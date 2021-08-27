//
//  MockSearchInteractorInput.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 26/08/21.
//

import Foundation
@testable import tMdbApp

struct SearchInteractorInputCalls {
    var didSearch: Bool = false
    var didRefreshSearch: Bool = false
}
class MockSearchInteractorInput: SearchInteractorInputProtocol {
    var presenter: SearchInteractorOutputProtocol?
    var remoteDataManager: SearchRemoteDataManagerInputProtocol?
    var totalPages: Int?
    
    lazy var calls = SearchInteractorInputCalls()
    
    func search(type: ShowType, query: String, page: Int) {
        calls.didSearch = true
    }
    
    func refreshSearch(type: ShowType, query: String, page: Int) {
        calls.didRefreshSearch = true
    }
}
