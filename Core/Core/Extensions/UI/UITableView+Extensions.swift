//
//  UITableView+Extensions.swift
//  Core
//
//  Created by Oguz Parlak on 27.11.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation
import UIKit

public extension UITableView {
    
    func register(_ cell: UITableViewCell.Type, bundle: Bundle? = nil) {
        let identifier: String = String(describing: cell)
        self.register(
            UINib(nibName: identifier,
                  bundle: bundle),
                  forCellReuseIdentifier: identifier)
    }
    
}
