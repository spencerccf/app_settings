import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'app_settings.dart';
import 'app_settings_platform_interface.dart';

/// An implementation of [AppSettingsPlatform] that uses method channels.
class MethodChannelAppSettings extends AppSettingsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('app_settings');

  @override
  Future<void> openAppSettings({
    AppSettingsType type = AppSettingsType.settings,
    bool asAnotherTask = false,
  }) {
    return methodChannel.invokeMethod<void>(type.name, {'asAnotherTask': asAnotherTask});
  }
}
