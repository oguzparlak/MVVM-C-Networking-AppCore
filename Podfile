# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'
use_frameworks!
workspace 'MVVM-C-App-Core-Networking'

def alamofire
  pod 'Alamofire', :git => 'https://github.com/Alamofire/Alamofire.git', :branch => 'alamofire5'
end

target 'MVVM-C-App-Core-Networking' do
  target 'MVVM-C-App-Core-NetworkingTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MVVM-C-App-Core-NetworkingUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'Networking' do
  project 'Networking/Networking'
  alamofire
  target 'NetworkingTests' do
  end
end