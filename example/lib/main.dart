import 'dart:async';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';

/// Main method to return runApp.
void main() => runApp(MyApp());

/// This is the main app stateful widget.
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

/// This is the app state.
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    /// Call out to intialize platform state.
    initPlatformState();
    super.initState();
  }

  /// Initialize platform state.
  Future<void> initPlatformState() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  /// Widget build method to return MaterailApp.
  @override
  Widget build(BuildContext context) {
    var actionItems = getListOfActionButtons();
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('App Settings Example App'),
            ),
            body: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.blueGrey,
              ),
              itemCount: actionItems.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.all(2.0),
                child: actionItems[index],
              ),
            )));
  }

  List<Widget> getListOfActionButtons() {
    var actionItems = <Widget>[];

    actionItems.addAll([
      ListTile(
          title: Text('Example Call With Callback'),
          minVerticalPadding: 5.0,
          onTap: (() async {
            print('Before Calling AppSettings.openWIFISettings()');
            await AppSettings.openWIFISettings(callback: () {
              print(
                  "** Sample callback function called before anything else gets executed in dart");
            });
            print('After Calling AppSettings.openWIFISettings()');
          })),
      ListTile(
          title: Text('WIFI'),
          minVerticalPadding: 5.0,
          onTap: (() async {
            print('Before Calling AppSettings.openWIFISettings()');
            await AppSettings.openWIFISettings();
            print('After Calling AppSettings.openWIFISettings()');
          })),
      ListTile(
        title: Text("Location"),
        onTap: () async {
          await AppSettings.openLocationSettings();
        },
      ),
      ListTile(
        title: Text("Security"),
        onTap: () async {
          await AppSettings.openSecuritySettings();
        },
      ),
      ListTile(
        title: Text("Lock & Password"),
        onTap: () async {
          await AppSettings.openLockAndPasswordSettings();
        },
      ),
      ListTile(
        title: Text("App Settings"),
        onTap: () async {
          await AppSettings.openAppSettings();
        },
      ),
      ListTile(
        title: Text("Bluetooth"),
        onTap: () async {
          await AppSettings.openBluetoothSettings();
        },
      ),
      ListTile(
        title: Text("Data Roaming"),
        onTap: () async {
          await AppSettings.openDataRoamingSettings();
        },
      ),
      ListTile(
        title: Text("Date"),
        onTap: () async {
          await AppSettings.openDateSettings();
        },
      ),
      ListTile(
        title: Text("Display"),
        onTap: () async {
          await AppSettings.openDisplaySettings();
        },
      ),
      ListTile(
        title: Text("Notification"),
        onTap: () async {
          await AppSettings.openNotificationSettings();
        },
      ),
      ListTile(
        title: Text("Sound"),
        onTap: () async {
          await AppSettings.openSoundSettings();
        },
      ),
      ListTile(
        title: Text("Internal Storage"),
        onTap: () async {
          await AppSettings.openInternalStorageSettings();
        },
      ),
      ListTile(
        title: Text("Battery optimization"),
        onTap: () async {
          await AppSettings.openBatteryOptimizationSettings();
        },
      ),
      ListTile(
        title: Text("NFC"),
        onTap: () async {
          await AppSettings.openNFCSettings();
        },
      ),
      ListTile(
        title: Text("VPN"),
        onTap: () async {
          await AppSettings.openVPNSettings(
            asAnotherTask: true,
          );
        },
      ),
      ListTile(
        title: Text("Device Settings"),
        onTap: () async {
          await AppSettings.openDeviceSettings(
            asAnotherTask: true,
          );
        },
      ),
      ListTile(
        title: Text("Accessibility"),
        onTap: () async {
          await AppSettings.openAccessibilitySettings(
            asAnotherTask: true,
          );
        },
      ),
      ListTile(
        title: Text("Developer"),
        onTap: () async {
          await AppSettings.openDevelopmentSettings(
            asAnotherTask: true,
          );
        },
      ),
      ListTile(
        title: Text("Hotspot"),
        onTap: () async {
          await AppSettings.openHotspotSettings(
            asAnotherTask: true,
          );
        },
      ),
      ListTile(
        title: Text("APN"),
        onTap: () async {
          await AppSettings.openAPNSettings(asAnotherTask: true);
        },
      ),
      ListTile(
        title: Text("Alarm & Reminders"),
        onTap: () async {
          await AppSettings.openAlarmSettings(asAnotherTask: true);
        },
      ),
      ListTile(
        title: Text("Subscriptions"),
        onTap: () async {
          await AppSettings.openSubscriptionSettings(asAnotherTask: true);
        },
      ),
    ]);
    return actionItems;
  }

  /// Dispose method to close out and cleanup objects.
  @override
  void dispose() {
    super.dispose();
  }
}
