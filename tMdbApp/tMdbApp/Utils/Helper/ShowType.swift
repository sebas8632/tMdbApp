//
//  SearchType.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 21/08/21.
//

import Foundation

enum ShowType: Int {
    case movie = 0
    case serie

    func getType(index: Int) -> ShowType {
        return index == 0 ? .movie : .serie
    }
}
