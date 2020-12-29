//
//  UserDefaultsAppStorage.swift
//  Itunes App
//
//  Created by Angelina on 29.12.2020.
//

import UIKit

class UserDefaultsAppStorage {
    
    var userDefaults: UserDefaults {
        return UserDefaults.standard
    }
    var searchText: [String]? {
        get {
            UserDefaults.standard.stringArray(forKey: #function)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: #function)
        }
    }
}

class AppData: NSObject {
    var storage = UserDefaultsAppStorage()
    private static var sharedManager: AppData = {
        let appData = AppData()
        return appData
    }()
    class func shared() -> AppData {
        return sharedManager
    }
}
