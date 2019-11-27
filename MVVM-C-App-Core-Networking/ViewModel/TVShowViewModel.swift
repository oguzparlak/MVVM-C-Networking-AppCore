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
import PKHUD
import RxSwift

class TVShowViewModel {
    
    var tvShowContainer: TVShowContainer? {
        didSet {
            // Update UI
            updateCellViewModels()
        }
    }
    
    var tvShowObservables = PublishSubject<[TVShowCellViewModel]>()
    var tvShowCellViewModels: [TVShowCellViewModel] = []
    
    private let tvShowRepository: TVShowRepository
    private let disposeBag = DisposeBag()
    
    init(
        tvShowRepository: TVShowRepository = TVShowRepository(requestConfigurator: RequestConfigurator(path: TVShowEndPoint.trendingTvShows(timeWindow: "week").provideUrl(),parameters: [Constants.Parameters.api_key : Constants.tmdbApiKey]))) {
        self.tvShowRepository = tvShowRepository
        fetchTVShows()
    }
    
    func fetchTVShows(shouldApplyPagination: Bool = false) {
        HUD.show(.progress)
        if shouldApplyPagination { tvShowRepository.incrementPage() }
        tvShowRepository
            .getRemoteDataSource()
            .subscribe(onNext: { [weak self] tvShows in
                self?.tvShowContainer = tvShows
            }, onError: { (error) in
                print(error)
            }, onCompleted: {
                HUD.hide()
            })
            .disposed(by: disposeBag)
    }
    
    func updateCellViewModels() {
        let tvShows = tvShowContainer?.results ?? []
        for tvShow in tvShows {
            let tvShowCellViewModel: TVShowCellViewModel = TVShowCellViewModel(tvShow: tvShow)
            tvShowCellViewModels.append(tvShowCellViewModel)
        }
        tvShowObservables.on(.next(tvShowCellViewModels))
    }
    
}
