//
//  Service.swift
//  Itunes App
//
//  Created by Angelina on 26.12.2020.
//

import Moya
import RxSwift

enum Service {
    case getAlbum(term: String, limit: String)
}

extension Service: TargetType {
    
    var baseURL: URL {
        URL(string: "https://itunes.apple.com/search?")!
    }
    
    var path: String {
        switch self {
        case .getAlbum(let term, let limit):
            return "\(term)&entity=album&attribute=albumTerm&\(limit)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAlbum:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getAlbum(let term, let limit):
            return .requestParameters(parameters: ["term" : term, "limit" : limit], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        nil
    }
    
    var sampleData: Data {
        Data()
    }
}

