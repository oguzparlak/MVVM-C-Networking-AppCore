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
import RxSwift

class TVShowRepository: Repository {
    
    typealias T = TVShowContainer?
    
    private var requestConfigurator: RequestConfigurator
    
    private var dataManager: TVShowDataManager?
    
    private var currentPage: Int = 1 {
        didSet {
            requestConfigurator.parameters = [
                "page" : String(currentPage),
                Constants.Parameters.api_key: Constants.tmdbApiKey]
        }
    }
    
    func incrementPage() {
        currentPage += 1
    }
    
    public init(requestConfigurator: RequestConfigurator, dataManager: TVShowDataManager? = TVShowDataManager(dataNotifier: DataNotifier<TVShowContainer>(dataCallback: { (container) in
        
    }, errorCallback: { (error) in
        
    }))) {
        self.dataManager = dataManager
        self.requestConfigurator = requestConfigurator
    }
    
    func getLocalDataSource() -> Observable<TVShowContainer?> {
        guard let dataManager = dataManager else { return Observable.just(TVShowContainer()) }
        return dataManager.loadAllTVShows()
    }
    
    func getRemoteDataSource() -> Observable<TVShowContainer?> {
        return ApiClient.request(ApiRouter(requestConfigurator: requestConfigurator))
    }
    
}
