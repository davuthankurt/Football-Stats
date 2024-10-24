# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

use_frameworks!

inhibit_all_warnings!

workspace 'FootballStats'


$Kingfisher =  pod 'Kingfisher'
$Alamofire =  pod 'Alamofire', '~> 5.4'
$SnapKit = pod 'SnapKit', '~> 5.7.0'

target 'StatsApp' do
  
  project 'StatsApp.xcodeproj'

  # Pods for StatsApp
  $Kingfisher
  $SnapKit
  
end

target 'StatsAPI' do
  project 'StatsAPI/StatsAPI.xcodeproj'
  
  $Alamofire
  
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end

