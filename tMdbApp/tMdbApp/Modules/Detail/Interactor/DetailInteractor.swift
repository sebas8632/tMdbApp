//
//  DetailInteractor.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 24/08/21.
//

import Foundation

class DetailInteractor: DetailInteractorInputProtocol {
    var detailViewModelMapper: DetailViewModelMapperProtocol?
    var presenter: DetailInteractorOutputProtocol?    
    var remoteDataManager: DetailRemoteDataManagerInputProtocol?
    
    var idShow: Int?
    var type: ShowType?
    
    func getDetails() {
        guard let id = idShow else { return }
        switch type {
        case .movie:
            remoteDataManager?.fetchMovieDetail(idShow: id)
        case .tv:
            //TODO
            break
        case .none:
            break
        }
    }

}

extension DetailInteractor: DetailRemoteDataManagerOutputProtocol {
    func didFetchMovieDetail(movieDetail: MovieDetailModel) {
        guard let mapper = detailViewModelMapper else { return }
        
        let items: [DetailViewModelItemProtocol] = mapper.mapMovieToDetailViewModel(movie: movieDetail)
        presenter?.didGetDetailViewModel(items: items)
    }
    
    
}
