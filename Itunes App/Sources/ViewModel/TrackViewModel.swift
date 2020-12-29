//
//  TrackViewModel.swift
//  Itunes App
//
//  Created by Angelina on 29.12.2020.
//

import Moya

class TrackViewModel {
    
    // MARK: - Private Properties
    private let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin()])
    
    // MARK: - Public Properties
    var tracks: TrackModel?
    
    // MARK: - Public Methods
    func getTrack(collectionId: Int, onSuccess: @escaping (TrackModel)->Void) {
        _ = provider.rx.request(.getTrack(collectionId: collectionId)).subscribe { [weak self] event in
            switch event {
            case let .success(response):
                if let data = try? response.map(TrackModel.self) {
                    self?.tracks = data
                    onSuccess(data)
                }
            case let .error(error):
                print(error, "SOMETHING GOING WRONG")
            }
        }
    }
}



