import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'elvenlabs_flutter_method_channel.dart';

abstract class ElvenlabsFlutterPlatform extends PlatformInterface {
  /// Constructs a ElvenlabsFlutterPlatform.
  ElvenlabsFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static ElvenlabsFlutterPlatform _instance = MethodChannelElvenlabsFlutter();

  /// The default instance of [ElvenlabsFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelElvenlabsFlutter].
  static ElvenlabsFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ElvenlabsFlutterPlatform] when
  /// they register themselves.
  static set instance(ElvenlabsFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('getPlatformVersion() has not been implemented.');
  }

  Future<void> startCall() {
    throw UnimplementedError('startCall() has not been implemented.');
  }

  Future<void> endCall() {
    throw UnimplementedError('endCall() has not been implemented.');
  }
}
