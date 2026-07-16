import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_settings/app_settings.dart';
import 'package:app_settings/app_settings_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final MethodChannelAppSettings platform = MethodChannelAppSettings();
  const MethodChannel channel =
      MethodChannel('com.spencerccf.app_settings/methods');

  final List<MethodCall> log = <MethodCall>[];

  setUp(() {
    log.clear();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      log.add(methodCall);
      return null;
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('openAppSettings invokes openSettings with the expected arguments',
      () async {
    await platform.openAppSettings(
      type: AppSettingsType.location,
      asAnotherTask: true,
    );

    expect(log, <Matcher>[
      isMethodCall('openSettings', arguments: <String, dynamic>{
        'asAnotherTask': true,
        'type': 'location',
      }),
    ]);
  });

  test(
      'openAppSettingsPanel invokes openSettingsPanel with the expected arguments',
      () async {
    await platform.openAppSettingsPanel(AppSettingsPanelType.wifi);

    expect(log, <Matcher>[
      isMethodCall('openSettingsPanel', arguments: <String, dynamic>{
        'type': 'wifi',
      }),
    ]);
  });
}
