//
//  Info.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import Foundation

struct InfoResponse: Codable {
    let classes: [String]?
    let sets: [String]?
    let standard: [String]?
    let wild: [String]?
    let types: [String]?
    let factions: [String]?
    let qualities: [String]?
    let races: [String]?
}
