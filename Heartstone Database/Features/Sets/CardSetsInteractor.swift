//
//  CardSetsInteractor.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import Foundation

protocol CardSetsInteractorProtocol: AnyObject {
    func fetchCardSets()
}

class CardSetsInteractor {
    
    var client: InfoClient
    var presenter: CardSetsPresenterProtocol
    
    required init(client: InfoClient, presenter: CardSetsPresenterProtocol) {
        self.client = client
        self.presenter = presenter
    }
}

extension CardSetsInteractor: CardSetsInteractorProtocol {
    func fetchCardSets() {
        Task.init {
            do {
                let infoResponse = try await client.getInfo()
                self.presenter.didReceive(info: infoResponse)
            } catch {
                self.presenter.didReceive(error: error)
            }
        }
    }
}
