//
//  MockSearchPresenterInput.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 26/08/21.
//

import Foundation
import UIKit

@testable import tMdbApp

struct SearchPresenterInputCalls {
    var didSearch: Bool = false
    var didRefresh: Bool = false
    var didResetData: Bool = false
    var didGoToDetail: Bool = false
}
class MockSearchPresenterInput: SearchPresenterInputProtocol {
   
    var view: SearchPresenterOutputProtocol?
    var interactor: SearchInteractorInputProtocol?
    var router: SearchRouterProtocol?
    
    var movieList: [MovieModel]?
    var seriesList: [SerieModel]?
    var actualPage: Int?
    
    lazy var calls = SearchPresenterInputCalls()
    
    func search(type: ShowType, query: String) {
        calls.didSearch = true
    }
    
    func refreshSearch(type: ShowType, query: String) {
        calls.didRefresh = true
    }
    
    func resetData() {
        calls.didResetData = true
    }
    
    func goToDetail(id: Int, type: ShowType, view: UIViewController) {
        calls.didGoToDetail = true
    }
    
    
}
