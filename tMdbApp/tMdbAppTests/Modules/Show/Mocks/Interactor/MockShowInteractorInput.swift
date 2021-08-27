//
//  MockShowInteractorInput.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 27/08/21.
//

import Foundation
@testable import tMdbApp

struct ShowInteractorInputCalls {
    var didGetMovies: Bool = false
}

class MockShowInteractorInput: ShowInteractorInputProtocol {
    var remoteDataManager: ShowRemoteDataManagerInputProtocol?
    var presenter: ShowInteractorOutputProtocol?
    
    var populars: [ShowContentProtocol]?
    var topRated: [ShowContentProtocol]?
    var upcoming: [ShowContentProtocol]?
    
    lazy var calls = ShowInteractorInputCalls()
    
    func getMovies() {
        calls.didGetMovies = true
        presenter?.didGetMovies(popularMovies: [MovieModel(id: 322, title: "Prueba Pelicula", posterPath: nil, releaseDate: "2020/05/14", voteAverage: nil)], topRatedMovies: [], upcomingMovies: [])
    }
    
    func getSeries() { }
    
    
}
