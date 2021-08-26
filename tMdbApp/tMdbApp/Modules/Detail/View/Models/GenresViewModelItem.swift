//
//  GenreViewModelItem.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 25/08/21.
//

import Foundation

struct GenresViewModelItem: DetailViewModelItemProtocol {
    
    var genres: [String]?
    
    var type: DetailViewModelItemType {
        return .genres
    }
    
    var sectionTitle: String {
        return "Genres"
    }
    
    var rowCount: Int {
        return genres?.count ?? 0
    }
    
}
