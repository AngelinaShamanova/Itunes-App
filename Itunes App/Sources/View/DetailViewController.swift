//
//  DetailViewController.swift
//  Itunes App
//
//  Created by Angelina on 26.12.2020.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Public properties
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
    var tracks = String()
    var trackCount = Int()
    var country = String()
    var collectionId = Int()
    var tableView = UITableView()
    var trackViewModel = TrackViewModel()
    var track = [Track]()
    var activityIndicator = UIActivityIndicatorView()
    
    //MARK: - Override funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activityIndicator = initLoading()
    }
    
    //MARK: - Private funcs
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(collectionName)
        view.addSubview(artistName)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        tableView.isHidden = true
        imageView.isHidden = true
        collectionName.isHidden = true
        artistName.isHidden = true
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
        tableView.snp.makeConstraints { make in
            make.top.equalTo(collectionName.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalTo(view)
        }
    }
    
    private func grabDataFromNet(forCell: UITableViewCell, index: IndexPath) {
        
        trackViewModel.getTrack(collectionId: collectionId) { [weak self] data in
            
            forCell.textLabel?.text = data.results[index.row].trackName
            self?.tableView.isHidden = false
            
            if data.results[index.row].trackName?.count ?? 0 <= 1 {
                self?.tableView.isHidden = true
            }
            self?.imageView.isHidden = false
            self?.collectionName.isHidden = false
            self?.artistName.isHidden = false
            self?.activityIndicator.stopAnimating()
        }
    }
}

//MARK: - Table View Data Source, Table View Delegate
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        trackCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.selectionStyle = .none
        grabDataFromNet(forCell: cell, index: indexPath)
        return cell
    }
}
