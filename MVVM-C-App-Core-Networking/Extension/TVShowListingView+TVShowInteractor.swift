//
//  TVShowListingView+Interactions.swift
//  MVVM-C-App-Core-Networking
//
//  Created by Oguz Parlak on 30.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation

extension TVShowListingView: TVShowInteractor {
    
    func shouldUpdateTableView() {
        tableView.reloadData()
    }
    
}
