//
//  StorageManager.swift
//  Itunes App
//
//  Created by Angelina on 01.01.2021.
//

import RealmSwift

//let realm = try! Realm()

class StorageManager {
    static func saveSearchHistory(_ searchHistory: SearchHistoryDB, _ history: History) {
        try! realm.write {
            realm.add(searchHistory)
            searchHistory.history.append(history)
        }
    }
    static func deleteSearchHistory(_ searchHistory: SearchHistoryDB) {
        try! realm.write {
            let search = searchHistory.history
            realm.delete(search)
            realm.delete(searchHistory)
        }
    }
}
