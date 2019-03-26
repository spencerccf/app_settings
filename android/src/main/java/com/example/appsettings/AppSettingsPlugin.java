package com.example.appsettings;

import android.content.Intent;
import android.net.Uri;
import android.provider.Settings;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

import static io.flutter.plugin.common.PluginRegistry.*;

public class AppSettingsPlugin implements MethodChannel.MethodCallHandler {
    private Registrar registrar;

    public AppSettingsPlugin(Registrar registrar) {
        this.registrar = registrar;
    }

    public static void registerWith(Registrar registrar) {
        MethodChannel channel = new MethodChannel(registrar.messenger(), "app_settings");
        channel.setMethodCallHandler(new AppSettingsPlugin(registrar));
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        if ("wifi".equalsIgnoreCase(call.method)) {
            openSettings(android.provider.Settings.ACTION_WIFI_SETTINGS);
        } else if ("location".equalsIgnoreCase(call.method)) {
            openSettings(android.provider.Settings.ACTION_LOCATION_SOURCE_SETTINGS);
        } else if ("security".equalsIgnoreCase(call.method)) {
            openSettings(android.provider.Settings.ACTION_SECURITY_SETTINGS);
        } else if ("app_settings".equalsIgnoreCase(call.method)) {
            Intent intent = new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            Uri uri = Uri.fromParts("package", this.registrar.activity().getPackageName(), null);
            intent.setData(uri);
            registrar.activity().startActivity(intent);
        }

        result.success(true);
    }

    private void openSettings(String url) {
        registrar.activity().startActivity(new Intent(url));
    }
}
