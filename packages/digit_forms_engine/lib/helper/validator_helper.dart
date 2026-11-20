import 'dart:async';

import 'package:digit_forms_engine/helper/form_builder_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../models/property_schema/property_schema.dart';

// Global registry for page schemas - used by validators to access cross-page values
final Map<String, Map<String, PropertySchema>> _pagesRegistry = {};

// Global registry for navigation params - used by validators to access navigation values
final Map<String, Map<String, dynamic>> _navigationParamsRegistry = {};

void registerPagesForValidation(
    String schemaKey, Map<String, PropertySchema> pages) {
  _pagesRegistry[schemaKey] = pages;
}

void unregisterPagesForValidation(String schemaKey) {
  _pagesRegistry.remove(schemaKey);
}

void registerNavigationParams(
    String schemaKey, Map<String, dynamic> navigationParams) {
  _navigationParamsRegistry[schemaKey] = navigationParams;
}

void unregisterNavigationParams(String schemaKey) {
  _navigationParamsRegistry.remove(schemaKey);
}

/// Resolves a value that may be a navigation param reference (e.g., "navigation.stockBalance")
/// Returns the resolved value or null if not found
dynamic _resolveNavigationValue(dynamic value, String? schemaKey) {
  if (value is! String || schemaKey == null) return value;
  if (!value.startsWith('navigation.')) return value;

  final navParams = _navigationParamsRegistry[schemaKey];
  if (navParams == null) return null;

  // Extract the key after "navigation."
  final key = value.substring('navigation.'.length);
  return navParams[key];
}

