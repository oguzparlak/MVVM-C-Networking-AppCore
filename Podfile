# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'
use_frameworks!

workspace 'MVVM-C-App-Core-Networking'

def rxSwift
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
end

def alamofire
  pod 'Alamofire', :git => 'https://github.com/Alamofire/Alamofire.git', :branch => 'alamofire5'
end

def uiPods
  pod 'Kingfisher', '~> 5.0'
  pod 'PKHUD', '~> 5.0'
end

target 'MVVM-C-App-Core-Networking' do
  use_frameworks!
  project 'MVVM-C-App-Core-Networking'
  rxSwift
  alamofire
  uiPods
end

target 'Networking' do
  use_frameworks!
  project 'Networking/Networking'
  rxSwift
  alamofire
end
