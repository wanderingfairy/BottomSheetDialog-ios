#
# Be sure to run `pod lib lint BottomSheetDialog.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BottomSheetDialog'
  s.version          = '0.1.3'
  s.summary          = 'Bottom sheet dialog for iOS.'
  s.swift_version    = '5.0'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A library for using the bottom sheet dialog in iOS.'

  s.homepage         = 'https://github.com/wanderingfairy/BottomSheetDialog-ios'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wanderingfairy' => 'iospandaman@gmail.com' }
  s.source           = { :git => 'https://github.com/wanderingfairy/BottomSheetDialog-ios.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'BottomSheetDialog/Classes/**/*'
  
  # s.resource_bundles = {
  #  'BottomSheetDialog' => ['BottomSheetDialog/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'SnapKit'
end
