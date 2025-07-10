import Flutter
import UIKit
import ElevenLabsSDK

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
      startElevenLabsCall(result: result)
    case "endCall":
      endElevenLabsCall(result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
  
  private func startElevenLabsCall(result: @escaping FlutterResult) {
    // TODO: Thay thế bằng API thực tế của ElevenLabs SDK
    // Ví dụ: ElevenLabsSDK.shared.startCall()
    
    // Placeholder implementation
    print("Starting ElevenLabs call...")
    result("Call started successfully")
  }
  
  private func endElevenLabsCall(result: @escaping FlutterResult) {
    // TODO: Thay thế bằng API thực tế của ElevenLabs SDK
    // Ví dụ: ElevenLabsSDK.shared.endCall()
    
    // Placeholder implementation
    print("Ending ElevenLabs call...")
    result("Call ended successfully")
  }
}
