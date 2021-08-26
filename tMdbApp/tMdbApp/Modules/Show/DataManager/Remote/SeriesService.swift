//
//  SeriesService.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 26/08/21.
//

import Foundation
import JSFSNetwork

enum SeriesService: ServiceProtocol  {
    case getPopular
    case getTopRated
    case getUpcoming

    var baseURL: URL {
        return URL(string: NetworkConstants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getPopular:
            return "/tv/popular"
        case .getTopRated:
            return "/tv/top_rated"
        case .getUpcoming:
            return "/tv/latest"
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
