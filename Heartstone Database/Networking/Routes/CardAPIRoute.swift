//
//  CardAPIRoute.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import Foundation

enum CardAPIRoute {
    
    case getCardsBy(setName: String)
    case getCardBy(id: String)
    
    private var path: String {
        switch self {
        case .getCardsBy(let setName):
            return "/cards/sets/\(setName)"
        case .getCardBy(let id):
            return "/cards/\(id)"
        }
    }
    
    private var method: String {
        return "GET"
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
