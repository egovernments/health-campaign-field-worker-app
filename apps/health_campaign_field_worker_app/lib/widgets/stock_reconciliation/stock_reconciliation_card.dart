import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_flow_builder/blocs/flow_crud_bloc.dart';
import 'package:digit_flow_builder/flow_builder.dart';
import 'package:digit_forms_engine/forms_engine.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_divider.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../localized.dart';

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
  static const _facilityKey = 'selectedFacility';
  static const _productVariantKey = 'selectedProductVariant';

  FacilityModel? _selectedFacility;
  ProductVariantModel? _selectedProduct;

  Map<String, double> _stockMetrics = {
    'stockReceived': 0,
    'stockIssued': 0,
    'stockReturned': 0,
    'stockLost': 0,
    'stockDamaged': 0,
    'stockInHand': 0,
  };

  bool _listenersAdded = false;

  // Cache facilities and product variants to prevent them from being cleared
  List<FacilityModel> _cachedFacilities = [];
  List<ProductVariantModel> _cachedProductVariants = [];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return ValueListenableBuilder<FlowCrudState?>(
      valueListenable: FlowCrudStateRegistry().listen(widget.pageSchema),
      builder: (context, flowState, child) {
        // Get facilities and product variants from FlowCrudStateRegistry
        final facilities = _getFacilities(flowState);
        final productVariants = _getProductVariants(flowState);

        // Cache facilities and product variants when they're loaded
        // This prevents them from being cleared when stock search happens
        if (facilities.isNotEmpty && _cachedFacilities.isEmpty) {
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

        // Recalculate stock metrics whenever flow state changes and both selections are made
        if (_selectedFacility != null && _selectedProduct != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _calculateStockMetrics(flowState);
          });
        }

        return ReactiveFormBuilder(
          form: () => _buildForm(),
          builder: (context, form, child) {
            // Add listeners just once
            if (!_listenersAdded) {
              _listenersAdded = true;

              form.control(_facilityKey).valueChanges.listen((value) {
                setState(() {
                  _selectedFacility = value as FacilityModel?;
                });
                _triggerStockSearchIfReady(context);
                _updateFormData(form);
              });

              form.control(_productVariantKey).valueChanges.listen((value) {
                setState(() {
                  _selectedProduct = value as ProductVariantModel?;
                });
                _triggerStockSearchIfReady(context);
                _updateFormData(form);
              });
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Facility Dropdown
                ReactiveWrapperField<FacilityModel>(
                  formControlName: _facilityKey,
                  validationMessages: {
                    'required': (error) =>
                        localizations.translate('Facility is required'),
                  },
                  showErrors: (control) => control.invalid && control.touched,
                  builder: (field) {
                    return LabeledField(
                      isRequired: true,
                      label: localizations.translate('Select Warehouse'),
                      child: DigitDropdown<FacilityModel>(
                        selectedOption: _selectedFacility != null
                            ? DropdownItem(
                                name: localizations
                                    .translate('${_selectedFacility!.id}'),
                                code: _selectedFacility!.id,
                              )
                            : null,
                        emptyItemText:
                            localizations.translate('No facilities found'),
                        items: displayFacilities.map((facility) {
                          return DropdownItem(
                            name: localizations.translate('${facility.id}'),
                            code: facility.id,
                          );
                        }).toList(),
                        onSelect: (value) {
                          field.control.markAsTouched();
                          final selected = displayFacilities.firstWhere(
                            (f) => f.id == value.code,
                          );
                          field.control.value = selected;
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: spacer2),

                // Product Variant Dropdown
                ReactiveWrapperField<ProductVariantModel>(
                  formControlName: _productVariantKey,
                  validationMessages: {
                    'required': (error) =>
                        localizations.translate('Product is required'),
                  },
                  showErrors: (control) => control.invalid && control.touched,
                  builder: (field) {
                    return LabeledField(
                      isRequired: true,
                      label: localizations.translate('Select Product'),
                      child: DigitDropdown<ProductVariantModel>(
                        sentenceCaseEnabled: true,
                        selectedOption: _selectedProduct != null
                            ? DropdownItem(
                                name: localizations.translate(
                                    _selectedProduct!.sku ??
                                        _selectedProduct!.id),
                                code: _selectedProduct!.id,
                              )
                            : null,
                        emptyItemText:
                            localizations.translate('No products found'),
                        items: displayProductVariants.map((product) {
                          return DropdownItem(
                            name: localizations
                                .translate(product.sku ?? product.id),
                            code: product.id,
                          );
                        }).toList(),
                        onSelect: (value) {
                          field.control.markAsTouched();
                          final selected = displayProductVariants.firstWhere(
                            (p) => p.id == value.code,
                          );
                          field.control.value = selected;
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: spacer4),

                // Stock Metrics Display (only show if both facility and product are selected)
                if (_selectedFacility != null && _selectedProduct != null) ...[
                  DigitCard(
                    margin: const EdgeInsets.all(0),
                    children: [
                      Text(
                        localizations.translate('Stock Metrics'),
                        style: textTheme.headingS.copyWith(
                          color: theme.colorTheme.text.primary,
                        ),
                      ),
                      const SizedBox(height: spacer2),
                      LabelValueItem(
                        label:
                            localizations.translate('Date of Reconciliation'),
                        value:
                            DateFormat('dd MMMM yyyy').format(DateTime.now()),
                        labelFlex: 5,
                      ),
                      const DigitDivider(),
                      LabelValueItem(
                        label: localizations.translate('Stock Received'),
                        value:
                            _stockMetrics['stockReceived']!.toStringAsFixed(0),
                        labelFlex: 5,
                      ),
                      const DigitDivider(),
                      LabelValueItem(
                        label: localizations.translate('Stock Issued'),
                        value: _stockMetrics['stockIssued']!.toStringAsFixed(0),
                        labelFlex: 5,
                      ),
                      const DigitDivider(),
                      LabelValueItem(
                        label: localizations.translate('Stock Returned'),
                        value:
                            _stockMetrics['stockReturned']!.toStringAsFixed(0),
                        labelFlex: 5,
                      ),
                      const DigitDivider(),
                      LabelValueItem(
                        label: localizations.translate('Stock Lost'),
                        value: _stockMetrics['stockLost']!.toStringAsFixed(0),
                        labelFlex: 5,
                      ),
                      const DigitDivider(),
                      LabelValueItem(
                        label: localizations.translate('Stock Damaged'),
                        value:
                            _stockMetrics['stockDamaged']!.toStringAsFixed(0),
                        labelFlex: 5,
                      ),
                      const DigitDivider(),
                      LabelValueItem(
                        label: localizations.translate('Stock on Hand'),
                        value: _stockMetrics['stockInHand']!.toStringAsFixed(0),
                        labelFlex: 5,
                      ),
                    ],
                  ),
                  const SizedBox(height: spacer2),
                  InfoCard(
                    type: InfoType.info,
                    description: localizations.translate(
                      'Please do a manual count of the stock and enter the value below',
                    ),
                    title: localizations.translate('Note'),
                  ),
                ],
              ],
            );
          },
        );
      },
    );
  }

  FormGroup _buildForm() {
    return fb.group({
      _facilityKey: FormControl<FacilityModel>(
        validators: [Validators.required],
      ),
      _productVariantKey: FormControl<ProductVariantModel>(
        validators: [Validators.required],
      ),
    });
  }

  void _updateFormData(FormGroup form) {
    final facility = form.control(_facilityKey).value as FacilityModel?;
    final product =
        form.control(_productVariantKey).value as ProductVariantModel?;

    // Update the forms engine with the selected values and calculated metrics
    context.read<FormsBloc>().add(
          FormsEvent.updateField(
            schemaKey: widget.pageSchema,
            context: context,
            key: 'stockReconciliationCard',
            value: {
              'facilityId': facility?.id,
              'productVariantId': product?.id,
              'stockMetrics': _stockMetrics,
            },
          ),
        );
  }

  void _calculateStockMetrics(FlowCrudState? flowState) {
    if (_selectedFacility == null || _selectedProduct == null) {
      setState(() {
        _stockMetrics = {
          'stockReceived': 0,
          'stockIssued': 0,
          'stockReturned': 0,
          'stockLost': 0,
          'stockDamaged': 0,
          'stockInHand': 0,
        };
      });
      return;
    }

    // Get stock data filtered by facility and product
    // Following the pattern from StockReconciliationBloc._handleCalculate
    final stockList = _getStockList(flowState);
    final facilityId = _selectedFacility!.id;
    final productId = _selectedProduct!.id;
    final loggedInUserUuid = FlowBuilderSingleton().loggedInUserUuid;

    // Filter stocks matching the bloc's logic:
    // 1. Filter by productVariantId
    // 2. Filter by facility (either as receiver or sender)
    // 3. Filter by logged-in user (stocks created by current user only)
    final filteredStock = stockList.where((stock) {
      // Must match product
      if (stock.productVariantId != productId) return false;

      // Must match facility (as receiver OR sender)
      final matchesReceiver = stock.receiverId == facilityId;
      final matchesSender = stock.senderId == facilityId;
      if (!matchesReceiver && !matchesSender) return false;

      // Must be created by logged-in user (matching StockReconciliationBloc logic)
      if (stock.auditDetails?.createdBy != loggedInUserUuid) return false;

      return true;
    }).toList();

    debugPrint(
        'Calculating metrics for ${filteredStock.length} stocks (facility=$facilityId, product=$productId, user=$loggedInUserUuid)');

    // Calculate metrics following StockReconciliationBloc pattern
    double stockReceived = 0;
    double stockIssued = 0;
    double stockReturned = 0;
    double stockLost = 0;
    double stockDamaged = 0;

    for (final stock in filteredStock) {
      final transactionType = stock.transactionType?.toUpperCase() ?? '';
      final transactionReason = stock.transactionReason?.toUpperCase() ?? '';
      final quantity = num.tryParse(stock.quantity ?? '0') ?? 0.0;

      // Check if this facility is the receiver or sender
      final isReceiver = stock.receiverId == facilityId;
      final isSender = stock.senderId == facilityId;

      debugPrint(
          'Processing stock: type=$transactionType, reason=$transactionReason, qty=$quantity, isReceiver=$isReceiver, isSender=$isSender');

      // Stock Received: This facility is the receiver AND transactionType == RECEIVED
      // Accept both: transactionReason == 'RECEIVED' OR transactionReason is empty/null (for regular receipts)
      if (isReceiver && transactionType == 'RECEIVED') {
        if (transactionReason == 'RETURNED') {
          // Stock Returned: transactionReason == RETURNED
          stockReturned += quantity;
          debugPrint('  -> Counted as RETURNED: $quantity');
        } else if (transactionReason.isEmpty ||
            transactionReason == 'RECEIVED') {
          // Regular stock receipt: transactionReason is null/empty or explicitly 'RECEIVED'
          stockReceived += quantity;
          debugPrint('  -> Counted as RECEIVED: $quantity');
        }
      }
      // Stock Issued/Lost/Damaged: This facility is the sender AND transactionType == DISPATCHED
      else if (isSender && transactionType == 'DISPATCHED') {
        if (transactionReason == 'LOST_IN_TRANSIT' ||
            transactionReason == 'LOST_IN_STORAGE') {
          // Stock Lost
          stockLost += quantity;
          debugPrint('  -> Counted as LOST: $quantity');
        } else if (transactionReason == 'DAMAGED_IN_TRANSIT' ||
            transactionReason == 'DAMAGED_IN_STORAGE') {
          // Stock Damaged
          stockDamaged += quantity;
          debugPrint('  -> Counted as DAMAGED: $quantity');
        } else if (transactionReason.isEmpty) {
          // Regular dispatch (issued)
          stockIssued += quantity;
          debugPrint('  -> Counted as ISSUED: $quantity');
        }
      } else {
        debugPrint('  -> NOT counted (not matching facility)');
      }
    }

    // Stock in hand = (received + returned) - (issued + damaged + lost)
    final stockInHand = (stockReceived + stockReturned) -
        (stockIssued + stockDamaged + stockLost);

    debugPrint(
        'Metrics: received=$stockReceived, issued=$stockIssued, returned=$stockReturned, lost=$stockLost, damaged=$stockDamaged, inHand=$stockInHand');

    setState(() {
      _stockMetrics = {
        'stockReceived': stockReceived.toDouble(),
        'stockIssued': stockIssued.toDouble(),
        'stockReturned': stockReturned.toDouble(),
        'stockLost': stockLost.toDouble(),
        'stockDamaged': stockDamaged.toDouble(),
        'stockInHand': stockInHand.toDouble(),
      };
    });

    // Update form data with the calculated metrics
    context.read<FormsBloc>().add(
          FormsEvent.updateField(
            schemaKey: widget.pageSchema,
            context: context,
            key: 'stockReconciliationCard',
            value: {
              'facilityId': _selectedFacility?.id,
              'productVariantId': _selectedProduct?.id,
              'stockMetrics': _stockMetrics,
            },
          ),
        );

    debugPrint('Updated form data with calculated metrics: $_stockMetrics');
  }

  List<FacilityModel> _getFacilities(FlowCrudState? flowState) {
    try {
      // Access data from FlowCrudState's stateWrapper
      final stateWrapper = flowState?.stateWrapper;
      if (stateWrapper == null || stateWrapper.isEmpty) return [];

      // stateWrapper is a List<Map<String, List<dynamic>>>
      for (final wrapperMap in stateWrapper) {
        if (wrapperMap is Map &&
            wrapperMap.containsKey('ProjectFacilityModel')) {
          final projectFacilities = wrapperMap['ProjectFacilityModel'] as List?;
          if (projectFacilities == null || projectFacilities.isEmpty) continue;

          // Extract facilities from project facilities
          final facilities = <FacilityModel>[];
          for (final pf in projectFacilities) {
            if (pf is Map && pf.containsKey('facility')) {
              final facilityData = pf['facility'];
              if (facilityData is FacilityModel) {
                facilities.add(facilityData);
              } else if (facilityData is Map) {
                facilities.add(FacilityModelMapper.fromMap(
                    facilityData as Map<String, dynamic>));
              }
            }
          }
          if (facilities.isNotEmpty) return facilities;
        }

        // Fallback: Try direct FacilityModel list
        if (wrapperMap is Map && wrapperMap.containsKey('FacilityModel')) {
          final facilityData = wrapperMap['FacilityModel'] as List?;
          if (facilityData != null && facilityData.isNotEmpty) {
            return facilityData
                .map((e) => e is FacilityModel
                    ? e
                    : FacilityModelMapper.fromMap(e as Map<String, dynamic>))
                .toList();
          }
        }
      }
    } catch (e) {
      debugPrint('Error parsing facility data: $e');
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
      debugPrint('Error parsing product variant data: $e');
    }

    return [];
  }

  List<StockModel> _getStockList(FlowCrudState? flowState) {
    try {
      // Access data from FlowCrudState's stateWrapper
      final stateWrapper = flowState?.stateWrapper;
      if (stateWrapper == null || stateWrapper.isEmpty) return [];

      // stateWrapper is a List<Map<String, List<dynamic>>>
      for (final wrapperMap in stateWrapper) {
        if (wrapperMap is Map && wrapperMap.containsKey('StockModel')) {
          final stockData = wrapperMap['StockModel'] as List?;
          if (stockData != null && stockData.isNotEmpty) {
            return stockData
                .map((e) => e is StockModel
                    ? e
                    : StockModelMapper.fromMap(e as Map<String, dynamic>))
                .toList();
          }
        }
      }
    } catch (e) {
      debugPrint('Error parsing stock data: $e');
    }

    return [];
  }

  void _triggerStockSearchIfReady(BuildContext context) {
    // Only trigger search if both facility and product are selected
    if (_selectedFacility == null || _selectedProduct == null) {
      debugPrint('Skipping search - facility or product not selected');
      return;
    }

    debugPrint(
        'Triggering TWO stock searches for facility=${_selectedFacility!.id}, product=${_selectedProduct!.id}');

    // Get tenantId from singleton
    final tenantId = FlowBuilderSingleton().selectedProject?.tenantId;
    if (tenantId == null) {
      debugPrint('ERROR: TenantId not found in singleton');
      return;
    }

    try {
      // Fetch all stocks for the product and tenant
      // The calculation method will filter by facility (receiverId OR senderId)
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
      ];

      final searchParams = GlobalSearchParameters(
        filters: filters,
        primaryModel: 'stock',
        select: ['stock'],
        pagination: null,
        orderBy: null,
      );

      debugPrint(
          'Fetching all stocks for product=${_selectedProduct!.id}, facility filter will be applied in calculation');

      context.read<CrudBloc>().add(CrudEventSearch(searchParams));
    } catch (e, stackTrace) {
      debugPrint('ERROR creating search params: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }
}
