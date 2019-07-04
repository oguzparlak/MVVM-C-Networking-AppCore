//
//  ViewController.swift
//  MVVM-C-App-Core-Networking
//
//  Created by Oguz Parlak on 27.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import UIKit
import Core
import Networking

class TVShowListingView: UIViewController, Storyboarded {
    
    
    // MARK: - UI Elements
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Public  Variables
   
    weak var coordinator: TVShowListingCoordinator?
    var tvShowViewModel: TVShowViewModel?
    
    // MARK: - Methods
    func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .black
        tableView.register(UINib(nibName: "MovieListingCell", bundle: nil), forCellReuseIdentifier: "MovieListingCell")
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
