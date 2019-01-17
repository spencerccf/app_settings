# app_settings

A Flutter plugin for opening iOS and Androoid phone settings from an app.

## Getting Started
 
[Include 'app_settings' from Dart Pub.](https://pub.dartlang.org/flutter)

```dart
dependencies:
  flutter:
    sdk: flutter
  app_settings: 1.0.0
```

Import 'app_settings.dart' into your dart code.

```dart
import 'package:app_settings/app_settings.dart';
```

Example implementation using a raised button 'onPressed' event.

```dart
Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
            RaisedButton(
                onPressed: AppSettings.openLocationSettings,
                child: Text('Open Location Settings'),
            ),
        ],
    );
}
```