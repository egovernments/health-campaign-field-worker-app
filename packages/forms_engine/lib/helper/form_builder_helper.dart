import 'package:forms_engine/helper/validator_helper.dart';
import 'package:forms_engine/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../models/property_schema/property_schema.dart';

FormControl buildFormControl(
    String name,
    PropertySchema schema,
    PropertySchema parentSchema, {
      String? defaultLatlng,
      Map<String, dynamic>? defaultValues,
    }) {
  final validators = buildValidators(schema);
  final format = schema.format;
  final rawValue = schema.value;

  switch (schema.type) {
    case PropertySchemaType.integer:
      if(format == PropertySchemaFormat.date) {
        return FormControl<DateTime>(
          value: schema.systemDate==true ? DateTime.now() : parseDateValue(rawValue),
          validators: validators,
        );
      }
      return FormControl<int>(
        value: parseIntValue(rawValue),
        validators: validators,
      );

    case PropertySchemaType.boolean:
      return FormControl<bool>(
        value: parseBoolValue(rawValue),
        validators: validators,
      );

    case PropertySchemaType.string:
      if (format == PropertySchemaFormat.date) {
        return FormControl<DateTime>(
          value: schema.systemDate==true ? DateTime.now() : parseDateValue(rawValue),
          validators: validators,
        );
      } else if (format == PropertySchemaFormat.latLng) {
        return FormControl<String>(
          value: defaultLatlng ?? (rawValue?.toString()),
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
          value: defaultValues?[name] ?? (rawValue?.toString().isEmpty ?? true ? null : rawValue.toString()),
          validators: validators,
        );
      }

    default:
      return FormControl<String>(
        value: defaultValues?[name] ?? (rawValue?.toString().isEmpty ?? true ? null : rawValue.toString()),
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
  if (value is bool) return value;
  if (value is String) return value.toLowerCase() == 'true' ? true : value.toLowerCase() == 'false' ? false : null;
  return null;
}

DateTime? parseDateValue(dynamic value) {
  if (value == null) return null;
  if (value is DateTime) return value;
  if (value is String) {
    try {
      return DateTime.parse(value);
    } catch (_) {
      return null;
    }
  }
  return null;
}


