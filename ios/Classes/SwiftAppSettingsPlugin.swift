import Flutter
import UIKit
import StoreKit

/// Swift app settings plugin with method channel call handler.
@available(iOS 15.0.0, *)
public class SwiftAppSettingsPlugin: NSObject, FlutterPlugin, UIWindowSceneDelegate {
    /// Private method to open device settings window
    private func openSettings(result: @escaping FlutterResult) {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        result("Done")
    }

    /// Public register method for Flutter plugin registrar.
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "app_settings", binaryMessenger: registrar.messenger())
        let instance = SwiftAppSettingsPlugin()

        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    /// Public handler method for managing method channel calls.
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "subscriptions" {
            Task {
                if let scene = UIApplication.shared.connectedScenes.first{
                    guard let windowScene = (scene as? UIWindowScene) else { return result("Unkown scene") }
                    await showManageSubscription(windowScene, result: result)
                }
            }
        } else {
            openSettings(result: result)
        }
    }

    func showManageSubscription(_ windowScene: UIWindowScene, result: @escaping FlutterResult) async {
        do {
            try await AppStore.showManageSubscriptions(in: windowScene)
        } catch {}
        result("Done")
    }
}
