//
//  CardsInteractor.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import Foundation

protocol CardsInteractorProtocol: AnyObject {
    func fetchCardsBy(setName: String)
}

class CardsInteractor {
    
    var client: CardAPIProtocol
    var presenter: CardsPresenterProtocol
    
    required init(client: CardAPIProtocol, presenter: CardsPresenterProtocol) {
        self.client = client
        self.presenter = presenter
    }
}

extension CardsInteractor: CardsInteractorProtocol {
    func fetchCardsBy(setName: String) {
        Task.init {
            do {
                let cardsResponse = try await client.getCardsBy(setName: setName)
                self.presenter.didReceive(cards: cardsResponse)
            } catch {
                self.presenter.didReceive(error: error)
            }
        }
    }
}
