#
# Be sure to run `pod lib lint MPFormTableViewCell.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MPFormTableViewCell"
  s.version          = "0.1.2"
  s.summary          = "A bundle of UITableViewCells that helps to create settings forms."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A bundle of UITableViewCells that helps to create settings forms. There are TextField cells, TextViews,
Switches, SegmentedControls, DatePicker, and so on...
                       DESC

  s.homepage         = "https://github.com/martinprot/MPFormTableViewCell"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Martin Prot" => "martinprot@gmail.com" }
  s.source           = { :git => "https://github.com/martinprot/MPFormTableViewCell.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/appricotmedia'

  s.ios.deployment_target = '7.0'

  s.source_files = 'MPFormTableViewCell/Classes/**/*'

  s.resource_bundles = {
	'MPFormTableViewCell' => ['MPFormTableViewCell/Assets/*.xib']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
