//
//  MainInfoViewModel.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 25/08/21.
//

import Foundation

struct MainInfoViewModelItem: DetailViewModelItemProtocol {
    
    var posterPath: String?
    var title: String
    var tagline: String?
    var releaseDate: String?
    var voteAverage: Double?
    
    var type: DetailViewModelItemType {
        return .mainInfo
    }
    var sectionTitle: String {
        return "Main Information"
    }

    
    
    
}
