//
//  NSObjectExtension.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 30/08/23.
//

import UIKit

extension NSObject {
    func setAccessibility(label: String? = nil, hint: String? = nil, value: String? = nil, traits: UIAccessibilityTraits = .none) {
        isAccessibilityElement = true
        accessibilityLabel = label
        accessibilityHint = hint
        accessibilityValue = value
        accessibilityTraits = traits
    }
}
