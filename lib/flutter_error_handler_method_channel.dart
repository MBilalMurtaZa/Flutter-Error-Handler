import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_error_handler_platform_interface.dart';

/// An implementation of [FlutterErrorHandlerPlatform] that uses method channels.
class MethodChannelFlutterErrorHandler extends FlutterErrorHandlerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_error_handler');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
