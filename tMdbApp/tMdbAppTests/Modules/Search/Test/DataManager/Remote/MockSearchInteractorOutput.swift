//
//  MockSearchInteractorOutput.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 26/08/21.
//

import Foundation
@testable import tMdbApp

struct SearchInteractorOutputCalls {
    var didSearchMovies: Bool = false
    var didSearchSeries: Bool = false
}

class MockSearchInteractorOutput: SearchInteractorOutputProtocol {
    
    lazy var calls = SearchInteractorOutputCalls()
    
    var movies: [MovieModel]?
    var series: [SerieModel]?
    var actualPage: Int?
    
    func didSearchMovies(movies: [MovieModel], actualPage: Int) {
        calls.didSearchMovies = true
        self.movies = movies
        self.actualPage = actualPage
    }
    
    func didSearchSeries(series: [SerieModel], actualPage: Int) {
        calls.didSearchSeries = true
        self.series = series
        self.actualPage = actualPage
    }
    
    
}
