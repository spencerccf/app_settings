import 'dart:async';

import 'package:flutter/services.dart';

class AppSettings {
  // Static constant variable to initialize MethodChannel of 'app_settings'.
  static const MethodChannel _channel = const MethodChannel('app_settings');

  /// Future async method call to open WIFI settings.
  static Future<void> openWIFISettings() async {
    _channel.invokeMethod('wifi');
  }

  /// Future async method call to open location settings.
  static Future<void> openLocationSettings() async {
    _channel.invokeMethod('location');
  }

  /// Future async method call to open security settings.
  static Future<void> openSecuritySettings() async {
    _channel.invokeMethod('security');
  }

  /// Future async method call to open bluetooth settings.
  static Future<void> openBluetoothSettings() async {
    _channel.invokeMethod('bluetooth');
  }

  /// Future async method call to open data roaming settings.
  static Future<void> openDataRoamingSettings() async {
    _channel.invokeMethod('data_roaming');
  }

  /// Future async method call to open date settings.
  static Future<void> openDateSettings() async {
    _channel.invokeMethod('date');
  }

  /// Future async method call to open display settings.
  static Future<void> openDisplaySettings() async {
    _channel.invokeMethod('display');
  }

  /// Future async method call to open notification settings.
  static Future<void> openNotificationSettings() async {
    _channel.invokeMethod('notification');
  }

  /// Future async method call to open sound settings.
  static Future<void> openSoundSettings() async {
    _channel.invokeMethod('sound');
  }

  /// Future async method call to open internal storage settings.
  static Future<void> openInternalStorageSettings() async {
    _channel.invokeMethod('internal_storage');
  }

  /// Future async method call to open battery optimization settings.
  static Future<void> openBatteryOptimizationSettings() async {
    _channel.invokeMethod('battery_optimization');
  }

  /// Future async method call to open app specific settings screen.
  static Future<void> openAppSettings() async {
    _channel.invokeMethod('app_settings');
  }
}
