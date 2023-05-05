import '../app_settings.dart';
import '../app_settings_platform_interface.dart';

class AppSettings {
  /// Open the app settings.
  ///
  /// If [type] is provided and supported, opens a specific app settings panel.
  /// If [asAnotherTask] is true, opens the app settings as another task on Android.
  Future<void> openAppSettings({AppSettingsType? type, bool asAnotherTask = false}) {
    return AppSettingsPlatform.instance.openAppSettings(type: type, asAnotherTask: asAnotherTask);
  }
}
