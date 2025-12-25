post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
end

platform :ios, '13.0'

target ‘project’ do

pod 'MJRefresh'
pod 'AFNetworking'
pod 'Masonry'
pod 'SDWebImage'
pod 'FDFullscreenPopGesture'
pod 'SDCycleScrollView'
pod 'MJExtension'
pod 'IQKeyboardManager'
pod 'YYText'
pod 'FBSDKCoreKit','~> 17.0.0'

end




















