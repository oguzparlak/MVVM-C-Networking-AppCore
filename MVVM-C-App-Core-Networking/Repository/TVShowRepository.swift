//
//  TVShowRepository.swift
//  MVVM-C-App-Core-Networking
//
//  Created by Oguz Parlak on 30.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation
import Networking
import Core

class TVShowRepository: Repository {
    
    typealias T = TVShowContainer?
    
    private let requestConfigurator: RequestConfigurator
    
    private var dataManager: TVShowDataManager?
    
    public init(requestConfigurator: RequestConfigurator, dataManager: TVShowDataManager? = TVShowDataManager(dataNotifier: DataNotifier<TVShowContainer>(dataCallback: { (container) in
        
    }, errorCallback: { (error) in
        
    }))) {
        self.dataManager = dataManager
        self.requestConfigurator = requestConfigurator
    }
    
    func getLocalDataSource() -> TVShowContainer? {
        return dataManager?.loadAllTVShows()
    }
    
    func getRemoteDataSource(responseCallback: @escaping (Result<TVShowContainer?, ApiError>) -> Void) {
        ApiClient.request(ApiRouter(requestConfigurator: requestConfigurator), completion: responseCallback)
    }
    
}
