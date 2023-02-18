#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'app_settings'
  s.version          = '3.0.0+1'
  s.summary          = 'A Flutter plugin for opening iOS and Android phone settings from an app.'
  s.description      = 'A Flutter plugin for opening iOS and Android phone settings from an app.'
  s.homepage         = 'https://github.com/spencerccf/app_settings'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'spencerccf@gmail.com' => 'spencerccf@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.ios.deployment_target = '15.0'
  s.swift_version = '5.0.1'
end

