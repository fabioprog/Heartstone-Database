//
//  CardDetailViewController.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import UIKit

protocol CardDetailViewControllerProtocol: AnyObject {
    func didReceive(card: CardDetail)
    func didReceive(error: String)
}

class CardDetailViewController: BaseViewController<CardDetailView> {
    
    var interactor: CardDetailInteractorProtocol
    var router: CardDetailRouterProtocol
    var id: String
    var card: CardDetail? {
        didSet {
            customView.hideLoadingView()
            setupCardData()
        }
    }
    
    required init(id: String, interactor: CardDetailInteractorProtocol, router: CardDetailRouterProtocol) {
        self.interactor = interactor
        self.router = router
        self.id = id
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = CardsStrings.detailTitle.text
        fetchData()
    }
    
    func fetchData() {
        customView.showLoadingView()
        interactor.fetchCardBy(id: id)
    }
    
    func setupCardData() {
        guard let card = card else { return }
        customView.imageView.loadFrom(urlString: card.img ?? "", defaultImage: ImageAsset.defaultCard.image)
        customView.imageView.setAccessibility(label: CardsAccessibilityStrings.detailCardImageViewLabel.localized(), traits: .image)
        
        customView.nameStackView.isHidden = card.name == nil
        customView.nameLabel.text = card.name
        customView.nameLabel.accessibilityIdentifier = CardsAccessibilityStrings.detailCardNameId.text
        customView.nameStackView.setGroupedAccessibility(labels: [customView.nameLabelTitle,
                                                                  customView.nameLabel])
        
        customView.setStackView.isHidden = card.cardSet == nil
        customView.setLabel.text = card.cardSet
        customView.setStackView.setGroupedAccessibility(labels: [customView.setLabelTitle,
                                                                 customView.setLabel])
        
        customView.typeStackView.isHidden = card.type == nil
        customView.typeLabel.text = card.type
        customView.typeStackView.setGroupedAccessibility(labels: [customView.typeLabelTitle,
                                                                  customView.typeLabel])
        
        customView.rarityStackView.isHidden = card.rarity == nil
        customView.rarityLabel.text = card.rarity
        customView.rarityStackView.setGroupedAccessibility(labels: [customView.rarityLabelTitle,
                                                                    customView.rarityLabel])
        
        customView.factionStackView.isHidden = card.faction == nil
        customView.factionLabel.text = card.faction
        customView.factionStackView.setGroupedAccessibility(labels: [customView.factionLabelTitle,
                                                                     customView.factionLabel])
        
        customView.costStackView.isHidden = card.cost == nil
        customView.costLabel.text = card.cost?.description
        customView.costStackView.setGroupedAccessibility(labels: [customView.costLabelTitle,
                                                                  customView.costLabel])
        
        customView.attackStackView.isHidden = card.attack == nil
        customView.attackLabel.text = card.attack?.description
        customView.attackStackView.setGroupedAccessibility(labels: [customView.attackLabelTitle,
                                                                    customView.attackLabel])
        
        customView.healthStackView.isHidden = card.health == nil
        customView.healthLabel.text = card.health?.description
        customView.healthStackView.setGroupedAccessibility(labels: [customView.healthLabelTitle,
                                                                    customView.healthLabel])
        
        customView.descriptionStackView.isHidden = card.text == nil
        customView.descriptionLabel.attributedText = card.text?.htmlToAttributedString()
        customView.descriptionStackView.setGroupedAccessibility(labels: [customView.descriptionLabelTitle,
                                                                         customView.descriptionLabel])
        
        customView.flavorStackView.isHidden = card.flavor == nil
        customView.flavorLabel.attributedText = card.flavor?.htmlToAttributedString()
        customView.flavorStackView.setGroupedAccessibility(labels: [customView.flavorLabelTitle,
                                                                    customView.flavorLabel])
        
    }
}

extension CardDetailViewController: CardDetailViewControllerProtocol {
    func didReceive(card: CardDetail) {
        self.card = card
    }
    
    func didReceive(error: String) {
        customView.hideLoadingView()
        presentAlert(title: BaseStrings.errorTitle.text,
                     message: error,
                     style: .alert,
                     options:
                        [(title: BaseStrings.ok.text,
                          style: UIAlertAction.Style.default,
                          uiIdentifier: "")])
        { [weak self] _ in
            guard let self = self else { return }
            self.router.back()
        }
    }
}
