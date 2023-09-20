library app_utils;

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uuid/uuid.dart';
import '../data/local_store/secure_store/secure_store.dart';
export 'app_exception.dart';
export 'constants.dart';
export 'extensions/extensions.dart';

Expression<bool> buildAnd(Iterable<Expression<bool?>> iterable) {
  if (iterable.isEmpty) return const Constant(true);
  final result = iterable.reduce((value, element) => value & element);

  return result.equals(true);
}

Expression<bool> buildOr(Iterable<Expression<bool?>> iterable) {
  if (iterable.isEmpty) return const Constant(true);
  final result = iterable.reduce((value, element) => value | element);

  return result.equals(true);
}

class IdGen {
  static const IdGen _instance = IdGen._internal();

  static IdGen get instance => _instance;

  /// Shorthand for [instance]
  static IdGen get i => instance;

  final Uuid uuid;

  const IdGen._internal() : uuid = const Uuid();

  String get identifier => uuid.v1();
}

class CustomValidator {
  /// Validates that control's value must be `true`
  static Map<String, dynamic>? requiredMin(AbstractControl<dynamic> control) {
    return control.value == null || control.value.toString().length >= 2
        ? null
        : {'Min2 characters Required': true};
  }

  static Map<String, dynamic>? validMobileNumber(
    AbstractControl<dynamic> control,
  ) {
    if (control.value == null || control.value.toString().isEmpty) {
      return null;
    }

    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';

    if (RegExp(pattern).hasMatch(control.value.toString())) return null;

    if (control.value.toString().length < 10) return {'mobileNumber': true};

    return {'mobileNumber': true};
  }

  static Map<String, dynamic>? validStockCount(
    AbstractControl<dynamic> control,
  ) {
    if (control.value == null || control.value.toString().isEmpty) {
      return {'required': true};
    }

    var parsed = int.tryParse(control.value) ?? 0;
    if (parsed < 0) {
      return {'min': true};
    } else if (parsed > 10000) {
      return {'max': true};
    }

    return null;
  }
}

setBgRunning(bool isBgRunning) async {
  final localSecureStore = LocalSecureStore.instance;
  await localSecureStore.setBackgroundService(isBgRunning);
}

performBackgroundService({
  BuildContext? context,
  required bool stopService,
  required bool isBackground,
}) async {
  final connectivityResult = await (Connectivity().checkConnectivity());

  final isOnline = connectivityResult == ConnectivityResult.wifi ||
      connectivityResult == ConnectivityResult.mobile;
  final service = FlutterBackgroundService();
  var isRunning = await service.isRunning();

  if (stopService) {
    if (isRunning) {
      if (!isBackground && context != null) {
        if (context.mounted) {
          DigitToast.show(
            context,
            options: DigitToastOptions(
              'Background Service Stopped',
              true,
              DigitTheme.instance.mobileTheme,
            ),
          );
        }
      }
    }
  } else {
    if (!isRunning && isOnline) {
      service.startService();
      if (context != null) {
        DigitToast.show(
          context!,
          options: DigitToastOptions(
            'Background Service stated',
            false,
            DigitTheme.instance.mobileTheme,
          ),
        );
      }
    }
  }
}

Timer makePeriodicTimer(
  Duration duration,
  void Function(Timer timer) callback, {
  bool fireNow = false,
}) {
  var timer = Timer.periodic(duration, callback);
  if (fireNow) {
    callback(timer);
  }

  return timer;
}

final requestData = {
  "data": [
    {
      "id": 1,
      "name": "John Doe",
      "age": 30,
      "email": "johndoe@example.com",
      "address": {
        "street": "123 Main Street",
        "city": "New York",
        "state": "NY",
        "zipcode": "10001",
      },
      "orders": [
        {
          "id": 101,
          "product": "Widget A",
          "quantity": 2,
          "price": 10.99,
        },
        {
          "id": 102,
          "product": "Widget B",
          "quantity": 1,
          "price": 19.99,
        },
      ],
    },
    {
      "id": 2,
      "name": "Jane Smith",
      "age": 25,
      "email": "janesmith@example.com",
      "address": {
        "street": "456 Elm Street",
        "city": "Los Angeles",
        "state": "CA",
        "zipcode": "90001",
      },
      "orders": [
        {
          "id": 201,
          "product": "Widget C",
          "quantity": 3,
          "price": 15.99,
        },
        {
          "id": 202,
          "product": "Widget D",
          "quantity": 2,
          "price": 12.99,
        },
      ],
    },
    // ... Repeat the above structure to reach approximately 100KB in size
  ],
};
