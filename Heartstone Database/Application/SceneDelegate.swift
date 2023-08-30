//
//  SceneDelegate.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: scene)
        
        window?.rootViewController = getRootViewController()
        window?.makeKeyAndVisible()
    }
    
    func getRootViewController() -> UIViewController {
        let navigationController = BaseNavigationController()
        navigationController.navigationBar.accessibilityIdentifier = SetsAccessibilityStrings.navigationBarId.text
        let controller = CardSetsRouter.factory(client: InfoClient(), navigation: navigationController)
        navigationController.viewControllers.append(controller)
        return navigationController
    }
}
