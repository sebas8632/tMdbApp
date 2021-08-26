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
    
    func search(type: ShowType, query: String, page: Int) {
        switch type {
        case .movie:
            remoteDataManager?.searchMovie(by: query, page: page)
        case .serie:
            remoteDataManager?.searchSerie(by: query, page: page)
        }
    }
    
    func refreshSearch(type: ShowType, query: String, page: Int) {
        
        guard let remoteDataManager = remoteDataManager, let isPaginating = remoteDataManager.isPaginating else { return }
        
        guard !isPaginating else {
            return
        }
        remoteDataManager.isPaginating = true
        switch type {
        case .movie:
            remoteDataManager.searchMovie(by: query, page: page)
        case .serie:
            remoteDataManager.searchSerie(by: query, page: page)
            
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
    
    func didSearchTv(response: ResponseModel<SerieModel>) {
        totalPages = response.totalPages
        let series: [SerieModel] = response.results ?? []
        self.remoteDataManager?.isPaginating = false
        self.presenter?.didSearchSeries(series: series, actualPage: response.page)
    }
    
    
}
