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
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .black
        tableView.register(UINib(nibName: "MovieListingCell", bundle: nil), forCellReuseIdentifier: "MovieListingCell")
        
        tableView.rx.setPrefetchDataSource(self).disposed(by: disposeBag)
        tableView.rx.setDataSource(self).disposed(by: disposeBag)
        tableView.rx.itemSelected
            .subscribe(onNext: { (indexPath) in
                print("Cell tapped at \(indexPath.row)")
            }, onCompleted: {
                print("Completed")
            })
        .disposed(by: disposeBag)
    }
    
}

// MARK: - Lifecycle
extension TVShowListingView {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tvShowViewModel = TVShowViewModel(tvShowInteractor: self)
        initTableView()
    }
    
}
