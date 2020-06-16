package com.example.appsettings

import android.content.Intent;
import android.provider.Settings;
import android.net.Uri

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
    try {
      this.registrar.activity().startActivity(Intent(url))
    } catch(e:Exception) {
      // Default to APP Settings if setting activity fails to load/be available on device
      openAppSettings()
    }
  }

  private fun openAppSettings() {
    val intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    val uri = Uri.fromParts("package", this.registrar.activity().getPackageName(), null)
    intent.setData(uri)
    this.registrar.activity().startActivity(intent)
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
      openSettings(Settings.ACTION_WIFI_SETTINGS)
    } else if (call.method == "location") {
      openSettings(Settings.ACTION_LOCATION_SOURCE_SETTINGS)
    } else if (call.method == "security") {
      openSettings(Settings.ACTION_SECURITY_SETTINGS)
    } else if (call.method == "bluetooth") {
      openSettings(Settings.ACTION_BLUETOOTH_SETTINGS)
    } else if (call.method == "data_roaming") {
      openSettings(Settings.ACTION_DATA_ROAMING_SETTINGS)
    } else if (call.method == "date") {
      openSettings(Settings.ACTION_DATE_SETTINGS)
    } else if (call.method == "display") {
      openSettings(Settings.ACTION_DISPLAY_SETTINGS)
    } else if (call.method == "notification") {
      openSettings(Settings.ACTION_NOTIFICATION_POLICY_ACCESS_SETTINGS)
    } else if (call.method == "nfc") {
      openSettings(Settings.ACTION_NFC_SETTINGS)
    } else if (call.method == "sound") {
      openSettings(Settings.ACTION_SOUND_SETTINGS)
    } else if (call.method == "internal_storage") {
      openSettings(Settings.ACTION_INTERNAL_STORAGE_SETTINGS)
    } else if (call.method == "battery_optimization") {
      openSettings(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS)
    } else if (call.method == "app_settings") {
      openAppSettings()
    }
  }
}
