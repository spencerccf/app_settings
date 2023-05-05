import Flutter
import UIKit

public class AppSettingsPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "app_settings", binaryMessenger: registrar.messenger())
        let instance = AppSettingsPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        var url: String = UIApplication.openSettingsURLString
        
        switch(call.method) {
        case "notification":
            if #available(iOS 16.0, *) {
                url = UIApplication.openNotificationSettingsURLString
            }
            break
        default:
            break
        }
        
        openSettings(settingsUrl: url)
        result(nil)
    }
    
    private func openSettings(settingsUrl: String) {
        if let url = URL(string: settingsUrl) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
