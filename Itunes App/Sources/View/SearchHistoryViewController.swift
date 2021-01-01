//
//  SearchHistoryViewController.swift
//  Itunes App
//
//  Created by Angelina on 30.12.2020.
//

import UIKit
import RealmSwift

let realm = try! Realm()

class SearchHistoryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var searchHistoryDB: Results<SearchHistoryDB>!
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        searchHistoryDB = realm.objects(SearchHistoryDB.self)
        print("REALM OBJECTS: ", realm.objects(SearchHistoryDB.self))
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 200, height: UIScreen.main.bounds.width - 200)
        layout.scrollDirection = .vertical
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        self.collectionView.backgroundColor = UIColor.white
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(TrackCell.self, forCellWithReuseIdentifier: TrackCell.cellId)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        layoutConstraints()
    }
    
    
    private func layoutConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchHistoryDB.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrackCell.cellId, for: indexPath) as! TrackCell
            let history = History()
            cell.collectionName.text = history.collectionName
            cell.imageView.loadImage(url: URL(string: history.imageUrl))
        return cell
    }
    
}
