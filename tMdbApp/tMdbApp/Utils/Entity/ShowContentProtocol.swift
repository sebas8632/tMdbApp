//
//  ShowContentProtocol.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 23/08/21.
//

import Foundation

protocol ShowContentProtocol {
    var title: String { get }
    var date: String? { get }
    var voteAverage: Double? { get }
    var imagePath: String? { get }
}
