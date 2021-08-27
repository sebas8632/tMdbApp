//
//  MockSessionProvider.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 26/08/21.
//

import Foundation
import JSFSNetwork
@testable import tMdbApp
class MockSessionProvider: ProviderProtocol {

    var successRequest: Bool = false
    func request<T>(type: T.Type, service: ServiceProtocol, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable, T : Encodable {
        if service is SearchService {
            let searchService = service as! SearchService
            
            switch searchService {
            case .searchMovie:
                if successRequest {
                    let response = generateSearhMovieResponse()
                    completion(.success(response as! T))
                }
            case .searchTv:
                if successRequest {
                    let response = generateSearSerieResponse()                
                    completion(.success(response as! T))
                }
                break
            }
        }
    }
    
    
}

extension MockSessionProvider {
    
    private func generateSearhMovieResponse() -> ResponseModel<MovieModel>? {
        guard let model: ResponseModel<MovieModel> = FileManager.getJSONObject(from: "SearchMovie") else { return nil }
        return model
    }
    
    private func generateSearSerieResponse() -> ResponseModel<SerieModel>? {
        guard let model: ResponseModel<SerieModel> = FileManager.getJSONObject(from: "SearchSerie") else { return nil }
        return model
    }
}
