import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/input_wrapper.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/blocs/inventory_report.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';
import 'package:inventory_management/utils/extensions/extensions.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:inventory_management/utils/i18_key_constants.dart' as i18;
import 'package:inventory_management/widgets/component_wrapper/facility_bloc_wrapper.dart';
import 'package:inventory_management/widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import 'package:inventory_management/widgets/inventory/no_facilities_assigned_dialog.dart';
import 'package:inventory_management/widgets/localized.dart';
import 'package:inventory_management/widgets/reports/readonly_pluto_grid.dart';
import 'package:inventory_management/blocs/product_variant.dart';
import 'package:inventory_management/blocs/stock_reconciliation.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:inventory_management/models/entities/stock_reconciliation.dart';
import 'package:inventory_management/utils/utils.dart';
import 'package:inventory_management/widgets/back_navigation_help_header.dart';

import 'bloc/custom_inventory_report.dart';

@RoutePage()
class CustomInventoryReportDetailsPage extends LocalizedStatefulWidget {
  final InventoryReportType reportType;

  const CustomInventoryReportDetailsPage({
    super.key,
    super.appLocalizations,
    required this.reportType,
  });

  @override
  State<CustomInventoryReportDetailsPage> createState() =>
      CustomInventoryReportDetailsPageState();
}

