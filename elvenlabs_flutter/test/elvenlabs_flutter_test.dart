import 'package:flutter/services.dart';
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
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ElvenlabsFlutter', () {
    const MethodChannel channel = MethodChannel('elvenlabs_flutter');
    final log = <MethodCall>[];

    setUp(() {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        log.add(methodCall);
        switch (methodCall.method) {
          case 'startCall':
            return 'Call started successfully';
          case 'endCall':
            return 'Call ended successfully';
          default:
            return null;
        }
      });
    });

    tearDown(() {
      log.clear();
    });

    test('startCall calls native method', () async {
      await ElvenlabsFlutter.startCall();
      expect(
        log,
        <Matcher>[
          isMethodCall('startCall', arguments: null),
        ],
      );
    });

    test('endCall calls native method', () async {
      await ElvenlabsFlutter.endCall();
      expect(
        log,
        <Matcher>[
          isMethodCall('endCall', arguments: null),
        ],
      );
    });

    test('startCall and endCall can be called in sequence', () async {
      await ElvenlabsFlutter.startCall();
      await ElvenlabsFlutter.endCall();
      
      expect(
        log,
        <Matcher>[
          isMethodCall('startCall', arguments: null),
          isMethodCall('endCall', arguments: null),
        ],
      );
    });
  });
}
