import 'elvenlabs_flutter_platform_interface.dart';

class ElvenlabsFlutter {
  Future<String?> getPlatformVersion() {
    return ElvenlabsFlutterPlatform.instance.getPlatformVersion();
  }

  static Future<void> startCall() async {
    await ElvenlabsFlutterPlatform.instance.startCall();
  }

  static Future<void> endCall() async {
    await ElvenlabsFlutterPlatform.instance.endCall();
  }
}
