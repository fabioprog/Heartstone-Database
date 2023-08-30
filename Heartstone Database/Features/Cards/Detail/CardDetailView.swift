//
//  CardDetailView.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import UIKit

class CardDetailView: BaseView {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorAsset.primary.color
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var cardContainer: UIView = {
        let view = UIView()
        view.backgroundColor = ColorAsset.primary.color
        view.layer.cornerRadius = 10.0
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: -3, height: 3)
        view.layer.shadowOpacity = 0.4
        return view
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameStackView,
                                                       setStackView,
                                                       typeStackView,
                                                       rarityStackView,
                                                       factionStackView,
                                                       costStackView,
                                                       attackStackView,
                                                       healthStackView,
                                                       descriptionStackView,
                                                       flavorStackView])
        stackView.spacing = 8.0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var nameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabelTitle, nameLabel])
        stackView.spacing = 4.0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var nameLabelTitle: UILabel = {
        let label = UILabel()
        label.text = CardsStrings.detailNameTitle.text
        label.textColor = ColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorAsset.primaryText.color
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var setStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [setLabelTitle, setLabel])
        stackView.spacing = 4.0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var setLabelTitle: UILabel = {
        let label = UILabel()
        label.text = CardsStrings.detailSetTitle.text
        label.textColor = ColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var setLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var typeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [typeLabelTitle, typeLabel])
        stackView.spacing = 4.0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var typeLabelTitle: UILabel = {
        let label = UILabel()
        label.text = CardsStrings.detailTypeTitle.text
        label.textColor = ColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var rarityStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [rarityLabelTitle, rarityLabel])
        stackView.spacing = 4.0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var rarityLabelTitle: UILabel = {
        let label = UILabel()
        label.text = CardsStrings.detailRarityTitle.text
        label.textColor = ColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var rarityLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var factionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [factionLabelTitle, factionLabel])
        stackView.spacing = 4.0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var factionLabelTitle: UILabel = {
        let label = UILabel()
        label.text = CardsStrings.detailFactionTitle.text
        label.textColor = ColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var factionLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var costStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [costLabelTitle, costLabel])
        stackView.spacing = 4.0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var costLabelTitle: UILabel = {
        let label = UILabel()
        label.text = CardsStrings.detailCostTitle.text
        label.textColor = ColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var costLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var attackStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [attackLabelTitle, attackLabel])
        stackView.spacing = 4.0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var attackLabelTitle: UILabel = {
        let label = UILabel()
        label.text = CardsStrings.detailAttackTitle.text
        label.textColor = ColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var attackLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var healthStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [healthLabelTitle, healthLabel])
        stackView.spacing = 4.0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var healthLabelTitle: UILabel = {
        let label = UILabel()
        label.text = CardsStrings.detailHealthTitle.text
        label.textColor = ColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var healthLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var descriptionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [descriptionLabelTitle, descriptionLabel])
        stackView.spacing = 4.0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var descriptionLabelTitle: UILabel = {
        let label = UILabel()
        label.text = CardsStrings.detailDescriptionTitle.text
        label.textColor = ColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorAsset.primaryText.color
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var flavorStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [flavorLabelTitle, flavorLabel])
        stackView.spacing = 4.0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var flavorLabelTitle: UILabel = {
        let label = UILabel()
        label.text = CardsStrings.detailFlavorTitle.text
        label.textColor = ColorAsset.primaryText.color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var flavorLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorAsset.primaryText.color
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    override func setupUI() {
        addSubviews(scrollView)
        scrollView.addSubviews(contentView)
        contentView.addSubviews(imageView, cardContainer)
        cardContainer.addSubviews(infoStackView)
    }
    
    override func setupConstraints() {
        scrollView
            .topAnchor(to: layoutMarginsGuide.topAnchor)
            .leftAnchor(to: layoutMarginsGuide.leftAnchor)
            .rightAnchor(to: layoutMarginsGuide.rightAnchor)
            .bottomAnchor(to: layoutMarginsGuide.bottomAnchor)

        contentView
            .topAnchor(to: scrollView.topAnchor, constant: 0)
            .leftAnchor(to: scrollView.leftAnchor, constant: 0)
            .rightAnchor(to: scrollView.rightAnchor, constant: 0)
            .bottomAnchor(to: scrollView.bottomAnchor, constant: 0)
            .widthAnchor(to: scrollView.widthAnchor)
        
        imageView
            .topAnchor(to: contentView.topAnchor, constant: 8)
            .leftAnchor(to: contentView.leftAnchor)
            .rightAnchor(to: contentView.rightAnchor)
            .heightAnchor(220)
        
        cardContainer
            .topAnchor(to: imageView.bottomAnchor, constant: 25)
            .leftAnchor(to: contentView.leftAnchor, constant: 8)
            .rightAnchor(to: contentView.rightAnchor, constant: 8)
            .bottomAnchor(to: contentView.bottomAnchor, constant: 20)
        
        infoStackView
            .topAnchor(to: cardContainer.topAnchor, constant: 16)
            .leftAnchor(to: cardContainer.leftAnchor, constant: 16)
            .rightAnchor(to: cardContainer.rightAnchor, constant: 16)
            .bottomAnchor(to: cardContainer.bottomAnchor, constant: 16)
    }
}
