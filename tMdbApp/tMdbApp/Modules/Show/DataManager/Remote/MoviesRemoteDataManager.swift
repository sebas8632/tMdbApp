//
//  MoviesRemoteDataManager.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 22/08/21.
//

import Foundation
import JSFSNetwork

class ShowRemoteDataManager: ShowRemoteDataManagerInputProtocol {
    
    var sessionProvider: URLSessionProvider?
    var interactor: ShowRemoteDataManagerOutputProtocol?
   
    func searchPopularMovies(group: DispatchGroup) {
        sessionProvider?.request(type: ResponseModel<MovieModel>.self, service: MoviesService.getPopular, completion: { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.interactor?.didSearchPopularMovies(movies: response.results ?? [])
            case .failure(let networkError):
                print(networkError)
            }
            group.leave()
        })
    }
    
    func searchTopRatedMovies(group: DispatchGroup) {
        sessionProvider?.request(type: ResponseModel<MovieModel>.self, service: MoviesService.getTopRated, completion: { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.interactor?.didSearchTopRatedMovies(movies: response.results ?? [])
            case .failure(let networkError):
                print(networkError)
            }
            group.leave()
        })
    }
    
    func searchUpcomingMovies(group: DispatchGroup) {
        sessionProvider?.request(type: ResponseModel<MovieModel>.self, service: MoviesService.getUpcoming, completion: { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.interactor?.didSearchUpcomingMovies(movies: response.results ?? [])
            case .failure(let networkError):
                print(networkError)
            }
            group.leave()
        })
    }
}
