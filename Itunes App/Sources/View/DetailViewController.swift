//
//  DetailViewController.swift
//  Itunes App
//
//  Created by Angelina on 26.12.2020.
//

import UIKit

class DetailViewController: UIViewController {
    
    var imageView = UIImageView()
    var collectionName = UILabel()
    var artistName = UILabel()
    var songsTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(collectionName)
        view.addSubview(artistName)
        view.addSubview(songsTableView)
        imageView.contentMode = .scaleAspectFit
        collectionName.textAlignment = .center
        collectionName.numberOfLines = 0
        collectionName.textColor = .gray
        artistName.textAlignment = .center
        artistName.numberOfLines = 0
        artistName.textColor = .black
        layoutConstraints()
    }
    
    private func layoutConstraints() {
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.top.equalTo(view).offset(50)
            make.centerX.equalTo(view)
        }
        artistName.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
        }
        collectionName.snp.makeConstraints { make in
            make.top.equalTo(artistName.snp.bottom).offset(10)
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
        }
        songsTableView.snp.makeConstraints { make in
            make.top.equalTo(collectionName.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalTo(view)
        }
    }

}
