#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint app_settings.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'app_settings'
  s.version          = '5.1.1'
  s.summary          = 'A Flutter plugin for opening macOS desktop settings from an app.'
  s.description      = 'A Flutter plugin for opening macOS desktop settings from an app.'
  s.homepage         = 'https://github.com/spencerccf/app_settings'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'spencerccf@gmail.com' => 'spencerccf@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'FlutterMacOS'
  s.platform = :osx, '10.11'

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0.1'
  s.resource_bundles = {'app_settings_privacy' => ['PrivacyInfo.xcprivacy']}
end
