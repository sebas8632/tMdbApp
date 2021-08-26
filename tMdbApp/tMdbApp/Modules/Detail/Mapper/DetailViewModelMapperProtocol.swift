//
//  DetailViewModelMapperProtocol.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 25/08/21.
//

import Foundation

protocol DetailViewModelMapperProtocol {
    func mapMovieToDetailViewModel(movie: MovieDetailModel) -> [DetailViewModelItemProtocol]
   // func mapSerieToDetailViewModel() -> DetailViewModelItem
}
