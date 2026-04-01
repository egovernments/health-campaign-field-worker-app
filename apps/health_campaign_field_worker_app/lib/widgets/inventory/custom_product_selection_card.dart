import 'package:digit_crud_bloc/digit_crud_bloc.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_flow_builder/flow_builder.dart';
import 'package:digit_flow_builder/utils/function_registry.dart';
import 'package:digit_flow_builder/utils/interpolation.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/models/property_schema/property_schema.dart';
import 'package:digit_forms_engine/widgets/base_reactive_field_wrapper.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../utils/stock_calculation_utils.dart';
import '../localized.dart';

class ProductSelectionCard extends LocalizedStatefulWidget {
  final dynamic stateData;
  final String pageSchema;
  final String formKey;

  const ProductSelectionCard({
    super.key,
    super.appLocalizations,
    required this.stateData,
    required this.pageSchema,
    this.formKey = 'productdetail',
  });

  @override
  State<ProductSelectionCard> createState() => _ProductSelectionCardState();
}

class _ProductSelectionCardState extends LocalizedState<ProductSelectionCard> {
  String get _productVariantKey => widget.formKey;
  List<DropdownItem>? _prefilledOptions;
  Set<String>? _prefilledProductIds; // Store just the IDs for matching
  bool _initialized = false;
  bool _formControlUpdated = false;

  // Stock calculation state
  List<ProductVariantModel> _selectedProducts = [];
  Map<String, double> _stockInHandMap = {};
  bool _stockSearchTriggered = false;

  @override
  void initState() {
    super.initState();
    // Don't call _initializeFromFormData here - localizations is not available yet
    // It will be called in build() when localizations is ready
  }

  /// Gets the facility ID from the previous page's form data (warehouseDetails.facilityToWhich)
  /// Reads from FormsBloc state which stores all page data
  String? _getFacilityIdFromFormData(BuildContext context) {
    // For stock-in-hand, we need the source facility (where stock is held)
    // For ISSUED: source = current user's facility (getUserFacilityId)
    // For RECEIPT/others: source = facilityToWhich
    final navigationParams = FlowCrudStateRegistry()
            .getNavigationParams('FORM::${widget.pageSchema}') ??
        FlowCrudStateRegistry().getNavigationParams(widget.pageSchema) ??
        {};
    final transactionType =
        navigationParams['transactionType']?.toString() ?? '';
    final isIssue =
        transactionType == 'DISPATCHED' || transactionType == 'ISSUED';
    final isReturn = transactionType == 'RETURNED';

    // For issue, use current user's facility directly
    if (isIssue || isReturn) {
      final stateData = widget.stateData is CrudStateData
          ? widget.stateData as CrudStateData
          : CrudStateData({}, []);
      final userFacilityId = FunctionRegistry.call(
        'getUserFacilityId',
        [],
        stateData,
      );
      if (userFacilityId != null && userFacilityId.toString().isNotEmpty) {
        debugPrint(
            'ProductSelectionCard: Using getUserFacilityId for issue: $userFacilityId');
        return userFacilityId.toString();
      }
    }

    final formsState = context.read<FormsBloc>().state;
    final schema = formsState.cachedSchemas[widget.pageSchema];

    if (schema != null) {
      final warehouseDetailsPage = schema.pages['warehouseDetails'];
      if (warehouseDetailsPage?.properties != null) {
        final facilityField =
            warehouseDetailsPage!.properties!['facilityToWhich'];
        if (facilityField?.value != null) {
          debugPrint(
              'ProductSelectionCard: Found facilityId from FormsBloc: ${facilityField!.value}');
          return facilityField.value.toString();
        }
      }
    }

    // Fallback: Try stateData.formData
    final formData = widget.stateData?.formData as Map<String, dynamic>?;
    if (formData != null) {
      final facilityId = formData['warehouseDetails.facilityToWhich'] ??
          formData['facilityToWhich'] ??
          (formData['warehouseDetails']
              as Map<String, dynamic>?)?['facilityToWhich'];

      if (facilityId != null) {
        debugPrint(
            'ProductSelectionCard: Found facilityId from formData: $facilityId');
        return facilityId.toString();
      }
    }

    debugPrint('ProductSelectionCard: facilityId not found');
    return null;
  }

