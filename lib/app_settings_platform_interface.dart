import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'app_settings_method_channel.dart';

abstract class AppSettingsPlatform extends PlatformInterface {
  /// Constructs a AppSettingsPlatform.
  AppSettingsPlatform() : super(token: _token);

  static final Object _token = Object();

  static AppSettingsPlatform _instance = MethodChannelAppSettings();

  /// The default instance of [AppSettingsPlatform] to use.
  ///
  /// Defaults to [MethodChannelAppSettings].
  static AppSettingsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AppSettingsPlatform] when
  /// they register themselves.
  static set instance(AppSettingsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> openAccessibilitySettings({bool asAnotherTask = false}) {
    throw UnimplementedError('openAccessibilitySettings() has not yet been implemented.');
  }

  Future<void> openAlarmSettings({bool asAnotherTask = false}) {
    throw UnimplementedError('openAlarmSettings() has not yet been implemented.');
  }

  Future<void> openApnSettings({bool asAnotherTask = false}) {
    throw UnimplementedError('openApnSettings() has not yet been implemented.');
  }

  Future<void> openAppSettings({bool asAnotherTask = false}) {
    throw UnimplementedError('openAppSettings() has not yet been implemented.');
  }

  Future<void> openBatteryOptimizationSettings({bool asAnotherTask = false}) {
    throw UnimplementedError('openBatteryOptimizationSettings() has not yet been implemented.');
  }

  Future<void> openBluetoothSettings({bool asAnotherTask = false}) {
    throw UnimplementedError('openBluetoothSettings() has not yet been implemented.');
  }

  Future<void> openDataRoamingSettings({bool asAnotherTask = false}) {
    throw UnimplementedError('openDataRoamingSettings() has not yet been implemented.');
  }

  Future<void> openDateSettings({bool asAnotherTask = false}) {
    throw UnimplementedError('openDateSettings() has not yet been implemented.');
  }

  Future<void> openDevelopmentSettings({bool asAnotherTask = false}) {
    throw UnimplementedError('openDevelopmentSettings() has not yet been implemented.');
  }

  Future<void> openDeviceSettings({bool asAnotherTask = false}) {
    throw UnimplementedError('openDeviceSettings() has not yet been implemented.');
  }

  Future<void> openDisplaySettings({bool asAnotherTask = false}) {
    throw UnimplementedError('openDisplaySettings() has not yet been implemented.');
  }

  Future<void> openHotspotSettings({bool asAnotherTask = false}) {
    throw UnimplementedError('openHotspotSettings() has not yet been implemented.');
  }

  Future<void> openInternalStorageSettings({bool asAnotherTask = false}) {
    throw UnimplementedError('openInternalStorageSettings() has not yet been implemented.');
  }

  Future<void> openLocationSettings({bool asAnotherTask = false}) {
    throw UnimplementedError('openLocationSettings() has not yet been implemented.');
  }

  Future<void> openLockAndPasswordSettings({bool asAnotherTask = false}) {
    throw UnimplementedError('openLockAndPasswordSettings() has not yet been implemented.');
  }

  Future<void> openNfcSettings({bool asAnotherTask = false}) {
    throw UnimplementedError('openNfcSettings() has not yet been implemented.');
  }

  Future<void> openNotificationSettings({bool asAnotherTask = false}) {
    throw UnimplementedError('openSecuritySettings() has not yet been implemented.');
  }

  Future<void> openWifiSettings({bool asAnotherTask = false}) {
    throw UnimplementedError('openWifiSettings() has not yet been implemented.');
  }

  Future<void> openWirelessSettings({bool asAnotherTask = false}) {
    throw UnimplementedError('openWirelessSettings() has not yet been implemented.');
  }

  Future<void> openSecuritySettings({bool asAnotherTask = false}) {
    throw UnimplementedError('openSecuritySettings() has not yet been implemented.');
  }

  Future<void> openSoundSettings({bool asAnotherTask = false}) {
    throw UnimplementedError('openSecuritySettings() has not yet been implemented.');
  }

  Future<void> openVpnSettings({bool asAnotherTask = false}) {
    throw UnimplementedError('openVpnSettings() has not yet been implemented.');
  }
}
