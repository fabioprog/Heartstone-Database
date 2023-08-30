//
//  APIRouter.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import Foundation

struct APIRouter {
    
    var host: String = "omgvamp-hearthstone-v1.p.rapidapi.com"
    var scheme: String = "https"
    var path: String = ""
    var method: String = "GET"
    var parameters: [URLQueryItem]?
    let headers = [
        "X-RapidAPI-Key": "62c3990dafmsh648c792636842e8p19988ejsn42fc123ceb39",
        "X-RapidAPI-Host": "omgvamp-hearthstone-v1.p.rapidapi.com"
    ]
        
    init(path: String, method: String = "GET", parameters: [URLQueryItem]?) {
        self.path = path
        self.method = method
        self.parameters = parameters
    }
}
