import Cocoa
import FlutterMacOS
import AppKit
import StoreKit

public class AppSettingsPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "com.spencerccf.app_settings/methods", binaryMessenger: registrar.messenger)
        
        registrar.addMethodCallDelegate(AppSettingsPlugin(), channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch(call.method) {
        case "openSettings":
            handleOpenSettings(call: call, result: result)
            break
        default:
            result(FlutterMethodNotImplemented)
            break
        }
    }

    /// Handle the 'openSettings' method call.
    private func handleOpenSettings(call: FlutterMethodCall, result: @escaping FlutterResult) {
        let arguments = call.arguments as! Dictionary<String, Any?>
        let type = arguments["type"] as! String

        switch(type) {
        case "notification":
            openSettings(settingsUrl: SettingsGeneral.notifications.rawValue)
            result(nil)
            break
        case "camera":
            openSettings(settingsUrl: SettingsGeneral.camera.rawValue)
            result(nil)
            break
        default:
            // Show the default settings as fallback.
            openSettings(settingsUrl: SettingsGeneral.preference.rawValue)
            result(nil)
            break
        }
    }

    private func openSettings(settingsUrl: String) {
        guard let url = URL(string: settingsUrl) else {
            return
        }
        
        NSWorkspace.shared.open(url)
    }
}
