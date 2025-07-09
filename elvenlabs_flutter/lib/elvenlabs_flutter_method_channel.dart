import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'elvenlabs_flutter_platform_interface.dart';

/// An implementation of [ElvenlabsFlutterPlatform] that uses method channels.
class MethodChannelElvenlabsFlutter extends ElvenlabsFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  static const methodChannel = MethodChannel('elvenlabs_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> startCall() async {
    await methodChannel.invokeMethod('startCall');
  }

  @override
  Future<void> endCall() async {
    await methodChannel.invokeMethod('endCall');
  }
}
