import 'package:flutter/services.dart';

class ElvenlabsFlutter {
  static const MethodChannel _channel = MethodChannel('elvenlabs_flutter');

  static Future<void> startCall() async {
    await _channel.invokeMethod('startCall');
  }

  static Future<void> endCall() async {
    await _channel.invokeMethod('endCall');
  }
}