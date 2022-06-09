#
# Be sure to run `pod lib lint CirclePay_Pod_iOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'CirclePay_Pod_iOS'
    s.version          = '1.0.4'
    s.summary          = 'These example sentences are selected automatically from various online news sources to reflect current usage of the word description.'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    These example sentences are selected automatically from various online news sources to reflect current usage of the word description.Views expressed in the examples do not represent the opinion of Merriam-Webster or its editors.
        DESC
        
        s.homepage         = 'https://github.com/Nejmoteam/CirclePay_Pod_iOS'
        # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
        s.license          = { :type => 'MIT', :file => 'LICENSE' }
        s.author           = { 'allam40960@gmail.com' => 'adelmohy_58@hotmail.com' }
        s.source           = { :git => 'https://github.com/Nejmoteam/CirclePay_Pod_iOS.git', :tag => s.version.to_s }
        # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
        
        s.ios.deployment_target = '12.0'
        
        s.source_files = 'Source/**/*.swift'
        s.swift_version = '5.0'
        # s.resource_bundles = {
        #   'CirclePay_Pod_iOS' => ['CirclePay_Pod_iOS/Assets/*.png']
        # }
        
        # s.public_header_files = 'Pod/Classes/**/*.h'
        s.frameworks = 'UIKit'
        s.dependency 'Alamofire', '5.4.1'
        s.dependency "FontBlaster" , '5.3.0'
        s.dependency 'IQKeyboardManagerSwift', '6.5.0'
        s.dependency 'Kingfisher', '~> 7.2.2'
        
        
        s.test_spec 'Tests' do |test_spec|
            test_spec.source_files = 'Tests/*.{h,m}'
            test_spec.dependency 'OHHTTPStubs/Swift' , '~> 9.1.0'
            
            # This dependency will only be linked with your tests.
        end
        
        
        
        # s.dependency 'AFNetworking', '~> 2.3'
    end
