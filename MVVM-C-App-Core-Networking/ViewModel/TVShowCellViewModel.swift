//
//  TVShowCellViewModel.swift
//  MVVM-C-App-Core-Networking
//
//  Created by Oguz Parlak on 30.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation

class TVShowCellViewModel {
    
    private let tvShow: TVShow
    
    var title: String? {
        get {
            return tvShow.name
        }
    }
    
    var overview: String? {
        get {
            return tvShow.overview
        }
    }
    
    var posterPath: String? {
        get {
            return tvShow.posterPath
        }
    }
    
    var backdropPath: String? {
        get {
            return tvShow.backdropPath
        }
    }
    
    var voteDescription: String? {
        get {
            return "\(tvShow.voteAverage!) / 10 (\(tvShow.voteCount!) total votes)"
        }
    }
    
    init(tvShow: TVShow) {
        self.tvShow = tvShow
    }
    
}
