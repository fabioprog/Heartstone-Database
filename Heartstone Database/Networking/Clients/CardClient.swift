//
//  CardClient.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import Foundation

protocol CardAPIProtocol {
    func getCardsBy(setName: String) async throws -> [Card]
    func getCardBy(id: String) async throws -> [CardDetail]
}

class CardClient: CardAPIProtocol {
    
    func getCardsBy(setName: String) async throws -> [Card] {
        let router = CardAPIRoute.getCardsBy(setName: setName).router
        let response: [Card] = try await APIRequest.request(apiRouter: router)
        return response
    }
    
    func getCardBy(id: String) async throws -> [CardDetail] {
        let router = CardAPIRoute.getCardBy(id: id).router
        let response: [CardDetail] = try await APIRequest.request(apiRouter: router)
        return response
    }
}
