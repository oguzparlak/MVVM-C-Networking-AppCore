//
//  TVShowListingView+UITableViewDataSourcePrefetching.swift
//  MVVM-C-App-Core-Networking
//
//  Created by Oguz Parlak on 4.07.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation
import UIKit

extension TVShowListingView: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard let tvShowViewModels: [TVShowCellViewModel] = tvShowViewModel?.tvShowCellViewModels else { return }
        let shouldFetchRemoteData: Bool = indexPaths.contains { (indexPath) -> Bool in
            // If there is 5 more rows to go, than start fetching data from remote
            indexPath.row == tvShowViewModels.count - 5
        }
        if shouldFetchRemoteData {
            tvShowViewModel?.fetchTVShows(shouldApplyPagination: true)
        }
    }
    
}
