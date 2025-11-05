import 'package:digit_data_model/models/entities/product_variant.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/models/property_schema/property_schema.dart';
import 'package:digit_forms_engine/widgets/base_reactive_field_wrapper.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../localized.dart';

class ProductSelectionCard extends LocalizedStatefulWidget {
  final dynamic stateData;
  final String pageSchema;

  const ProductSelectionCard(
      {super.key,
      super.appLocalizations,
      required this.stateData,
      required this.pageSchema});

  @override
  State<ProductSelectionCard> createState() => _ProductSelectionCardState();
}

class _ProductSelectionCardState extends LocalizedState<ProductSelectionCard> {
  static const _productVariantKey = 'productdetail';

  @override
  Widget build(BuildContext context) {
    // Get schema from FormsBloc
    final pages =
        context.read<FormsBloc>().state.cachedSchemas[widget.pageSchema]?.pages;

    if (pages == null) {
      return const SizedBox.shrink();
    }

    // Find the field schema
    PropertySchema? fieldSchema;
    void findSchema(Map<String, PropertySchema> node) {
      for (final entry in node.entries) {
        if (entry.key == _productVariantKey) {
          fieldSchema = entry.value;
          return;
        }
        if (entry.value.properties != null &&
            entry.value.properties!.isNotEmpty) {
          findSchema(entry.value.properties!);
        }
      }
    }

    findSchema(pages);

    if (fieldSchema == null) {
      return const SizedBox.shrink();
    }

    // Extract data
    final wrapperList =
        widget.stateData.stateWrapper as List<Map<String, List<dynamic>>>;

    final productVariants = wrapperList.firstWhere(
        (m) => m.containsKey('ProductVariantModel'))['ProductVariantModel'];

    final labelFromSchema = fieldSchema!.label ?? fieldSchema!.innerLabel;

    // Helper function to convert field value to DropdownItems
    List<DropdownItem> getInitialOptions(dynamic value) {
      if (value == null) return [];

      // Handle List<ProductVariantModel>
      if (value is List<ProductVariantModel>) {
        return value
            .map((m) => DropdownItem(
                  code: m.id,
                  name: localizations.translate(m.sku ?? m.id),
                ))
            .toList();
      }

      // Handle List<Map> (from FormsBloc state restoration)
      if (value is List) {
        return value
            .map((item) {
              if (item is Map) {
                final id = item['id'] as String?;
                final sku = item['sku'] as String?;
                if (id != null) {
                  return DropdownItem(
                    code: id,
                    name: localizations.translate(sku ?? id),
                  );
                }
              } else if (item is ProductVariantModel) {
                return DropdownItem(
                  code: item.id,
                  name: localizations.translate(item.sku ?? item.id),
                );
              }
              return null;
            })
            .whereType<DropdownItem>()
            .toList();
      }

      return [];
    }

    // Use BaseReactiveFieldWrapper to automatically handle all validation messages
    return BaseReactiveFieldWrapper(
      formControlName: _productVariantKey,
      schema: fieldSchema!, // Pass the schema - it handles all validations!
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
            initialOptions: getInitialOptions(field.value),
            onOptionSelected: (selectedValues) {
              field.control.markAsTouched();

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
                      schemaKey: widget.pageSchema,
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
  }
}
