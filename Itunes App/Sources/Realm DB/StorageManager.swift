//
//  StorageManager.swift
//  Itunes App
//
//  Created by Angelina on 01.01.2021.
//

import RealmSwift

class StorageManager {
    static func saveSearchHistory(_ searchHistory: SearchHistoryDB) {
        try! realm.write {
            realm.add(searchHistory)
        }
    }
    static func deleteSearchHistory(_ searchHistory: SearchHistoryDB) {
        try! realm.write {
            let search = searchHistory
            realm.delete(search)
        }
    }
}
