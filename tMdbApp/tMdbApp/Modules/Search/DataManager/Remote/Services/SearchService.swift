//
//  SearchService.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 21/08/21.
//

import Foundation
import JSFSNetwork
enum SearchService: ServiceProtocol {
    
    case searchMovie(query: String, page: Int)
    case searchTv(query: String, page: Int)
    
    var baseURL: URL {
        return URL(string: NetworkConstants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .searchMovie:
            return "/search/movie"
        case .searchTv:
            return "/search/tv"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var task: Task {
        switch self {
        case let .searchMovie(query, page):
            let parameters = ["api_key": NetworkConstants.apiKey,
                              "query" : query,
                              "page": "\(page)"]
            return .requestParameters(parameters)
        case let .searchTv(query, page):
            let parameters = ["api_key": NetworkConstants.apiKey,
                              "query" : query,
                              "page": "\(page)"]
            return .requestParameters(parameters)
        }
    }
    
    var headers: Headers {
        return [:]
    }
    
    var parametersEncoding: ParametersEncoding {
        return .url
    }
    
    
}
