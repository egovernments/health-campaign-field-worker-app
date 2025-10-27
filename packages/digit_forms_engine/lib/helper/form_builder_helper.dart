import 'package:digit_forms_engine/helper/validator_helper.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../models/property_schema/property_schema.dart';

FormControl buildFormControl(
  String name,
  PropertySchema schema,
  PropertySchema parentSchema, {
  String? defaultLatlng,
  Map<String, dynamic>? defaultValues,
  String? schemaKey,
}) {
  final validators = buildValidators(schema, schemaKey: schemaKey);
  final format = schema.format;
  final rawValue = schema.value;

  switch (schema.type) {
    case PropertySchemaType.integer:
      if (format == PropertySchemaFormat.date) {
        return FormControl<DateTime>(
          value: parseDateValue(defaultValues?[name]) ??
              (schema.systemDate == true
                  ? DateTime.now()
                  : parseDateValue(rawValue)),
          validators: validators,
        );
      }
      return FormControl<int>(
        value: parseIntValue(defaultValues?[name]) ?? parseIntValue(rawValue),
        validators: validators,
      );

    case PropertySchemaType.boolean:
      return FormControl<bool>(
        value: defaultValues?[name] ?? parseBoolValue(rawValue),
        validators: validators,
      );

    case PropertySchemaType.dynamic:
      return FormControl<dynamic>(
        validators: validators,
      );

    case PropertySchemaType.string:
      if (format == PropertySchemaFormat.date) {
        return FormControl<DateTime>(
          value: parseDateValue(defaultValues?[name]) ??
              (schema.systemDate == true
                  ? DateTime.now()
                  : parseDateValue(rawValue)),
          validators: validators,
        );
      } else if (format == PropertySchemaFormat.idPopulator) {
        /// TODO: need to create constant beneficiary id type
        final availableIDs = defaultValues?['availableIDs'];

        // Determine which ID to use and its label
        final selectedLabel = availableIDs?['UNIQUE_BENEFICIARY_ID'] != null
            ? 'UNIQUE_BENEFICIARY_ID'
            : 'DEFAULT';
        final selectedId = availableIDs?[selectedLabel]?.toString();

        return FormControl<String>(
          value: schema.hidden == true
              ? '$selectedLabel, $selectedId'
              : rawValue?.toString(),
          validators: validators,
        );
      } else if (format == PropertySchemaFormat.latLng) {
        return FormControl<String>(
          value: defaultValues?[name] ?? rawValue?.toString(),
          validators: validators,
        );
      } else if (format == PropertySchemaFormat.locality) {
        return FormControl<String>(
          value: defaultValues?[name] ?? rawValue?.toString(),
          validators: validators,
        );
      } else if (format == PropertySchemaFormat.numeric) {
        return FormControl<int>(
          value: parseIntValue(defaultValues?[name] ?? rawValue),
          validators: validators,
        );
      } else {
        return FormControl<String>(
          value: defaultValues?[name] ??
              (rawValue?.toString().isEmpty ?? true
                  ? null
                  : rawValue.toString()),
          validators: validators,
        );
      }

    default:
      return FormControl<String>(
        value: defaultValues?[name] ??
            (rawValue?.toString().isEmpty ?? true ? null : rawValue.toString()),
        validators: validators,
      );
  }
}

int? parseIntValue(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is String && value.trim().isEmpty) return null;
  if (value is String) return int.tryParse(value);
  return null;
}

bool? parseBoolValue(dynamic value) {
  if (value == null) return null;
  if (value is bool && value == true) return value;
  if (value is String) return value.toLowerCase() == 'true' ? true : null;
  return null;
}

DateTime? parseDateValue(dynamic value) {
  if (value == null) return null;

  if (value is DateTime) return value;

  if (value is int) {
    // Handle milliseconds since epoch
    return DateTime.fromMillisecondsSinceEpoch(value);
  }

  if (value is String) {
    try {
      // Try parsing as ISO date first
      return DateTime.parse(value);
    } catch (_) {
      // Try parsing as milliseconds in string form
      final millis = int.tryParse(value);
      if (millis != null) {
        return DateTime.fromMillisecondsSinceEpoch(millis);
      }
      return null;
    }
  }

  return null;
}
