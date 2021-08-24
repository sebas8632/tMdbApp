//
//  SearchMovieModel.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 21/08/21.
//

import Foundation
struct MovieModel: Codable {
    var id: Int
    var title: String
    var posterPath: String?
    var releaseDate: String
    var voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}

extension MovieModel: ShowContentProtocol {

    var date: String? {
        return releaseDate
    }
    
    var imagePath: String? {
        return posterPath
    }
    
    
}
