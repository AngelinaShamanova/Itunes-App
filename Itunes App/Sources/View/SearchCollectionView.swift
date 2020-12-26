//
//  SearchViewController.swift
//  Itunes App
//
//  Created by Angelina on 25.12.2020.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - Private Properties
    private var collectionView: UICollectionView!

    // MARK: - Public Properties
    let tracks = [TrackModel(trackName: "bad guy", artistName: "Billie Eilish", artworkUrl100: ""), TrackModel(trackName: "bad guy", artistName: "Billie Eilish", artworkUrl100: ""), TrackModel(trackName: "bad guy", artistName: "Billie Eilish", artworkUrl100: ""), TrackModel(trackName: "bad guy", artistName: "Billie Eilish", artworkUrl100: ""), TrackModel(trackName: "bad guy", artistName: "Billie Eilish", artworkUrl100: ""), TrackModel(trackName: "bad guy", artistName: "Billie Eilish", artworkUrl100: ""), TrackModel(trackName: "bad guy", artistName: "Billie Eilish", artworkUrl100: ""), TrackModel(trackName: "bad guy", artistName: "Billie Eilish", artworkUrl100: ""), TrackModel(trackName: "bad guy", artistName: "Billie Eilish", artworkUrl100: "")]
    
    //MARK: - Override funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Private funcs
    private func configureUI() {
        view.backgroundColor = .white
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 200, height: UIScreen.main.bounds.width - 200)
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TrackCell.self, forCellWithReuseIdentifier: TrackCell.cellId)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
    }
    
    // MARK: - Collection View Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrackCell.cellId, for: indexPath) as! TrackCell
//        let track = tracks[indexPath.item].artworkUrl100
//        cell.imageView.image = UIImage(named: "\(track)")
        cell.imageView.image = UIImage(named: "questionnaire.jpg")
        return cell
    }

}
