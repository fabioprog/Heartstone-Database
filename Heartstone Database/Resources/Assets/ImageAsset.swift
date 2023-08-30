//
//  ImageAsset.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import UIKit

enum ImageAsset: String {
    case launchImg = "launch-img"
    case defaultCard = "default-card"
    
    var image: UIImage {
        switch self {
        default: return UIImage(named: self.rawValue) ?? UIImage()
        }
    }
}
