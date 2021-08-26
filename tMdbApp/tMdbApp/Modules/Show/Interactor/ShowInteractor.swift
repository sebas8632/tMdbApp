//
//  ShowInteractor.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 22/08/21.
//

import Foundation

class ShowInteractor: ShowInteractorInputProtocol {
    
    var populars: [ShowContentProtocol]?
    var topRated: [ShowContentProtocol]?
    var upcoming: [ShowContentProtocol]?
    
    var remoteDataManager: ShowRemoteDataManagerInputProtocol?
    var presenter: ShowInteractorOutputProtocol?
    
    func getMovies() {
        let group = DispatchGroup()
        
        group.enter()
        remoteDataManager?.searchPopularMovies(group: group)
        
        group.enter()
        remoteDataManager?.searchTopRatedMovies(group: group)
        
        group.enter()
        remoteDataManager?.searchUpcomingMovies(group: group)
        
        group.notify(queue: .main) { [weak self] in
            self?.presenter?.didGetMovies(popularMovies: self?.populars ?? [],
                                          topRatedMovies: self?.topRated ?? [],
                                          upcomingMovies: self?.upcoming ?? [])
        }
    }
    
    func getSeries() {
        let group = DispatchGroup()
        
        group.enter()
        remoteDataManager?.searchPopularSeries(group: group)
        
        group.enter()
        remoteDataManager?.searchTopRatedSeries(group: group)
        
        group.enter()
        remoteDataManager?.searchUpcomingSeries(group: group)
        
        group.notify(queue: .main) { [weak self] in
            self?.presenter?.didGetSeries(popularSeries: self?.populars ?? [],
                                          topRatedSeries: self?.topRated ?? [],
                                          upcomingSeries: self?.upcoming ?? [])
        }
    }
}

extension ShowInteractor: ShowRemoteDataManagerOutputProtocol {
    
    func didSearchPopularMovies(movies: [MovieModel]) {
        populars = movies
    }
    
    func didSearchTopRatedMovies(movies: [MovieModel]) {
        topRated = movies
    }
    
    func didSearchUpcomingMovies(movies: [MovieModel]) {
        upcoming = movies
    }
    
    func didSearchPopularSeries(series: [SerieModel]) {
        populars = series
    }
    
    func didSearchTopRatedSeries(series: [SerieModel]) {
        topRated = series
    }
    
    func didSearchUpcomingSeries(series: [SerieModel]) {
        upcoming = series
    }
}
