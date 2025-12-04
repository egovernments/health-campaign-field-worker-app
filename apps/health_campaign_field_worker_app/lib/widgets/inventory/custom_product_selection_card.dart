import 'package:digit_data_model/models/entities/product_variant.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/models/property_schema/property_schema.dart';
import 'package:digit_forms_engine/widgets/base_reactive_field_wrapper.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

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
  List<DropdownItem>? _prefilledOptions;
  Set<String>? _prefilledProductIds; // Store just the IDs for matching
  bool _initialized = false;
  bool _formControlUpdated = false;

  @override
  void initState() {
    super.initState();
    // Don't call _initializeFromFormData here - localizations is not available yet
    // It will be called in build() when localizations is ready
  }

  void _initializeFromFormData(List<dynamic>? productVariants) {
    if (_initialized) return;

    // Get prefilled value from stateData.formData
    final formData = widget.stateData?.formData as Map<String, dynamic>?;
    debugPrint('ProductSelectionCard: formData = $formData');

    if (formData != null) {
      // Try to get product variant value - check various formats
      final productValue = formData[_productVariantKey] ??
          formData['stockDetails.$_productVariantKey'] ??
          (formData['stockDetails']
              as Map<String, dynamic>?)?[_productVariantKey];

      debugPrint(
          'ProductSelectionCard: Looking for $_productVariantKey, found: $productValue');

      if (productValue != null) {
        // Extract just the IDs from formData
        _prefilledProductIds = _extractProductIdsFromValue(productValue);

        // Build dropdown items using the actual ProductVariantModel list to get proper SKU
        if (_prefilledProductIds != null && _prefilledProductIds!.isNotEmpty && productVariants != null) {
          _prefilledOptions = _buildDropdownItemsFromProductVariants(
            _prefilledProductIds!,
            productVariants,
          );
        }

        _initialized =
            _prefilledOptions != null && _prefilledOptions!.isNotEmpty;
        _formControlUpdated =
            false; // Need to update form control when available
        if (_initialized) {
          debugPrint(
              'ProductSelectionCard: Initialized with prefilled options: $_prefilledOptions');
        }
      }
    }
  }

  /// Extract product IDs from various value formats
  Set<String>? _extractProductIdsFromValue(dynamic value) {
    if (value == null) return null;

    final ids = <String>{};

    if (value is Map) {
      final id = value['id'] as String?;
      if (id != null && id.isNotEmpty) {
        ids.add(id);
      }
    } else if (value is String && value.isNotEmpty) {
      ids.add(value);
    } else if (value is List) {
      for (final item in value) {
        if (item is Map) {
          final id = item['id'] as String?;
          if (id != null && id.isNotEmpty) {
            ids.add(id);
          }
        } else if (item is String && item.isNotEmpty) {
          ids.add(item);
        }
      }
    }

    return ids.isEmpty ? null : ids;
  }

  /// Build DropdownItems from ProductVariantModel list using prefilled IDs
  /// This ensures we get the correct SKU from the actual product data
  List<DropdownItem> _buildDropdownItemsFromProductVariants(
    Set<String> productIds,
    List<dynamic> productVariants,
  ) {
    final items = <DropdownItem>[];

    for (final variant in productVariants) {
      if (variant is ProductVariantModel && productIds.contains(variant.id)) {
        items.add(DropdownItem(
          code: variant.id,
          name: localizations.translate(variant.sku ?? variant.id),
        ));
      }
    }

    return items;
  }

  /// Updates the form control with the prefilled value
  void _updateFormControlIfNeeded(
    ReactiveFormFieldState<dynamic, dynamic> field,
    List<dynamic>? productVariants,
  ) {
    if (_initialized &&
        !_formControlUpdated &&
        _prefilledProductIds != null &&
        productVariants != null) {
      // Schedule the update for after the current build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;

        // Find the ProductVariantModel instances that match the prefilled IDs
        final selectedModels = productVariants
            .where((v) => _prefilledProductIds!.contains((v as ProductVariantModel).id))
            .toList();

        if (selectedModels.isNotEmpty) {
          // Update the form control value with ProductVariantModel instances
          field.control.value = selectedModels;

          // Also update FormsBloc to sync state
          context.read<FormsBloc>().add(
                FormsEvent.updateField(
                  schemaKey: widget.pageSchema,
                  context: context,
                  key: _productVariantKey,
                  value: selectedModels
                      .map((m) => {
                            "id": (m as ProductVariantModel).id,
                            "sku": m.sku,
                          })
                      .toList(),
                ),
              );

          debugPrint(
              'ProductSelectionCard: Updated form control with ${selectedModels.length} products');
        }
      });
      _formControlUpdated = true;
    }
  }

  @override
  void didUpdateWidget(covariant ProductSelectionCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Re-initialize if stateData changed and we haven't initialized yet
    if (!_initialized && widget.stateData != oldWidget.stateData) {
      // Will be re-initialized in build() with productVariants
      setState(() {});
    }
  }

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

    // Initialize from formData on first build (localizations and productVariants are now available)
    if (!_initialized) {
      _initializeFromFormData(productVariants);
    }

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
        // Update form control with prefilled value if needed
        _updateFormControlIfNeeded(field, productVariants);

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
            // Use prefilled options from formData if available, otherwise use field value
            initialOptions: _prefilledOptions ?? getInitialOptions(field.value),
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
