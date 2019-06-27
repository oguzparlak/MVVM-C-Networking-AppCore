//
//  ConcreteCoordinator.swift
//  Core
//
//  Created by Oguz Parlak on 27.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation
import UIKit

public class ConcreteCoordinator: NSObject, Coordinator, UINavigationControllerDelegate  {
    
    // MARK: - Variables
    public var navigationController: UINavigationController
    
    public var childCoordinators = [Coordinator]()
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Functions
    
    /// This method will only be called internally
    public func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    public func childCoordinatorShouldNotBeDeleted(navigationController: UINavigationController) -> Bool {
        guard let fromViewController = navigationController.getFromViewController() else {
            return true
        }
        if navigationController.viewControllers.contains(fromViewController) {
            return true
        }
        return false
    }
    
    public func start() {
        fatalError("start() should be overriden")
    }
    
}
