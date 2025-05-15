import 'package:flutter/foundation.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../models/property_schema/property_schema.dart';

List<Validator<T>> buildValidators<T>(PropertySchema schema) {
  final List<Validator<T>> validators = [];

  if (schema.validations != null) {
    for (final rule in schema.validations!) {
      switch (rule.type) {
        case 'required':
          if (rule.value == true) {
            validators.add(Validators.required as Validator<T>);
          }
          break;

        case 'pattern':
          if (rule.value is List && rule.value.isNotEmpty) {
            validators.add(Validators.pattern(RegExp(rule.value.first)) as Validator<T>);
          }
          break;

        case 'minLength':
          if (rule.value is int) {
            validators.add(Validators.minLength(rule.value) as Validator<T>);
          }
          break;

        case 'maxLength':
          if (rule.value is int) {
            validators.add(Validators.maxLength(rule.value) as Validator<T>);
          }
          break;

        case 'min':
        case 'minValue':
          if (rule.value is int) {
            validators.add(Validators.min(rule.value) as Validator<T>);
          }
          break;

        case 'max':
        case 'maxValue':
          if (rule.value is int) {
            validators.add(Validators.max(rule.value) as Validator<T>);
          }
          break;

        default:
          if (kDebugMode) {
            print('Unknown validation type: ${rule.type}');
          }
          break;
      }
    }
  }

  return validators;
}
