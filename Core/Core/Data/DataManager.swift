//
//  DataManager.swift
//  Core
//
//  Created by Oguz Parlak on 27.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation

public protocol DataManager {
    
    associatedtype T
    
    func save(with key: String, data: T?)
    
    func load(with key: String) -> T?
    
}
