//
//  EndpointProvider.swift
//  Networking
//
//  Created by Oguz Parlak on 30.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation

public protocol EndpointProvider {
    
    func provideUrl() -> String
    
}