class CustomInventoryReportDetailsPageState
    extends LocalizedState<CustomInventoryReportDetailsPage> {
  static const _productVariantKey = 'productVariant';
  static const _facilityKey = 'facilityKey';
  String? selectedFacilityId;

  TextEditingController controller1 = TextEditingController();

  /// Handles the selection of a facility and product variant from the form and triggers the loading of the corresponding inventory report data.
  ///
  /// This function takes a [FormGroup] and an [InventoryReportBloc] as parameters.
  /// The [FormGroup] should contain controls for the facility and product variant.
  /// The [InventoryReportBloc] is used to dispatch events to load the inventory report data.
  ///
  /// The function first checks the report type of the widget.
  /// If the report type is reconciliation, it creates an [InventoryReportLoadStockReconciliationDataEvent].
  /// Otherwise, it creates an [InventoryReportLoadStockDataEvent].
  /// The facility ID and product variant ID are retrieved from the form controls.
  /// If the form control values are not null, the IDs of the facility and product variant are used.
  /// Otherwise, an empty string is used.
  ///
  /// The function then dispatches an [InventoryReportLoadingEvent] to the [InventoryReportBloc].
  /// After a delay of 500 milliseconds, it dispatches the previously created event to the [InventoryReportBloc].
  ///
  /// @param form The [FormGroup] that contains the controls for the facility and product variant.
  /// @param inventoryReportBloc The [InventoryReportBloc] to which the events are dispatched.
  void handleSelection(
      FormGroup form, CustomInventoryReportBloc inventoryReportBloc) {
    final event = widget.reportType == InventoryReportType.reconciliation
        ? InventoryReportLoadStockReconciliationDataEvent(
            facilityId: form.control(_facilityKey).value != null
                ? selectedFacilityId!
                : '',
            productVariantId: form.control(_productVariantKey).value != null
                ? (form.control(_productVariantKey).value
                        as ProductVariantModel)
                    .id
                : '',
          )
        : InventoryReportLoadStockDataEvent(
            reportType: widget.reportType,
            facilityId: form.control(_facilityKey).value != null
                ? selectedFacilityId!
                : '',
            productVariantId: form.control(_productVariantKey).value != null
                ? (form.control(_productVariantKey).value
                        as ProductVariantModel)
                    .id
                : '',
          );

    inventoryReportBloc.add(
      const InventoryReportLoadingEvent(),
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      inventoryReportBloc.add(event);
    });
  }

  FormGroup _form() {
    return fb.group({
      _facilityKey: FormControl<String>(
        validators: [Validators.required],
      ),
      _productVariantKey: FormControl<ProductVariantModel>(),
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isWareHouseManager = InventorySingleton().isWareHouseMgr;

    return BlocProvider<CustomInventoryReportBloc>(
      create: (context) => CustomInventoryReportBloc(
        stockReconciliationRepository: context.repository<
            StockReconciliationModel, StockReconciliationSearchModel>(context),
        stockRepository:
            context.repository<StockModel, StockSearchModel>(context),
      ),
      child: Scaffold(
        bottomNavigationBar: DigitCard(
          children: [
            DigitButton(
              size: DigitButtonSize.large,
              type: DigitButtonType.secondary,
              mainAxisSize: MainAxisSize.max,
              onPressed: () => context.router.popUntilRoot(),
              label: localizations.translate(
                i18.inventoryReportDetails.backToHomeButtonLabel,
              ),
            ),
          ],
        ),
        body: BlocBuilder<CustomInventoryReportBloc, InventoryReportState>(
          builder: (context, inventoryReportState) {
            final noRecordsMessage = localizations.translate(
              i18.inventoryReportDetails.noRecordsMessage,
            );
            final noFilterMessage = localizations.translate(
              InventorySingleton().isDistributor &&
                      !InventorySingleton().isWareHouseMgr
                  ? i18.inventoryReportDetails.noFilterMessageDistributor
                  : i18.inventoryReportDetails.noFilterMessage,
            );

            return ScrollableContent(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackNavigationHelpHeaderWidget(),
                Container(
                  padding: const EdgeInsets.all(spacer2),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      maxLines: 1,
                      style:
                          Theme.of(context).digitTextTheme(context).headingXl,
                    ),
                  ),
                ),
                ReactiveFormBuilder(
                  form: _form,
                  builder: (ctx, form, child) {
                    return FacilityBlocWrapper(
                      projectId: InventorySingleton().projectId,
                      child: ProductVariantBlocWrapper(
                        projectId: InventorySingleton().projectId,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.65,
                          child: BlocConsumer<StockReconciliationBloc,
                              StockReconciliationState>(
                            listener: (context, stockState) {
                              // if (!stockState.persisted) return;

                              // context.router
                              //     .replace(InventoryAcknowledgementRoute());
                            },
                            builder: (context, stockState) {
                              return Column(
                                children: [
                                  DigitCard(
                                    margin: const EdgeInsets.all(spacer2),
                                    children: [
                                      if (isWareHouseManager)
                                        BlocConsumer<FacilityBloc,
                                            FacilityState>(
                                          listener: (context, state) =>
                                              state.whenOrNull(
                                            empty: () =>
                                                NoFacilitiesAssignedDialog.show(
                                              context,
                                              localizations,
                                            ),
                                          ),
                                          builder: (context, state) {
                                            final facilities = state.whenOrNull(
                                                  fetched: (facilities,
                                                          allFacilities) =>
                                                      facilities,
                                                ) ??
                                                [];

                                            return InkWell(
                                              onTap: () async {
                                                if (mounted) {
                                                  final stockReconciliationBloc =
                                                      context.read<
                                                          StockReconciliationBloc>();

                                                  final facility = await context
                                                          .router
                                                          .push(InventoryFacilitySelectionRoute(
                                                              facilities:
                                                                  facilities))
                                                      as FacilityModel?;

                                                  if (facility == null) {
                                                    return;
                                                  }
                                                  form
                                                          .control(_facilityKey)
                                                          .value =
                                                      localizations.translate(
                                                    'FAC_${facility.id}',
                                                  );

                                                  setState(() {
                                                    selectedFacilityId =
                                                        facility.id;
                                                  });

                                                  controller1.text =
                                                      localizations.translate(
                                                          'FAC_${facility.id}');
                                                  stockReconciliationBloc.add(
                                                    StockReconciliationSelectFacilityEvent(
                                                      facility,
                                                    ),
                                                  );

                                                  if (mounted) {
                                                    handleSelection(
                                                        form,
                                                        context.read<
                                                            CustomInventoryReportBloc>());
                                                  }
                                                }
                                              },
                                              child: IgnorePointer(
                                                child: ReactiveWrapperField(
                                                  formControlName: _facilityKey,
                                                  builder: (field) {
                                                    return InputField(
                                                      type: InputType.search,
                                                      isRequired: true,
                                                      controller: controller1,
                                                      label: localizations
                                                          .translate(
                                                        i18.stockReconciliationDetails
                                                            .facilityLabel,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      BlocBuilder<InventoryProductVariantBloc,
                                          InventoryProductVariantState>(
                                        builder: (context, state) {
                                          return state.maybeWhen(
                                            orElse: () => const Offstage(),
                                            loading: () => const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                            empty: () => Center(
                                              child: Text(
                                                i18.stockDetails
                                                    .noProductsFound,
                                              ),
                                            ),
                                            fetched: (productVariants) {
                                              return ReactiveWrapperField(
                                                formControlName:
                                                    _productVariantKey,
                                                validationMessages: {
                                                  'required': (object) =>
                                                      localizations.translate(
                                                        i18.common
                                                            .corecommonRequired,
                                                      ),
                                                },
                                                builder: (field) {
                                                  if (field.control.value ==
                                                      null) {
                                                    field.control.value =
                                                        productVariants.first;
                                                    handleSelection(
                                                        form,
                                                        context.read<
                                                            CustomInventoryReportBloc>());
                                                  }
                                                  return LabeledField(
                                                    isRequired: true,
                                                    label:
                                                        localizations.translate(
                                                      i18.stockReconciliationDetails
                                                          .productLabel,
                                                    ),
                                                    child: DigitDropdown(
                                                      emptyItemText:
                                                          localizations
                                                              .translate(
                                                        i18.common.noMatchFound,
                                                      ),
                                                      selectedOption: DropdownItem(
                                                          name: productVariants
                                                                  .first.sku ??
                                                              productVariants
                                                                  .first.id,
                                                          code: productVariants
                                                              .first.id),
                                                      items: productVariants
                                                          .map((variant) {
                                                        return DropdownItem(
                                                          name: localizations
                                                              .translate(
                                                            variant.sku ??
                                                                variant.id,
                                                          ),
                                                          code: variant.id,
                                                        );
                                                      }).toList(),
                                                      onSelect: (value) {
                                                        /// Find the selected product variant model by matching the id
                                                        final selectedVariant =
                                                            productVariants
                                                                .firstWhere(
                                                          (variant) =>
                                                              variant.id ==
                                                              value.code,
                                                        );

                                                        /// Update the form control with the selected product variant model
                                                        field.control.value =
                                                            selectedVariant;

                                                        handleSelection(
                                                            form,
                                                            context.read<
                                                                CustomInventoryReportBloc>());
                                                      },
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: inventoryReportState.when(
                                        empty: () => _NoReportContent(
                                          title: title,
                                          message: noFilterMessage,
                                        ),
                                        loading: () {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                        stock: (data) {
                                          if (data.isEmpty) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(spacer4),
                                              child: _NoReportContent(
                                                title: title,
                                                message: noRecordsMessage,
                                              ),
                                            );
                                          }

                                          const dateKey = 'date';
                                          const waybillKey = 'waybillNumber';
                                          const quantityKey = 'quantity';
                                          const transactingPartyKey =
                                              'transactingParty';

                                          return _ReportDetailsContent(
                                            title: title,
                                            data: DigitGridData(
                                              columns: [
                                                DigitGridColumn(
                                                  label:
                                                      localizations.translate(
                                                    i18.inventoryReportDetails
                                                        .dateLabel,
                                                  ),
                                                  key: dateKey,
                                                  width: 100,
                                                ),
                                                DigitGridColumn(
                                                  label:
                                                      localizations.translate(
                                                    i18.inventoryReportDetails
                                                        .waybillLabel,
                                                  ),
                                                  key: waybillKey,
                                                  width: 150,
                                                ),
                                                DigitGridColumn(
                                                  label: quantityLabel,
                                                  key: quantityKey,
                                                  width: 150,
                                                ),
                                                DigitGridColumn(
                                                  label: transactingPartyLabel,
                                                  key: transactingPartyKey,
                                                  width: 200,
                                                ),
                                              ],
                                              rows: [
                                                for (final entry
                                                    in data.entries) ...[
                                                  for (final model
                                                      in entry.value)
                                                    DigitGridRow(
                                                      [
                                                        DigitGridCell(
                                                          key: dateKey,
                                                          value: entry.key,
                                                        ),
                                                        DigitGridCell(
                                                          key: waybillKey,
                                                          value: model
                                                                  .wayBillNumber ??
                                                              model
                                                                  .wayBillNumber ??
                                                              '',
                                                        ),
                                                        DigitGridCell(
                                                          key: quantityKey,
                                                          value:
                                                              model.quantity ??
                                                                  '',
                                                        ),
                                                        DigitGridCell(
                                                          key:
                                                              transactingPartyKey,
                                                          value: widget
                                                                          .reportType ==
                                                                      InventoryReportType
                                                                          .dispatch ||
                                                                  widget.reportType ==
                                                                      InventoryReportType
                                                                          .loss ||
                                                                  widget.reportType ==
                                                                      InventoryReportType
                                                                          .damage
                                                              ? localizations
                                                                      .translate(
                                                                          'FAC_${model.receiverId}') ??
                                                                  localizations
                                                                      .translate(
                                                                          model.receiverType ??
                                                                              '')
                                                              : localizations
                                                                      .translate(
                                                                          'FAC_${model.senderId}') ??
                                                                  localizations
                                                                      .translate(
                                                                          model.receiverType ??
                                                                              ''),
                                                        ),
                                                      ],
                                                    ),
                                                ],
                                              ],
                                            ),
                                          );
                                        },
                                        stockReconciliation: (data) {
                                          if (data.isEmpty) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(spacer4),
                                              child: _NoReportContent(
                                                title: title,
                                                message: noRecordsMessage,
                                              ),
                                            );
                                          }

                                          const dateKey = 'date';
                                          const receivedKey = 'received';
                                          const dispatchedKey = 'dispatched';
                                          const returnedKey = 'returned';
                                          const damagedKey = 'damaged';
                                          const lossKey = 'loss';
                                          const stockInHandKey = 'stockInHand';
                                          const manualCountKey = 'manualCount';

                                          return _ReportDetailsContent(
                                            title: title,
                                            data: DigitGridData(
                                              columns: [
                                                DigitGridColumn(
                                                  label:
                                                      localizations.translate(
                                                    i18.inventoryReportDetails
                                                        .dateLabel,
                                                  ),
                                                  key: dateKey,
                                                  width: 100,
                                                ),
                                                DigitGridColumn(
                                                  label:
                                                      localizations.translate(
                                                    i18.inventoryReportDetails
                                                        .receivedCountLabel,
                                                  ),
                                                  key: receivedKey,
                                                  width: 110,
                                                ),
                                                DigitGridColumn(
                                                  label:
                                                      localizations.translate(
                                                    i18.inventoryReportDetails
                                                        .dispatchedCountLabel,
                                                  ),
                                                  key: dispatchedKey,
                                                  width: 100,
                                                ),
                                                DigitGridColumn(
                                                  label:
                                                      localizations.translate(
                                                    i18.inventoryReportDetails
                                                        .returnedCountLabel,
                                                  ),
                                                  key: returnedKey,
                                                  width: 120,
                                                ),
                                                DigitGridColumn(
                                                  label:
                                                      localizations.translate(
                                                    i18.inventoryReportDetails
                                                        .damagedCountLabel,
                                                  ),
                                                  key: damagedKey,
                                                  width: 120,
                                                ),
                                                DigitGridColumn(
                                                  label:
                                                      localizations.translate(
                                                    i18.inventoryReportDetails
                                                        .lostCountLabel,
                                                  ),
                                                  key: lossKey,
                                                  width: 120,
                                                ),
                                                DigitGridColumn(
                                                  label:
                                                      localizations.translate(
                                                    i18.inventoryReportDetails
                                                        .stockInHandLabel,
                                                  ),
                                                  key: stockInHandKey,
                                                  width: 150,
                                                ),
                                                DigitGridColumn(
                                                  label:
                                                      localizations.translate(
                                                    i18.inventoryReportDetails
                                                        .manualCountLabel,
                                                  ),
                                                  key: manualCountKey,
                                                  width: 150,
                                                ),
                                              ],
                                              rows: [
                                                for (final entry
                                                    in data.entries) ...[
                                                  for (final model
                                                      in entry.value)
                                                    DigitGridRow(
                                                      [
                                                        DigitGridCell(
                                                          key: dateKey,
                                                          value: entry.key,
                                                        ),
                                                        DigitGridCell(
                                                          key: receivedKey,
                                                          value:
                                                              _getCountFromAdditionalDetails(
                                                            model,
                                                            'received',
                                                          ),
                                                        ),
                                                        DigitGridCell(
                                                          key: dispatchedKey,
                                                          value:
                                                              _getCountFromAdditionalDetails(
                                                            model,
                                                            'issued',
                                                          ),
                                                        ),
                                                        DigitGridCell(
                                                          key: returnedKey,
                                                          value:
                                                              _getCountFromAdditionalDetails(
                                                            model,
                                                            'returned',
                                                          ),
                                                        ),
                                                        DigitGridCell(
                                                          key: lossKey,
                                                          value:
                                                              _getCountFromAdditionalDetails(
                                                            model,
                                                            'lost',
                                                          ),
                                                        ),
                                                        DigitGridCell(
                                                          key: damagedKey,
                                                          value:
                                                              _getCountFromAdditionalDetails(
                                                            model,
                                                            'damaged',
                                                          ),
                                                        ),
                                                        DigitGridCell(
                                                          key: stockInHandKey,
                                                          value:
                                                              _getCountFromAdditionalDetails(
                                                            model,
                                                            'inHand',
                                                          ),
                                                        ),
                                                        DigitGridCell(
                                                          key: manualCountKey,
                                                          value:
                                                              (model.physicalCount ??
                                                                      '0')
                                                                  .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                ],
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  String get title {
    String value;
    switch (widget.reportType) {
      case InventoryReportType.receipt:
        value = i18.inventoryReportDetails.receiptReportTitle;
        break;
      case InventoryReportType.dispatch:
        value = i18.inventoryReportDetails.dispatchReportTitle;
        break;
      case InventoryReportType.returned:
        value = i18.inventoryReportDetails.returnedReportTitle;
        break;
      case InventoryReportType.damage:
        value = i18.inventoryReportDetails.damageReportTitle;
        break;
      case InventoryReportType.loss:
        value = i18.inventoryReportDetails.lossReportTitle;
        break;
      case InventoryReportType.reconciliation:
        value = i18.inventoryReportDetails.reconciliationReportTitle;
        break;
    }

    return localizations.translate(value);
  }

  String get quantityLabel {
    String value;
    switch (widget.reportType) {
      case InventoryReportType.receipt:
        value = i18.inventoryReportDetails.receiptQuantityLabel;
        break;
      case InventoryReportType.dispatch:
        value = i18.inventoryReportDetails.dispatchQuantityLabel;
        break;
      case InventoryReportType.returned:
        value = i18.inventoryReportDetails.returnedQuantityLabel;
        break;
      case InventoryReportType.damage:
        value = i18.inventoryReportDetails.damagedQuantityLabel;
        break;
      default:
        value = i18.inventoryReportDetails.lossQuantityLabel;
        break;
    }

    return localizations.translate(value);
  }

  String get transactingPartyLabel {
    String value;

    switch (widget.reportType) {
      case InventoryReportType.receipt:
        value = i18.inventoryReportDetails.receiptTransactingPartyLabel;
        break;
      case InventoryReportType.dispatch:
        value = i18.inventoryReportDetails.dispatchTransactingPartyLabel;
        break;
      case InventoryReportType.returned:
        value = i18.inventoryReportDetails.returnedTransactingPartyLabel;
        break;
      case InventoryReportType.damage:
        value = i18.inventoryReportDetails.damagedTransactingPartyLabel;
        break;
      default:
        value = i18.inventoryReportDetails.lossTransactingPartyLabel;
        break;
    }

    return localizations.translate(value);
  }

  /// This function retrieves the count of a specific key from the additional data.
  ///
  /// It takes an iterable of MapEntry objects, which represent the additional data,
  /// and a string key, which represents the key to be searched for in the additional data.
  ///
  /// It first filters the additional data to get the entries that have the specified key.
  /// If there are any entries with the specified key, it tries to parse the value of the first entry as a double.
  /// If the parsing is successful, it returns the value as a string with no decimal places.
  /// If the parsing is not successful, it returns '0'.
  /// If there are no entries with the specified key, it also returns '0'.
  ///
  /// @param additionalData The iterable of MapEntry objects representing the additional data.
  /// @param key The key to be searched for in the additional data.
  /// @return The count of the specified key in the additional data, as a string.
  String _getCountFromAdditionalDetails(
    StockReconciliationModel model,
    String key,
  ) {
    final additionalDetails = model.additionalFields;
    if (additionalDetails == null) {
      return '0';
    }
    final count = additionalDetails.fields.firstWhereOrNull(
      (e) => e.key == key,
    );
    if (count == null) {
      return '0';
    }
    return (double.tryParse(count.value.toString()) ?? 0.0).toStringAsFixed(0);
  }

  handleFacilitySelection(
      FormGroup form, List<FacilityModel> facilities) async {}
}

class _ReportDetailsContent extends StatelessWidget {
  final String title;
  final DigitGridData data;

  const _ReportDetailsContent({
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(spacer2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: spacer4),
          Flexible(
            child: ReadonlyDigitGrid(
              data: data,
            ),
          ),
        ],
      ),
    );
  }
}

class _NoReportContent extends StatelessWidget {
  final String title;
  final String message;

  const _NoReportContent({
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: spacer4,
          width: double.maxFinite,
        ),
        Center(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.disabledColor,
            ),
          ),
        ),
      ],
    );
  }
}
