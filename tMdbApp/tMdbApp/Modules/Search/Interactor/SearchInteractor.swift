//
//  SearchInteractor.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 20/08/21.
//

import Foundation

class SearchInteractor: SearchInteractorInputProtocol {
    
    var totalPages: Int? = 1
    
    var presenter: SearchInteractorOutputProtocol?
    var remoteDataManager: SearchRemoteDataManagerInputProtocol?
    
    func search(type: SearchType, query: String, page: Int) {
        switch type {
        case .movie:
            remoteDataManager?.searchMovie(by: query, page: page)
        case .tv:
            remoteDataManager?.searchTv(by: query, page: page)
        }
    }
    
    func refreshSearch(type: SearchType, query: String, page: Int) {
        
        guard let remoteDataManager = remoteDataManager, let isPaginating = remoteDataManager.isPaginating else { return }
        
        guard !isPaginating else {
            return
        }
        remoteDataManager.isPaginating = true
        switch type {
        case .movie:
            remoteDataManager.searchMovie(by: query, page: page)
        case .tv:
            remoteDataManager.searchTv(by: query, page: page)
            
        }
    }
    
}

extension SearchInteractor: SearchRemoteDataManagerOutputProtocol {
    
    func didSearchMovie(response: ResponseModel<MovieModel>) {
        totalPages = response.totalPages
        let movies: [MovieModel] = response.results ?? []
        self.remoteDataManager?.isPaginating = false
        self.presenter?.didSearchMovies(movies: movies, actualPage: response.page)
    }
    
    func didSearchTv(response: ResponseModel<TvModel>) {
        totalPages = response.totalPages
        let series: [TvModel] = response.results ?? []
        self.remoteDataManager?.isPaginating = false
        self.presenter?.didSearchSeries(series: series, actualPage: response.page)
    }
    
    
}
