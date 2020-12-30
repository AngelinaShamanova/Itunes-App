//
//  DetailViewController.swift
//  Itunes App
//
//  Created by Angelina on 26.12.2020.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Public properties
    var tracks = String()
    var trackCount = Int()
    var country = String()
    var collectionId = Int()
    var countTrack: (()->Void)?
    var tableView = UITableView()
    var trackViewModel = TrackViewModel()
    var track = [Track]()
    var activityIndicator = UIActivityIndicatorView()
    var headerView = TableHeaderView()
    
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
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        tableView.isHidden = true
        tableView.tableHeaderView = headerView
        layoutConstraints()
    }
    
    private func layoutConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    private func grabDataFromNet(cell: UITableViewCell, indexPath: IndexPath) {
        
        trackViewModel.getTrack(collectionId: collectionId) { [weak self] data in
            let dataTrackName = data.results[indexPath.row].trackName
            cell.textLabel?.text = dataTrackName
            self?.tableView.isHidden = false
            if (dataTrackName?.count ?? 0) <= 1 {
                self?.trackCount = dataTrackName?.count ?? 0
                cell.textLabel?.text = data.results[indexPath.row].collectionName
            }
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
        grabDataFromNet(cell: cell, indexPath: indexPath)
        return cell
    }
}
