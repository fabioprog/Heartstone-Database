//
//  ColorAsset.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import UIKit

enum ColorAsset: String {
    case primary = "PrimaryColor"
    case primaryText = "PrimaryTextColor"
    
    var color: UIColor {
        switch self {
        default: return UIColor(named: self.rawValue) ?? .clear
        }
    }
}
