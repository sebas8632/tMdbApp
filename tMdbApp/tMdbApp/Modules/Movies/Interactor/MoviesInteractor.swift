//
//  MoviesInteractor.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 22/08/21.
//

import Foundation

class MoviesInteractor: MoviesInteractorInputProtocol {

    var popularMovies: [MovieModel]?
    
    var topRatedMovies: [MovieModel]?
    
    var upcomingMovies: [MovieModel]?
    
    var remoteDataManager: MoviesRemoteDataManagerInputProtocol?
    var presenter: MoviesInteractorOutputProtocol?
    
    func getMovies() {
        let group = DispatchGroup()
        
        group.enter()
        remoteDataManager?.searchPopularMovies(group: group)
        
        group.enter()
        remoteDataManager?.searchTopRatedMovies(group: group)
        
        group.enter()
        remoteDataManager?.searchUpcomingMovies(group: group)
        
        group.notify(queue: .main) { [weak self] in
            self?.presenter?.didGetMovies(popularMovies: self?.popularMovies ?? [],
                                    topRatedMovies: self?.topRatedMovies ?? [],
                                    upcomingMovies: self?.upcomingMovies ?? [])
        }
    }
}

extension MoviesInteractor: MoviesRemoteDataManagerOutputProtocol {
    func didSearchPopularMovies(movies: [MovieModel]) {
        popularMovies = movies
    }
    
    func didSearchTopRatedMovies(movies: [MovieModel]) {
        topRatedMovies = movies
    }
    
    func didSearchUpcomingMovies(movies: [MovieModel]) {
        upcomingMovies = movies
    }
    
    
}
