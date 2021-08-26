//
//  ShowDetailModel.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 25/08/21.
//

import Foundation

struct MovieDetailModel: Codable {
    var posterPath: String?
    var title: String
    var tagline: String?
    var releaseDate: String?
    var voteAverage: Double?
    var genres: [GenreModel]?
    var overview: String?
    var productionCompanies: [ProductCompany]?
    var video: Bool?
    
    enum CodingKeys: String, CodingKey {
        case title
        case releaseDate = "release_date"
        case genres = "genres"
        case tagline
        case voteAverage = "vote_average"
        case overview
        case productionCompanies = "production_companies"
        case video
        case posterPath = "poster_path"
    }
    
    func getGenres() -> [String] {
        
        let genresName: [String]? = genres?.map{
             $0.name
        }
        return genresName ?? []
    }
    
    func getCompanies() -> [String] {
        
        let companies: [String]? = productionCompanies?.map{
             $0.name
        }
        return companies ?? []
    }
}

struct GenreModel: Codable {
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
    

}

struct ProductCompany: Codable {
    var name: String

    enum CodingKeys: String, CodingKey {
        case name
    }
}
