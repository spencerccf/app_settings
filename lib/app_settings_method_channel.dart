import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'app_settings.dart';
import 'app_settings_platform_interface.dart';

/// An implementation of [AppSettingsPlatform] that uses method channels.
class MethodChannelAppSettings extends AppSettingsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('com.spencerccf.app_settings/methods');

  @override
  Future<void> openAppSettings({
    AppSettingsType type = AppSettingsType.settings,
    bool asAnotherTask = false,
  }) {
    return methodChannel.invokeMethod<void>('openSettings', {
      'asAnotherTask': asAnotherTask,
      'type': type.name,
    });
  }

  @override
  Future<void> openAppSettingsPanel(AppSettingsPanelType type) {
    return methodChannel.invokeMethod<void>('openSettingsPanel', {
      'type': type.name,
    });
  }
}
