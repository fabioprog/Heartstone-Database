//
//  CardDetailInteractor.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import Foundation

protocol CardDetailInteractorProtocol: AnyObject {
    func fetchCardBy(id: String)
}

class CardDetailInteractor {
    
    var client: CardClient
    var presenter: CardDetailPresenterProtocol
    
    required init(client: CardClient, presenter: CardDetailPresenterProtocol) {
        self.client = client
        self.presenter = presenter
    }
}

extension CardDetailInteractor: CardDetailInteractorProtocol {
    func fetchCardBy(id: String) {
        Task.init {
            do {
                let cardsResponse = try await client.getCardBy(id: id)
                self.presenter.didReceive(cards: cardsResponse)
            } catch {
                self.presenter.didReceive(error: error)
            }
        }
    }
}
