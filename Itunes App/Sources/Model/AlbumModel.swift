//
//  TrackModel.swift
//  Itunes App
//
//  Created by Angelina on 26.12.2020.
//

import Foundation

struct AlbumModel: Decodable {
    let resultCount: Int
    var results: [Album]
}

struct Album: Decodable {
    let artistName: String
    let collectionName: String?
    let artworkUrl100: String?
    let country: String
    let trackCount: Int
    let collectionId: Int
}


