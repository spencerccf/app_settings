# app_settings

[![pub package](https://img.shields.io/pub/v/app_settings.svg)](https://pub.dartlang.org/packages/app_settings)

A Flutter plugin for opening iOS and Android phone settings from an app.

## Installation

First, add `app_settings` as a [dependency in your pubspec.yaml file](https://pub.dev/packages/app_settings).

```dart
flutter pub add app_settings
```

Next, import 'app_settings.dart' into your dart code.

```dart
import 'package:app_settings/app_settings.dart';
```

### iOS
  ***TIP: If using Objective-C for iOS in your project, you will need to add `use_frameworks!` to your `Runner project podfile` in order to use this Swift plugin:***

```pod
target 'Runner' do
  use_frameworks!
```

### Android
Each option will open and display the exact corresponding system settings screen: WIFI, Location, or Security, etc.

Using the `AppSettingsType.settings` option will open the general app settings.

## Example

```dart
Widget build(BuildContext context) {
  return ElevatedButton(
    onPressed: () => AppSettings.openAppSettings(type: AppSettingsType.location),
    child: const Text('Open Location Settings'),
  );
}
```
