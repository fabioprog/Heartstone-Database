//
//  CardDetailRouter.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import UIKit

protocol CardDetailRouterProtocol {
    func back()
}

class CardDetailRouter {
 
    var navigation: UINavigationController
    
    required init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    static func factory(id: String, client: CardClient = CardClient(), navigation: UINavigationController) -> CardDetailViewController {
        let presenter = CardDetailPresenter()
        let interactor = CardDetailInteractor(client: client, presenter: presenter)
        let router = CardDetailRouter(navigation: navigation)
        let controller = CardDetailViewController(id: id, interactor: interactor, router: router)
        presenter.controller = controller
        return controller
    }
}

extension CardDetailRouter: CardDetailRouterProtocol {
    func back() {
        navigation.popViewController(animated: true)
    }
}
