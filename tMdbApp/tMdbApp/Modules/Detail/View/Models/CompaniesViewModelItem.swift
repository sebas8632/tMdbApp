//
//  CompaniesViewModelItem.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 25/08/21.
//

import Foundation

struct CompaniesViewModelItem: DetailViewModelItemProtocol {
    
    var companies: [String]?
    var type: DetailViewModelItemType {
        return .companies
    }
    
    var sectionTitle: String {
        return "Production Companies"
    }
    
    var rowCount: Int {
        return companies?.count ?? 0
    }
}
