library json_forms;

import 'package:digit_forms_engine/utils/utils.dart';
import 'package:digit_forms_engine/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'helper/form_builder_helper.dart';
import 'models/property_schema/property_schema.dart';

class JsonForms extends StatelessWidget {
  final PropertySchema propertySchema;
  final List<Map<String, Widget>>? childrens;
  final Map<String, dynamic>? defaultValues;
  final String pageName;
  final String currentSchemaKey;
  final Map<String, dynamic>? navigationParams;

  const JsonForms({
    super.key,
    required this.propertySchema,
    this.childrens,
    this.defaultValues,
    required this.pageName,
    required this.currentSchemaKey,
    this.navigationParams,
  });

  static Map<String, AbstractControl<dynamic>> getFormControls(
    PropertySchema schema, {
    String? defaultLatlng,
    Map<String, dynamic>? defaultValues,
    String? schemaKey,
  }) {
    assert(schema.properties != null);

    final Map<String, AbstractControl<dynamic>> controls = {
      for (final entry in schema.properties!.entries)
        if (!isHidden(entry.value) || entry.value.includeInForm == true)
          entry.key: buildFormControl(
            entry.key,
            entry.value,
            schema,
            defaultLatlng: defaultLatlng,
            defaultValues: defaultValues,
            schemaKey: schemaKey,
          ),
    };

    return controls;
  }

  static Map<String, dynamic> getFormValues(
    FormGroup form,
    PropertySchema schema,
  ) {
    final values = schema.properties!.entries
        .where((entry) => (!isHidden(entry.value) ||
            entry.value.includeInForm == true)) // Skip hidden fields
        .map((e) => _getParsedValues(form, e.key, e.value))
        .whereType<MapEntry<String, dynamic>>()
        .toList();

    final result = Map.fromEntries(values);

    // Additionally, collect any form controls with entity suffixes (e.g., fieldName_item_0)
    // These are created by MultiEntityTabView and need to be preserved for the transformer
    for (final controlKey in form.controls.keys) {
      if (controlKey.contains('_item_')) {
        result[controlKey] = form.control(controlKey).value;
      }
    }

    return result;
  }

  static MapEntry<String, dynamic>? _getParsedValues(
    FormGroup form,
    String name,
    PropertySchema schema,
  ) {
    if (schema.type == PropertySchemaType.object) {
      final results = schema.properties!.entries.map((e) {
        return _getParsedValues(form, e.key, e.value);
      });
      return MapEntry(
        name,
        Map.fromEntries(results.whereType<MapEntry<String, dynamic>>()),
      );
    } else {
      // Check if the control exists before accessing it
      // This handles cases like MultiEntityTabView where controls may be renamed
      try {
        final value = form.control(name).value;
        if (value == null) return null;
        return MapEntry(name, value);
      } catch (e) {
        // Control doesn't exist (e.g., renamed in MultiEntityTabView)
        // Return null to exclude from result
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) => JsonFormBuilder(
        schema: propertySchema,
        formControlName: '/',
        components: childrens,
        pageName: pageName,
        currentSchemaKey: currentSchemaKey,
        navigationParams: navigationParams,
      );
}
