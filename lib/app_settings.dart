import 'dart:async';

import 'package:flutter/services.dart';

class AppSettings {
  // Static constant variable to initialize MethodChannel of 'app_settings'.
  static const MethodChannel _channel = const MethodChannel('app_settings');

  /// Future async method call to open WIFI settings.
  static Future<void> openWIFISettings({
    bool asAnotherTask = false,
  }) async {
    _channel.invokeMethod('wifi', {
      'asAnotherTask': asAnotherTask,
    });
  }

  /// Future async method call to open wireless settings.
  static Future<void> openWirelessSettings({
    bool asAnotherTask = false,
  }) async {
    _channel.invokeMethod('wireless', {
      'asAnotherTask': asAnotherTask,
    });
  }

  /// Future async method call to open location settings.
  static Future<void> openLocationSettings({
    bool asAnotherTask = false,
  }) async {
    _channel.invokeMethod('location', {
      'asAnotherTask': asAnotherTask,
    });
  }

  /// Future async method call to open security settings.
  static Future<void> openSecuritySettings({
    bool asAnotherTask = false,
  }) async {
    _channel.invokeMethod('security', {
      'asAnotherTask': asAnotherTask,
    });
  }

  /// Future async method call to open bluetooth settings.
  static Future<void> openBluetoothSettings({
    bool asAnotherTask = false,
  }) async {
    _channel.invokeMethod('bluetooth', {
      'asAnotherTask': asAnotherTask,
    });
  }

  /// Future async method call to open data roaming settings.
  static Future<void> openDataRoamingSettings({
    bool asAnotherTask = false,
  }) async {
    _channel.invokeMethod('data_roaming', {
      'asAnotherTask': asAnotherTask,
    });
  }

  /// Future async method call to open date settings.
  static Future<void> openDateSettings({
    bool asAnotherTask = false,
  }) async {
    _channel.invokeMethod('date', {
      'asAnotherTask': asAnotherTask,
    });
  }

  /// Future async method call to open display settings.
  static Future<void> openDisplaySettings({
    bool asAnotherTask = false,
  }) async {
    _channel.invokeMethod('display', {
      'asAnotherTask': asAnotherTask,
    });
  }

  /// Future async method call to open notification settings.
  static Future<void> openNotificationSettings({
    bool asAnotherTask = false,
  }) async {
    _channel.invokeMethod('notification', {
      'asAnotherTask': asAnotherTask,
    });
  }

  /// Future async method call to open sound settings.
  static Future<void> openSoundSettings({
    bool asAnotherTask = false,
  }) async {
    _channel.invokeMethod('sound', {
      'asAnotherTask': asAnotherTask,
    });
  }

  /// Future async method call to open internal storage settings.
  static Future<void> openInternalStorageSettings({
    bool asAnotherTask = false,
  }) async {
    _channel.invokeMethod('internal_storage', {
      'asAnotherTask': asAnotherTask,
    });
  }

  /// Future async method call to open battery optimization settings.
  static Future<void> openBatteryOptimizationSettings({
    bool asAnotherTask = false,
  }) async {
    _channel.invokeMethod('battery_optimization', {
      'asAnotherTask': asAnotherTask,
    });
  }

  /// Future async method call to open app specific settings screen.
  static Future<void> openAppSettings({
    bool asAnotherTask = false,
  }) async {
    _channel.invokeMethod('app_settings', {
      'asAnotherTask': asAnotherTask,
    });
  }

  /// Future async method call to open NCF settings.
  static Future<void> openNFCSettings({
    bool asAnotherTask = false,
  }) async {
    _channel.invokeMethod('nfc', {
      'asAnotherTask': asAnotherTask,
    });
  }

  /// Future async method call to open Device settings.
  static Future<void> openDeviceSettings({
      bool asAnotherTask = false,
    }) async {
      _channel.invokeMethod('device_settings', {
        'asAnotherTask': asAnotherTask,
      });
  }

  /// Future async method call to open VPN settings.
  static Future<void> openVPNSettings({
      bool asAnotherTask = false,
    }) async {
      _channel.invokeMethod('vpn', {
        'asAnotherTask': asAnotherTask,
      });
  }

   /// Future async method call to open accessibility settings.
  static Future<void> openAccessibilitySettings({
      bool asAnotherTask = false,
    }) async {
      _channel.invokeMethod('accessibility', {
        'asAnotherTask': asAnotherTask,
      });
  }
}
