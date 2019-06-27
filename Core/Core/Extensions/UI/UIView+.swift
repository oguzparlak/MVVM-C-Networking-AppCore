//
//  UIView+.swift
//  Core
//
//  Created by Oguz Parlak on 27.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    public func applyGradient(firstColor: UIColor, secondColor: UIColor) {
        let gradient = CAGradientLayer()
        
        // TODO Change gradient position
        // gradient.startPoint = CGPoint(x: 0, y: 0)
        // gradient.endPoint = CGPoint(x: 0, y: 0)
        gradient.frame = self.bounds
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        
        self.layer.insertSublayer(gradient, at: 0)
    }
    
}
