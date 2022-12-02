#
# Be sure to run `pod lib lint FlowerCocoa.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FlowerCocoa'
  s.version          = '0.2.4'
  s.summary          = 'A short description of FlowerCocoa.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/marst123/FlowerCocoa'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'marst123' => 'tianlan2325@qq.com' }
  s.source           = { :git => 'https://github.com/marst123/FlowerCocoa.git', :tag => s.version.to_s }

s.swift_versions = ['5.0']

  s.ios.deployment_target = '9.0'

  s.source_files = 'FlowerCocoa/Classes/**/*'
  s.dependency 'SnapKit'
  
  # s.resource_bundles = {
  #   'FlowerCocoa' => ['FlowerCocoa/Assets/*.png']
  # }

end
