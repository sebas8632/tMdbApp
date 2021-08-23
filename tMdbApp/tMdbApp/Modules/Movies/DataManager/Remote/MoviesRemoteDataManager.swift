//
//  MoviesRemoteDataManager.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 22/08/21.
//

import Foundation
import JSFSNetwork

class MoviesRemoteDataManager: MoviesRemoteDataManagerInputProtocol {
    var sessionProvider: URLSessionProvider?
    var interactor: MoviesRemoteDataManagerOutputProtocol?
    
}
