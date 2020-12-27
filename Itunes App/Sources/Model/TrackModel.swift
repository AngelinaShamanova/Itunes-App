//
//  TrackModel.swift
//  Itunes App
//
//  Created by Angelina on 26.12.2020.
//

import Foundation

struct TrackModel: Decodable {
    let resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
    let trackName: String
    let artistName: String
    let collectionName: String?
    let artworkUrl100: String?
}
