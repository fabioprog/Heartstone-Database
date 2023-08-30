//
//  CardsTableViewCell.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import UIKit

class CardsTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: CardsTableViewCell.self)
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorAsset.primary.color
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.cornerRadius = 6
        view.layer.shadowOffset = CGSize(width: -3, height: 3)
        view.layer.shadowOpacity = 0.4
        return view
    }()
    
    private lazy var cardStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, typeLabelTitle, typeLabel, descriptionLabelTitle, descriptionLabel])
        stackView.spacing = 4.0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorAsset.primaryText.color
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private lazy var typeLabelTitle: UILabel = {
        let label = UILabel()
        label.text = CardsStrings.cardType.text
        label.textColor = ColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorAsset.primaryText.color
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    private lazy var descriptionLabelTitle: UILabel = {
        let label = UILabel()
        label.text = CardsStrings.cardText.text
        label.textColor = ColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorAsset.primaryText.color
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(containerView)
        containerView.addSubviews(cardStackView)
        setupConstraints()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        nameLabel.isHidden = false
        typeLabelTitle.isHidden = false
        typeLabel.text = nil
        typeLabel.isHidden = false
        descriptionLabelTitle.isHidden = false
        descriptionLabel.text = nil
        descriptionLabel.isHidden = false
    }
}

extension CardsTableViewCell {
    func setupConstraints() {
        containerView
            .topAnchor(to: contentView.topAnchor, constant: 8)
            .leftAnchor(to: contentView.leftAnchor, constant: 8)
            .rightAnchor(to: contentView.rightAnchor, constant: 8)
            .bottomAnchor(to: contentView.bottomAnchor, constant: 8)
        
        cardStackView
            .topAnchor(to: containerView.topAnchor, constant: 16)
            .leftAnchor(to: containerView.leftAnchor, constant: 16)
            .rightAnchor(to: containerView.rightAnchor, constant: 16)
            .bottomAnchor(to: containerView.bottomAnchor, constant: 16)
    }
    
    func setupUI() {
        contentView.backgroundColor = ColorAsset.primary.color
    }
    
    func setupData(card: Card) {
        nameLabel.text = card.name ?? "--"
        typeLabel.text = card.type ?? "--"
        descriptionLabel.attributedText = card.text?.htmlToAttributedString() ?? NSAttributedString(string: "--")
        setupAccessibility()
        
        func setupAccessibility() {
            setAccessibility(label: CardsAccessibilityStrings.cardsCellLabel.localized(
                                    card.name ?? BaseStrings.unavailable.text,
                                    card.type ?? BaseStrings.unavailable.text,
                                    card.text ?? BaseStrings.unavailable.text),
                             hint: CardsAccessibilityStrings.cardsCellHint.localized(),
                             traits: .button)
            
            accessibilityElements = [nameLabel, typeLabelTitle, typeLabel, descriptionLabelTitle, descriptionLabel]
            nameLabel.accessibilityIdentifier = card.name
            typeLabel.accessibilityIdentifier = card.type
        }
    }
}
