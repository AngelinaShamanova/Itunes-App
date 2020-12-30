//
//  TrackModel.swift
//  Itunes App
//
//  Created by Angelina on 29.12.2020.
//

import Foundation

struct TrackModel: Decodable {
    let resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
    let trackName: String?
    let collectionName: String?
}
