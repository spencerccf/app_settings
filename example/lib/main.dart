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
            body: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 2,
                children: List.generate(actionItems.length, (index) {
                  return Center(
                      child: ButtonTheme(
                    colorScheme: ColorScheme.dark(),
                    minWidth: 150.0,
                    child: actionItems[index],
                  ));
                }))));
  }

  List<Widget> getListOfActionButtons() {
    var actionItems = <Widget>[];

    actionItems.addAll([
      ElevatedButton(
        child: Text("WIFI"),
        onPressed: () {
          AppSettings.openWIFISettings();
        },
      ),
      ElevatedButton(
        child: Text("Location"),
        onPressed: () {
          AppSettings.openLocationSettings();
        },
      ),
      ElevatedButton(
        child: Text("Security"),
        onPressed: () {
          AppSettings.openSecuritySettings();
        },
      ),
      ElevatedButton(
        child: Text("App Settings"),
        onPressed: () {
          AppSettings.openAppSettings();
        },
      ),
      ElevatedButton(
        child: Text("Bluetooth"),
        onPressed: () {
          AppSettings.openBluetoothSettings();
        },
      ),
      ElevatedButton(
        child: Text("Data Roaming"),
        onPressed: () {
          AppSettings.openDataRoamingSettings();
        },
      ),
      ElevatedButton(
        child: Text("Date"),
        onPressed: () {
          AppSettings.openDateSettings();
        },
      ),
      ElevatedButton(
        child: Text("Display"),
        onPressed: () {
          AppSettings.openDisplaySettings();
        },
      ),
      ElevatedButton(
        child: Text("Notification"),
        onPressed: () {
          AppSettings.openNotificationSettings();
        },
      ),
      ElevatedButton(
        child: Text("Sound"),
        onPressed: () {
          AppSettings.openSoundSettings();
        },
      ),
      ElevatedButton(
        child: Text("Internal Storage"),
        onPressed: () {
          AppSettings.openInternalStorageSettings();
        },
      ),
      ElevatedButton(
        child: Text("Battery optimization"),
        onPressed: () {
          AppSettings.openBatteryOptimizationSettings();
        },
      ),
      ElevatedButton(
        child: Text("NFC"),
        onPressed: () {
          AppSettings.openNFCSettings();
        },
      ),
      ElevatedButton(
        child: Text("VPN"),
        onPressed: () {
          AppSettings.openVPNSettings(
            asAnotherTask: true,
          );
        },
      ),
      ElevatedButton(
        child: Text("Device Settings"),
        onPressed: () {
          AppSettings.openDeviceSettings(
            asAnotherTask: true,
          );
        },
      ),
       ElevatedButton(
        child: Text("Accessibility"),
        onPressed: () {
          AppSettings.openAccessibilitySettings(
            asAnotherTask: true,
          );
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
