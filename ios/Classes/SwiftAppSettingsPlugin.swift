import Flutter
import UIKit

public class SwiftAppSettingsPlugin: NSObject, FlutterPlugin {
  private func openSettings() -> Bool {
      var success: Bool = true
      guard let url = URL(string: "\(UIApplication.openSettingsURLString)") else {        
        return false
      }
      if #available(iOS 10.0, *) {
          UIApplication.shared.open(url, options: [:], completionHandler: nil)
      } else {
          UIApplication.shared.openURL(url)
      }
      return success
  }

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "app_settings", binaryMessenger: registrar.messenger())
    let instance = SwiftAppSettingsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {    
    if call.method == "wifi" {
      result(openSettings())
    } else if call.method == "location" {
      result(openSettings())
    } else if call.method == "security" {
      result(openSettings())
    } else {
      result(false)
    }
  }
}
