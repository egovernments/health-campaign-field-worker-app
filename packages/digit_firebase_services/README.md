# digit_firebase_services
digit_firebase_services is a Flutter package that simplifies the integration of Firebase services into your app. It bundles together commonly used Firebase services like firebase_core and firebase_crashlytics and allows you to enable or disable them with a simple flag. This package is designed to be flexible and configurable, making it easy to manage Firebase services in a unified way.

## Features

- Unified integration of Firebase Core and Firebase Crashlytics.
- Simple API to set up Firebase services.

## Getting started

```dart
dependencies:
  digit_firebase_services: latest_version
```

## Usage

```dart
import 'package:digit_firebase_services/digit_firebase_services.dart'
    as firebase_services;

firebase_services.initialize(
options: DefaultFirebaseOptions.currentPlatform,
onErrorMessage: (value) {
AppLogger.instance.error(title: 'CRASHLYTICS', message: value);
},
);
```