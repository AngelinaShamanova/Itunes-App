//
//  HistoryTableViewController.swift
//  Itunes App
//
//  Created by Angelina on 25.12.2020.
//

import UIKit
import RealmSwift

class HistoryTableViewController: UITableViewController {
    
    var searchHistoryDB: Results<SearchHistoryDB>!
    
    //MARK: - Override funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        searchHistoryDB = realm.objects(SearchHistoryDB.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchHistoryDB.count > 0 ? (searchHistoryDB.count) : 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let searchHistory = searchHistoryDB[indexPath.row]
        cell.textLabel?.text = searchHistory.searchText
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SearchHistoryViewController()
        self.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let searchHistory = searchHistoryDB[indexPath.row]
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { _, _ in
            StorageManager.deleteSearchHistory(searchHistory)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return [deleteAction]
    }
}
