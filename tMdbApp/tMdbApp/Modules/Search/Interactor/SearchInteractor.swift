//
//  SearchInteractor.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 20/08/21.
//

import Foundation

class SearchInteractor: SearchInteractorInputProtocol {
    
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
    
}

extension SearchInteractor: SearchRemoteDataManagerOutputProtocol {
    func didSearchMovie(response: SearchResponseModel<SearchMovieModel>) {
        let movies: [SearchMovieModel] = response.results ?? []
        presenter?.didSearchMovies(movies: movies)
    }
    
    func didSearchTv(response: SearchResponseModel<SearchTvModel>) {
        let series: [SearchTvModel] = response.results ?? []
        presenter?.didSearchSeries(series: series)
    }
    
    
}
