# app_settings

[![pub package](https://img.shields.io/pub/v/app_settings.svg)](https://pub.dartlang.org/packages/app_settings)

A Flutter plugin for opening iOS and Android phone settings from an app.

## Features

- Supports **Swift Package Manager (SPM)** for iOS integration.
- Opens various settings pages (e.g., location, Wi-Fi, etc.) for both Android and iOS.
- Optional on-device AI settings proposals via
  [`app_settings_ai`](https://pub.dev/packages/app_settings_ai).

## Installation

First, add `app_settings` as a [dependency in your pubspec.yaml file](https://pub.dev/packages/app_settings).

```dart
flutter pub add app_settings
```

Next, import 'app_settings.dart' into your Dart code.

```dart
import 'package:app_settings/app_settings.dart';
```

### iOS

***TIP: If using Objective-C for iOS in your project, you will need to add `use_frameworks!` to your `Runner project podfile` in order to use this Swift plugin:***

```pod
target 'Runner' do
  use_frameworks!
```

If you prefer using **Swift Package Manager (SPM)**, make sure to enable swift support in your project.
See also [Flutter SPM integration](https://docs.flutter.dev/packages-and-plugins/swift-package-manager/for-app-developers).

```sh
  flutter config --enable-swift-package-manager 
```



## Usage

Open the settings of the application using `AppSettings.openAppSettings()`.
By default, `AppSettingsType.settings` is used as the type, which opens the general application settings.
If the given type is not supported on the current platform, the general settings are opened instead.

**Android** If `asAnotherTask` is set to true, the settings page is opened in a different Activity.

```dart
Widget build(BuildContext context) {
  return ElevatedButton(
    onPressed: () => AppSettings.openAppSettings(type: AppSettingsType.location),
    child: const Text('Open Location Settings'),
  );
}
```

### Android Q Settings Panels

To open a Settings Panel on Android Q and higher,
call `AppSettings.openAppSettingsPanel()` with a given type.

```dart
Widget build(BuildContext context) {
  return ElevatedButton(
    onPressed: () => AppSettings.openAppSettingsPanel(AppSettingsPanelType.volume),
    child: const Text('Open Volume Settings Panel'),
  );
}
```

Settings panels are not supported on other platforms.

## On-device AI settings proposals

[`app_settings_ai`](https://pub.dev/packages/app_settings_ai) is a companion package
that turns a natural-language complaint — *"I'm not getting message alerts"* — into a
ranked list of settings screens to open, then opens them through this plugin.
Inference runs entirely on the device: Apple Foundation Models on iOS 26+ and the ML
Kit GenAI Prompt API (Gemini Nano) on supported Android devices.

It is a separate package so that `app_settings` stays dependency-free — apps that only
need to open a settings screen don't pay for an on-device model runtime or a raised
SDK floor.
