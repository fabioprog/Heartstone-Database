//
//  CardSetsPresenter.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import Foundation

protocol CardSetsPresenterProtocol: AnyObject {
    func didReceive(info: Info)
    func didReceive(error: Error)
}

class CardSetsPresenter {
    
    weak var controller: CardSetsViewControllerProtocol?
    
    required init(controller: CardSetsViewControllerProtocol? = nil) {
        self.controller = controller
    }
}

extension CardSetsPresenter: CardSetsPresenterProtocol {
    func didReceive(info: Info) {
        DispatchQueue.main.async {
            self.controller?.didReceive(sets: [])
        }
    }
    
    func didReceive(error: Error) {
        DispatchQueue.main.async {
            self.controller?.didReceive(error: error.localizedDescription)
        }
    }
}
