
---

# Flutter Error Handler

[![pub package](https://img.shields.io/pub/v/flutter_error_handler.svg)](https://pub.dev/packages/flutter_error_handler)

A comprehensive global error handler package for Flutter applications, designed to simplify error tracking and improve app stability. By effortlessly capturing both framework-level and asynchronous errors, this package ensures that no error goes unnoticed, allowing you to implement custom logging and reporting strategies with minimal effort

## Getting Started

This package provides a hassle-free way to manage errors globally across your Flutter application. Whether it's a UI-related error or an asynchronous operation failure (like API calls), `flutter_error_handler` makes it easy to track, log, and handle all errors from one central place, enhancing both development and production monitoring.


## Key Features

- **Global error tracking**: Captures errors across the entire app, both synchronous (framework-level) and asynchronous.
- **Async error handling**: Catches errors in async operations using `runZonedGuarded`.
- **Custom error handling**: Allows you to provide a custom error handler for logging or handling errors based on your specific needs (e.g., Firebase Crashlytics, Sentry, or your own logging service).
- **Pre-app initialization**: Supports custom logic before launching the main app (e.g., loading preferences, initializing services).

## Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_error_handler: ^latest
```

Then, run:

```bash
flutter pub get
```

## Usage

To integrate `flutter_error_handler` into your Flutter application, wrap your app initialization in the provided `FlutterErrorHandler.init` function.

### Basic Example:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_error_handler/flutter_error_handler.dart';

void main() async {
  // Initialize global error handling with the package
  await FlutterErrorHandler.init(
    app: const MyApp(), // Pass your app widget here
    preAppInitialization: () async {
      // Perform any pre-initialization logic here (e.g., loading preferences)
    },
    onErrorHandler: (Object error, StackTrace stackTrace) {
      // Handle or log the error here
      logErrorToService(error, stackTrace);
    },
  );
}

void logErrorToService(Object error, StackTrace stackTrace) {
  // Example: Log the error to a service like Firebase Crashlytics or Sentry
  print("Logging error: $error");
  print("StackTrace: $stackTrace");
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
              // Example: Throw a test error
              throw Exception('This is a test error!');
            },
            child: Text('Throw Error'),
          ),
        ),
      ),
    );
  }
}
```

### Parameters

- `app`: Your root widget (`MyApp()`).
- `preAppInitialization`: A function to perform pre-app initialization tasks, such as loading preferences or setting up configurations. It runs before `runApp`.
- `onErrorHandler`: A custom error handler function that is invoked whenever an error occurs. This is where you can log errors to an external service or handle errors in a custom way.
- `showConsoleLogsInDebugMode`: To help this check you can control console logs.

### Example Use Cases:

- **Firebase Crashlytics**:

  ```dart
  import 'package:firebase_crashlytics/firebase_crashlytics.dart';

  void logErrorToService(Object error, StackTrace stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  }
  ```

- **Sentry**:

  ```dart
  import 'package:sentry_flutter/sentry_flutter.dart';

  void logErrorToService(Object error, StackTrace stackTrace) {
    Sentry.captureException(error, stackTrace: stackTrace);
  }
  ```

## Handling Flutter and Async Errors

1. **Flutter Framework Errors**: Errors that occur within the Flutter widget tree, such as during build, layout, or rendering, are caught by `FlutterError.onError` and handled by the global error handler.

2. **Asynchronous Errors**: Errors in async operations (e.g., API calls, database operations) are caught using `runZonedGuarded`, allowing you to handle uncaught async exceptions globally.

### Custom Error Handling

You can customize how errors are handled by providing your own `onErrorHandler` function when calling `FlutterErrorHandler.init`. This allows you to log errors to a service, display custom error messages, or handle the errors in a way that suits your application’s needs.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

### Steps to contribute:
1. Fork this repository.
2. Create your feature branch (`git checkout -b feature/new-feature`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/new-feature`).
5. Open a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

Developed by [M.Bilal MurtaZa](https://github.com/MBilalMurtaZa)

---

### Example Error Reporting with Firebase:

```dart
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void logErrorToService(Object error, StackTrace stackTrace) {
  FirebaseCrashlytics.instance.recordError(error, stackTrace);
}
```

---


