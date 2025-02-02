@preconcurrency import Flutter
import UIKit
import StoreKit

@MainActor
public class AppSettingsPlugin: NSObject, FlutterPlugin, UIWindowSceneDelegate {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "com.spencerccf.app_settings/methods", binaryMessenger: registrar.messenger())
        let instance = AppSettingsPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
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
            if #available(iOS 16.0, *) {
                openSettings(settingsUrl: UIApplication.openNotificationSettingsURLString)
            } else {
                openSettings(settingsUrl: UIApplication.openSettingsURLString)
            }
            result(nil)
            break
        case "subscriptions":
            if #available(iOS 15.0, *) {
                Task {
                    let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                    
                    if(windowScene != nil) {
                        await openSubscriptionSettings(windowScene!)
                    } else {
                        openSettings(settingsUrl: UIApplication.openSettingsURLString)
                    }
                    
                    result(nil)
                }
            } else {
                // Show the default settings as fallback.
                openSettings(settingsUrl: UIApplication.openSettingsURLString)
                result(nil)
            }
            break
        default:
            // Show the default settings as fallback.
            openSettings(settingsUrl: UIApplication.openSettingsURLString)
            result(nil)
            break
        }
    }
    
    private func openSettings(settingsUrl: String) {
        guard let url = URL(string: settingsUrl) else {
            return
        }
        
        if (UIApplication.shared.canOpenURL(url)) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    @available(iOS 15.0.0, *)
    private func openSubscriptionSettings(_ windowScene: UIWindowScene) async {
        do {
            try await AppStore.showManageSubscriptions(in: windowScene)
        } catch {
            // Show the default settings as fallback.
            openSettings(settingsUrl: UIApplication.openSettingsURLString)
        }
    }
}
