//
//  RootController.swift
//  MVVM-C-App-Core-Networking
//
//  Created by Oguz Parlak on 30.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation
import Core

class RootController: UITabBarController {
    
    let tvShowListingCoordinator = TVShowListingCoordinator(navigationController: UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Customize UI
        if #available(iOS 11.0, *) {
            tabBar.tintColor = UIColor(named: "color_theme")
        }
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Futura", size: 11) as Any], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Futura", size: 11) as Any], for: .selected)
        
        // MARK: - Start Coordinators
        tvShowListingCoordinator.start()
        
        // MARK: - Specify ViewControllers
        viewControllers = [tvShowListingCoordinator.navigationController]
        
    }
    
}
