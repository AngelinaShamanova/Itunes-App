//
//  CoverCell.swift
//  Itunes App
//
//  Created by Angelina on 26.12.2020.
//

import UIKit

class TrackCell: UICollectionViewCell {
    
    //MARK: - Private properties
    
    //MARK: - Public properties
    static var cellId = "image"
    var imageView = UIImageView()
    
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
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
}
