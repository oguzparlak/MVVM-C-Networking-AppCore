//
//  TVShowListingCoordinator.swift
//  MVVM-C-App-Core-Networking
//
//  Created by Oguz Parlak on 30.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation
import Core

class TVShowListingCoordinator: ConcreteCoordinator {
    
    override func start() {
        let listingView = TVShowListingView.instantiate()
        listingView.coordinator = self
        listingView.title = "Backlight"
        listingView.tabBarItem = UITabBarItem(title: "Popular", image: UIImage(named: "ic_popular_disabled"), selectedImage: UIImage(named: "ic_popular"))
        navigationController.pushViewController(listingView, animated: true)
        navigationController.configureTheme()
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if childCoordinatorShouldNotBeDeleted(navigationController: navigationController) { return }
    }
    
}
