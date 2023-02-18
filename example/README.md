# app_settings

[![pub package](https://img.shields.io/pub/v/app_settings.svg)](https://pub.dartlang.org/packages/app_settings)

A Flutter plugin for opening iOS and Android phone settings from an app.

## Getting Started
 
[Include 'app_settings' from Dart Pub.](https://pub.dartlang.org/packages/app_settings)

```dart
dependencies:
  flutter:
    sdk: flutter
  app_settings: 4.2.1
```

Next, import 'app_settings.dart' into your dart code.

```dart
import 'package:app_settings/app_settings.dart';
```

## Platform Specifics
The following setting options available on both iOS and Android: 
- openAppSettings
- openWIFISettings
- openLocationSettings
- openSecuritySettings
- openBluetoothSettings
- openDataRoamingSettings
- openDateSettings
- openDisplaySettings
- openNotificationSettings
- openSoundSettings
- openInternalStorageSettings
- openBatteryOptimizationSettings
- openDevelopmentSettings
- openAPNSettings
### iOS
  ***TIP: If using Objective-C for iOS in your project, you will need to add `use_frameworks!` to your `Runner project podfile` in order to use this Swift plugin:***
    
    - target 'Runner' do
        use_frameworks!

All options open the current 'app' settings section if there are settings defined.  If no current settings are defined for the app the iPhone Settings Screen will be displayed.

### Android
Each option will open and display the exact corresponding system settings screen: WIFI, Location, or Security, etc.

Using the openAppSettings option will open the current 'app' settings for the running app.

In some cases, to access directly the Bluetooth window, you will need to provide access permissions in the android/app/src/main/AndroidManifest.xml

```dart
<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.yourname.yourapp">   
	 <uses-permission android:name="android.permission.BLUETOOTH" />  
	 <uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />  
	 <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>  
 <application
```



## Example
Example implementation using a raised button 'onPressed' event.  

```dart
Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
            RaisedButton(
                onPressed: (() async {
                  await AppSettings.openLocationSettings();
                }),
                child: Text('Open Location Settings'),
            ),
        ],
    );
}
```

Example implementation using a raised button 'onPressed' event and custom function callback.  

```dart
Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
            RaisedButton(
                onPressed: (() async {
                  print('Before Calling AppSettings.openWIFISettings()');
                  await AppSettings.openWIFISettings(callback: () {
                    print("** Sample callback function called before anything else gets executed in dart");
                  });
                  print('After Calling AppSettings.openWIFISettings()');
                }),
                child: Text('Open Location Settings'),
            ),
        ],
    );
}
```
