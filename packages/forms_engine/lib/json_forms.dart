library json_forms;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:forms_engine/utils/utils.dart';
import 'package:forms_engine/widgets/product_variant_builder.dart';
import 'package:forms_engine/widgets/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/blocs/delivery_intervention/deliver_intervention.dart';
import 'package:registration_delivery/blocs/household_overview/household_overview.dart';
import 'package:registration_delivery/utils/utils.dart';

import 'helper/form_builder_helper.dart';
import 'models/property_schema/property_schema.dart';

class JsonForms extends StatelessWidget {
  final PropertySchema propertySchema;
  final List<Map<String, Widget>>? childrens;
  final Map<String, dynamic>? defaultValues;

  const JsonForms({
    super.key,
    required this.propertySchema,
    this.childrens,
    this.defaultValues,
  });

  static Map<String, AbstractControl<dynamic>> getFormControls(
    PropertySchema schema, {
    String? defaultLatlng,
    Map<String, dynamic>? defaultValues,
    int count = 0,
  }) {
    assert(schema.properties != null);

// old stable one
    // final Map<String, AbstractControl<dynamic>> controls = {
    //   for (final entry in schema.properties!.entries)
    //     if (!isHidden(entry.value))
    //       entry.key: buildFormControl(
    //         entry.key,
    //         entry.value,
    //         schema,
    //         defaultLatlng: defaultLatlng,
    //         defaultValues: defaultValues,
    //       ),
    // };

    // return controls;

    final Map<String, AbstractControl<dynamic>> controls = {};
// my chnage
    // schema.properties!.forEach((key, value) {
    //   if (key == 'resourceCard') {
    //     final variants = defaultValues?['variants'];
    //     final productVariants = defaultValues?['product'];

    //     for (int i = 0; i < defaultValues?['count']; i++) {
    //       final dynamicKey = 'resourceCard_$i';
    //       controls[dynamicKey] = FormControl<dynamic>(
    //           value: variants != null &&
    //                   variants.length < defaultValues?['count']
    //               ? variants.last
    //               : (variants != null && i < variants.length
    //                   ? variants.firstWhereOrNull(
    //                       (element) =>
    //                           element.id ==
    //                           productVariants?.elementAt(i).productVariantId,
    //                     )
    //                   : null));
    //     }
    //   } else {
    //     if (!isHidden(value)) {
    //       controls[key] = buildFormControl(
    //         key,
    //         value,
    //         schema,
    //         defaultLatlng: defaultLatlng,
    //         defaultValues: defaultValues,
    //       );
    //     }
    //   }
    // });

    // working fine with product_key

    // schema.properties!.forEach((key, value) {
    //   if (key == 'resourceCard') {
    //     final variants = defaultValues?['variants'] as List<dynamic>? ?? [];
    //     final productVariants =
    //         defaultValues?['product'] as List<dynamic>? ?? [];
    //     final count = defaultValues?['count'] as int? ?? 0;

    //     for (int i = 0; i < count; i++) {
    //       final dynamicKey = 'resourceCard_$i';

    //       dynamic matchedVariant;

    //       if (i < productVariants.length) {
    //         final productVariantId = productVariants[i].productVariantId;
    //         matchedVariant = variants.firstWhereOrNull(
    //           (v) => v.id == productVariantId,
    //         );
    //       }

    //       matchedVariant ??= (variants.isNotEmpty ? variants.last : null);

    //       controls[dynamicKey] = FormControl<dynamic>(value: matchedVariant);
    //     }
    //   }

    //   // Skip this block if it's resourceCard
    //   if (key != 'resourceCard' && !isHidden(value)) {
    //     controls[key] = buildFormControl(
    //       key,
    //       value,
    //       schema,
    //       defaultLatlng: defaultLatlng,
    //       defaultValues: defaultValues,
    //     );
    //   }
    // });

    schema.properties!.forEach((key, value) {
      if (key == 'resourceCard') {
        final variants = defaultValues?['variants'] as List<dynamic>? ?? [];
        final productVariants =
            defaultValues?['product'] as List<dynamic>? ?? [];
        final count = defaultValues?['count'] as int? ?? 0;

        for (int i = 0; i < count; i++) {
          final resourceKey = 'resourceCard_$i';
          final quantityKey = 'quantityDistributed_$i';

          dynamic matchedVariant;

          if (i < productVariants.length) {
            final productVariantId = productVariants[i].productVariantId;
            matchedVariant = variants.firstWhereOrNull(
              (v) => v.id == productVariantId,
            );
          }

          matchedVariant ??= (variants.isNotEmpty ? variants.last : null);

          // Add both resource and quantity controls
          controls[resourceKey] = FormControl<dynamic>(value: matchedVariant);
          controls[quantityKey] = FormControl<dynamic>(value: 1); // or "0"
        }
      }

      if (key != 'resourceCard' && !isHidden(value)) {
        controls[key] = buildFormControl(
          key,
          value,
          schema,
          defaultLatlng: defaultLatlng,
          defaultValues: defaultValues,
        );
      }
    });

    return controls;
  }

  static Map<String, dynamic> getFormValues(
    FormGroup form,
    PropertySchema schema,
  ) {
    final values = schema.properties!.entries
        .where((entry) => !isHidden(entry.value)) // Skip hidden fields
        .map((e) => _getParsedValues(form, e.key, e.value))
        .whereType<MapEntry<String, dynamic>>()
        .toList();

    return Map.fromEntries(values);
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
      final value = form.control(name).value;
      if (value == null) return null;
      return MapEntry(name, value);
    }
  }

  @override
  Widget build(BuildContext context) => JsonFormBuilder(
        schema: propertySchema,
        formControlName: '/',
        components: childrens,
      );
}
