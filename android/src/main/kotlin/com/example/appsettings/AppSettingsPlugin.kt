package com.example.appsettings

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
import io.flutter.plugin.common.PluginRegistry.Registrar


class AppSettingsPlugin() : MethodCallHandler, FlutterPlugin, ActivityAware {
    /// Private variable to hold instance of Registrar for creating Intents.
    private lateinit var activity: Activity

    /// Private method to open device settings window
    private fun openSettings(url: String, asAnotherTask: Boolean = false, result: Result) {
        try {
            val intent = Intent(url)
            if (asAnotherTask) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            this.activity.startActivity(intent)
        } catch (e: Exception) {
            // Default to APP Settings if setting activity fails to load/be available on device
            openAppSettings(asAnotherTask, result)
        }
        result.success("Done")
    }

    private fun openSettingsWithCustomIntent(intent: Intent, asAnotherTask: Boolean = false, result: Result) {
        try {
            if (asAnotherTask) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            this.activity.startActivity(intent)
        } catch (e: Exception) {
            // Default to APP Settings if setting activity fails to load/be available on device
            openAppSettings(asAnotherTask, result)
        }
        result.success("Done")
    }

    private fun openAppSettings(asAnotherTask: Boolean = false, result: Result) {
        val intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
        if (asAnotherTask) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        val uri = Uri.fromParts("package", this.activity.packageName, null)
        intent.data = uri
        this.activity.startActivity(intent)
        result.success("Done")
    }

    /// Main constructor to setup the Registrar
    constructor(registrar: Registrar) : this() {
        //this.activity = registrar.activity() //Deprecated: https://api.flutter.dev/javadoc/io/flutter/plugin/common/PluginRegistry.Registrar.html#activity()
    }

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "app_settings")
            channel.setMethodCallHandler(AppSettingsPlugin(registrar))
        }
    }

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        val channel = MethodChannel(binding.binaryMessenger, "app_settings")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {

    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        this.activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        this.activity = binding.activity
    }

    override fun onDetachedFromActivity() {
    }

    /// Handler method to manage method channel calls.
    override fun onMethodCall(call: MethodCall, result: Result) {

        val asAnotherTask = call.argument("asAnotherTask") ?: false

        if (call.method == "wifi") {
            openSettings(Settings.ACTION_WIFI_SETTINGS, asAnotherTask, result)
        } else if (call.method == "wireless") {
            openSettings(Settings.ACTION_WIRELESS_SETTINGS, asAnotherTask, result)
        } else if (call.method == "location") {
            openSettings(Settings.ACTION_LOCATION_SOURCE_SETTINGS, asAnotherTask, result)
        } else if (call.method == "security") {
            openSettings(Settings.ACTION_SECURITY_SETTINGS, asAnotherTask, result)
        } else if (call.method == "locksettings") {
            openSettings(DevicePolicyManager.ACTION_SET_NEW_PASSWORD, asAnotherTask, result)
        } else if (call.method == "bluetooth") {
            openSettings(Settings.ACTION_BLUETOOTH_SETTINGS, asAnotherTask, result)
        } else if (call.method == "data_roaming") {
            openSettings(Settings.ACTION_DATA_ROAMING_SETTINGS, asAnotherTask, result)
        } else if (call.method == "date") {
            openSettings(Settings.ACTION_DATE_SETTINGS, asAnotherTask, result)
        } else if (call.method == "display") {
            openSettings(Settings.ACTION_DISPLAY_SETTINGS, asAnotherTask, result)
        } else if (call.method == "notification") {
            if (Build.VERSION.SDK_INT >= 26) {
                val intent = Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS)
                        .putExtra(Settings.EXTRA_APP_PACKAGE, this.activity.packageName)
                if (asAnotherTask) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                this.activity.startActivity(intent)
                result.success("Done")
            } else {
                openAppSettings(asAnotherTask, result)
            }
        } else if (call.method == "nfc") {
            openSettings(Settings.ACTION_NFC_SETTINGS, asAnotherTask, result)
        } else if (call.method == "sound") {
            openSettings(Settings.ACTION_SOUND_SETTINGS, asAnotherTask, result)
        } else if (call.method == "internal_storage") {
            openSettings(Settings.ACTION_INTERNAL_STORAGE_SETTINGS, asAnotherTask, result)
        } else if (call.method == "battery_optimization") {
            openSettings(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS, asAnotherTask, result)
        } else if (call.method == "vpn") {
            if(Build.VERSION.SDK_INT >= 24) {
                openSettings(Settings.ACTION_VPN_SETTINGS, asAnotherTask, result)
            }else{
                openSettings("android.net.vpn.SETTINGS", asAnotherTask, result)
            }
        } else if (call.method == "app_settings") {
            openAppSettings(asAnotherTask, result)
        }
        else if (call.method == "device_settings") {
            openSettings(Settings.ACTION_SETTINGS, asAnotherTask, result)
        }
        else if (call.method == "accessibility") {
            openSettings(Settings.ACTION_ACCESSIBILITY_SETTINGS, asAnotherTask, result)
        }
        else if (call.method == "development") {
            openSettings(Settings.ACTION_APPLICATION_DEVELOPMENT_SETTINGS, asAnotherTask, result)
        }
        else if(call.method == "hotspot") {
            val intent = Intent()
            intent.setClassName("com.android.settings", "com.android.settings.TetherSettings")
            openSettingsWithCustomIntent(intent, asAnotherTask, result)
        } else if (call.method == "apn") {
            openSettings(Settings.ACTION_APN_SETTINGS, asAnotherTask, result)
        } else if (call.method == "alarm") {
            val uri = Uri.fromParts("package", this.activity.packageName, null)
            openSettingsWithCustomIntent(Intent(Settings.ACTION_REQUEST_SCHEDULE_EXACT_ALARM, uri), asAnotherTask, result)
        }
    }
}
