//
//  DataNotifier.swift
//  Core
//
//  Created by Oguz Parlak on 27.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation

public struct DataNotifier<Data>: DataObserver {
    
    public typealias T = Data
    
    private let dataCallback: (Data?) -> ()
    
    private let errorCallback: (Error) -> ()
    
    public init(dataCallback: @escaping (Data?) -> (), errorCallback: @escaping (Error) -> ()) {
        self.dataCallback = dataCallback
        self.errorCallback = errorCallback
    }
    
    public func onDataChanged(data: Data?) {
        dataCallback(data)
    }
    
    public func onError(error: Error) {
        errorCallback(error)
    }
    
}

public protocol DataObserver {
    
    associatedtype T
    
    func onDataChanged(data: T?)
    
    func onError(error: Error)
    
}
