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
    private var timer: Timer?
    private let viewModel = ViewModel()
    
    // MARK: - Public Properties
    var tracks = [Track]()
    var label = UILabel()
    var activityIndicator = UIActivityIndicatorView()
//    var activityLabel: UILabel = {
//        let label = UILabel()
//        label.text = "LOADING"
//        label.font = UIFont.systemFont(ofSize: 14)
//        label.textColor = .lightGray
//        label.textAlignment = .center
//        return label
//    }()
    let searchController = UISearchController(searchResultsController: nil )
    
    //MARK: - Override funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Collection View Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrackCell.cellId, for: indexPath) as! TrackCell
        guard let trackImage = tracks[indexPath.item].artworkUrl100 else { return cell }
        cell.collectionName.text = tracks[indexPath.row].collectionName
        cell.imageView.loadImage(url: URL(string: trackImage))
        return cell
    }
    
    //MARK: - Collection View Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellName = tracks[indexPath.item]
        guard let image = cellName.artworkUrl100 else { return }
        
        let vc = DetailViewController()
        vc.artistName.text = cellName.artistName
        vc.collectionName.text = cellName.collectionName
        vc.imageView.loadImage(url: URL(string: image))
        modalPresentationStyle = .popover
        present(vc, animated: true, completion: nil)
    }
    
    //MARK: - Private funcs
    private func configureUI() {
        view.backgroundColor = .white
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 200, height: UIScreen.main.bounds.width - 200)
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TrackCell.self, forCellWithReuseIdentifier: TrackCell.cellId)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        view.addSubview(label)
//        view.addSubview(activityLabel)
//        activityLabel.isHidden = true
        setupSearchBar()
        label.text = "Please enter search term above"
        label.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
//        activityLabel.snp.makeConstraints { make in
//            make.center.equalTo(view)
//        }
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
}

    //MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.label.isHidden = true
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            
            self.activityIndicator = self.initLoading()
//            self.activityLabel.isHidden = false
            
            self.viewModel.getCoverTracks(term: searchText, limit: "10") { data in
                if !data.results.isEmpty {
                    print("[!] RESULTS DATA: \(data.results)")
                    self.tracks = data.results
                    self.collectionView.reloadData()
                } else {
                    print("[!] RESULTS DATA ARE EMPTY")
                }
                self.activityIndicator.stopAnimating()
//                self.activityLabel.isHidden = true
            }
        })
    }
}

