//
//  MockSearchRemoteDataManagerOutput.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 26/08/21.
//

import Foundation
@testable import tMdbApp

struct SearchRemoteDataManagerOutputCalls {
    var didSearchMovie: Bool = false
    var didSearchSerie: Bool = false

}

class MockSearchRemoteDataManagerOutput: SearchRemoteDataManagerOutputProtocol {
    
    lazy var calls = SearchRemoteDataManagerOutputCalls()
    var responseMovie: ResponseModel<MovieModel>?
    var responseSerie: ResponseModel<SerieModel>?

    func didSearchMovie(response: ResponseModel<MovieModel>) {
        calls.didSearchMovie = true
        responseMovie = response
    }
    
    func didSearchTv(response: ResponseModel<SerieModel>) {
        calls.didSearchSerie = true
        responseSerie = response
    }
    
    
}
