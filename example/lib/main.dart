import 'package:flutter/material.dart';
import 'package:flutter_error_handler/flutter_error_handler.dart';

void main() async {
  // Initialize global error handling with the error handler package
  await FlutterErrorHandler.init(
    app: const MyApp(), // Pass your app widget here
    preAppInitialization: () async {
      // Do any pre-initialization logic here (e.g., loading preferences)
    },
    onErrorHandler: (Object error, StackTrace stackTrace) {
      // Custom logging or error handling logic
      print("Custom Error Handler:");
      print("Error: $error");
      print("StackTrace: $stackTrace");
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Error Handler Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              throw Exception('This is a test error!');
            },
            child: Text('Throw Error'),
          ),
        ),
      ),
    );
  }
}
