import 'dart:async';
import 'package:flutter/services.dart';

class AppSettings {
  static const MethodChannel _channel =
      const MethodChannel('app_settings');

  static Future<bool> get openWIFISettings async {
    final bool success = await _channel.invokeMethod('wifi');
    return success;
  }

  static Future<bool> get openLocationSettings async {
    final bool success = await _channel.invokeMethod('location');
    return success;
  }

  static Future<bool> get openSecuritySettings async {
    final bool success = await _channel.invokeMethod('security');
    return success;
  }
}
