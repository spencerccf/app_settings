package com.spencerccf.app_settings

import android.app.Activity
import android.app.admin.DevicePolicyManager
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.provider.Settings

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** AppSettingsPlugin */
class AppSettingsPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The Activity that will be used to start intents
  /// when the settings are opened as another task.
  private var activity: Activity? = null

  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "com.spencerccf.app_settings/methods")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when(call.method) {
      "openSettings" -> handleOpenSettings(call, result)
      "openSettingsPanel" -> handleOpenSettingsPanel(call, result)
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    this.activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    this.activity = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    this.activity = binding.activity
  }

  override fun onDetachedFromActivity() {
    this.activity = null
  }

  /**
   * Handle the 'openSettings' method call.
   */
  private fun handleOpenSettings(call: MethodCall, result: Result) {
    val asAnotherTask = call.argument<Boolean>("asAnotherTask") ?: false

    when(call.argument<String>("type")) {
      "accessibility" -> openSettings(Settings.ACTION_ACCESSIBILITY_SETTINGS, result, asAnotherTask)
      "alarm" -> openAlarmSettings(result, asAnotherTask)
      "apn" -> openSettings(Settings.ACTION_APN_SETTINGS, result, asAnotherTask)
      "appLocale" -> openAppLocaleSettings(result, asAnotherTask)
      "batteryOptimization" -> openBatteryOptimizationSettings(result, asAnotherTask)
      "bluetooth" -> openSettings(Settings.ACTION_BLUETOOTH_SETTINGS, result, asAnotherTask)
      "dataRoaming" -> openSettings(Settings.ACTION_DATA_ROAMING_SETTINGS, result, asAnotherTask)
      "date" -> openSettings(Settings.ACTION_DATE_SETTINGS, result, asAnotherTask)
      "developer" -> openSettings(
        Settings.ACTION_APPLICATION_DEVELOPMENT_SETTINGS,
        result,
        asAnotherTask,
      )
      "device" -> openSettings(Settings.ACTION_DEVICE_INFO_SETTINGS, result, asAnotherTask)
      "generalSettings" -> openSettings(Settings.ACTION_SETTINGS, result, asAnotherTask)
      "display" -> openSettings(Settings.ACTION_DISPLAY_SETTINGS, result, asAnotherTask)
      "hotspot" -> openHotspotSettings(result, asAnotherTask)
      "internalStorage" -> openSettings(
        Settings.ACTION_INTERNAL_STORAGE_SETTINGS,
        result,
        asAnotherTask,
      )
      "location" -> openSettings(Settings.ACTION_LOCATION_SOURCE_SETTINGS, result, asAnotherTask)
      "lockAndPassword" -> openSettings(
        DevicePolicyManager.ACTION_SET_NEW_PASSWORD,
        result,
        asAnotherTask,
      )
      "manageUnknownAppSources" -> openSettings(Settings.ACTION_MANAGE_UNKNOWN_APP_SOURCES, result, asAnotherTask)
      "nfc" -> openSettings(Settings.ACTION_NFC_SETTINGS, result, asAnotherTask)
      "notification" -> openNotificationSettings(result, asAnotherTask)
      "security" -> openSettings(Settings.ACTION_SECURITY_SETTINGS, result, asAnotherTask)
      "settings" -> openAppSettings(result, asAnotherTask)
      "sound" -> openSettings(Settings.ACTION_SOUND_SETTINGS, result, asAnotherTask)
      "vpn" -> openVpnSettings(result, asAnotherTask)
      "wifi" -> openSettings(Settings.ACTION_WIFI_SETTINGS, result, asAnotherTask)
      "wireless" -> openSettings(Settings.ACTION_WIRELESS_SETTINGS, result, asAnotherTask)
      else -> result.notImplemented()
    }
  }

  /**
   * Handle the 'openSettingsPanel' method call.
   */
  private fun handleOpenSettingsPanel(call: MethodCall, result: Result) {
    if(Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) {
      result.success(null)
      return
    }

    this.activity?.let {
      when(call.argument<String>("type")) {
        "internetConnectivity" -> {
          it.startActivity(Intent(Settings.Panel.ACTION_INTERNET_CONNECTIVITY))
          result.success(null)
        }
        "nfc" -> {
          it.startActivity(Intent(Settings.Panel.ACTION_NFC))
          result.success(null)
        }
        "volume" -> {
          it.startActivity(Intent(Settings.Panel.ACTION_VOLUME))
          result.success(null)
        }
        "wifi" -> {
          it.startActivity(Intent(Settings.Panel.ACTION_WIFI))
          result.success(null)
        }
        else -> result.notImplemented()
      }
    } ?: run {
      result.success(null)
    }
  }

  /**
   * Open the application settings.
   */
  private fun openAppSettings(result: Result, asAnotherTask: Boolean = false) {
    val intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
    if (asAnotherTask) {
      intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    }

    this.activity?.let {
      intent.data = Uri.fromParts("package", it.packageName, null)
      it.startActivity(intent)
    }

    result.success(null)
  }

  /**
   * Open the application's preferred locale settings.
   */
  private fun openAppLocaleSettings(result: Result, asAnotherTask: Boolean = false) {
    // Only available on Android 13+
    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) {
      result.success(null)
      return
    }

    val intent = Intent(Settings.ACTION_APP_LOCALE_SETTINGS)
    if (asAnotherTask) {
      intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    }

    this.activity?.let {
      intent.data = Uri.fromParts("package", it.packageName, null)
      it.startActivity(intent)
    }

    result.success(null)
  }

  /**
   * Open the alarm settings.
   */
  private fun openAlarmSettings(result: Result, asAnotherTask: Boolean = false) {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
      val uri = this.activity?.let { Uri.fromParts("package", it.packageName, null) }

      if(uri == null) {
        result.success(null)
        return
      }

      openSettingsWithIntent(Intent(Settings.ACTION_REQUEST_SCHEDULE_EXACT_ALARM, uri), result, asAnotherTask)
    } else {
      openAppSettings(result, asAnotherTask)
    }
  }

  /**
   * Open the battery optimization settings.
   */
  private fun openBatteryOptimizationSettings(result: Result, asAnotherTask: Boolean = false) {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
      openSettings(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS, result, asAnotherTask)
    } else {
      openAppSettings(result, asAnotherTask)
    }
  }

  /**
   * Open the hotspot settings.
   */
  private fun openHotspotSettings(result: Result, asAnotherTask: Boolean) {
    // See https://stackoverflow.com/questions/6406668/launch-a-hidden-android-settings-activity-from-a-program
    val intent = Intent().setClassName(
      "com.android.settings",
      "com.android.settings.TetherSettings")

    openSettingsWithIntent(intent, result, asAnotherTask)
  }

  /**
   * Open the Notification settings.
   */
  private fun openNotificationSettings(result: Result, asAnotherTask: Boolean) {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
      this.activity?.let {
        val intent = Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS)
            .putExtra(Settings.EXTRA_APP_PACKAGE, it.packageName)

        if (asAnotherTask) {
          intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        }

        it.startActivity(intent)
      }

      result.success(null)
    } else {
      openAppSettings(result, asAnotherTask)
    }
  }

  /**
   * Open the settings panel for the given url.
   */
  private fun openSettings(
    url: String,
    result: Result,
    asAnotherTask: Boolean = false,
  ) {
    try {
      val intent = Intent(url)
      if (asAnotherTask) {
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
      }

      this.activity?.startActivity(intent)
      result.success(null)
    } catch (e: Exception) {
      // If the Activity fails to start, show the app settings instead.
      openAppSettings(result, asAnotherTask)
    }
  }

  /**
   * Open a settings panel using the given intent.
   */
  private fun openSettingsWithIntent(
    intent: Intent,
    result: Result,
    asAnotherTask: Boolean = false,
  ) {
    try {
      if (asAnotherTask) {
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
      }

      this.activity?.startActivity(intent)

      result.success(null)
    } catch (e: Exception) {
      // If the Activity fails to start, show the app settings instead.
      openAppSettings(result, asAnotherTask)
    }
  }

  /**
   * Open the VPN settings.
   */
  private fun openVpnSettings(result: Result, asAnotherTask: Boolean) {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
      openSettings(Settings.ACTION_VPN_SETTINGS, result, asAnotherTask)
    } else {
      // See https://stackoverflow.com/questions/26469267/action-to-open-up-vpn-settings-activity-for-api-2-3-7
      openSettings("android.net.vpn.SETTINGS", result, asAnotherTask)
    }
  }
}