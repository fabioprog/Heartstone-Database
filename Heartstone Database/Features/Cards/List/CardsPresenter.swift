//
//  CardsPresenter.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import Foundation

protocol CardsPresenterProtocol: AnyObject {
    func didReceive(cards: [Card])
    func didReceive(error: Error)
}

class CardsPresenter {
    
    weak var controller: CardsViewControllerProtocol?
    
    init(controller: CardsViewControllerProtocol? = nil) {
        self.controller = controller
    }
}

extension CardsPresenter: CardsPresenterProtocol {
    func didReceive(cards: [Card]) {
        DispatchQueue.main.async {
            self.controller?.didReceive(cards: cards)
        }
    }
    
    func didReceive(error: Error) {
        DispatchQueue.main.async {
            self.controller?.didReceive(error: error.localizedDescription)
        }
    }
}
