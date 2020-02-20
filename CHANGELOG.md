## Platform Specifics
The following setting options available on both iOS and Android: openAppSettings, openWIFISettings, openLocationSettings, openSecuritySettings, openBluetoothSettings, openDataRoamingSettings, openDateSettings, openDisplaySettings, openNotificationSettings, openSoundSettings

### iOS
All three options open the current 'app' settings section if there are settings defined.  If no current settings are defined for the app the iPhone Settings Screen will be displayed.

### Android
Each option will open and display the corresponding screen: WIFI, Location, or Security, etc.

## 3.0.1
Added Internal Storage settings access for Android.  iOS will still rely on App Settings.

## 3.0.0+1
Update plugin version in `.podspec`

## 3.0.0
Upgrade to Swift version: 5.0.1 - This version will only work on projects running Swift 5.0.1

## 2.0.2
Legacy Swift 4 support.

## 2.0.2
Added Date, Display, Notification, and Sound settings access for Android.  iOS will still rely on App Settings.

## 2.0.1+1
Added Bluetooth & Data Roaming settings access for Android (more to come).  iOS will still rely on App Settings.

## 2.0.0
Update AGP, migrate to `AndroidX`

## 1.0.6+2
Added missing `podspec` description

## 1.0.6+1
  ***iOS TIP: If using Objective-C for iOS in your project, you will need to add `use_frameworks!` to your `Runner project podfile` in order to use this Swift plugin:***
    
    - target 'Runner' do
        use_frameworks!

## 1.0.6

Add openAppSettings() to access platform specific 'app' settings menu.

## 1.0.5

Ensure the plugin stays compatible with iOS8+.
Declare Swift compatibility version 4.2.

## 1.0.4

Upgrading Kotlin version from: ext.kotlin_version = '1.2.71' to ext.kotlin_version = '1.3.20'


## 1.0.3

Adding additional documentation.