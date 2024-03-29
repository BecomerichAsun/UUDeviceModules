#
# Be sure to run `pod lib lint UUDeviceModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UUDeviceModule'
  s.version          = '1.2.3'
  s.summary          = 'A short description of UUDeviceModule.'


  s.description      = <<-DESC
  Fix 录音问题
                       DESC

  s.homepage         = 'https://github.com/BecomerichAsun/UUDeviceModules'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'becomerichios@163.com' => 'becomerichios@163.com' }
  s.source           = { :git => 'https://github.com/BecomerichAsun/UUDeviceModules.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'
  s.source_files = 'UUDeviceModule/Classes'
  s.resources = 'UUDeviceModule/UUCheckSources.bundle'
  s.framework = 'UIKit', 'AVFoundation'
  s.dependency 'SnapKit','~> 5.0.0'
  s.dependency 'SVGAPlayer', '2.3.5'
  
end
