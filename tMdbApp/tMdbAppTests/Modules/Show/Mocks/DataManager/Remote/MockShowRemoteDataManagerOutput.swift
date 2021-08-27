//
//  MockRemoteDataManagerOutput.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 27/08/21.
//

import Foundation
@testable import tMdbApp

struct ShowRemoteDataManagerOutputCalls {
    var didSearchPopularMovies: Bool = false
    var didSearchTopRatedMovies: Bool = false
    var didSearchUpcomingMovies: Bool = false

}
class MockShowRemoteDataManagerOutput: ShowRemoteDataManagerOutputProtocol {
    
    lazy var calls = ShowRemoteDataManagerOutputCalls()
    var popularMovies: [MovieModel]?
    var topRatedMovies: [MovieModel]?
    var upcomingMovies: [MovieModel]?
    
    func didSearchPopularMovies(movies: [MovieModel]) {
        calls.didSearchPopularMovies = true
        popularMovies = movies
    }
    
    func didSearchTopRatedMovies(movies: [MovieModel]) {
        calls.didSearchTopRatedMovies = true
        topRatedMovies = movies
    }
    
    func didSearchUpcomingMovies(movies: [MovieModel]) {
        calls.didSearchUpcomingMovies = true
        upcomingMovies = movies
    }
    
    func didSearchPopularSeries(series: [SerieModel]) { }
    
    func didSearchTopRatedSeries(series: [SerieModel]) { }
    
    
}
