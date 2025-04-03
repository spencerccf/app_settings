## 6.1.1
- Users can request permission to install apps
  
## 6.1.0
-  Added openAppSettings() to access platform specific 'camera' settings (Only MacOS) . 

## 6.0.0

- Fİx for AppSettingsPlugin.swift:5:43, Attribute can only be applied to declarations, not types issue #232
- Upgraded gradle from 7.5 to 8.2

## 5.2.0

- Add Swift Package Manager support.

## 5.1.1

- Fixed a build issue on iOS for the example app.

## 5.1.0
Add `AppSettingsType.appLocale` to open the app language settings (only available on Android 13 and higher).

## 5.0.0

- **BREAKING CHANGES**
    - The `openAppSettings()` method now accepts a single settings type. This replaces the various individual methods.
    - The `callback` argument has been removed. Instead, await `openAppSettings()`.
    - Flutter 3.7 is now required.

- Updated the plugin to the new plugin template, using the platform interface.
- Fixed a typo in the application identifier.
- Bumped the Android SDK version to 33
- Added the `namespace` property to the build.gradle for compatibility with Gradle 8
- Added support for notification settings on iOS 16
- Added support for Android Q Settings Panels
- Relaxes the Android Bluetooth settings (`Settings.ACTION_BLUETOOTH_SETTINGS`) requirement. The Bluetooth permission is no longer required.

## 4.2.1

- Fixed the async result from `openAppSettings()` returning after the app settings have been processed on the native side.

## 4.2.0

- Added the ability to provide an optional custom callback function to `openAppSettings()`.

## 4.1.9

- Added the ability to open APN settings.

## 4.1.8

- Increase the Dart SDK upper bound to `<3.0.0`

## 4.1.7

- Added support for Flutter <=3.0.1.

## 4.1.6

- Added the ability to open personal hotspot settings.
- Added the ability to open custom intents.

## 4.1.5

- Added the ability to open the developer settings. **This requires enabling the developer settings to work correctly**

## 4.1.4

- Migrate from jcenter() to mavenCentral()

## 4.1.3

- Added Android Open Lock & Password settings.

## 4.1.2

- Updated Android compileSdkVersion to 31.

## 4.1.1

- Added the ability to open VPN settings.
- Added the ability to open the device settings.

## 4.1.0

- Added null-safety support.
- Added the ability to open settings as a new task on Android.

## 4.0.4

- Updated the plugin to support Android embedding v2 in Flutter 1.12.

## 4.0.3

- Fixed a bug in openNotificationSettings for Android.

## 4.0.2

- Added in NFC settings access for Android. iOS will still rely on App Settings.

## 4.0.1+1

- Updated Android compileSdkVersion to 30.

## 4.0.1

- Added Battery Optimization settings access for Android. iOS will still rely on App Settings.

## 4.0.0

- Updated Gradle wrapper distribution from 4.6 -> 6.2.2
- Updated Kotlin plugin version from 1.3.50 -> 1.3.70
- Updated Android Gradle plugin from 3.5.1 -> 3.6.1
- Updated compileSdkVersion from 28 -> 'android-R'
- Removed generated and non-essential files
- Updated .gitignore
- Fixed the example app, which was not working correctly.

## 3.0.1

- Added Internal Storage settings access for Android.  iOS will still rely on App Settings.

## 3.0.0+1

- Updated plugin version in `.podspec`.

## 3.0.0

- Upgraded to Swift version: 5.0.1 - This version will only work on projects running Swift 5.0.1

## 2.0.2

- Legacy Swift 4 support.

## 2.0.2

- Added Date, Display, Notification, and Sound settings access for Android. iOS will still rely on App Settings.

## 2.0.1+1

- Added Bluetooth & Data Roaming settings access for Android (more to come). iOS will still rely on App Settings.

## 2.0.0

- Updated AGP and migrate to `AndroidX`.

## 1.0.6+2

- Added missing `podspec` description.

## 1.0.6+1
  ***iOS TIP: If using Objective-C for iOS in your project, you will need to add `use_frameworks!` to your `Runner project podfile` in order to use this Swift plugin:***
    
    - target 'Runner' do
        use_frameworks!

## 1.0.6

- Added openAppSettings() to access platform specific 'app' settings menu.

## 1.0.5

- Ensure the plugin stays compatible with iOS8+.
- Declare Swift compatibility version 4.2.

## 1.0.4

- Upgraded Kotlin version from: ext.kotlin_version = '1.2.71' to ext.kotlin_version = '1.3.20'

## 1.0.3

- Added additional documentation.
