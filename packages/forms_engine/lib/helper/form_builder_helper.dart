import 'package:forms_engine/helper/validator_helper.dart';
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

  switch (schema.type) {
    case PropertySchemaType.integer:
      return FormControl<int>(
        value: schema.value ,
        validators: validators,
      );

    case PropertySchemaType.boolean:
      return FormControl<bool>(
        value: schema.value,
        validators: validators,
      );

    case PropertySchemaType.string:
      if (format == PropertySchemaFormat.date) {
        return FormControl<DateTime>(
          value: DateTime.now(),
          validators: validators,
        );
      } else if (format == PropertySchemaFormat.latLng) {
        return FormControl<String>(value: defaultLatlng);
      } else if (format == PropertySchemaFormat.locality) {
        return FormControl<String>(value: defaultValues?['locality']);
      } else if (format == PropertySchemaFormat.numeric) {
        return FormControl<int>(
          value: schema.value ?? 0,
          validators: validators,
        );
      } else {
        return FormControl<String>(
          value: schema.value,
          validators: validators,
        );
      }

    default:
      return FormControl<String>(
        value: schema.value,
        validators: validators,
      );
  }
}
