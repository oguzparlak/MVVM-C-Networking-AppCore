//
//  TVShowListingView+UITableViewDataSource.swift
//  MVVM-C-App-Core-Networking
//
//  Created by Oguz Parlak on 30.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation
import UIKit

extension TVShowListingView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tvShowViewModel?.tvShowCellViewModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tvShowView = tableView.dequeueReusableCell(withIdentifier: "MovieListingCell") as! MovieListingCell
        let tvShowViewModels = tvShowViewModel?.tvShowCellViewModels
        let tvShowCellViewModel = tvShowViewModels?[indexPath.row]
        tvShowView.tvShowViewModel = tvShowCellViewModel
        return tvShowView
    }
    
}
