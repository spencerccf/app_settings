# app_settings

[![pub package](https://img.shields.io/pub/v/app_settings.svg)](https://pub.dartlang.org/packages/app_settings)

A Flutter plugin for opening iOS and Android phone settings from an app.

## Getting Started
 
[Include 'app_settings' from Dart Pub.](https://pub.dartlang.org/packages/app_settings)

```dart
dependencies:
  flutter:
    sdk: flutter
  app_settings: 2.0.2
```

Next, import 'app_settings.dart' into your dart code.

```dart
import 'package:app_settings/app_settings.dart';
```

## Platform Specifics
The following setting options available on both iOS and Android: openAppSettings, openWIFISettings, openLocationSettings, openSecuritySettings, openBluetoothSettings, openDataRoamingSettings, openDateSettings, openDisplaySettings, openNotificationSettings, openSoundSettings
### iOS
  ***TIP: If using Objective-C for iOS in your project, you will need to add `use_frameworks!` to your `Runner project podfile` in order to use this Swift plugin:***
    
    - target 'Runner' do
        use_frameworks!

All options open the current 'app' settings section if there are settings defined.  If no current settings are defined for the app the iPhone Settings Screen will be displayed.

### Android
Each option will open and display the exact corresponding system settings screen: WIFI, Location, or Security, etc.

Using the openAppSettings option will open the current 'app' settings for the running app.

## Example
Example implementation using a raised button 'onPressed' event.  

```dart
Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
            RaisedButton(
                onPressed: AppSettings.openLocationSettings(),
                child: Text('Open Location Settings'),
            ),
        ],
    );
}
```
