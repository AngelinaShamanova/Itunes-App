//
//  TableHeaderView.swift
//  Itunes App
//
//  Created by Angelina on 30.12.2020.
//

import UIKit

class TableHeaderView: UIView {
    
    var imageView: UIImageView = {
        let img = UIImageView()
        img.layer.masksToBounds = false
        img.layer.cornerRadius = 0.8
        img.layer.shadowColor = UIColor(named: "lightGray")?.cgColor
        img.layer.shadowOpacity = 3
        img.layer.shadowRadius = 1.7
        return img
    }()
    var collectionName = UILabel()
    var artistName = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 200))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
