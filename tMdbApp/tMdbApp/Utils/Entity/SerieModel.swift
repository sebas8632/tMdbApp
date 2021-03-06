//
//  SearchTVModel.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 21/08/21.
//

import Foundation
struct SerieModel: Codable {
    
    var id: Int
    var firstAirDate: String?
    var name: String
    var posterPath: String?
    var voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstAirDate = "first_air_date"
        case name
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}

extension SerieModel: ShowContentProtocol {

    var title: String  {
        return name
    }
    
    var date: String? {
        return firstAirDate
    }
    
    var imagePath: String? {
        return posterPath
    }
}

