//
//  Card.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import Foundation

struct Card: Codable {
    let cardId: String
    let name: String?
    let type: String?
    let text: String?
}
