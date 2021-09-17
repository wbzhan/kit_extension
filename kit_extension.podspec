#
# Be sure to run `pod lib lint kit_extension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'kit_extension'
  s.version          = '0.2.7'
  s.summary          = 'A common UIKit Extension'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
UIKit 一般扩展内容
                       DESC

  s.homepage         = 'https://github.com/zhanwenbaoit@126.com/kit_extension'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhanwenbaoit@126.com' => 'wbzhan@yeah.net' }
  s.source           = { :git => 'https://github.com/wbzhan/kit_extension.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.swift_version = "5.0"
  s.ios.deployment_target = '9.0'

  s.source_files = 'kit_extension/Classes/**/*'

end
