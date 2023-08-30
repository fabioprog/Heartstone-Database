//
//  CardSetsRouter.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import UIKit

protocol CardSetsRouterProtocol {
    func navigateToCards(setName: String)
}

class CardSetsRouter {
    
    var navigation: UINavigationController
    
    required init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    static func factory(client: InfoClient = InfoClient(), navigation: UINavigationController) -> CardSetsViewController {
        let presenter = CardSetsPresenter()
        let interactor = CardSetsInteractor(client: client, presenter: presenter)
        let router = CardSetsRouter(navigation: navigation)
        let controller = CardSetsViewController(interactor: interactor, router: router)
        controller.navigationItem.largeTitleDisplayMode = .automatic
        presenter.controller = controller
        return controller
    }
}

extension CardSetsRouter: CardSetsRouterProtocol {
    func navigateToCards(setName: String) {
        let controller = CardsRouter.factory(setName: setName, client: CardClient(), navigation: navigation)
        navigation.show(controller, sender: self)
    }
}
