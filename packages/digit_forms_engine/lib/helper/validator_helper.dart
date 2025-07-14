import 'package:flutter/foundation.dart';
import 'package:forms_engine/helper/form_builder_helper.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../models/property_schema/property_schema.dart';

List<Validator<T>> buildValidators<T>(PropertySchema schema) {
  final List<Validator<T>> validators = [];

  if (schema.validations != null) {
    for (final rule in schema.validations!) {
      switch (rule.type) {
        case 'minLength':
          final parsedValue = parseIntValue(rule.value);

          if(schema.type != PropertySchemaType.integer) {
            if (parsedValue != null) {
              validators.add(Validators.composeOR([
                Validators.minLength(parsedValue) as Validator<T>,
                Validators.equals(null),
              ]) as Validator<T>);
            }
          }

          break;

        case 'maxLength':
          final parsedValue = parseIntValue(rule.value);
          if (parsedValue != null && schema.type != PropertySchemaType.integer) {
            validators.add(Validators.composeOR([
              Validators.maxLength(parsedValue) as Validator<T>,
              Validators.equals(null),
            ]) as Validator<T>);
          }
          break;

        case 'min':
        case 'minValue':
          final parsedValue = parseIntValue(rule.value);
          if (parsedValue != null) {
            validators.add(Validators.composeOR([
              Validators.min(parsedValue) as Validator<T>,
              Validators.equals(null),
            ]) as Validator<T>);
          }
          break;

        case 'max':
        case 'maxValue':
          final parsedValue = parseIntValue(rule.value);
          if (parsedValue != null) {
            validators.add(Validators.composeOR([
              Validators.max(parsedValue) as Validator<T>,
              Validators.equals(null),
            ]) as Validator<T>);
          }
          break;

        case 'pattern':
          if (rule.value is List && rule.value.isNotEmpty) {
            validators.add(Validators.composeOR([
              Validators.pattern(RegExp(rule.value.first)) as Validator<T>,
              Validators.composeOR(
                  [Validators.equals(''), Validators.equals(null)]),
            ]) as Validator<T>);
          } else if (rule.value is String && rule.value.isNotEmpty) {
            validators.add(Validators.composeOR([
              Validators.pattern(RegExp(rule.value)) as Validator<T>,
              Validators.composeOR(
                  [Validators.equals(''), Validators.equals(null)]),
            ]) as Validator<T>);
          }
          break;

        case 'required':
          if (rule.value == true) {
            validators.add(Validators.required as Validator<T>);
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

/// Checks if the validations contain a rule of type 'required'.
bool hasRequiredValidation(List<ValidationRule>? validations) {
  if (validations == null) return false;

  return validations
      .any((rule) => rule.type == 'required' && rule.value == true);
}

int? getMinValue(List<ValidationRule>? validations) {
  if (validations == null) return null;

  for (final rule in validations) {
    if (rule.type == 'min' || rule.type == 'minValue') {
      return parseIntValue(rule.value);
    }
  }
  return null;
}

int? getMaxValue(List<ValidationRule>? validations) {
  if (validations == null) return null;

  for (final rule in validations) {
    if (rule.type == 'max' || rule.type == 'maxValue') {
      return parseIntValue(rule.value);
    }
  }
  return null;
}

int? getMinLength(List<ValidationRule>? validations) {
  if (validations == null) return null;

  for (final rule in validations) {
    if (rule.type == 'minLength') {
      return parseIntValue(rule.value);
    }
  }
  return null;
}

int? getMaxLength(List<ValidationRule>? validations) {
  if (validations == null) return null;

  for (final rule in validations) {
    if (rule.type == 'maxLength') {
      return parseIntValue(rule.value);
    }
  }
  return null;
}
