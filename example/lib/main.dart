import 'package:flutter/material.dart';

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
  /// Widget build method to return MaterailApp.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Settings Example App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                child: Text("Open WIFI"),
                onPressed: () {
                  AppSettings.openWIFISettings();
                },
              ),
              FlatButton(
                child: Text("Open Location"),
                onPressed: () {
                  AppSettings.openLocationSettings();
                },
              ),
              FlatButton(
                child: Text("Open Security"),
                onPressed: () {
                  AppSettings.openSecuritySettings();
                },
              ),
              FlatButton(
                child: Text("Open App Settings"),
                onPressed: () {
                  AppSettings.openAppSettings();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
