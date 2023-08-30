//
//  CardSetsTableViewCell.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import UIKit

class CardSetsTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: CardSetsTableViewCell.self)
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorAsset.primary.color
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.cornerRadius = 6
        view.layer.shadowOffset = CGSize(width: -3, height: 3)
        view.layer.shadowOpacity = 0.4
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorAsset.primaryText.color
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(containerView)
        containerView.addSubviews(nameLabel)
        setupConstraints()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
    }
}

extension CardSetsTableViewCell {
    func setupConstraints() {
        containerView
            .topAnchor(to: contentView.topAnchor, constant: 8)
            .leftAnchor(to: contentView.leftAnchor, constant: 8)
            .rightAnchor(to: contentView.rightAnchor, constant: 8)
            .bottomAnchor(to: contentView.bottomAnchor, constant: 8)
        
        nameLabel
            .topAnchor(to: containerView.topAnchor, constant: 20)
            .leftAnchor(to: containerView.leftAnchor, constant: 8)
            .rightAnchor(to: containerView.rightAnchor, constant: 8)
            .bottomAnchor(to: containerView.bottomAnchor, constant: 20)
    }
    
    func setupUI() {
        contentView.backgroundColor = ColorAsset.primary.color
    }
    
    func setupData(setName: String) {
        nameLabel.text = setName
        setupAccessibility()
        
        func setupAccessibility() {
            setAccessibility(label: SetsAccessibilityStrings.cellLabel.localized(setName),
                             hint: SetsAccessibilityStrings.cellHint.localized(),
                             traits: .button)
            
            accessibilityElements = [nameLabel]
            nameLabel.accessibilityIdentifier = setName
        }
    }
}
