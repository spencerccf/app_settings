import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> getActions() {
    return [
      ListTile(
        title: const Text('Wifi'),
        minVerticalPadding: 5.0,
        onTap: () => AppSettings.openAppSettings(type: AppSettingsType.wifi),
      ),
      ListTile(
        title: const Text("Location"),
        onTap: () => AppSettings.openAppSettings(type: AppSettingsType.location),
      ),
      ListTile(
        title: const Text("Security"),
        onTap: () => AppSettings.openAppSettings(type: AppSettingsType.security),
      ),
      ListTile(
        title: const Text("Lock & Password"),
        onTap: () => AppSettings.openAppSettings(type: AppSettingsType.lockAndPassword),
      ),
      ListTile(
        title: const Text("App Settings"),
        onTap: () => AppSettings.openAppSettings(type: AppSettingsType.settings),
      ),
      ListTile(
        title: const Text("Bluetooth"),
        onTap: () => AppSettings.openAppSettings(type: AppSettingsType.bluetooth),
      ),
      ListTile(
        title: const Text("Data Roaming"),
        onTap: () => AppSettings.openAppSettings(type: AppSettingsType.dataRoaming),
      ),
      ListTile(
        title: const Text("Date"),
        onTap: () => AppSettings.openAppSettings(type: AppSettingsType.date),
      ),
      ListTile(
        title: const Text("Display"),
        onTap: () => AppSettings.openAppSettings(type: AppSettingsType.display),
      ),
      ListTile(
        title: const Text("Notification"),
        onTap: () => AppSettings.openAppSettings(type: AppSettingsType.notification),
      ),
      ListTile(
        title: const Text("Sound"),
        onTap: () => AppSettings.openAppSettings(type: AppSettingsType.sound),
      ),
      ListTile(
        title: const Text("Internal Storage"),
        onTap: () => AppSettings.openAppSettings(type: AppSettingsType.internalStorage),
      ),
      ListTile(
        title: const Text("Battery optimization"),
        onTap: () => AppSettings.openAppSettings(type: AppSettingsType.batteryOptimization),
      ),
      ListTile(
        title: const Text("NFC"),
        onTap: () => AppSettings.openAppSettings(type: AppSettingsType.nfc),
      ),
      ListTile(
        title: const Text("VPN"),
        onTap: () => AppSettings.openAppSettings(type: AppSettingsType.vpn, asAnotherTask: true),
      ),
      ListTile(
        title: const Text("Device Settings"),
        onTap: () => AppSettings.openAppSettings(type: AppSettingsType.device, asAnotherTask: true),
      ),
      ListTile(
        title: const Text("Accessibility"),
        onTap: () => AppSettings.openAppSettings(type: AppSettingsType.accessibility, asAnotherTask: true),
      ),
      ListTile(
        title: const Text("Developer"),
        onTap: () => AppSettings.openAppSettings(type: AppSettingsType.developer, asAnotherTask: true),
      ),
      ListTile(
        title: const Text("Hotspot"),
        onTap: () => AppSettings.openAppSettings(type: AppSettingsType.hotspot, asAnotherTask: true),
      ),
      ListTile(
        title: const Text("APN"),
        onTap: () => AppSettings.openAppSettings(type: AppSettingsType.apn, asAnotherTask: true),
      ),
      ListTile(
        title: const Text("Alarms"),
        onTap: () => AppSettings.openAppSettings(type: AppSettingsType.alarm, asAnotherTask: true),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final actionItems = getActions();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Settings Example App'),
        ),
        body: ListView.separated(
          separatorBuilder: (_, index) => const Divider(color: Colors.blueGrey),
          itemCount: actionItems.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: actionItems[index],
          ),
        ),
      ),
    );
  }
}
