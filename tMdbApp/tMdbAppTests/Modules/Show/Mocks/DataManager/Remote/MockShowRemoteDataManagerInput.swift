//
//  MockSHowRemoteDataManagerInput.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 27/08/21.
//

import Foundation
import JSFSNetwork
@testable import tMdbApp

struct ShowRemoteDataMangerInputCalls {
    var didSearchPopularMovies: Bool = false
    var didSearchTopRatedMovies: Bool = false
    var didSearchUpcomingMovies: Bool = false
}
class MockShowRemoteDataManagerInput: ShowRemoteDataManagerInputProtocol {
    var sessionProvider: ProviderProtocol?
    var interactor: ShowRemoteDataManagerOutputProtocol?
    
    lazy var calls = ShowRemoteDataMangerInputCalls()
    
    func searchPopularMovies(group: DispatchGroup) {
        calls.didSearchPopularMovies = true
        sessionProvider?.request(type: ResponseModel<MovieModel>.self, service: MoviesService.getPopular, completion: { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.interactor?.didSearchPopularMovies(movies: response.results!)
            case .failure(_):
                break
            }
            group.leave()
        })
    }
    
    func searchTopRatedMovies(group: DispatchGroup) {
        calls.didSearchTopRatedMovies = true
        sessionProvider?.request(type: ResponseModel<MovieModel>.self, service: MoviesService.getTopRated, completion: { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.interactor?.didSearchTopRatedMovies(movies: response.results!)
            case .failure(_):
                break
            }
            group.leave()
        })
    }
    
    func searchUpcomingMovies(group: DispatchGroup) {
        calls.didSearchUpcomingMovies = true
        sessionProvider?.request(type: ResponseModel<MovieModel>.self, service: MoviesService.getUpcoming, completion: { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.interactor?.didSearchUpcomingMovies(movies: response.results!)
            case .failure(_):
                break
            }
            group.leave()
        })
    }
    
    func searchPopularSeries(group: DispatchGroup) { }
    
    func searchTopRatedSeries(group: DispatchGroup) { }
    
    
}
