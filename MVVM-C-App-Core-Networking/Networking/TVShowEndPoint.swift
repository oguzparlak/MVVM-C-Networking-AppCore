//
//  MovieEndPoint.swift
//  MVVM-C-App-Core-Networking
//
//  Created by Oguz Parlak on 30.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation
import Networking

/// Models the TVShowEndPoint
enum TVShowEndPoint : EndpointProvider {
    
    // Gathers popular tv shows weekly or daily
    case trendingTvShows(timeWindow: String)
    case image(width: String, posterPath: String)
    
    // MARK: - EndPointProvider conforming methods
    
    func provideUrl() -> String {
        
        switch self {
        case .trendingTvShows(let timeWindow):
            return "trending/tv/\(timeWindow)"
        case .image(let width, let posterPath):
            return "https://image.tmdb.org/t/p/w\(width)/\(posterPath)"
        }
    }
    
    // MARK: - Private methods
    
    private func parameters(for page: Int) -> [String : String] {
        return [
            "page" : String(page)
        ]
    }
}
