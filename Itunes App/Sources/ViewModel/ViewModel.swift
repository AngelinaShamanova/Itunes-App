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
    var tracks: TrackModel?
    
    // MARK: - Public Methods
    func getCoverTracks(term: String, limit: String, onSuccess: @escaping (TrackModel)->Void) {
        _ = provider.rx.request(.getCover(term: term, limit: limit)).subscribe { [weak self] event in
            switch event {
            case let .success(response):
                if let data = try? response.map(TrackModel.self) {
                    self?.tracks = data
                    onSuccess(data)
                }
            case let .error(error):
                print(error)
            }
        }
    }
}

