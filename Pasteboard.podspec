#
# Be sure to run `pod lib lint Pasteboard.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Pasteboard'
  s.version          = '0.1.0'
  s.summary          = 'A easy way to read/write/share data with iOS UIPasteboard'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A easy way to read/write/share data with iOS UIPasteboard.
Just read pasteboard or write data to it and it will sync up with iOS UIPasteboard.
                       DESC

  s.homepage         = 'https://github.com/jacobjiangwei/Pasteboard'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jacob Jiang' => 'kof2003@126.com' }
  s.source           = { :git => 'https://github.com/jacobjiangwei/Pasteboard.git', :tag => s.version.to_s }
  s.swift_versions   = '5.0'
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Pasteboard/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Pasteboard' => ['Pasteboard/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
