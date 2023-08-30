//
//  InfoClient.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import Foundation

protocol InfoAPIProtocol {
    func getInfo() async throws -> Info
}

class InfoClient: InfoAPIProtocol {
    
    func getInfo() async throws -> Info {
        let router = InfoAPIRoute.getInfo.router
        let response: Info = try await APIRequest.request(apiRouter: router)
        return response
    }
}
