import Flutter
import UIKit

public class SwiftAppSettingsPlugin: NSObject, FlutterPlugin {
  private func openSettings() {
      if let url = URL(string: "\(UIApplication.openSettingsURLString)") {        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
      }
  }

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "app_settings", binaryMessenger: registrar.messenger())
    let instance = SwiftAppSettingsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {    
      openSettings()
  }
}