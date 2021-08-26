//
//  DatesOnAirViewModelItem.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 26/08/21.
//

import Foundation

struct DatesOnAirViewModelItem: DetailViewModelItemProtocol {
    
    var firstAirDate: String?
    var lasAirDate: String?
    
    var type: DetailViewModelItemType {
        return .datesOnAir
    }
    
    var sectionTitle: String {
        return "Dates on Air"
    }
    
    
}
