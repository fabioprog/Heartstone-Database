//
//  CardDetail.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import Foundation

struct CardDetail: Codable {
    let cardId: String?
    let name: String?
    let img: String?
    let type: String?
    let text: String?
    let flavor: String?
    let cardSet: String?
    let faction: String?
    let rarity: String?
    let cost: Int?
    let attack: Int?
    let health: Int?
}
