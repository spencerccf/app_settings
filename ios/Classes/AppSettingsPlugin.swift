import Flutter
import UIKit

public class AppSettingsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "app_settings", binaryMessenger: registrar.messenger())
    let instance = AppSettingsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    openSettings()
    result(nil)
  }

  private func openSettings() {
    if let url = URL(string: UIApplication.openSettingsURLString) {
      if #available(iOS 10.0, *) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
      } else {
        UIApplication.shared.openURL(url)
      }
    }
  }
}
