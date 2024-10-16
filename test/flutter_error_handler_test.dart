import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_error_handler/flutter_error_handler.dart';
import 'package:flutter_error_handler/flutter_error_handler_platform_interface.dart';
import 'package:flutter_error_handler/flutter_error_handler_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterErrorHandlerPlatform
    with MockPlatformInterfaceMixin
    implements FlutterErrorHandlerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterErrorHandlerPlatform initialPlatform = FlutterErrorHandlerPlatform.instance;

  test('$MethodChannelFlutterErrorHandler is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterErrorHandler>());
  });

  test('getPlatformVersion', () async {
    FlutterErrorHandler flutterErrorHandlerPlugin = FlutterErrorHandler();
    MockFlutterErrorHandlerPlatform fakePlatform = MockFlutterErrorHandlerPlatform();
    FlutterErrorHandlerPlatform.instance = fakePlatform;

    expect(await flutterErrorHandlerPlugin.getPlatformVersion(), '42');
  });
}
