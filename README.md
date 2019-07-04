# MVVM-C-Networking App Core

[![IDE](https://img.shields.io/badge/Xcode-10-blue.svg)](https://developer.apple.com/xcode/)
[![Language](https://img.shields.io/badge/swift-4-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/iOS-12-green.svg)](https://developer.apple.com/ios/)

A lightweight, easy and ready to use, highly extensible core module for you to integrate into your project. This project aims to create clean, extensible and weakly coupled architecture for everybody to use.

# Techstack
- MVVM
- Coordinator Pattern
- Repository Pattern
- Alamofire

# Modules
## Core
Core module provides you:
- Navigation (via Coordinator)
- Data Management
- Repository
- Caching
- UI Componenets (Not implemented in this project)

## Networking
Networking module does does nothing but API Request. It manages your network requests and routes with specified parameters, paths, http methods.

# Code Samples
This feature sample consumes TMDB API. It displays the trending TV Shows with Pagination. This feature will guide you how to apply core modules into your feature module.  

## Coordinator
Define your coordinator like this. In start method initialize your `View`. You may want to coordinate to another scene. This project is a SingleViewApplication. So you may want to checkout [this](https://github.com/oguzparlak/CoordinatorExperiment) project to see how routing is made between Coordinators.

```swift
import Foundation
import Core

class TVShowListingCoordinator: ConcreteCoordinator {

override func start() {
let listingView = TVShowListingView.instantiate()
listingView.coordinator = self
listingView.title = "Backlight"
listingView.tabBarItem = UITabBarItem(title: "Popular", image: UIImage(named: "ic_popular_disabled"), selectedImage: UIImage(named: "ic_popular"))
navigationController.pushViewController(listingView, animated: true)
navigationController.configureTheme()
}

func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
if childCoordinatorShouldNotBeDeleted(navigationController: navigationController) { return }
}

}
```

## View
Define your Views as usual. Keep an instance of your `Coordinator` and `ViewModel`

```swift
import UIKit
import Core

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
```

## ViewModel
Your ViewModel manages the data and view. Keep an instance of `Model`, `Repository` and `Interactor` here.
When Network request comes through fetch the remote data via Repository and update the model. Finally, you can update your view.

```swift
import Foundation
import Core
import Networking

class TVShowViewModel {

var tvShowContainer: TVShowContainer? {
didSet {
// Update UI
updateCellViewModels()
tvShowInteractor.shouldUpdateTableView()
}
}

var tvShowCellViewModels: [TVShowCellViewModel] = []

private let tvShowRepository: TVShowRepository
private let tvShowInteractor: TVShowInteractor

init(tvShowRepository: TVShowRepository = TVShowRepository(requestConfigurator: RequestConfigurator(path: TVShowEndPoint.trendingTvShows(timeWindow: "week").provideUrl(), parameters: [Constants.Parameters.api_key : Constants.tmdbApiKey])), tvShowInteractor: TVShowInteractor) {
self.tvShowRepository = tvShowRepository
self.tvShowInteractor = tvShowInteractor
fetchTVShows()
}

func fetchTVShows(shouldApplyPagination: Bool = false) {
if shouldApplyPagination { tvShowRepository.incrementPage() }
self.tvShowRepository.getRemoteDataSource(responseCallback: { [weak self] result in
switch result {
case .success(let tvShows):
self?.tvShowContainer = tvShows
case .error(let error):
print(error)
}
})
}

func updateCellViewModels() {
let tvShows = tvShowContainer?.results ?? []
for tvShow in tvShows {
tvShowCellViewModels.append(TVShowCellViewModel(tvShow: tvShow))
}
}

}
```

## Repository
Repository is a gateway between your feature layer and network layer. It either fetches the data from remote or cache.
Define your Repository like this:

```swift
import Foundation
import Networking
import Core

class TVShowRepository: Repository {

typealias T = TVShowContainer?

private var requestConfigurator: RequestConfigurator

private var dataManager: TVShowDataManager?

private var currentPage: Int = 1 {
didSet {
requestConfigurator.parameters = [
"page" : String(currentPage),
Constants.Parameters.api_key: Constants.tmdbApiKey]
}
}

func incrementPage() {
currentPage += 1
}

public init(requestConfigurator: RequestConfigurator, dataManager: TVShowDataManager? = TVShowDataManager(dataNotifier: DataNotifier<TVShowContainer>(dataCallback: { (container) in

}, errorCallback: { (error) in

}))) {
self.dataManager = dataManager
self.requestConfigurator = requestConfigurator
}

func getLocalDataSource() -> TVShowContainer? {
return dataManager?.loadAllTVShows()
}

func getRemoteDataSource(responseCallback: @escaping (Result<TVShowContainer?, ApiError>) -> Void) {
ApiClient.request(ApiRouter(requestConfigurator: requestConfigurator), completion: responseCallback)
}

}
```

## Networking
Define your endpoints for specific feature.

```swift
import Foundation
import Networking

/// Models the TVShowEndPoint
enum TVShowEndPoint : EndpointProvider {

// Gathers popular tv shows weekly or daily
case trendingTvShows(timeWindow: String)
case image(width: String, posterPath: String)

// MARK: - EndPointProvider conforming methods

func provideUrl() -> String {

switch self {
case .trendingTvShows(let timeWindow):
return "trending/tv/\(timeWindow)"
case .image(let width, let posterPath):
return "https://image.tmdb.org/t/p/w\(width)/\(posterPath)"
}
}

// MARK: - Private methods

private func parameters(for page: Int) -> [String : String] {
return [
"page" : String(page)
]
}
}
```

# Acknowledgement
Thank you [Paul Hudson](https://www.hackingwithswift.com/about) for clarifying the `Coordinator` pattern. And also special thanks to [Ali Can Batur](https://github.com/alicanbatur) for code review.
