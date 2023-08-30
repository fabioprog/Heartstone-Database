//
//  CardsRouter.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import UIKit

protocol CardsRouterProtocol {
    func navigateToCardDetail(by id: String)
    func back()
}

class CardsRouter {
    
    var navigation: UINavigationController
    
    required init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    static func factory(setName: String, client: CardClient = CardClient(), navigation: UINavigationController) -> CardsViewController {
        let presenter = CardsPresenter()
        let interactor = CardsInteractor(client: client, presenter: presenter)
        let router = CardsRouter(navigation: navigation)
        let controller = CardsViewController(setName: setName, interactor: interactor, router: router)
        presenter.controller = controller
        return controller
    }
}

extension CardsRouter: CardsRouterProtocol {
    func navigateToCardDetail(by id: String) {
        let controller = CardDetailRouter.factory(id: id, navigation: navigation)
        navigation.show(controller, sender: self)
    }
    
    func back() {
        navigation.popViewController(animated: true)
    }
}
