//
//  CoverCell.swift
//  Itunes App
//
//  Created by Angelina on 26.12.2020.
//

import UIKit

class TrackCell: UICollectionViewCell {
    
    //MARK: - Public properties
    static var cellId = "image"
    var imageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.layer.masksToBounds = false
        img.layer.cornerRadius = 0.8
        img.layer.shadowColor = UIColor(named: "lightGray")?.cgColor
        img.layer.shadowOpacity = 3
        img.layer.shadowRadius = 1.7
        return img
    }()
    var collectionName: UILabel = {
        let name = UILabel()
        name.numberOfLines = 0
        name.textAlignment = .center
        name.adjustsFontSizeToFitWidth = true
        return name
    }()
    
    //MARK: - Override funcs
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private funcs
    private func configureUI() {
        addSubview(imageView)
        addSubview(collectionName)
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.top.equalTo(self).offset(5)
            make.centerX.equalTo(self)
        }
        collectionName.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.bottom.equalTo(self).offset(-5)
            make.leading.equalTo(self).offset(2)
            make.trailing.equalTo(self).offset(-2)
            make.height.equalTo(60)
        }
    }
}
