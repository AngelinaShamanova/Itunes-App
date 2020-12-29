//
//  ViewModel.swift
//  Itunes App
//
//  Created by Angelina on 26.12.2020.
//

import Moya

class ViewModel {
    
    // MARK: - Private Properties
    private let provider = MoyaProvider<Service>(plugins: [NetworkLoggerPlugin()])
    
    // MARK: - Public Properties
    var tracks: AlbumModel?
    
    // MARK: - Public Methods
    func getAlbums(term: String, limit: String, onSuccess: @escaping (AlbumModel)->Void) {
        _ = provider.rx.request(.getAlbum(term: term, limit: limit)).subscribe { [weak self] event in
            switch event {
            case let .success(response):
                if let data = try? response.map(AlbumModel.self) {
                    self?.tracks = data
                    onSuccess(data)
                }
            case let .error(error):
                print(error, "SOMETHING GOING WRONG")
            }
        }
    }
}

