//
//  SerieDetailModel.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 26/08/21.
//

import Foundation

struct SerieDetailModel: Codable {
    var posterPath: String?
    var name: String
    var tagline: String?
    var firstAirDate: String?
    var lastAirDate: String?
    var voteAverage: Double?
    var overview: String?
    var productionCompanies: [ProductCompany]?
    var numberOfSeasons: Int
    var numberOfEpisodes: Int
    var createdBy: [CreatorModel]
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case name
        case tagline
        case firstAirDate = "first_air_date"
        case lastAirDate = "last_air_date"
        case voteAverage = "vote_average"
        case overview
        case productionCompanies = "production_companies"
        case numberOfSeasons = "number_of_seasons"
        case numberOfEpisodes = "number_of_episodes"
        case createdBy = "created_by"
    }
    
    func getCompanies() -> [String] {
        
        let companies: [String]? = productionCompanies?.map{
            $0.name
        }
        return companies ?? []
    }
}

struct CreatorModel: Codable {
    var name: String
    var profilePath: String?
    
    
    enum CodingKeys: String, CodingKey {
        case name
        case profilePath = "profile_path"
    }
}
