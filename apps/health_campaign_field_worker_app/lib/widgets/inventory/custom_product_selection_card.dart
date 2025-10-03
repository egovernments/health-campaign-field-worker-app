import 'package:digit_data_model/models/entities/product_variant.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/models/property_schema/property_schema.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../localized.dart';

class ProductSelectionCard extends LocalizedStatefulWidget {
  final String? label;
  final bool readOnly;
  final dynamic stateData;

  const ProductSelectionCard({
    super.key,
    super.appLocalizations,
    this.label,
    this.readOnly = false,
    this.stateData,
  });

  @override
  State<ProductSelectionCard> createState() => _ProductSelectionCardState();
}

class _ProductSelectionCardState extends LocalizedState<ProductSelectionCard> {
  static const _productVariantKey = 'productdetail';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    final pages =
        context.read<FormsBloc>().state.cachedSchemas['MANAGESTOCK']?.pages;
    final wrapperList =
        widget.stateData.stateWrapper as List<Map<String, List<dynamic>>>;

    final productVariants = wrapperList.firstWhere(
        (m) => m.containsKey('ProductVariantModel'))['ProductVariantModel'];

    final stringfacilities = productVariants.toString();

    bool isReadOnlyFromSchema = false;
    String? labelFromSchema;
    List<DropdownItem> enums = [];

    // Schema traversal (similar to ResourceCard)
    void walk(Map<String, PropertySchema> node) {
      for (final entry in node.entries) {
        final key = entry.key;
        final schema = entry.value;

        if (key == _productVariantKey) {
          isReadOnlyFromSchema =
              (schema.readOnly == true) || (schema.displayOnly == true);
          labelFromSchema = schema.label ?? schema.innerLabel;
          enums = productVariants?.map((e) {
                final model = e as ProductVariantModel;
                return DropdownItem(
                  code: model.productId!,
                  name: model.sku!, // replace with facility name if available
                );
              }).toList() ??
              [];
          return;
        }

        if (schema.properties != null && schema.properties!.isNotEmpty) {
          walk(schema.properties!);
        }
      }
    }

    walk(pages!);

    return ReactiveFormBuilder(
      form: () => fb.group({
        _productVariantKey: FormControl<List<ProductVariantModel>>(
          validators: [Validators.required],
        ),
      }),
      builder: (context, form, child) {
        return ReactiveWrapperField(
          formControlName: _productVariantKey,
          validationMessages: {
            'required': (_) =>
                '${localizations.translate(labelFromSchema ?? "Product")}_IS_REQUIRED',
          },
          showErrors: (control) => control.invalid && control.touched,
          builder: (field) {
            return LabeledField(
              label: localizations.translate(
                labelFromSchema ?? "Select Product",
              ),
              isRequired: true,
              child: MultiSelectDropDown(
                errorMessage: field.errorText,
                helpText: localizations.translate('Select Variants'),
                options: productVariants!
                    .map((e) => DropdownItem(
                          code: e.id,
                          name: localizations.translate(e.sku ?? e.id),
                        ))
                    .toList(),
                // Convert existing field value into DropdownItems
                initialOptions: field.value != null
                    ? (field.value as List<ProductVariantModel>)
                        .map(
                          (m) => DropdownItem(
                            code: m.id,
                            name: localizations.translate(m.sku ?? m.id),
                          ),
                        )
                        .toList()
                    : [],
                onOptionSelected: (selectedValues) {
                  form.control(_productVariantKey).markAsTouched();

                  // Find selected models from productVariants
                  final selectedModels = selectedValues
                      .map((v) => productVariants!
                          .map((e) => e as ProductVariantModel)
                          .firstWhere((m) => m.id == v.code))
                      .toList();

                  // Update form control with list of models
                  field.control.value = selectedModels;

                  // Push update into FormsBloc with dot-separated ids (or list if you prefer)
                  context.read<FormsBloc>().add(
                        FormsEvent.updateField(
                          schemaKey: 'MANAGESTOCK',
                          context: context,
                          key: _productVariantKey,
                          value: selectedModels
                              .map((m) => {
                                    "id": m.id,
                                    "sku": m.sku,
                                  })
                              .toList(),
                        ),
                      );
                },
              ),
            );
          },
        );
      },
    );
  }
}
