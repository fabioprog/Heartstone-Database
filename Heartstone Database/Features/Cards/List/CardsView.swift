//
//  CardsView.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import UIKit

class CardsView: BaseView {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        tableView.register(CardsTableViewCell.self,
                           forCellReuseIdentifier: CardsTableViewCell.identifier)
        tableView.accessibilityIdentifier = CardsAccessibilityStrings.cardsTableViewId.text
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
