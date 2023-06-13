library app_utils;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:drift/drift.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:isar/isar.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uuid/uuid.dart';

import '../data/local_store/no_sql/schema/service_registry.dart';
import '../data/local_store/secure_store/secure_store.dart';
import 'constants.dart';

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

setBgrunning(bool isBgRunning) async {
  final localSecureStore = LocalSecureStore.instance;
  await localSecureStore.setBackgroundService(isBgRunning);
}

performBackgroundService(context, stopService, isBackground) async {
  final connectivityResult = await (Connectivity().checkConnectivity());

  final isOnline = connectivityResult == ConnectivityResult.wifi ||
      connectivityResult == ConnectivityResult.mobile;
  final service = FlutterBackgroundService();
  var isRunning = await service.isRunning();

  if (stopService) {
    if (isRunning) {
      service.invoke("stopService");
      if (isBackground == false) {
        DigitToast.show(
          context,
          options: DigitToastOptions(
            'Background Service Stopped',
            true,
            DigitTheme.instance.mobileTheme,
          ),
        );
      }
      try {
        await Constants().isar.close(deleteFromDisk: false);
        // final serviceRegistryList =
        //     await Constants().isar.serviceRegistrys.where().findAll();
        // print(serviceRegistryList.length);
        // Constants().initilize();
      } catch (e) {
        print(e);
      }
    }
  } else {
    if (!isRunning && isOnline) {
      service.startService();

      DigitToast.show(
        context,
        options: DigitToastOptions(
          'Background Service stated',
          false,
          DigitTheme.instance.mobileTheme,
        ),
      );
    } else if (isRunning && !isOnline) {
      service.invoke("stopService");
      DigitToast.show(
        context,
        options: DigitToastOptions(
          'Background Service Stopped',
          true,
          DigitTheme.instance.mobileTheme,
        ),
      );
      try {
        Constants().isar.close(deleteFromDisk: false);
      } catch (e) {
        print(e);
      }
    }
  }
}
