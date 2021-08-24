//
//  MoviesService.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 23/08/21.
//

import Foundation
import JSFSNetwork

enum MoviesService: ServiceProtocol  {
    case getPopular
    case getTopRated
    case getUpcoming

    var baseURL: URL {
        return URL(string: NetworkConstants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getPopular:
            return "/movie/popular"
        case .getTopRated:
            return "/movie/top_rated"
        case .getUpcoming:
            return "/movie/upcoming"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var task: Task {
        let params = ["api_key": NetworkConstants.apiKey]
        return .requestParameters(params)
    }
    
    var headers: Headers {
        return [:]
    }
    
    var parametersEncoding: ParametersEncoding {
        return .url
    }
}
