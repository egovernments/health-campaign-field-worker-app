library app_utils;

import 'package:drift/drift.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uuid/uuid.dart';

export 'app_exception.dart';
export 'constants.dart';

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

extension DateAgeExtension on DateTime {
  int get age {
    return (DateTime.now().difference(this).inDays / 365).round();
  }
}

extension IntIncrementer on int? {
  int get increment {
    return incrementBy(1);
  }

  int incrementBy(int value) {
    return (this ?? value) + value;
  }
}

class CustomValidator {
  /// Validates that control's value must be `true`
  static Map<String, dynamic>? requiredMin(AbstractControl<dynamic> control) {
    return control.value == null || control.value.toString().length >= 2
        ? null
        : {'Min 2 characters Required': true};
  }
}
