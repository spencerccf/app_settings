import 'package:flutter_test/flutter_test.dart';
import 'package:app_settings/app_settings.dart';
import 'package:app_settings/app_settings_platform_interface.dart';
import 'package:app_settings/app_settings_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAppSettingsPlatform
    with MockPlatformInterfaceMixin
    implements AppSettingsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AppSettingsPlatform initialPlatform = AppSettingsPlatform.instance;

  test('$MethodChannelAppSettings is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAppSettings>());
  });

  test('getPlatformVersion', () async {
    AppSettings appSettingsPlugin = AppSettings();
    MockAppSettingsPlatform fakePlatform = MockAppSettingsPlatform();
    AppSettingsPlatform.instance = fakePlatform;

    expect(await appSettingsPlugin.getPlatformVersion(), '42');
  });
}