  /// Triggers stock search for calculating stock in hand
  Future<void> _triggerStockSearch(BuildContext context) async {
    final facilityId = _getFacilityIdFromFormData(context);
    if (facilityId == null || facilityId.isEmpty) {
      debugPrint(
          'ProductSelectionCard: Skipping stock search - no facility selected');
      return;
    }

    if (_selectedProducts.isEmpty) {
      debugPrint(
          'ProductSelectionCard: Skipping stock search - no products selected');
      return;
    }

    final tenantId = FlowBuilderSingleton().selectedProject?.tenantId;
    if (tenantId == null) {
      debugPrint('ProductSelectionCard: ERROR - TenantId not found');
      return;
    }

    debugPrint(
        'ProductSelectionCard: Triggering stock search for facility=$facilityId, '
        'products=${_selectedProducts.map((p) => p.id).toList()}');

    try {
      final filters = <SearchFilter>[
        SearchFilter(
          root: 'stock',
          field: 'tenantId',
          operator: 'equals',
          value: tenantId,
        ),
      ];

      final searchParams = GlobalSearchParameters(
        filters: filters,
        primaryModel: 'stock',
        select: ['stock'],
        pagination: null,
        orderBy: null,
      );

      // Use CrudService directly via singleton instead of bloc
      final crudService = CrudBlocSingleton().crudService;
      final (results, _) =
          await crudService.searchEntities(query: searchParams);

      // Extract stock list from results
      final stockList =
          results['stock']?.whereType<StockModel>().toList() ?? <StockModel>[];

      debugPrint(
          'ProductSelectionCard: Fetched ${stockList.length} stock records');

      if (!mounted) return;

      // Calculate stock in hand for selected products
      final loggedInUserUuid = FlowBuilderSingleton().loggedInUserUuid;
      final productIds = _selectedProducts.map((p) => p.id).toList();

      _stockInHandMap = StockCalculationUtils.calculateStockInHandForProducts(
        stockList: stockList,
        facilityId: facilityId,
        productIds: productIds,
        loggedInUserUuid: loggedInUserUuid,
      );

      debugPrint(
          'ProductSelectionCard: Calculated stockInHand: $_stockInHandMap');

      // Update FormsBloc with stock in hand data
      _updateStockInHandInFormsBloc();

      setState(() {
        _stockSearchTriggered = true;
      });
    } catch (e, stackTrace) {
      debugPrint('ProductSelectionCard: ERROR in stock search: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }

  /// Updates FormsBloc with stock in hand data so it's available to the next page
  void _updateStockInHandInFormsBloc() {
    if (_stockInHandMap.isEmpty || _selectedProducts.isEmpty) return;

    // Update the stockInHandMap
    context.read<FormsBloc>().add(
          FormsEvent.updateField(
            schemaKey: widget.pageSchema,
            context: context,
            key: 'stockInHandMap',
            value: _stockInHandMap,
          ),
        );

    // Also update the product data to include stockInHand for each product
    // This makes it available in multi-entity iterations
    final productsWithStockInHand = _selectedProducts.map((product) {
      return {
        "id": product.id,
        "sku": product.sku,
        "stockInHand": _stockInHandMap[product.id] ?? 0.0,
      };
    }).toList();

    context.read<FormsBloc>().add(
          FormsEvent.updateField(
            schemaKey: widget.pageSchema,
            context: context,
            key: _productVariantKey,
            value: productsWithStockInHand,
          ),
        );

    // Update the schema to add max validations for quantity fields
    _updateQuantityFieldValidations();

    debugPrint(
        'ProductSelectionCard: Updated FormsBloc with stockInHandMap and products with stockInHand');
  }

  /// Updates the schema to add max validations for quantity fields based on stockInHand.
  /// Creates entity-specific fields (e.g., quantitySent_item_0, quantitySent_item_1)
  /// with their respective stockInHand as max validation, and removes base fields
  /// to prevent double-renaming by multi_entity_tab_view.
  void _updateQuantityFieldValidations() {
    final formsBloc = context.read<FormsBloc>();
    final schema = formsBloc.state.cachedSchemas[widget.pageSchema];
    if (schema == null) {
      debugPrint('ProductSelectionCard: ERROR - schema is null');
      return;
    }

    // Find the page with multiEntityConfig (the page that needs entity-specific fields)
    String? multiEntityPageKey;
    PropertySchema? multiEntityPage;

    for (final entry in schema.pages.entries) {
      if (entry.value.multiEntityConfig != null) {
        multiEntityPageKey = entry.key;
        multiEntityPage = entry.value;
        break;
      }
    }

    if (multiEntityPageKey == null || multiEntityPage?.properties == null) {
      debugPrint(
          'ProductSelectionCard: ERROR - No page with multiEntityConfig found');
      return;
    }

    debugPrint(
        'ProductSelectionCard: Found multiEntityConfig page: $multiEntityPageKey');
    debugPrint(
        'ProductSelectionCard: Updating validations for ${_selectedProducts.length} products');

    // Quantity fields that need max validation
    // These are all quantity fields that could potentially need stock validation
    final quantityFields = [
      'quantitySent',
      'quantityLost',
      'quantityDamaged',
      'quantityReturned',
    ];

    // Create a new properties map
    final updatedProperties =
        Map<String, PropertySchema>.from(multiEntityPage!.properties!);

    // Store base field schemas before they might be removed
    // This allows us to create entity-specific fields even if base fields were removed in a previous call
    final baseFieldSchemas = <String, PropertySchema>{};
    for (final fieldName in quantityFields) {
      // First try to get the base field
      var baseSchema = multiEntityPage.properties![fieldName];

      // If base field is gone, try to get from an existing entity-specific field
      if (baseSchema == null) {
        // Find any existing entity-specific field to use as template
        for (final key in multiEntityPage.properties!.keys) {
          if (key.startsWith('${fieldName}_item_')) {
            baseSchema = multiEntityPage.properties![key];
            break;
          }
        }
      }

      if (baseSchema != null) {
        baseFieldSchemas[fieldName] = baseSchema;
      }
    }

    // For each selected product, create entity-specific field validations
    for (var entityIndex = 0;
        entityIndex < _selectedProducts.length;
        entityIndex++) {
      final product = _selectedProducts[entityIndex];
      final stockInHand = _stockInHandMap[product.id] ?? 0.0;
      final maxValue = stockInHand.toInt();

      debugPrint(
          'ProductSelectionCard: Entity $entityIndex - product=${product.id}, stockInHand=$stockInHand, maxValue=$maxValue');

      for (final fieldName in quantityFields) {
        // Get the base field schema (from our stored map)
        final baseFieldSchema = baseFieldSchemas[fieldName];
        if (baseFieldSchema == null) continue;

        // Create the entity-specific field name (matching multi_entity_tab_view pattern)
        final entityFieldName = '${fieldName}_item_$entityIndex';

        // Create validations with entity-specific max value
        final existingValidations = baseFieldSchema.validations ?? [];

        // Filter out any existing max validation and add the new one
        final filteredValidations = existingValidations
            .where((v) => v.type != 'max' && v.type != 'maxValue')
            .toList();

        final newValidations = [
          ...filteredValidations,
          // Always add max validation, even when stockInHand is 0
          // This prevents entering any quantity when there's no stock
          ValidationRule(
            type: 'max',
            value: maxValue,
            message: maxValue > 0
                ? 'Quantity cannot exceed stock in hand ($maxValue)'
                : 'No stock available',
          ),
        ];

        // Create the entity-specific field schema with validation
        updatedProperties[entityFieldName] =
            baseFieldSchema.copyWith(validations: newValidations);
      }
    }

    // Remove base quantity fields to prevent double-rendering.
    // multi_entity_tab_view will use the entity-specific fields we created.
    for (final fieldName in quantityFields) {
      if (updatedProperties.containsKey(fieldName)) {
        updatedProperties.remove(fieldName);
        debugPrint('ProductSelectionCard: Removed base field: $fieldName');
      }

      // Also remove any old entity-specific fields that are beyond current selection
      // (e.g., if user had 3 products but now has 2, remove _item_2 fields)
      final keysToRemove = <String>[];
      for (final key in updatedProperties.keys) {
        if (key.startsWith('${fieldName}_item_')) {
          final indexMatch = RegExp(r'_item_(\d+)$').firstMatch(key);
          if (indexMatch != null) {
            final index = int.tryParse(indexMatch.group(1)!);
            if (index != null && index >= _selectedProducts.length) {
              keysToRemove.add(key);
            }
          }
        }
      }
      for (final key in keysToRemove) {
        updatedProperties.remove(key);
        debugPrint('ProductSelectionCard: Removed stale field: $key');
      }
    }

    debugPrint(
        'ProductSelectionCard: Final quantity field keys: ${updatedProperties.keys.where((k) => k.contains('quantity')).toList()}');
    debugPrint(
        'ProductSelectionCard: All property keys: ${updatedProperties.keys.toList()}');

    // Update the page schema
    final updatedPage = multiEntityPage.copyWith(properties: updatedProperties);
    final updatedPages = Map<String, PropertySchema>.from(schema.pages);
    updatedPages[multiEntityPageKey] = updatedPage;

    // Update the full schema
    final updatedSchema = schema.copyWith(pages: updatedPages);

    formsBloc.add(FormsEvent.update(
      schemaKey: widget.pageSchema,
      schema: updatedSchema,
    ));

    debugPrint(
        'ProductSelectionCard: Updated quantity field validations for ${_selectedProducts.length} entities');

    // Log validation details for each entity-specific field
    for (var i = 0; i < _selectedProducts.length; i++) {
      final quantitySentField = updatedProperties['quantitySent_item_$i'];
      if (quantitySentField != null) {
        debugPrint(
            'ProductSelectionCard: quantitySent_item_$i validations: ${quantitySentField.validations?.map((v) => '${v.type}=${v.value}').toList()}');
      } else {
        debugPrint(
            'ProductSelectionCard: ERROR - quantitySent_item_$i not found in updatedProperties');
      }
    }
  }

  void _initializeFromFormData(List<dynamic>? productVariants) {
    if (_initialized) return;

    // Get prefilled value from stateData.formData
    final formData = widget.stateData?.formData as Map<String, dynamic>?;

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
        if (_prefilledProductIds != null &&
            _prefilledProductIds!.isNotEmpty &&
            productVariants != null) {
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
            .where((v) =>
                _prefilledProductIds!.contains((v as ProductVariantModel).id))
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

    // Extract data - add null check
    final wrapperData = widget.stateData?.stateWrapper;
    if (wrapperData == null) {
      return const SizedBox.shrink();
    }
    final wrapperList = wrapperData as List<Map<String, List<dynamic>>>;

    final productVariants = wrapperList.firstWhere(
        (m) => m.containsKey('ProductVariantModel'),
        orElse: () => {'ProductVariantModel': []})['ProductVariantModel'];

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
            labelFromSchema ?? "SELECT_PRODUCT",
          ),
          isRequired: true,
          child: MultiSelectDropDown(
            sentenceCaseEnabled: false,
            emptyItemText: localizations.translate('NO_OPTIONS_AVAILABLE'),
            errorMessage: field.errorText,
            helpText: localizations.translate('SELECT_PRODUCT_VARIANTS'),
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

              // Update selected products for stock calculation
              setState(() {
                _selectedProducts = selectedModels;
                _stockSearchTriggered = false; // Reset to trigger new search
              });

              // Update form control with list of models
              field.control.value = selectedModels;

              // Push update into FormsBloc with dot-separated ids (or list if you prefer)
              context.read<FormsBloc>().add(
                    FormsEvent.updateField(
                      schemaKey: widget.pageSchema,
                      context: context,
                      key: _productVariantKey,
                      value: selectedModels.isNotEmpty
                          ? selectedModels
                              .map((m) => {
                                    "id": m.id,
                                    "sku": m.sku,
                                  })
                              .toList()
                          : null,
                    ),
                  );

              // Trigger stock search after product selection
              if (selectedModels.isNotEmpty) {
                _triggerStockSearch(context);
              }
            },
          ),
        );
      },
    );
  }
}
