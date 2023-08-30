//
//  UIImageExtension.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import UIKit

extension UIImageView {

    func loadFrom(urlString: String, defaultImage: UIImage? = nil) {
        guard let url = URL(string: urlString) else {
            if let defaultImage = defaultImage {
                self.image = defaultImage
            }
            return
        }
        ImageLoader().downloadImage(url) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            case .failure:
                if let defaultImage = defaultImage {
                    self.image = defaultImage
                }
            }
        }
    }
}
