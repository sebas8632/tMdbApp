//
//  MockShowPresenterInput.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 27/08/21.
//

import Foundation
import UIKit
@testable import tMdbApp

struct ShowPresenterInputCalls {
    var didGetMovies: Bool = false
    var didGoToDetail: Bool = false

}

class MockShowPresenterInput: ShowPresenterInputProtocol {
    var view: ShowPresenterOutputProtocol?
    var interactor: ShowInteractorInputProtocol?
    var router: ShowRouterProtocol?
    
    var populars: [ShowContentProtocol]?
    var topRated: [ShowContentProtocol]?
    var upcoming: [ShowContentProtocol]?
    
    var movies: [CategoryItem]?
    var series: [CategoryItem]?
    
    lazy var calls = ShowPresenterInputCalls()
    
    func getMovies() {
        calls.didGetMovies = true
        movies?.append(CategoryItem(category: .popular, items: [MovieModel(id: 123, title: "Prueba", posterPath: nil, releaseDate: "2020/01/04", voteAverage: nil),
        MovieModel(id: 234, title: "Prueba 2", posterPath: nil, releaseDate: "2019/07/25", voteAverage: nil)]))
        
        self.view?.updateInitialData(type: .movie)
    }
    
    func getSeries() { }
    
    func goToDetail(id: Int, type: ShowType, view: UIViewController) {
        calls.didGoToDetail = true
    }
    
    
}
