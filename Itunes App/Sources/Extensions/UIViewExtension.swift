//
//  UIViewExtension.swift
//  Itunes App
//
//  Created by Angelina on 26.12.2020.
//

import UIKit

extension UIActivityIndicatorView {
    
    func scaleIndicator(factor: CGFloat) {
        transform = CGAffineTransform(scaleX: factor, y: factor)
    }
}

extension UIImageView {
    func loadImage(url: URL?) {
        guard let url = url else { print("Incorrect url"); return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
