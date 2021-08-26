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
    
    func mapSerieToDetailViewModel(serie: SerieDetailModel) -> [DetailViewModelItemProtocol] {
        var items = [DetailViewModelItemProtocol]()
        
        let mainInfo: MainInfoViewModelItem = MainInfoViewModelItem(posterPath: serie.posterPath, title: serie.name, tagline: serie.tagline, releaseDate: "", voteAverage: serie.voteAverage)
        items.append(mainInfo)
        
        let datesOnAir: DatesOnAirViewModelItem = DatesOnAirViewModelItem(firstAirDate: serie.firstAirDate, lasAirDate: serie.lastAirDate)
        items.append(datesOnAir)
        let overview: OverviewViewModelItem = OverviewViewModelItem(overview: serie.overview)
        items.append(overview)
        
        let seasonInfo: SeasonInfoViewModelItem = SeasonInfoViewModelItem(numberOfSeasons: serie.numberOfSeasons, numberOfEpisodes: serie.numberOfEpisodes)
        items.append(seasonInfo)
        
        let companies = serie.getCompanies()
        if !companies.isEmpty {
            items.append(CompaniesViewModelItem(companies: companies))
        }
        
        let creators = serie.createdBy
        if !creators.isEmpty {
            items.append(CreatedByViewModelItem(creators: creators))
        }
        
        return items
    }
}
