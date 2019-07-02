//
//  TVShowViewModel.swift
//  MVVM-C-App-Core-Networking
//
//  Created by Oguz Parlak on 30.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation
import Core
import Networking

class TVShowViewModel {
    
    var tvShowContainer: TVShowContainer? {
        didSet {
            // Update UI
            updateCellViewModels()
            tvShowInteractor.shouldUpdateTableView()
        }
    }
    
    var tvShowCellViewModels: [TVShowCellViewModel] = []
    
    private let tvShowRepository: TVShowRepository
    private let tvShowInteractor: TVShowInteractor
    
    init(tvShowRepository: TVShowRepository = TVShowRepository(requestConfigurator: RequestConfigurator(path: TVShowEndPoint.trendingTvShows(timeWindow: "week").provideUrl(), parameters: [Constants.Parameters.api_key : Constants.tmdbApiKey])), tvShowInteractor: TVShowInteractor) {
        self.tvShowRepository = tvShowRepository
        self.tvShowInteractor = tvShowInteractor
        fetchTVShows()
    }
    
    func fetchTVShows() {
        self.tvShowRepository.getRemoteDataSource(responseCallback: { [weak self] result in
            switch result {
            case .success(let tvShows):
                self?.tvShowContainer = tvShows
            case .error(let error):
                print(error)
            }
        })
    }
    
    func updateCellViewModels() {
        tvShowCellViewModels.removeAll()
        let tvShows = tvShowContainer?.results ?? []
        for tvShow in tvShows {
            tvShowCellViewModels.append(TVShowCellViewModel(tvShow: tvShow))
        }
    }
    
}
