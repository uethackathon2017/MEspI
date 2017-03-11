# Uncomment the next line to define a global platform for your project
 platform :ios, '9.0'
use_frameworks!
target 'MapGame' do
	pod 'NMPopUpViewSwift'
    pod 'TesseractOCRiOS', '4.0.0'
    pod 'Alamofire'
    pod 'SwiftyJSON'
   post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'NO'
        end
    end
end 
end
