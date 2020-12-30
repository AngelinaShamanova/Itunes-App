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
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(imageView)
        addSubview(collectionName)
        addSubview(artistName)
        imageView.contentMode = .scaleAspectFit
        artistName.textColor = .black
        setLabels(label: artistName)
        setLabels(label: collectionName)
        layoutConstraints()
    }
    
    private func layoutConstraints() {
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.centerX.equalTo(self)
        }
        artistName.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-20)
        }
        collectionName.snp.makeConstraints { make in
            make.top.equalTo(artistName.snp.bottom).offset(10)
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-20)
        }
    }
    
    private func setLabels(label: UILabel) {
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .gray
    }
    
}
