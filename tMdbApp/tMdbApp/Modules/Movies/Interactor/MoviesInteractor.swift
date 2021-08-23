//
//  MoviesInteractor.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 22/08/21.
//

import Foundation

class MoviesInteractor: MoviesInteractorInputProtocol {
    var remoteDataManager: MoviesRemoteDataManagerInputProtocol?
    var presenter: MoviesInteractorOutputProtocol?
    
    
}

extension MoviesInteractor: MoviesRemoteDataManagerOutputProtocol {
    
}
