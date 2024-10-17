library;

import 'flutter_error_handler_platform_interface.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FlutterErrorHandler {
  Future<String?> getPlatformVersion() {
    return FlutterErrorHandlerPlatform.instance.getPlatformVersion();
  }

  /// Initialize global error handling for the app.
  static Future<void> init({
    required Widget app,
    required Future<void> Function() preAppInitialization,
    required Function(Object error, StackTrace stackTrace) onErrorHandler,
    bool showConsoleLogsInDebugMode = true,
  }) async {
    BindingBase.debugZoneErrorsAreFatal = true;
    FlutterError.onError = (FlutterErrorDetails details) {
      if (showConsoleLogsInDebugMode) {
        if (kDebugMode) {
          print('Caught framework error: ${details.exceptionAsString()}');
          FlutterError.dumpErrorToConsole(details);
        }
      }
      onErrorHandler(details.exception, details.stack!);
    };
    runZonedGuarded(() async {
      await preAppInitialization();
      runApp(app);
    }, (error, stackTrace) {
      if (showConsoleLogsInDebugMode) {
        if (kDebugMode) {
          print('Caught zoned error: ${error.toString()}');
          print(stackTrace.toString());
        }
      }
      onErrorHandler(error, stackTrace);
    });
  }
}
