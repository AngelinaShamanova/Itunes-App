//
//  AppDelegate.swift
//  Itunes App
//
//  Created by Angelina on 25.12.2020.
//

import SnapKit
import Moya
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

//        var config = Realm.Configuration(schemaVersion: 1, migrationBlock: { migration, oldSchemaVersion in if (oldSchemaVersion < 1) {}
//            })
//            config.deleteRealmIfMigrationNeeded = true
//            Realm.Configuration.defaultConfiguration = config
//        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = MainViewController()
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

