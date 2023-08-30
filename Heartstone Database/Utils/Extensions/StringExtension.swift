//
//  StringExtension.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import Foundation

extension String {
    
    func getURLComponentBy(key: String) -> String? {
        guard let url = URL(string: self),
              let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let item = components.queryItems?.first(where: { $0.name == key })?.value
        else {
            return nil
        }
        return item
    }
    
    func htmlToAttributedString() -> NSAttributedString? {
        let data = Data(self.utf8)
        if let attributedString = try? NSMutableAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            let attributes = [NSAttributedString.Key.foregroundColor: ColorAsset.primaryText.color]
            attributedString.addAttributes(attributes,
                                           range: NSRange.init(location: 0, length: attributedString.length))
            return attributedString
        }
        return nil
    }
}
