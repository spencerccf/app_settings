import '../app_settings.dart';
import '../app_settings_platform_interface.dart';

class AppSettings {
  /// Open the app settings.
  ///
  /// If [type] is supported, opens a specific app settings panel.
  /// If [asAnotherTask] is true, opens the app settings as another task on Android.
  static Future<void> openAppSettings({
    AppSettingsType type = AppSettingsType.settings,
    bool asAnotherTask = false,
  }) {
    return AppSettingsPlatform.instance.openAppSettings(type: type, asAnotherTask: asAnotherTask);
  }

  /// Open an application settings panel.
  ///
  /// App Settings Panels are only supported on Android.
  ///
  /// This method does nothing on Android Pie and lower,
  /// as settings panels are only available from Android Q onwards.
  static Future<void> openAppSettingsPanel(AppSettingsPanelType type) {
    return AppSettingsPlatform.instance.openAppSettingsPanel(type);
  }
}
