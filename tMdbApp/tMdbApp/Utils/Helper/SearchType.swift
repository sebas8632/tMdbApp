//
//  SearchType.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 21/08/21.
//

import Foundation

enum SearchType: Int {
    case movie = 0
    case tv

    func getType(index: Int) -> SearchType {
        return index == 0 ? .movie : .tv
    }
}
