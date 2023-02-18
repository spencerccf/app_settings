import 'dart:async';

import 'package:flutter/services.dart';

class AppSettings {
  // Static constant variable to initialize MethodChannel of 'app_settings'.
  static const MethodChannel _channel = const MethodChannel('app_settings');

  /// Future async method call to open WIFI settings.
  static Future<void> openWIFISettings(
      {bool asAnotherTask = false, Function? callback}) async {
    await _channel.invokeMethod('wifi', {
      'asAnotherTask': asAnotherTask,
    });

    if (callback != null) handleCallback(callback);
  }

  /// Future async method call to open wireless settings.
  static Future<void> openWirelessSettings(
      {bool asAnotherTask = false, Function? callback}) async {
    await _channel.invokeMethod('wireless', {
      'asAnotherTask': asAnotherTask,
    });
    if (callback != null) handleCallback(callback);
  }

  /// Future async method call to open location settings.
  static Future<void> openLocationSettings(
      {bool asAnotherTask = false, Function? callback}) async {
    await _channel.invokeMethod('location', {
      'asAnotherTask': asAnotherTask,
    });
    if (callback != null) handleCallback(callback);
  }

  /// Future async method call to open security settings.
  static Future<void> openSecuritySettings(
      {bool asAnotherTask = false, Function? callback}) async {
    await _channel.invokeMethod('security', {
      'asAnotherTask': asAnotherTask,
    });
    if (callback != null) handleCallback(callback);
  }

  /// Future async method call to open security settings.
  static Future<void> openLockAndPasswordSettings(
      {bool asAnotherTask = false, Function? callback}) async {
    await _channel.invokeMethod('locksettings', {
      'asAnotherTask': asAnotherTask,
    });
    if (callback != null) handleCallback(callback);
  }

  /// Future async method call to open bluetooth settings.
  static Future<void> openBluetoothSettings(
      {bool asAnotherTask = false, Function? callback}) async {
    await _channel.invokeMethod('bluetooth', {
      'asAnotherTask': asAnotherTask,
    });
    if (callback != null) handleCallback(callback);
  }

  /// Future async method call to open data roaming settings.
  static Future<void> openDataRoamingSettings(
      {bool asAnotherTask = false, Function? callback}) async {
    await _channel.invokeMethod('data_roaming', {
      'asAnotherTask': asAnotherTask,
    });
    if (callback != null) handleCallback(callback);
  }

  /// Future async method call to open date settings.
  static Future<void> openDateSettings(
      {bool asAnotherTask = false, Function? callback}) async {
    await _channel.invokeMethod('date', {
      'asAnotherTask': asAnotherTask,
    });
    if (callback != null) handleCallback(callback);
  }

  /// Future async method call to open display settings.
  static Future<void> openDisplaySettings(
      {bool asAnotherTask = false, Function? callback}) async {
    await _channel.invokeMethod('display', {'asAnotherTask': asAnotherTask});
    if (callback != null) handleCallback(callback);
  }

  /// Future async method call to open notification settings.
  static Future<void> openNotificationSettings(
      {bool asAnotherTask = false, Function? callback}) async {
    await _channel.invokeMethod('notification', {
      'asAnotherTask': asAnotherTask,
    });
    if (callback != null) handleCallback(callback);
  }

  /// Future async method call to open sound settings.
  static Future<void> openSoundSettings(
      {bool asAnotherTask = false, Function? callback}) async {
    await _channel.invokeMethod('sound', {
      'asAnotherTask': asAnotherTask,
    });
    if (callback != null) handleCallback(callback);
  }

  /// Future async method call to open internal storage settings.
  static Future<void> openInternalStorageSettings(
      {bool asAnotherTask = false, Function? callback}) async {
    await _channel.invokeMethod('internal_storage', {
      'asAnotherTask': asAnotherTask,
    });
    if (callback != null) handleCallback(callback);
  }

  /// Future async method call to open battery optimization settings.
  static Future<void> openBatteryOptimizationSettings(
      {bool asAnotherTask = false, Function? callback}) async {
    await _channel.invokeMethod('battery_optimization', {
      'asAnotherTask': asAnotherTask,
    });
    if (callback != null) handleCallback(callback);
  }

  /// Future async method call to open app specific settings screen.
  static Future<void> openAppSettings(
      {bool asAnotherTask = false, Function? callback}) async {
    await _channel
        .invokeMethod('app_settings', {'asAnotherTask': asAnotherTask});
    if (callback != null) handleCallback(callback);
  }

  /// Future async method call to open NCF settings.
  static Future<void> openNFCSettings(
      {bool asAnotherTask = false, Function? callback}) async {
    await _channel.invokeMethod('nfc', {
      'asAnotherTask': asAnotherTask,
    });
    if (callback != null) handleCallback(callback);
  }

  /// Future async method call to open Device settings.
  static Future<void> openDeviceSettings(
      {bool asAnotherTask = false, Function? callback}) async {
    await _channel.invokeMethod('device_settings', {
      'asAnotherTask': asAnotherTask,
    });
    if (callback != null) handleCallback(callback);
  }

  /// Future async method call to open VPN settings.
  static Future<void> openVPNSettings(
      {bool asAnotherTask = false, Function? callback}) async {
    await _channel.invokeMethod('vpn', {
      'asAnotherTask': asAnotherTask,
    });
    if (callback != null) handleCallback(callback);
  }

  /// Future async method call to open accessibility settings.
  static Future<void> openAccessibilitySettings(
      {bool asAnotherTask = false, Function? callback}) async {
    await _channel.invokeMethod('accessibility', {
      'asAnotherTask': asAnotherTask,
    });
    if (callback != null) handleCallback(callback);
  }

  /// Future async method call to open Development settings.
  static Future<void> openDevelopmentSettings(
      {bool asAnotherTask = false, Function? callback}) async {
    await _channel
        .invokeMethod('development', {'asAnotherTask': asAnotherTask});
    if (callback != null) handleCallback(callback);
  }

  /// Opening hotspot and tethering settings
  static Future<void> openHotspotSettings(
      {bool asAnotherTask = false, Function? callback}) async {
    await _channel.invokeMethod('hotspot', {'asAnotherTask': asAnotherTask});
    if (callback != null) handleCallback(callback);
  }

  /// Future async method call to open APN settings.
  static Future<void> openAPNSettings(
      {bool asAnotherTask = false, Function? callback}) async {
    await _channel.invokeMethod('apn', {
      'asAnotherTask': asAnotherTask,
    });
    if (callback != null) handleCallback(callback);
  }

  /// Future async method call to open Alarms & Reminders settings.
  static Future<void> openAlarmSettings(
      {bool asAnotherTask = false, Function? callback}) async {
    await _channel.invokeMethod('alarm', {
      'asAnotherTask': asAnotherTask,
    });
    if (callback != null) handleCallback(callback);
  }

  /// Future async method call to open Subscription settings.
  static Future<void> openSubscriptionSettings(
      {bool asAnotherTask = false, Function? callback}) async {
    await _channel.invokeMethod('subscriptions');
    if (callback != null) handleCallback(callback);
  }

  static void handleCallback(Function callback) {
    callback();
  }
}
