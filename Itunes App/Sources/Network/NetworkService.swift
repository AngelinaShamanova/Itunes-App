//
//  NetworkService.swift
//  Itunes App
//
//  Created by Angelina on 26.12.2020.
//

import Moya
import RxSwift

enum NetworkService {
    case getAlbum(term: String, limit: String)
    case getTrack(collectionId: Int)
}

extension NetworkService: TargetType {
    
    var baseURL: URL {
        URL(string: "https://itunes.apple.com/")!
    }
    
    var path: String {
        switch self {
        case .getAlbum(let term, let limit):
            return "search/\(term)&entity=album&attribute=albumTerm&\(limit)"
        case .getTrack(let collectionId):
            return "lookup/\(collectionId)&entity=song&media=music"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAlbum:
            return .get
        case .getTrack:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getAlbum(let term, let limit):
            return .requestParameters(parameters: ["term" : term, "limit" : limit], encoding: URLEncoding.default)
        case .getTrack(let collectionId):
            return .requestParameters(parameters: ["id" : collectionId], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        nil
    }
    
    var sampleData: Data {
        Data()
    }
}

