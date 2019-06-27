//
//  RequestConfigurator.swift
//  Networking
//
//  Created by Oguz Parlak on 27.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation
import Alamofire

public struct RequestConfigurator {
    
    // MARK: - Variables
    
    // Parameters that will be passed into url
    // as query string
    public var parameters: Parameters? = [:]
    
    // Additional path will be added to source url
    public var path: String? = ""
    
    // The HTTP Method of the request
    // Ex: .get, .post
    public var httpMethod: HTTPMethod? = .get
    
    // MARK: - Initializer
    public init(path: String) {
        self.path = path
    }
    
}
