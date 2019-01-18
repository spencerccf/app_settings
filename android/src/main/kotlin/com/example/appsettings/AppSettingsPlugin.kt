package com.example.appsettings

import android.content.Intent;
import android.provider.Settings;

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class AppSettingsPlugin: MethodCallHandler {
  /// Private variable to hold instance of Registrar for creating Intents.
  private var registrar: Registrar

  /// Private method to open device settings window
  private fun openSettings(url: String) {
    this.registrar.activity().startActivity(Intent(url))
  }

  /// Main constructor to setup the Registrar
  constructor(registrar: Registrar) {
    this.registrar = registrar
  }

  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "app_settings")
      channel.setMethodCallHandler(AppSettingsPlugin(registrar))
    }
  }

  /// Handler method to manage method channel calls.
  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "wifi") {
      openSettings(android.provider.Settings.ACTION_WIFI_SETTINGS)
    } else if (call.method == "location") {
      openSettings(android.provider.Settings.ACTION_LOCATION_SOURCE_SETTINGS)
    } else if (call.method == "security") {
      openSettings(android.provider.Settings.ACTION_SECURITY_SETTINGS)
    }
  }
}