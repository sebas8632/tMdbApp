//
//  MockShowSessionProvider.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 27/08/21.
//

import Foundation
import JSFSNetwork
@testable import tMdbApp
class MockShowSessionProvider: ProviderProtocol {

    var successRequest: Bool = false
    func request<T>(type: T.Type, service: ServiceProtocol, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable, T : Encodable {

        if service is MoviesService {
            let movieService = service as! MoviesService
            switch movieService {
            case .getPopular:
                completion(.success(generatePopularMoviesResponse() as! T))
            case .getTopRated:
                completion(.success(generateTopRatedMoviesResponse() as! T))
            case .getUpcoming:
                completion(.success(generatePopularMoviesResponse() as! T))
            }
        } else if service is SeriesService {
            let serieService = service as! SeriesService
            switch serieService {
            case .getPopular:
                break
            case .getTopRated:
                break
            }
        }
    }
    
    
}

extension MockShowSessionProvider {
    
    private func generatePopularMoviesResponse() -> ResponseModel<MovieModel>? {
        guard let model: ResponseModel<MovieModel> = FileManager.getJSONObject(from: "PopularMovies") else { return nil }
        return model
    }
    
    private func generateTopRatedMoviesResponse() -> ResponseModel<MovieModel>? {
        guard let model: ResponseModel<MovieModel> = FileManager.getJSONObject(from: "TopRatedMovies") else { return nil }
        return model
    }
    
    private func generateUpcomingMoviesResponse() -> ResponseModel<MovieModel>? {
        guard let model: ResponseModel<MovieModel> = FileManager.getJSONObject(from: "UpcomingMovies") else { return nil }
        return model
    }

}
