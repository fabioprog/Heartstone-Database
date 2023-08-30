//
//  InfoClient.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import Foundation

protocol InfoAPIProtocol {
    func getInfo() async throws -> InfoResponse
}

class InfoClient: InfoAPIProtocol {
    
    func getInfo() async throws -> InfoResponse {
        let router = InfoAPIRoute.getInfo.router
        let response: InfoResponse = try await APIRequest.request(apiRouter: router)
        return response
    }
}
