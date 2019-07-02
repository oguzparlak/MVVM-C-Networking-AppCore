//
//  TVShowDataManager.swift
//  MVVM-C-App-Core-Networking
//
//  Created by Oguz Parlak on 30.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation
import Core

class TVShowDataManager: KeyValueManager<TVShowContainer, TVShowContainer> {
    
    // MARK: - Initializer
    override init(dataNotifier: DataNotifier<TVShowContainer>?) {
        super.init(dataNotifier: dataNotifier)
    }
    
    // MARK: - Public methods
    func loadAllTVShows() ->  TVShowContainer? {
        return self.load(with: "tv_shows")
    }
    
    func saveAllTVShows(data: TVShowContainer?) {
        self.save(with: "tv_shows", data: data)
    }
    
}
