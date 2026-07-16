import 'package:flutter_test/flutter_test.dart';
import 'package:app_settings/app_settings.dart';
import 'package:app_settings/app_settings_platform_interface.dart';
import 'package:app_settings/app_settings_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAppSettingsPlatform
    with MockPlatformInterfaceMixin
    implements AppSettingsPlatform {
  AppSettingsType? lastOpenedType;
  bool? lastAsAnotherTask;
  AppSettingsPanelType? lastOpenedPanelType;

  @override
  Future<void> openAppSettings({
    AppSettingsType type = AppSettingsType.settings,
    bool asAnotherTask = false,
  }) async {
    lastOpenedType = type;
    lastAsAnotherTask = asAnotherTask;
  }

  @override
  Future<void> openAppSettingsPanel(AppSettingsPanelType type) async {
    lastOpenedPanelType = type;
  }
}

void main() {
  final AppSettingsPlatform initialPlatform = AppSettingsPlatform.instance;

  test('$MethodChannelAppSettings is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAppSettings>());
  });

  test('openAppSettings forwards to the platform implementation', () async {
    final mockPlatform = MockAppSettingsPlatform();
    AppSettingsPlatform.instance = mockPlatform;

    await AppSettings.openAppSettings(
      type: AppSettingsType.location,
      asAnotherTask: true,
    );

    expect(mockPlatform.lastOpenedType, AppSettingsType.location);
    expect(mockPlatform.lastAsAnotherTask, true);
  });

  test('openAppSettingsPanel forwards to the platform implementation',
      () async {
    final mockPlatform = MockAppSettingsPlatform();
    AppSettingsPlatform.instance = mockPlatform;

    await AppSettings.openAppSettingsPanel(AppSettingsPanelType.wifi);

    expect(mockPlatform.lastOpenedPanelType, AppSettingsPanelType.wifi);
  });
}
