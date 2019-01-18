import 'package:flutter/material.dart';
import 'dart:async';

import 'package:app_settings/app_settings.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription<Position> _positionStreamSubscription;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    /* ***********************
      Testing purposes only: Ask for Location access 
     *********************** */
    const LocationOptions locationOptions =
        LocationOptions(accuracy: LocationAccuracy.best, distanceFilter: 10);
    final Stream<Position> positionStream =
        Geolocator().getPositionStream(locationOptions);
    _positionStreamSubscription = positionStream.listen((Position position) {
      if (position == null) {
        return;
      }
      var currentLocation = [position.longitude, position.latitude];
      print(currentLocation);
    });
    /* ***********************
      ^ Testing purposes only: Ask for Location access 
     *********************** */

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
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
            ])),
      ),
    );
  }

  @override
  void dispose() {
    if (_positionStreamSubscription != null) {
      _positionStreamSubscription.cancel();
      _positionStreamSubscription = null;
    }
    super.dispose();
  }
}
