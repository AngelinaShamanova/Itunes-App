//
//  HistoryTableViewController.swift
//  Itunes App
//
//  Created by Angelina on 25.12.2020.
//

import UIKit

class HistoryTableViewController: UITableViewController {

    //MARK: - Override funcs
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }

    // MARK: - Table View Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        return cell
    }
}
