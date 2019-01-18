import 'dart:async';
import 'package:flutter/services.dart';

class AppSettings {
  static const MethodChannel _channel = const MethodChannel('app_settings');

  static Future openWIFISettings() async {
    _channel.invokeMethod('wifi');
  }

  static Future openLocationSettings() async {
    _channel.invokeMethod('location');
  }

  static Future openSecuritySettings() async {
    _channel.invokeMethod('security');
  }
}
