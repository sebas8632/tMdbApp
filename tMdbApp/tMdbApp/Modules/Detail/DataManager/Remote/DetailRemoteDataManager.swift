//
//  DetailRemoteDataManager.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 24/08/21.
//

import Foundation
import JSFSNetwork

class DetailRemoteDataManager: DetailRemoteDataManagerInputProtocol {
    
    var sessionProvider: ProviderProtocol?
    var interactor: DetailRemoteDataManagerOutputProtocol?

    func fetchMovieDetail(idShow: Int) {
        sessionProvider?.request(type: MovieDetailModel.self, service: DetailService.movie(id: "\(idShow)"), completion: { [weak self] (result) in
            switch result {
            case .success(let model):
                self?.interactor?.didFetchMovieDetail(movieDetail: model)
            case .failure(let networkError):
                print(networkError)
                break
            }
        })
    }

    func fetchSerieDetail(idShow: Int) {
        sessionProvider?.request(type: SerieDetailModel.self, service: DetailService.serie(id: "\(idShow)"), completion: { [weak self] (result) in
            switch result {
            case .success(let model):
                self?.interactor?.didFetchSerieDetail(serieDetail: model)
            case .failure(let networkError):
            print(networkError)
            }
        })
    }
}
