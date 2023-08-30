//
//  BaseStrings.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import Foundation

enum BaseStrings: String {
    case errorTitle = "errorTitle"
    case ok = "OK"
    case unavailable = "unavailable"
    
    var text: String {
        switch self {
        default: return NSLocalizedString(rawValue, comment: "")
        }
    }
}
