// Importing necessary packages and modules
import 'package:drift/drift.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uuid/uuid.dart';

/// This function takes an iterable of boolean expressions and builds an AND expression from them.
/// If the iterable is empty, it returns a constant true expression.
/// Otherwise, it reduces the iterable to a single expression using the & operator, and checks if the result equals true.
Expression<bool> buildAnd(Iterable<Expression<bool>> iterable) {
  if (iterable.isEmpty) return const Constant(true);
  final result = iterable.reduce((value, element) => value & element);

  return result.equals(true);
}

/// This class is a singleton that generates unique identifiers using the Uuid package.
class IdGen {
  static const IdGen _instance = IdGen._internal();

  static IdGen get instance => _instance;

  /// Shorthand for [instance]
  static IdGen get i => instance;

  final Uuid uuid;

  const IdGen._internal() : uuid = const Uuid();

  /// Generates a new unique identifier.
  String get identifier => uuid.v1();
}

/// This class contains custom validators for form controls.
class CustomValidator {
  /// Validates that control's value must be `true`
  static Map<String, dynamic>? requiredMin(AbstractControl<dynamic> control,) {
    return control.value == null ||
        control.value
            .toString()
            .length >= 2 ||
        control.value
            .toString()
            .trim()
            .isEmpty
        ? null
        : {'required': true};
  }

  /// Validates that the control's value is a valid stock count.
  /// The value must be a non-negative integer less than or equal to 10000.
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