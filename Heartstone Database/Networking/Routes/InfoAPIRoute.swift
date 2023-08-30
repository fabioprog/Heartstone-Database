//
//  InfoAPIRoute.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import Foundation

enum InfoAPIRoute {
    
    case getInfo
    
    private var path: String {
        switch self {
        case .getInfo:
            return "/info"
        }
    }

    private var method: String {
        switch self {
        case .getInfo:
            return "GET"
        }
    }

    private var parameters: [URLQueryItem]? {
        return nil
    }
    
    var router: APIRouter {
        switch self {
        default:
            return APIRouter(path: path, method: method, parameters: parameters)
        }
    }
}
