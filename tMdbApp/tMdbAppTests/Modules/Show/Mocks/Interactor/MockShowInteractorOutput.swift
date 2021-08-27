//
//  MockShowInteractorInput.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 27/08/21.
//

import Foundation
@testable import tMdbApp

struct ShowInteractorOutputCalls {
    var didGetMovies: Bool = false
}

class MockShowInteractorOutput: ShowInteractorOutputProtocol {
    
    lazy var calls = ShowInteractorOutputCalls()
    var popularMovies: [ShowContentProtocol]?
    var topRatedMovies: [ShowContentProtocol]?
    var upcomingMovies: [ShowContentProtocol]?

    func didGetMovies(popularMovies: [ShowContentProtocol], topRatedMovies: [ShowContentProtocol], upcomingMovies: [ShowContentProtocol]) {
        calls.didGetMovies = true
        self.popularMovies = popularMovies
        self.topRatedMovies = topRatedMovies
        self.upcomingMovies = upcomingMovies
        
    }
    
    func didGetSeries(popularSeries: [ShowContentProtocol], topRatedSeries: [ShowContentProtocol]) { }

}
