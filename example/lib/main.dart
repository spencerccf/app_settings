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
        title: const Text('WIFI'),
        minVerticalPadding: 5.0,
        onTap: () => AppSettings.openWifiSettings(),
      ),
      ListTile(
        title: const Text("Location"),
        onTap: () => AppSettings.openLocationSettings(),
      ),
      ListTile(
        title: const Text("Security"),
        onTap: () => AppSettings.openSecuritySettings(),
      ),
      ListTile(
        title: const Text("Lock & Password"),
        onTap: () => AppSettings.openLockAndPasswordSettings(),
      ),
      ListTile(
        title: const Text("App Settings"),
        onTap: () => AppSettings.openAppSettings(),
      ),
      ListTile(
        title: const Text("Bluetooth"),
        onTap: () => AppSettings.openBluetoothSettings(),
      ),
      ListTile(
        title: const Text("Data Roaming"),
        onTap: () => AppSettings.openDataRoamingSettings(),
      ),
      ListTile(
        title: const Text("Date"),
        onTap: () => AppSettings.openDateSettings(),
      ),
      ListTile(
        title: const Text("Display"),
        onTap: () => AppSettings.openDisplaySettings(),
      ),
      ListTile(
        title: const Text("Notification"),
        onTap: () => AppSettings.openNotificationSettings(),
      ),
      ListTile(
        title: const Text("Sound"),
        onTap: () => AppSettings.openSoundSettings(),
      ),
      ListTile(
        title: const Text("Internal Storage"),
        onTap: () => AppSettings.openInternalStorageSettings(),
      ),
      ListTile(
        title: const Text("Battery optimization"),
        onTap: () => AppSettings.openBatteryOptimizationSettings(),
      ),
      ListTile(
        title: const Text("NFC"),
        onTap: () => AppSettings.openNFCSettings(),
      ),
      ListTile(
        title: const Text("VPN"),
        onTap: () => AppSettings.openVPNSettings(asAnotherTask: true),
      ),
      ListTile(
        title: const Text("Device Settings"),
        onTap: () => AppSettings.openDeviceSettings(asAnotherTask: true),
      ),
      ListTile(
        title: const Text("Accessibility"),
        onTap: () => AppSettings.openAccessibilitySettings(asAnotherTask: true),
      ),
      ListTile(
        title: const Text("Developer"),
        onTap: () => AppSettings.openDevelopmentSettings(asAnotherTask: true),
      ),
      ListTile(
        title: const Text("Hotspot"),
        onTap: () => AppSettings.openHotspotSettings(asAnotherTask: true),
      ),
      ListTile(
        title: const Text("APN"),
        onTap: () => AppSettings.openAPNSettings(asAnotherTask: true),
      ),
      ListTile(
        title: const Text("Alarm & Reminders"),
        onTap: () => AppSettings.openAlarmSettings(asAnotherTask: true),
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
