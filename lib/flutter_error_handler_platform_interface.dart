import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_error_handler_method_channel.dart';

abstract class FlutterErrorHandlerPlatform extends PlatformInterface {
  /// Constructs a FlutterErrorHandlerPlatform.
  FlutterErrorHandlerPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterErrorHandlerPlatform _instance = MethodChannelFlutterErrorHandler();

  /// The default instance of [FlutterErrorHandlerPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterErrorHandler].
  static FlutterErrorHandlerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterErrorHandlerPlatform] when
  /// they register themselves.
  static set instance(FlutterErrorHandlerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
