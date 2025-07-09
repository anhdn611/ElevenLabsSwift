import Flutter
import UIKit

public class ElvenlabsFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "elvenlabs_flutter", binaryMessenger: registrar.messenger())
    let instance = ElvenlabsFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "startCall":
      // TODO: Gọi SDK thực tế ở đây
      result("Call started")
    case "endCall":
      // TODO: Gọi SDK thực tế ở đây
      result("Call ended")
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
