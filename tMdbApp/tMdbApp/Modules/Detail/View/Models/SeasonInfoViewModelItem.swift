//
//  SeasonInfoViewModelItem.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 26/08/21.
//

import Foundation

struct SeasonInfoViewModelItem: DetailViewModelItemProtocol {
    
    var numberOfSeasons: Int?
    var numberOfEpisodes: Int?
    
    var type: DetailViewModelItemType {
        return .seasonInfo
    }
    
    var sectionTitle: String {
        return "Season Info"
    }
    
    
}
