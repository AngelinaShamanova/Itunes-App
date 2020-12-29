//
//  UIViewControllerExtension.swift
//  Itunes App
//
//  Created by Angelina on 26.12.2020.
//

import UIKit

extension UIViewController {
    
    func initLoading() -> UIActivityIndicatorView {
        let load = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
        view.addSubview(load)
        load.scaleIndicator(factor: 2)
        load.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        load.hidesWhenStopped = true
        load.style = UIActivityIndicatorView.Style.gray
        load.startAnimating()
        return load
    }
}
