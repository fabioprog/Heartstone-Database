//
//  SetsStrings.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 29/08/23.
//

import Foundation

enum SetsAccessibilityStrings: String {
    case navigationBarId = "navigationBarId"
    case tableViewLabel = "setsTableViewLabel"
    case tableViewId = "setsTableViewId"
    case cellLabel = "setsCellLabel"
    case cellHint = "setsCellHint"
    case cellLabelId = "setsCellLabelId"
    
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

enum SetsStrings: String {
    case title = "setsNavigationTitle"
    case tableViewEmptyMessage = "tableViewEmptyMessage"
    
    var text: String {
        switch self {
        default: return NSLocalizedString(rawValue, comment: "")
        }
    }
}
