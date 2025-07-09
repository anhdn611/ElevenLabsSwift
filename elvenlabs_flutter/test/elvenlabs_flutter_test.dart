import 'package:flutter_test/flutter_test.dart';
import 'package:elvenlabs_flutter/elvenlabs_flutter.dart';
import 'package:elvenlabs_flutter/elvenlabs_flutter_platform_interface.dart';
import 'package:elvenlabs_flutter/elvenlabs_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockElvenlabsFlutterPlatform
    with MockPlatformInterfaceMixin
    implements ElvenlabsFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ElvenlabsFlutterPlatform initialPlatform = ElvenlabsFlutterPlatform.instance;

  test('$MethodChannelElvenlabsFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelElvenlabsFlutter>());
  });

  test('getPlatformVersion', () async {
    ElvenlabsFlutter elvenlabsFlutterPlugin = ElvenlabsFlutter();
    MockElvenlabsFlutterPlatform fakePlatform = MockElvenlabsFlutterPlatform();
    ElvenlabsFlutterPlatform.instance = fakePlatform;

    expect(await elvenlabsFlutterPlugin.getPlatformVersion(), '42');
  });
}
