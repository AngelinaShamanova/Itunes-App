//
//  Service.swift
//  Itunes App
//
//  Created by Angelina on 26.12.2020.
//

import Moya

//enum Service {
//    case getCollectionName
//    case getImagesString(breed: String)
//    case getSubbreedImages(breed: String, subbreed: String)
//}
//
//extension Service: TargetType {
//
//    var baseURL: URL {
//     URL(string: "https://itunes.apple.com/search?parameterkeyvalue")!
//    }
//
//    var path: String {
//        switch self {
//        case .getList:
//            return "/breeds/list/all"
//        case .getImagesString(let breed):
//            return "/breed/\(breed)/images"
//        case .getSubbreedImages(let breed, let subbreed):
//            return "/breed/\(breed)/\(subbreed)/images/"
//        }
//    }
//
//    var method: Method {
//        switch self {
//        case .getList, .getImagesString, .getSubbreedImages:
//            return .get
//        }
//    }
//    
//    var task: Task {
//        .requestPlain
//    }
//
//    var headers: [String: String]? {
//        ["Content-type": "application/json"]
//    }
//
//    var sampleData: Data {
//        Data()
//    }
//}

