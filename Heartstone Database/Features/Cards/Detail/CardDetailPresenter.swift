//
//  CardDetailPresenter.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import Foundation

protocol CardDetailPresenterProtocol: AnyObject {
    func didReceive(cards: [CardDetail])
    func didReceive(error: Error)
}

class CardDetailPresenter {
    
    weak var controller: CardDetailViewControllerProtocol?
    
    init(controller: CardDetailViewControllerProtocol? = nil) {
        self.controller = controller
    }
}

extension CardDetailPresenter: CardDetailPresenterProtocol {
    func didReceive(cards: [CardDetail]) {
        DispatchQueue.main.async {
            if let card = cards.first {
                self.controller?.didReceive(card: card)
            } else {
                self.controller?.didReceive(error: CardsStrings.detailDefaultError.text)
            }
        }
    }
    
    func didReceive(error: Error) {
        DispatchQueue.main.async {
            self.controller?.didReceive(error: error.localizedDescription)
        }
    }
}
