//
//  OverviewViewModelItem.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 25/08/21.
//

import Foundation

struct OverviewViewModelItem: DetailViewModelItemProtocol {
    
    var overview: String?
    
    var type: DetailViewModelItemType {
        return .overview
    }
    
    var sectionTitle: String {
        return "Overview"
    }
    
    
}
