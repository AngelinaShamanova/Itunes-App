//
//  AlbumViewModel.swift
//  Itunes App
//
//  Created by Angelina on 26.12.2020.
//

import Moya

class AlbumViewModel {
    
    // MARK: - Private Properties
    private let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin()])
    
    // MARK: - Public Properties
    var albums: AlbumModel?
    
    // MARK: - Public Methods
    func getAlbums(term: String, limit: String, onSuccess: @escaping (AlbumModel)->Void) {
        _ = provider.rx.request(.getAlbum(term: term, limit: limit)).subscribe { [weak self] event in
            switch event {
            case let .success(response):
                if let data = try? response.map(AlbumModel.self) {
                    self?.albums = data
                    onSuccess(data)
                }
            case let .error(error):
                print(error, "SOMETHING GOING WRONG")
            }
        }
    }
}

