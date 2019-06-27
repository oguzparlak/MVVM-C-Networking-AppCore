//
//  UINavigationController+.swift
//  Core
//
//  Created by Oguz Parlak on 27.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    public func getFromViewController() -> UIViewController? {
        return self.transitionCoordinator?.viewController(forKey: .from)
    }
    
    public func configureForBlackTheme() {
        if #available(iOS 11.0, *) {
            self.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
        self.navigationBar.barStyle = .black
        self.navigationBar.tintColor = .white
        self.navigationBar.barTintColor = .black
        self.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "AvenirNext-Bold", size: 17) as Any,
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        if #available(iOS 11.0, *) {
            self.navigationBar.largeTitleTextAttributes = [
                NSAttributedString.Key.font: UIFont(name: "AvenirNext-Bold", size: 34) as Any,
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
        } else {
            // Fallback on earlier versions
        }
    }
    
}