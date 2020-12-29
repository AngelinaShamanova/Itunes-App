//
//  DetailViewController.swift
//  Itunes App
//
//  Created by Angelina on 26.12.2020.
//

import UIKit

class DetailViewController: UIViewController {
    
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
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(collectionName)
        view.addSubview(artistName)
        imageView.contentMode = .scaleAspectFit
        setLabels(label: collectionName)
        setLabels(label: artistName)
        artistName.textColor = .black
        layoutConstraints()
    }
    
    private func setLabels(label: UILabel) {
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .gray
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
    }

}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
