//
//  DetailViewModel.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 25/08/21.
//

import Foundation

protocol DetailViewModelItemProtocol {
    var type: DetailViewModelItemType { get }
    var rowCount: Int { get }
    var sectionTitle: String  { get }
}

extension DetailViewModelItemProtocol {
    var rowCount: Int {
        return 1
    }
}
