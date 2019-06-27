//
//  Repository.swift
//  Core
//
//  Created by Oguz Parlak on 27.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation
import Networking

public protocol Repository {
    
    associatedtype T
    
    func getLocalDataSource() -> T
    
    func getRemoteDataSource(responseCallback: @escaping (Result<T, ApiError>) -> Void)
}
