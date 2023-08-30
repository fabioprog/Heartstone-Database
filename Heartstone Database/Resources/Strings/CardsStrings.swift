//
//  CardsStrings.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import Foundation

enum CardsAccessibilityStrings: String {
    case cardsTableViewLabel = "cardsTableViewLabel"
    case cardsTableViewId = "cardsTableViewId"
    case cardsCellNameLabel = "cardsCellNameLabel"
    case cardsCellLabel = "cardsCellLabel"
    case cardsCellHint = "cardsCellHint"
    case cardsCellNameId = "cardsCellNameId"
    case cardsCellTypeId = "cardsCellTypeId"
    case cardsCellTextId = "cardsCellTextId"
    //Card Detail
    case detailCardImageViewLabel = "detailCardImageViewLabel"
    case detailCardNameId = "detailCardNameId"
    
    var text: String {
        switch self {
        default: return rawValue
        }
    }
    
    func localized(_ args: CVarArg...) -> String {
        switch self {
        default:
            return String(format: NSLocalizedString(rawValue, comment: ""), args)
        }
    }
}

enum CardsStrings: String {
    //List
    case cardType = "cardTypeTitle"
    case cardText = "cardTextTitle"
    
    //Detail
    case detailTitle = "cardDetailNavigationTitle"
    case detailDefaultError = "cardDetailDefaultError"
    case detailNameTitle = "cardDetailNameTitle"
    case detailFlavorTitle = "cardDetailFlavorTitle"
    case detailDescriptionTitle = "cardDetailDescriptionTitle"
    case detailSetTitle = "cardDetailSetTitle"
    case detailTypeTitle = "cardDetailTypeTitle"
    case detailFactionTitle = "cardDetailFactionTitle"
    case detailRarityTitle = "cardDetailRarityTitle"
    case detailCostTitle = "cardDetailCostTitle"
    case detailAttackTitle = "cardDetailAttackTitle"
    case detailHealthTitle = "cardDetailHealthTitle"
    
    var text: String {
        switch self {
        default: return NSLocalizedString(rawValue, comment: "")
        }
    }
}
