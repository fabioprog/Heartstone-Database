//
//  UITableViewExtension.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 30/08/23.
//

import UIKit

extension UITableView {

    func setEmptyMessage(_ message: String) {
        
        let messageLabel = UILabel(frame: CGRect(x: center.x, y: center.y, width: bounds.size.width, height: bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = ColorAsset.primaryText.color
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = .systemFont(ofSize: 16, weight: .medium)
       
        backgroundView = messageLabel
    }

    func removeEmptyMessage() {
        self.backgroundView = nil
    }
}
