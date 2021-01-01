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
    
    //MARK: - Public properties
    var searchHistory: Results<SearchHistoryDB>!
    var viewModel = AlbumViewModel()
    var album = [Album]()
    var searchText = ""
    var collectionView: UICollectionView!
    
    //MARK: - Override funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        searchHistory = realm.objects(SearchHistoryDB.self)
    }
    
    //MARK: - Private funcs
    private func configureUI() {
        view.backgroundColor = .white
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 230, height: UIScreen.main.bounds.width - 230)
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
            make.leading.trailing.bottom.equalTo(view)
            make.top.equalTo(view).offset(50)
        }
    }
    
    //MARK: - Collection View Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrackCell.cellId, for: indexPath) as! TrackCell
        viewModel.getAlbums(term: "\(searchText)", limit: "10") { [weak self] data in
            if !data.results.isEmpty {
                self?.album = data.results
                cell.collectionName.text = data.results[indexPath.item].collectionName
                cell.imageView.loadImage(url: URL(string: data.results[indexPath.item].artworkUrl100 ?? ""))
            }
        }
        return cell
    }
    
}
