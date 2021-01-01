//
//  SearchHistoryDB.swift
//  Itunes App
//
//  Created by Angelina on 31.12.2020.
//

import RealmSwift

class SearchHistoryDB: Object {
    @objc dynamic var searchText = ""
    let history = List<History>()
}

class History: Object {
    @objc dynamic var collectionName = ""
    @objc dynamic var imageUrl = ""
}