List<Validator<T>> buildValidators<T>(PropertySchema schema,
    {String? schemaKey}) {
  final List<Validator<T>> validators = [];

  if (schema.validations != null) {
    for (final rule in schema.validations!) {
      switch (rule.type) {
        case 'minLength':
          final parsedValue = parseIntValue(rule.value);

          if (schema.type != PropertySchemaType.integer) {
            if (parsedValue != null) {
              validators.add(Validators.composeOR([
                Validators.minLength(parsedValue) as Validator<T>,
                Validators.composeOR(
                    [Validators.equals(''), Validators.equals(null)]),
              ]) as Validator<T>);
            }
          }

          break;

        case 'maxLength':
          final parsedValue = parseIntValue(rule.value);
          if (parsedValue != null &&
              schema.type != PropertySchemaType.integer) {
            validators.add(Validators.composeOR([
              Validators.maxLength(parsedValue) as Validator<T>,
              Validators.composeOR(
                  [Validators.equals(''), Validators.equals(null)]),
            ]) as Validator<T>);
          }
          break;

        case 'min':
        case 'minValue':
          // Check if value is a navigation param reference
          if (rule.value is String &&
              rule.value.startsWith('navigation.') &&
              schemaKey != null) {
            validators.add(Validators.delegate((control) {
              final resolvedValue =
                  _resolveNavigationValue(rule.value, schemaKey);
              final minVal = parseIntValue(resolvedValue);
              if (minVal == null || control.value == null) return null;
              final numValue = num.tryParse(control.value.toString());
              if (numValue == null) return null;
              if (numValue < minVal) {
                return {
                  'min': {'min': minVal, 'actual': numValue}
                };
              }
              return null;
            }) as Validator<T>);
          } else {
            final parsedValue = parseIntValue(rule.value);
            if (parsedValue != null) {
              // Use delegate validator to handle both numeric and string values
              validators.add(Validators.delegate((control) {
                if (control.value == null || control.value.toString().isEmpty) {
                  return null; // Allow null/empty values (required validation handles this)
                }
                final numValue = num.tryParse(control.value.toString());
                if (numValue == null) return null; // Not a valid number, skip
                if (numValue < parsedValue) {
                  return {
                    'min': {'min': parsedValue, 'actual': numValue}
                  };
                }
                return null;
              }) as Validator<T>);
            }
          }
          break;

        case 'max':
        case 'maxValue':
          // Check if value is a navigation param reference
          if (rule.value is String &&
              rule.value.startsWith('navigation.') &&
              schemaKey != null) {
            validators.add(Validators.delegate((control) {
              final resolvedValue =
                  _resolveNavigationValue(rule.value, schemaKey);
              final maxVal = parseIntValue(resolvedValue);
              if (maxVal == null || control.value == null) return null;
              final numValue = num.tryParse(control.value.toString());
              if (numValue == null) return null;
              if (numValue > maxVal) {
                return {
                  'max': {'max': maxVal, 'actual': numValue}
                };
              }
              return null;
            }) as Validator<T>);
          } else {
            final parsedValue = parseIntValue(rule.value);
            if (parsedValue != null) {
              // Use delegate validator to handle both numeric and string values
              validators.add(Validators.delegate((control) {
                if (control.value == null || control.value.toString().isEmpty) {
                  return null; // Allow null/empty values (required validation handles this)
                }
                final numValue = num.tryParse(control.value.toString());
                if (numValue == null) return null; // Not a valid number, skip
                if (numValue > parsedValue) {
                  return {
                    'max': {'max': parsedValue, 'actual': numValue}
                  };
                }
                return null;
              }) as Validator<T>);
            }
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
            // Checkbox controls default to `false`, which Validators.required
            // treats as a present value — a required checkbox would never
            // block submission. Require the value to be `true` instead.
            // Scoped to checkboxes: boolean radios render `false` as a
            // legitimate "No" answer.
            if (schema.type == PropertySchemaType.boolean &&
                schema.format == PropertySchemaFormat.checkbox) {
              validators.add(Validators.requiredTrue as Validator<T>);
            } else {
              validators.add(Validators.required as Validator<T>);
            }
          }
          break;

        case 'notEqualTo':
          if (rule.value is String && schemaKey != null) {
            validators.add(Validators.delegate(
              (control) => _notEqualToValidator(
                  rule.value as String, control, schemaKey),
            ) as Validator<T>);
          }
          break;

        case 'startDate':
        case 'endDate':
          // `{{otherField}}`: the date must not be before (startDate) or
          // after (endDate) that field's date, re-checked whenever it
          // changes. `{{today}}` and fixed bounds only limit the picker
          // (json_form_builder.dart `_dateBound`), as before.
          final otherField = _dateBoundFieldName(rule.value);
          if (otherField != null) {
            final isStart = rule.type == 'startDate';
            validators.add(Validators.delegate(
              (control) => _dateBoundValidator(otherField, isStart, control),
            ) as Validator<T>);
          }
          break;

        case 'notIn':
          // value: a list, or a navigation reference to one
          // (e.g. "navigation.existingNames"); or, to keep names unique per
          // option of another field, {"from": "navigation.namesByType",
          // "scopeField": "locationType"} where the reference holds
          // {optionCode: [names]}.
          if (schemaKey != null) {
            validators.add(Validators.delegate(
              (control) => _notInValidator(rule.value, control, schemaKey),
            ) as Validator<T>);
          }
          break;

        default:
          if (kDebugMode) {
            // print('Unknown validation type: ${rule.type}');
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

/// Custom validator that checks if a field's value is not equal to another field's value
/// Supports both current page fields and cross-page references using dot notation (e.g., 'warehouseDetails.facilityFromWhich')
/// Fails when the control's value matches an entry of [listOrReference],
/// ignoring case and surrounding spaces. Empty values pass (required handles
/// those).
Map<String, dynamic>? _notInValidator(dynamic listOrReference,
    AbstractControl<dynamic> control, String schemaKey) {
  dynamic list;
  if (listOrReference is Map) {
    // Scoped form: only names under the selected option of `scopeField`.
    // Nothing is taken until an option is picked.
    final scopeField = listOrReference['scopeField']?.toString();
    final scopeControl = _siblingControl(control, scopeField);
    if (scopeControl == null) {
      // The first run happens while the control is built, before it joins
      // its form group, and a prefilled name may never run again on its own.
      // Re-run once the group exists so the scope listener gets attached.
      if (control.parent == null) {
        scheduleMicrotask(() {
          if (control.parent != null) control.updateValueAndValidity();
        });
      }
      return null;
    }
    _revalidateOnChange(control, scopeControl);
    final scope = scopeControl.value?.toString();
    final byScope = _resolveNavigationValue(listOrReference['from'], schemaKey);
    if (scope == null || scope.isEmpty || byScope is! Map) return null;
    list = byScope[scope];
  } else {
    list = _resolveNavigationValue(listOrReference, schemaKey);
  }
  final value = control.value?.toString().trim().toLowerCase() ?? '';
  if (list is! List || value.isEmpty) return null;

  final taken = list.any((e) => e?.toString().trim().toLowerCase() == value);
  return taken ? {'notIn': true} : null;
}

final RegExp _dateBoundRef = RegExp(r'^\{\{\s*([A-Za-z0-9_]+)\s*\}\}$');

/// The field named by a `{{field}}` date bound, or null for `{{today}}`,
/// numbers and anything else.
String? _dateBoundFieldName(dynamic value) {
  if (value is! String) return null;
  final name = _dateBoundRef.firstMatch(value.trim())?.group(1);
  return name == 'today' ? null : name;
}

/// Fails when [control]'s date is before ([isStart]) or after the date in
/// sibling field [otherField], comparing days only (same day passes). Empty
/// values pass; `required` handles those.
Map<String, dynamic>? _dateBoundValidator(
    String otherField, bool isStart, AbstractControl<dynamic> control) {
  final other = _siblingControl(control, otherField);
  if (other == null) {
    // First run happens before the control joins its group; run again once
    // it has, so the listener on the other field gets attached.
    if (control.parent == null) {
      scheduleMicrotask(() {
        if (control.parent != null) control.updateValueAndValidity();
      });
    }
    return null;
  }
  _revalidateOnChange(control, other);

  final value = _asDate(control.value);
  final bound = _asDate(other.value);
  if (value == null || bound == null) return null;

  final day = DateTime(value.year, value.month, value.day);
  final boundDay = DateTime(bound.year, bound.month, bound.day);
  final outOfRange = isStart ? day.isBefore(boundDay) : day.isAfter(boundDay);
  return outOfRange ? {isStart ? 'startDate' : 'endDate': true} : null;
}

/// A date control's value as a DateTime: the picker stores a DateTime;
/// prefilled values may be epoch ms, ISO, "dd MMM yyyy" or "dd/MM/yyyy".
DateTime? _asDate(dynamic value) {
  if (value == null || (value is String && value.trim().isEmpty)) return null;
  final parsed = parseDateValue(value);
  if (parsed != null) return parsed;
  if (value is String) {
    for (final pattern in const ['dd MMM yyyy', 'dd/MM/yyyy']) {
      try {
        return DateFormat(pattern).parseStrict(value.trim());
      } catch (_) {}
    }
  }
  return null;
}

/// The control named [name] in [control]'s form group, if any.
AbstractControl<dynamic>? _siblingControl(
    AbstractControl<dynamic> control, String? name) {
  final group = control.parent;
  if (name == null || group is! FormGroup || !group.contains(name)) {
    return null;
  }
  return group.control(name);
}

/// Controls already re-validated when their scope control changes.
final Expando<bool> _revalidating = Expando<bool>('notInScope');

/// Re-runs [control]'s validators whenever [scope] changes. A validator only
/// runs when its own control changes, so without this a name entered before
/// picking a clashing type would stay valid.
void _revalidateOnChange(
    AbstractControl<dynamic> control, AbstractControl<dynamic> scope) {
  if (_revalidating[control] == true) return;
  _revalidating[control] = true;
  scope.valueChanges.listen((_) => control.updateValueAndValidity());
}

Map<String, dynamic>? _notEqualToValidator(
    String otherFieldName, AbstractControl<dynamic> control, String schemaKey) {
  final form = control.parent;
  if (form is! FormGroup) return null;

  final currentValue = control.value;

  // Build flat value map from all pages
  final pages = _pagesRegistry[schemaKey];
  if (pages == null) return null;

  final flatValues = <String, dynamic>{};

  // Add current form values
  form.controls.forEach((key, control) {
    flatValues[key] = control.value;
  });

  // Add all page values with dot notation
  pages.forEach((pageKey, pageSchema) {
    if (pageSchema.properties != null) {
      pageSchema.properties!.forEach((fieldKey, fieldSchema) {
        flatValues['$pageKey.$fieldKey'] = fieldSchema.value;
      });
    }
  });

  debugPrint('Flat Values $flatValues');
  debugPrint('Looking for otherFieldName: $otherFieldName');

  // Look up the other field's value
  final otherValue = flatValues[otherFieldName];
  debugPrint('Found otherValue: $otherValue');

  // Allow null or empty values to pass (required validation handles that separately)
  if (currentValue == null ||
      currentValue == '' ||
      otherValue == null ||
      otherValue == '') {
    return null;
  }

  // Check if values are equal
  if (currentValue == otherValue) {
    return {'notEqualTo': true};
  }

  return null;
}
