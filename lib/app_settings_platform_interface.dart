import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'app_settings_method_channel.dart';
import 'src/app_settings_panel_type.dart';
import 'src/app_settings_type.dart';

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

  Future<void> openAppSettings({
    AppSettingsType type = AppSettingsType.settings,
    bool asAnotherTask = false,
  }) {
    throw UnimplementedError('openAppSettings() has not yet been implemented.');
  }

  Future<void> openAppSettingsPanel(AppSettingsPanelType type) {
    throw UnimplementedError('openAppSettingsPanel() has not yet been implemented.');
  }
}
