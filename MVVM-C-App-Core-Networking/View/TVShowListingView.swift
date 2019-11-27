//
//  ViewController.swift
//  MVVM-C-App-Core-Networking
//
//  Created by Oguz Parlak on 27.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import UIKit
import Core
import RxSwift
import RxCocoa

class TVShowListingView: UIViewController, Storyboarded {
    
    // MARK: - UI Elements
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Public  Variables
    weak var coordinator: TVShowListingCoordinator?
    var tvShowViewModel: TVShowViewModel?
    
    // MARK: - Private Variables
    private let disposeBag = DisposeBag()
    
    // MARK: - Methods
    func initTableView() {
        tableView.register(MovieListingCell.self)
        
        // Cell Binding
        tvShowViewModel?
            .tvShowObservables
            .bind(to: tableView.rx.items(cellType: MovieListingCell.self)) { [weak self] (row, element, cell) in
                let tvShowViewModels = self?.tvShowViewModel?.tvShowCellViewModels
                let tvShowCellViewModel = tvShowViewModels?[row]
                cell.tvShowViewModel = tvShowCellViewModel
            }
            .disposed(by: disposeBag)
        
        // Pagination
        tableView.rx
            .willDisplayCell
            .subscribe(onNext: { [weak self] (cell: UITableViewCell, indexPath: IndexPath) in
                guard let tvShowViewModels: [TVShowCellViewModel] = self?.tvShowViewModel?.tvShowCellViewModels else { return }
                let shouldFetchRemoteData: Bool = tvShowViewModels.count == indexPath.row + 1
                if shouldFetchRemoteData {
                    self?.tvShowViewModel?.fetchTVShows(shouldApplyPagination: true)
                }
            })
            .disposed(by: disposeBag)
        
        // Item Selected
        tableView.rx
            .modelSelected(TVShowCellViewModel.self)
            .subscribe(onNext: { (cellViewModel) in
                print(cellViewModel)
            })
            .disposed(by: disposeBag)
    }
    
}

// MARK: - Lifecycle
extension TVShowListingView {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tvShowViewModel = TVShowViewModel()
        initTableView()
    }
    
}
