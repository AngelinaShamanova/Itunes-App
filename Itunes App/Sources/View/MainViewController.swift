//
//  MainViewController.swift
//  Itunes App
//
//  Created by Angelina on 25.12.2020.
//

import UIKit

class MainViewController: UITabBarController {
    
    //MARK: - Private properties
    private let searchViewController = SearchViewController()
    private let historyTableView = HistoryTableViewController()
    
    //MARK: - Override funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tabBar.tintColor = #colorLiteral(red: 1, green: 0, blue: 0.3764705882, alpha: 1)
        viewControllers = [
            generateViewController(rootViewController: searchViewController, image: #imageLiteral(resourceName: "Search"), title: "Search"),
            generateViewController(rootViewController: historyTableView, image: #imageLiteral(resourceName: "History"), title: "History")
        ]
    }
    
    //MARK: - Private funcs
    private func configureUI() {
    }
    
    private func generateViewController(rootViewController: UIViewController, image: UIImage, title: String) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.image = image
        navigationVC.tabBarItem.title = title
        rootViewController.navigationItem.title = title
        navigationVC.navigationBar.prefersLargeTitles = true
        return navigationVC
    }
}

