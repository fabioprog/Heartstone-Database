//
//  CardSetsView.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import UIKit

class CardSetsView: BaseView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.rowHeight = UITableView.automaticDimension;
        tableView.estimatedRowHeight = 66.0
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        tableView.register(CardSetsTableViewCell.self,
                           forCellReuseIdentifier: CardSetsTableViewCell.identifier)
        tableView.setAccessibility(label: SetsAccessibilityStrings.tableViewLabel.localized())
        tableView.accessibilityIdentifier = SetsAccessibilityStrings.tableViewId.text
        return tableView
    }()
    
    override func setupUI() {
        addSubview(tableView)
    }
    
    override func setupConstraints() {
        tableView
            .topAnchor(to: layoutMarginsGuide.topAnchor)
            .leftAnchor(to: layoutMarginsGuide.leftAnchor)
            .rightAnchor(to: layoutMarginsGuide.rightAnchor)
            .bottomAnchor(to: bottomAnchor)
    }
}
