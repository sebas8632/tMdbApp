//
//  DetailService.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 24/08/21.
//

import Foundation
import JSFSNetwork

enum DetailService: ServiceProtocol {
    
    case movie(id: String)
    case serie(id: String)

    var baseURL: URL {
        return URL(string: NetworkConstants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .movie(let id):
            return "/movie/\(id)"
        case .serie(let id):
            return "/tv/\(id)"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var task: Task {
        let params = [ "api_key": NetworkConstants.apiKey]
        return .requestParameters(params)
    }
    
    var headers: Headers {
        return [:]
    }
    
    var parametersEncoding: ParametersEncoding {
        return .url
    }
    
    
}
