//
//  Service.swift
//  Itunes App
//
//  Created by Angelina on 26.12.2020.
//

import Moya
import RxSwift

enum Service {
    case getCover(term: String, limit: String)
}

extension Service: TargetType {
    
    var baseURL: URL {
        URL(string: "https://itunes.apple.com/search?term=entity=allArtist&attribute=albumTerm")!
    }
    
    var path: String {
        switch self {
        case .getCover(let term, let limit):
            return "\(term)&\(limit)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCover:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getCover(let term, let limit):
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

