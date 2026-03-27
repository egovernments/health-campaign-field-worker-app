import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_flow_builder/flow_builder.dart';
import 'package:digit_forms_engine/forms_engine.dart';
import 'package:digit_forms_engine/widgets/base_reactive_field_wrapper.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_divider.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../utils/stock_calculation_utils.dart';
import '../localized.dart';

/// GlobalKey to access StockReconciliationCard state for validation
class StockReconciliationCardKey
    extends GlobalKey<_StockReconciliationCardState> {
  const StockReconciliationCardKey() : super.constructor();

  /// Validates the form and shows errors. Returns true if valid.
  bool validate() => currentState?.validate() ?? false;

  /// Returns true if both facility and product are selected
  bool get isValid => currentState?.isValid ?? false;
}

class StockReconciliationCard extends LocalizedStatefulWidget {
  final String? label;
  final bool readOnly;
  final dynamic stateData;
  final String pageSchema;

  const StockReconciliationCard({
    super.key,
    super.appLocalizations,
    this.label,
    this.readOnly = false,
    this.stateData,
    required this.pageSchema,
  });

  @override
  State<StockReconciliationCard> createState() =>
      _StockReconciliationCardState();
}

class _StockReconciliationCardState
    extends LocalizedState<StockReconciliationCard> {
  FacilityModel? _selectedFacility;
  ProductVariantModel? _selectedProduct;

  Map<String, double> _stockMetrics = {
    'stockReceived': 0,
    'stockIssued': 0,
    'stockReturned': 0,
    'stockLost': 0,
    'stockDamaged': 0,
    'stockExcess': 0,
    'stockLess': 0,
    'stockInHand': 0,
  };

  // Cache facilities and product variants to prevent them from being cleared
  List<FacilityModel> _cachedFacilities = [];
  List<ProductVariantModel> _cachedProductVariants = [];

  // Track if fields have been touched (for showing validation errors)
  bool _facilityTouched = false;
  bool _productTouched = false;

  // Track if manualCount has been initialized to prevent resetting user edits
  bool _manualCountInitialized = false;

  // Track if metrics need recalculation (set to true when facility/product changes)
  bool _needsMetricsRecalculation = false;

  @override
  void initState() {
    super.initState();
    // Reset form fields when page is opened fresh
    // This ensures previous session values don't persist
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _resetFormFields();
      }
    });
  }

  /// Reset form fields to clear any previous session values
  void _resetFormFields() {
    context.read<FormsBloc>().add(
          FormsEvent.updateField(
            schemaKey: widget.pageSchema,
            context: context,
            key: 'stockReconciliationCard',
            value: null,
          ),
        );
    context.read<FormsBloc>().add(
          FormsEvent.updateField(
            schemaKey: widget.pageSchema,
            context: context,
            key: 'stockInHand',
            value: 0,
          ),
        );
    context.read<FormsBloc>().add(
          FormsEvent.updateField(
            schemaKey: widget.pageSchema,
            context: context,
            key: 'manualCount',
            value: null,
          ),
        );
    context.read<FormsBloc>().add(
          FormsEvent.updateField(
            schemaKey: widget.pageSchema,
            context: context,
            key: 'comments',
            value: null,
          ),
        );
  }

  /// Checks if both facility and product are selected.
  bool get isValid => _selectedFacility != null && _selectedProduct != null;

  /// Validates and marks all fields as touched. Returns true if valid.
  /// This can be called via GlobalKey when parent wants to validate.
  bool validate() {
    setState(() {
      _facilityTouched = true;
      _productTouched = true;
    });
    return isValid;
  }

  /// Get error message for facility field
  String? get _facilityError => _facilityTouched && _selectedFacility == null
      ? localizations.translate('CORE_COMMON_REQUIRED')
      : null;

  /// Get error message for product field
  String? get _productError => _productTouched && _selectedProduct == null
      ? localizations.translate('CORE_COMMON_REQUIRED')
      : null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    // Get field schema for validation messages
    final pages =
        context.read<FormsBloc>().state.cachedSchemas[widget.pageSchema]?.pages;
    PropertySchema? fieldSchema;
    if (pages != null) {
      for (final page in pages.values) {
        if (page.properties?.containsKey('stockReconciliationCard') == true) {
          fieldSchema = page.properties!['stockReconciliationCard'];
          break;
        }
      }
    }

    // Use BaseReactiveFieldWrapper to handle validation automatically
    return BaseReactiveFieldWrapper(
      formControlName: 'stockReconciliationCard',
      schema: fieldSchema,
      builder: (field) {
        // When form control is touched and invalid, trigger internal validation
        if (field.control.touched && !_facilityTouched && !_productTouched) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) validate();
          });
        }

        return ValueListenableBuilder<FlowCrudState?>(
          valueListenable: FlowCrudStateRegistry().listen(widget.pageSchema),
          builder: (context, flowState, child) {
            // Get facilities and product variants from FlowCrudStateRegistry
            final facilities = _getFacilities(flowState);
            final productVariants = _getProductVariants(flowState);

            // Cache facilities and product variants when they're loaded
            // This prevents them from being cleared when stock search happens
            if (facilities.isNotEmpty) {
              _cachedFacilities = facilities;
            }
            if (productVariants.isNotEmpty && _cachedProductVariants.isEmpty) {
              _cachedProductVariants = productVariants;
            }

            // Use cached data if current data is empty (happens after stock search)
            final displayFacilities =
                facilities.isNotEmpty ? facilities : _cachedFacilities;
            final displayProductVariants = productVariants.isNotEmpty
                ? productVariants
                : _cachedProductVariants;

            // Recalculate stock metrics only when needed (facility/product changed)
            if (_selectedFacility != null &&
                _selectedProduct != null &&
                _needsMetricsRecalculation) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted && _needsMetricsRecalculation) {
                  _needsMetricsRecalculation = false;
                  _calculateStockMetrics(flowState);
                }
              });
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Facility Dropdown
                LabeledField(
                  isRequired: true,
                  label: localizations.translate('SELECT_WAREHOUSE'),
                  child: DigitDropdown<FacilityModel>(
                    errorMessage: _facilityError,
                    selectedOption: _selectedFacility != null
                        ? DropdownItem(
                            name: localizations
                                .translate('${_selectedFacility!.id}'),
                            code: _selectedFacility!.id,
                          )
                        : null,
                    emptyItemText:
                        localizations.translate('NO_FACILITIES_FOUND'),
                    items: displayFacilities.map((facility) {
                      return DropdownItem(
                        name: localizations.translate('${facility.id}'),
                        code: facility.id,
                      );
                    }).toList(),
                    onSelect: (value) {
                      final selected = displayFacilities.firstWhere(
                        (f) => f.id == value.code,
                      );
                      setState(() {
                        _facilityTouched = true;
                        _selectedFacility = selected;
                        // Mark product as touched too - so error shows if not selected
                        _productTouched = true;
                        // Reset flags when facility changes
                        _manualCountInitialized = false;
                        _needsMetricsRecalculation = true;
                      });
                      _triggerStockSearchIfReady(context);
                      _updateFormData();
                    },
                  ),
                ),
                const SizedBox(height: spacer2),

                // Product Variant Dropdown
                LabeledField(
                  isRequired: true,
                  label: localizations.translate('SELECT_PRODUCT'),
                  child: DigitDropdown<ProductVariantModel>(
                    errorMessage: _productError,
                    sentenceCaseEnabled: true,
                    selectedOption: _selectedProduct != null
                        ? DropdownItem(
                            name: localizations.translate(
                                _selectedProduct!.sku ?? _selectedProduct!.id),
                            code: _selectedProduct!.id,
                          )
                        : null,
                    emptyItemText: localizations.translate('NO_PRODUCTS_FOUND'),
                    items: displayProductVariants.map((product) {
                      return DropdownItem(
                        name:
                            localizations.translate(product.sku ?? product.id),
                        code: product.id,
                      );
                    }).toList(),
                    onSelect: (value) {
                      final selected = displayProductVariants.firstWhere(
                        (p) => p.id == value.code,
                      );
                      setState(() {
                        _productTouched = true;
                        _selectedProduct = selected;
                        // Mark facility as touched too - so error shows if not selected
                        _facilityTouched = true;
                        // Reset flags when product changes
                        _manualCountInitialized = false;
                        _needsMetricsRecalculation = true;
                      });
                      _triggerStockSearchIfReady(context);
                      _updateFormData();
                    },
                  ),
                ),
                const SizedBox(height: spacer4),

                // Stock Metrics Display (only show if both facility and product are selected)
                if (_selectedFacility != null && _selectedProduct != null) ...[
                  DigitCard(
                    margin: const EdgeInsets.all(0),
                    children: [
                      Text(
                        localizations.translate(
                            i18.stockReconciliationMetrics.stockMetrics),
                        style: textTheme.headingS.copyWith(
                          color: theme.colorTheme.text.primary,
                        ),
                      ),
                      const SizedBox(height: spacer2),
                      LabelValueItem(
                        label: localizations.translate(i18
                            .stockReconciliationMetrics.dateOfReconciliation),
                        value:
                            DateFormat('dd MMMM yyyy').format(DateTime.now()),
                        labelFlex: 5,
                      ),
                      const DigitDivider(),
                      LabelValueItem(
                        label: localizations.translate(
                            i18.stockReconciliationMetrics.stockReceived),
                        value:
                            _stockMetrics['stockReceived']!.toStringAsFixed(0),
                        labelFlex: 5,
                      ),
                      const DigitDivider(),
                      LabelValueItem(
                        label: localizations.translate(
                            i18.stockReconciliationMetrics.stockIssued),
                        value: _stockMetrics['stockIssued']!.toStringAsFixed(0),
                        labelFlex: 5,
                      ),
                      const DigitDivider(),
                      LabelValueItem(
                        label: localizations.translate(
                            i18.stockReconciliationMetrics.stockReturned),
                        value:
                            _stockMetrics['stockReturned']!.toStringAsFixed(0),
                        labelFlex: 5,
                      ),
                      const DigitDivider(),
                      LabelValueItem(
                        label: localizations.translate(
                            i18.stockReconciliationMetrics.stockLost),
                        value: _stockMetrics['stockLost']!.toStringAsFixed(0),
                        labelFlex: 5,
                      ),
                      const DigitDivider(),
                      LabelValueItem(
                        label: localizations.translate(
                            i18.stockReconciliationMetrics.stockDamaged),
                        value:
                            _stockMetrics['stockDamaged']!.toStringAsFixed(0),
                        labelFlex: 5,
                      ),
                      const DigitDivider(),
                      LabelValueItem(
                        label: localizations.translate(
                            i18.stockReconciliationMetrics.stockExcess),
                        value: _stockMetrics['stockExcess']!.toStringAsFixed(0),
                        labelFlex: 5,
                      ),
                      const DigitDivider(),
                      LabelValueItem(
                        label: localizations.translate(
                            i18.stockReconciliationMetrics.stockLess),
                        value: _stockMetrics['stockLess']!.toStringAsFixed(0),
                        labelFlex: 5,
                      ),
                      const DigitDivider(),
                      LabelValueItem(
                        label: localizations.translate(
                            i18.stockReconciliationMetrics.stockOnHand),
                        value: _stockMetrics['stockInHand']!.toStringAsFixed(0),
                        labelFlex: 5,
                      ),
                    ],
                  ),
                  const SizedBox(height: spacer2),
                  InfoCard(
                    type: InfoType.info,
                    description: localizations.translate(
                      'STOCK_RECONCILIATION_INFO_CARD_CONTENT',
                    ),
                    title: localizations
                        .translate('STOCK_RECONCILIATION_INFO_CARD_TITLE'),
                  ),
                ],
              ],
            );
          },
        );
      },
    );
  }

  void _updateFormData() {
    // Update the forms engine with the selected values, calculated metrics, and validation status
    // Set value to null when invalid so that 'required' validation fails
    final isValidSelection =
        _selectedFacility != null && _selectedProduct != null;

    context.read<FormsBloc>().add(
          FormsEvent.updateField(
            schemaKey: widget.pageSchema,
            context: context,
            key: 'stockReconciliationCard',
            value: isValidSelection
                ? {
                    'facilityId': _selectedFacility?.id,
                    'productVariantId': _selectedProduct?.id,
                    'stockMetrics': _stockMetrics,
                  }
                : null, // Set to null when invalid - triggers 'required' validation
          ),
        );

    // Also store stockInHand as a separate field for visibility conditions
    if (isValidSelection) {
      context.read<FormsBloc>().add(
            FormsEvent.updateField(
              schemaKey: widget.pageSchema,
              context: context,
              key: 'stockInHand',
              value: _stockMetrics['stockInHand']?.toInt() ?? 0,
            ),
          );
    }
  }

  void _calculateStockMetrics(FlowCrudState? flowState) {
    if (_selectedFacility == null || _selectedProduct == null) {
      setState(() {
        _stockMetrics = StockCalculationUtils.emptyMetrics;
      });
      return;
    }

    // Get stock data from flow state using common utility
    final stockList = StockCalculationUtils.extractStockListFromWrapper(
      flowState?.stateWrapper,
    );
    final facilityId = _selectedFacility!.id;
    final productId = _selectedProduct!.id;
    final loggedInUserUuid = FlowBuilderSingleton().loggedInUserUuid;

    // Calculate metrics using common utility
    final calculatedMetrics = StockCalculationUtils.calculateStockMetrics(
      stockList: stockList,
      facilityId: facilityId,
      productId: productId,
      loggedInUserUuid: loggedInUserUuid,
    );

    setState(() {
      _stockMetrics = calculatedMetrics;
    });

    // Update form data with the calculated metrics
    // Only set value when both facility and product are selected
    final isValidSelection =
        _selectedFacility != null && _selectedProduct != null;

    context.read<FormsBloc>().add(
          FormsEvent.updateField(
            schemaKey: widget.pageSchema,
            context: context,
            key: 'stockReconciliationCard',
            value: isValidSelection
                ? {
                    'facilityId': _selectedFacility?.id,
                    'productVariantId': _selectedProduct?.id,
                    'stockMetrics': _stockMetrics,
                  }
                : null,
          ),
        );

    // Also store stockInHand as a separate field for visibility conditions
    // This allows visibility conditions like: manualCount != stockInHand
    if (isValidSelection) {
      final stockInHandValue = _stockMetrics['stockInHand']?.toInt() ?? 0;

      context.read<FormsBloc>().add(
            FormsEvent.updateField(
              schemaKey: widget.pageSchema,
              context: context,
              key: 'stockInHand',
              value: stockInHandValue,
            ),
          );

      // Set manualCount default value to stockInHand only on first initialization
      // This pre-fills the field so user only needs to change if count differs
      // Don't overwrite if user has already edited the value
      if (!_manualCountInitialized) {
        _manualCountInitialized = true;
        context.read<FormsBloc>().add(
              FormsEvent.updateField(
                schemaKey: widget.pageSchema,
                context: context,
                key: 'manualCount',
                value: stockInHandValue,
              ),
            );
      }
    }
  }

  List<FacilityModel> _getFacilities(FlowCrudState? flowState) {
    try {
      final stateWrapper = flowState?.stateWrapper;
      if (stateWrapper == null || stateWrapper.isEmpty) return [];

      // Extract ProjectFacilityModel and FacilityModel from wrapper
      // Same pattern as custom_facility_widgets.dart
      List<dynamic>? projectFacilities;
      List<dynamic>? allFacilities;

      if (stateWrapper is List && stateWrapper.isNotEmpty) {
        final firstItem = stateWrapper.first;
        if (firstItem is Map) {
          final wrapperList =
              stateWrapper as List<Map<String, List<dynamic>>>;
          projectFacilities = wrapperList
              .firstWhere(
                (m) => m.containsKey('ProjectFacilityModel'),
                orElse: () => {'ProjectFacilityModel': []},
              )['ProjectFacilityModel'];
          allFacilities = wrapperList
              .firstWhere(
                (m) => m.containsKey('FacilityModel'),
                orElse: () => {'FacilityModel': []},
              )['FacilityModel'];
        }
      }

      if (projectFacilities == null || projectFacilities.isEmpty) return [];

      // Filter by facilityLevel == 'current' (same as custom_facility_widgets.dart)
      final filteredProjectFacilities = projectFacilities.where((e) {
        final model = e as ProjectFacilityModel;
        final facilityLevel = model.additionalFields?.fields
            .where((f) => f.key == 'facilityLevel')
            .firstOrNull
            ?.value;
        return facilityLevel == null || facilityLevel == 'current';
      }).toList();

      // Get the filtered facility IDs
      final facilityIds = filteredProjectFacilities
          .cast<ProjectFacilityModel>()
          .map((pf) => pf.facilityId)
          .toSet();

      // Return FacilityModel entries matching filtered IDs
      if (allFacilities != null && allFacilities.isNotEmpty) {
        return allFacilities
            .map((e) => e is FacilityModel
                ? e
                : FacilityModelMapper.fromMap(e as Map<String, dynamic>))
            .where((f) => facilityIds.contains(f.id))
            .toList();
      }
    } catch (e) {
      // Silently handle parsing errors
    }

    return [];
  }

  List<ProductVariantModel> _getProductVariants(FlowCrudState? flowState) {
    try {
      // Access data from FlowCrudState's stateWrapper
      final stateWrapper = flowState?.stateWrapper;
      if (stateWrapper == null || stateWrapper.isEmpty) return [];

      // stateWrapper is a List<Map<String, List<dynamic>>>
      for (final wrapperMap in stateWrapper) {
        if (wrapperMap is Map &&
            wrapperMap.containsKey('ProductVariantModel')) {
          final productData = wrapperMap['ProductVariantModel'] as List?;
          if (productData != null && productData.isNotEmpty) {
            return productData
                .map((e) => e is ProductVariantModel
                    ? e
                    : ProductVariantModelMapper.fromMap(
                        e as Map<String, dynamic>))
                .toList();
          }
        }
      }
    } catch (e) {
      // Silently handle parsing errors
    }

    return [];
  }

  void _triggerStockSearchIfReady(BuildContext context) {
    // Only trigger search if both facility and product are selected
    if (_selectedFacility == null || _selectedProduct == null) {
      return;
    }

    // Get tenantId from singleton
    final tenantId = FlowBuilderSingleton().selectedProject?.tenantId;
    if (tenantId == null) {
      return;
    }

    final facilityId = _selectedFacility!.id;

    try {
      // Fetch stocks for the product and tenant where facility is sender OR receiver
      final filters = <SearchFilter>[
        SearchFilter(
          root: 'stock',
          field: 'tenantId',
          operator: 'equals',
          value: tenantId,
        ),
        SearchFilter(
          root: 'stock',
          field: 'productVariantId',
          operator: 'equals',
          value: _selectedProduct!.id,
        ),
        // Check if facility is sender OR receiver using equalsAny operator
        SearchFilter(
          root: 'stock',
          field: 'senderId,receiverId',
          operator: 'equalsAny',
          value: facilityId,
        ),
      ];

      final searchParams = GlobalSearchParameters(
        filters: filters,
        primaryModel: 'stock',
        select: ['stock'],
        pagination: null,
        orderBy: null,
      );

      context.read<CrudBloc>().add(CrudEventSearch(searchParams));
    } catch (e) {
      // Search params creation failed - silently ignore
    }
  }
}
