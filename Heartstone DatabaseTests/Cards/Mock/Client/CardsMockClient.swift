//
//  CardsMockClient.swift
//  Heartstone DatabaseTests
//
//  Created by Fabio Augusto Resende on 30/08/23.
//

import Foundation
@testable import Heartstone_Database

enum CardsMockRoute {
    
    case getCards
    case getEmptyCards
    case getCardDetail
    case getEmptyCardDetail
    
    var path: String {
        switch self {
        case .getCards:
            return "get_cards"
        case .getEmptyCards:
            return "get_empty_data_cards"
        case .getCardDetail:
            return "get_card_detail"
        case .getEmptyCardDetail:
            return "get_empty_data_card_detail"
        }
    }
}

class CardsMockClient: CardClient {
    override func getCardsBy(setName: String) async throws -> [Card] {
        let path = CardsMockRoute.getCards.path
        let response: [Card] = try await MockRequest.getFile(by: path)
        return response
    }
    
    override func getCardBy(id: String) async throws -> [CardDetail] {
        let path = CardsMockRoute.getCardDetail.path
        let response: [CardDetail] = try await MockRequest.getFile(by: path)
        return response
    }
}

class CardsMockClientWithEmptyData: CardClient {
    override func getCardsBy(setName: String) async throws -> [Card] {
        let path = CardsMockRoute.getEmptyCards.path
        let response: [Card] = try await MockRequest.getFile(by: path)
        return response
    }
    
    override func getCardBy(id: String) async throws -> [CardDetail] {
        let path = CardsMockRoute.getEmptyCardDetail.path
        let response: [CardDetail] = try await MockRequest.getFile(by: path)
        return response
    }
}
