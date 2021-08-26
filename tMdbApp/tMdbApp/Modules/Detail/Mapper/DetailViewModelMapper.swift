//
//  DetailViewModelMapper.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 25/08/21.
//

import Foundation

class DetailViewModelMapper: DetailViewModelMapperProtocol {
    
    func mapMovieToDetailViewModel(movie: MovieDetailModel) -> [DetailViewModelItemProtocol]{
        var items = [DetailViewModelItemProtocol]()
        
        let mainInfo: MainInfoViewModelItem = MainInfoViewModelItem(posterPath: movie.posterPath, title: movie.title, tagline: movie.tagline, releaseDate: movie.releaseDate, voteAverage: movie.voteAverage)
        items.append(mainInfo)
        
        let overview: OverviewViewModelItem = OverviewViewModelItem(overview: movie.overview)
        items.append(overview)
        
        let genres = movie.getGenres()
        if !genres.isEmpty {
            items.append(GenresViewModelItem(genres: genres))
        }
        
        let companies = movie.getCompanies()
        if !companies.isEmpty {
            items.append(CompaniesViewModelItem(companies: companies))
        }
        
        return items
    }
}
