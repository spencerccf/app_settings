import 'package:flutter/material.dart';
import 'dart:async';

import 'package:app_settings/app_settings.dart';

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
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                // Generate 100 widgets that display their index in the List.
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
    var actionItems = List<Widget>();

    actionItems.addAll([
      RaisedButton(
        child: Text("Open WIFI"),
        onPressed: () {
          AppSettings.openWIFISettings();
        },
      ),
      RaisedButton(
        child: Text("Open Location"),
        onPressed: () {
          AppSettings.openLocationSettings();
        },
      ),
      RaisedButton(
        child: Text("Open Security"),
        onPressed: () {
          AppSettings.openSecuritySettings();
        },
      ),
      RaisedButton(
        child: Text("Open App Settings"),
        onPressed: () {
          AppSettings.openAppSettings();
        },
      ),
      RaisedButton(
        child: Text("Open Bluetooth"),
        onPressed: () {
          AppSettings.openBluetoothSettings();
        },
      ),
      RaisedButton(
        child: Text("Open Data Roaming"),
        onPressed: () {
          AppSettings.openDataRoamingSettings();
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
