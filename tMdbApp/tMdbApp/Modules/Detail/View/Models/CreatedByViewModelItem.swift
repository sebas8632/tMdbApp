//
//  CreatedByViewModelItem.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 26/08/21.
//

import Foundation

struct CreatedByViewModelItem: DetailViewModelItemProtocol {
    
    var creators: [CreatorModel]?
    
    var type: DetailViewModelItemType {
        return .createdBy
    }
    
    var sectionTitle: String {
        return "Created by"
    }

}
