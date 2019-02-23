# app_settings

[![pub package](https://img.shields.io/pub/v/app_settings.svg)](https://pub.dartlang.org/packages/app_settings)

A Flutter plugin for opening iOS and Android phone settings from an app.

## Getting Started
 
[Include 'app_settings' from Dart Pub.](https://pub.dartlang.org/packages/app_settings)

```dart
dependencies:
  flutter:
    sdk: flutter
  app_settings: 1.0.4
```

Next, import 'app_settings.dart' into your dart code.

```dart
import 'package:app_settings/app_settings.dart';
```

## Platform Specifics
The following setting options available on both iOS and Android: openWIFISettings, openLocationSettings, openSecuritySettings  

### iOS
All three options open the current 'app' settings section if there are settings defined.  If no current settings are defined for the app the iPhone Settings Screen will be displayed.

### Android
Each option will open and display the exact corresponding screen: WIFI, Location, or Security.

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
