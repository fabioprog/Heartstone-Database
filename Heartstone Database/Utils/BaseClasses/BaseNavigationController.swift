//
//  BaseNavigationController.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {        
        navigationBar.barTintColor = ColorAsset.primary.color
        navigationBar.backgroundColor = ColorAsset.primary.color
        navigationBar.titleTextAttributes = [.foregroundColor: ColorAsset.primaryText.color]
        navigationBar.largeTitleTextAttributes = [.foregroundColor: ColorAsset.primaryText.color]
        navigationBar.tintColor = ColorAsset.primaryText.color
        navigationBar.prefersLargeTitles = false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return traitCollection.userInterfaceStyle == .light ? .darkContent : .lightContent
    }
}
