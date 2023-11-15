import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../blocs/facility/facility.dart';
import '../../../blocs/inventory_report/inventory_report.dart';
import '../../../blocs/product_variant/product_variant.dart';
import '../../../blocs/stock_reconciliation/stock_reconciliation.dart';
import '../../../models/data_model.dart';
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';
import '../../../widgets/component_wrapper/facility_bloc_wrapper.dart';
import '../../../widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import '../../../widgets/header/back_navigation_help_header.dart';
import '../../../widgets/inventory/no_facilities_assigned_dialog.dart';
import '../../../widgets/localized.dart';
import '../../../widgets/reports/readonly_pluto_grid.dart';
import '../facility_selection.dart';

class InventoryReportDetailsPage extends LocalizedStatefulWidget
    with AutoRouteWrapper {
  final InventoryReportType reportType;

  const InventoryReportDetailsPage({
    Key? key,
    super.appLocalizations,
    required this.reportType,
  }) : super(key: key);

  @override
  State<InventoryReportDetailsPage> createState() =>
      _InventoryReportDetailsPageState();

/* created a wrapper  Router which handles the BlocProvider 
and attached the event to load the data*/
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return InventoryReportBloc(
          stockReconciliationRepository: context.repository<
              StockReconciliationModel, StockReconciliationSearchModel>(),
          stockRepository: context.repository<StockModel, StockSearchModel>(),
        );
      },
      child: this,
    );
  }
}

class _InventoryReportDetailsPageState
    extends LocalizedState<InventoryReportDetailsPage> {
  static const _productVariantKey = 'productVariant';
  static const _facilityKey = 'facilityKey';
  Map<String, FacilityModel> facilityMap = {};

  void handleSelection(FormGroup form) {
    final event = widget.reportType == InventoryReportType.reconciliation
        ? InventoryReportLoadStockReconciliationDataEvent(
            facilityId: form.control(_facilityKey).value != null
                ? (form.control(_facilityKey).value as FacilityModel).id
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
                ? (form.control(_facilityKey).value as FacilityModel).id
                : '',
            productVariantId: form.control(_productVariantKey).value != null
                ? (form.control(_productVariantKey).value
                        as ProductVariantModel)
                    .id
                : '',
          );

    context.read<InventoryReportBloc>().add(
          const InventoryReportLoadingEvent(),
        );

    Future.delayed(const Duration(milliseconds: 500), () {
      context.read<InventoryReportBloc>().add(event);
    });
  }

  FormGroup _form() {
    return fb.group({
      _facilityKey: FormControl<FacilityModel>(
        validators: [Validators.required],
      ),
      _productVariantKey: FormControl<ProductVariantModel>(
        validators: [Validators.required],
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DigitCard(
        padding: const EdgeInsets.all(8.0),
        child: DigitElevatedButton(
          onPressed: () => context.router.popUntilRoot(),
          child: Text(
            localizations.translate(
              i18.inventoryReportDetails.backToHomeButtonLabel,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ),
      ),
      body: BlocBuilder<InventoryReportBloc, InventoryReportState>(
        builder: (context, inventoryReportState) {
          final noRecordsMessage = localizations.translate(
            i18.inventoryReportDetails.noRecordsMessage,
          );
          final noFilterMessage = localizations.translate(
            i18.inventoryReportDetails.noFilterMessage,
          );

          return ScrollableContent(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackNavigationHelpHeaderWidget(),
              Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  title,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              ReactiveFormBuilder(
                form: _form,
                builder: (ctx, form, child) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: FacilityBlocWrapper(
                      child: ProductVariantBlocWrapper(
                        child: BlocProvider(
                          create: (context) => StockReconciliationBloc(
                            stockRepository: context
                                .repository<StockModel, StockSearchModel>(),
                            stockReconciliationRepository: context.repository<
                                StockReconciliationModel,
                                StockReconciliationSearchModel>(),
                            StockReconciliationState(
                              projectId: context.projectId,
                              dateOfReconciliation: DateTime.now(),
                            ),
                          ),
                          child: BlocConsumer<StockReconciliationBloc,
                              StockReconciliationState>(
                            listener: (context, stockState) {
                              if (!stockState.persisted) return;

                              context.router.replace(AcknowledgementRoute());
                            },
                            builder: (context, stockState) {
                              return Column(
                                children: [
                                  DigitCard(
                                    child: Column(
                                      children: [
                                        BlocConsumer<FacilityBloc,
                                            FacilityState>(
                                          listener: (context, state) =>
                                              state.whenOrNull(
                                            empty: () =>
                                                NoFacilitiesAssignedDialog.show(
                                              context,
                                            ),
                                          ),
                                          builder: (context, state) {
                                            final facilities = state.whenOrNull(
                                                  fetched:
                                                      (facilities, _, __) =>
                                                          facilities,
                                                ) ??
                                                [];
                                            final allFacilities =
                                                state.whenOrNull(
                                                      fetched: (
                                                        _,
                                                        allFacilities,
                                                        __,
                                                      ) =>
                                                          allFacilities,
                                                    ) ??
                                                    [];
                                            for (var element in allFacilities) {
                                              facilityMap[element.id] = element;
                                            }

                                            return DigitTextFormField(
                                              valueAccessor:
                                                  FacilityValueAccessor(
                                                facilities,
                                              ),
                                              label: localizations.translate(
                                                i18.stockReconciliationDetails
                                                    .facilityName,
                                              ),
                                              suffix: const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(Icons.search),
                                              ),
                                              formControlName: _facilityKey,
                                              readOnly: true,
                                              isRequired: true,
                                              onTap: () async {
                                                final stockReconciliationBloc =
                                                    context.read<
                                                        StockReconciliationBloc>();

                                                final facility = await context
                                                    .router
                                                    .push<FacilityModel>(
                                                  FacilitySelectionRoute(
                                                    facilities: facilities,
                                                  ),
                                                );

                                                if (facility == null) return;
                                                form
                                                    .control(_facilityKey)
                                                    .value = facility;
                                                stockReconciliationBloc.add(
                                                  StockReconciliationSelectFacilityEvent(
                                                    facility,
                                                  ),
                                                );

                                                handleSelection(form);
                                              },
                                            );
                                          },
                                        ),
                                        BlocBuilder<ProductVariantBloc,
                                            ProductVariantState>(
                                          builder: (context, state) {
                                            return state.maybeWhen(
                                              orElse: () => const Offstage(),
                                              fetched: (productVariants) {
                                                return DigitReactiveDropdown<
                                                    ProductVariantModel>(
                                                  formControlName:
                                                      _productVariantKey,
                                                  label:
                                                      localizations.translate(
                                                    i18.stockReconciliationDetails
                                                        .spaqLabel,
                                                  ),
                                                  isRequired: true,
                                                  onChanged: (value) {
                                                    handleSelection(form);
                                                  },
                                                  valueMapper: (value) {
                                                    return localizations
                                                        .translate(
                                                      value.sku ?? value.id,
                                                    );
                                                  },
                                                  menuItems: productVariants,
                                                  validationMessages: {
                                                    'required': (object) =>
                                                        localizations.translate(
                                                          i18.stockReconciliationDetails
                                                              .fieldRequired,
                                                        ),
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
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
                                              padding: const EdgeInsets.all(
                                                kPadding * 2,
                                              ),
                                              child: _NoReportContent(
                                                title: title,
                                                message: noRecordsMessage,
                                              ),
                                            );
                                          }

                                          const dateKey = 'date';
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
                                                          key: quantityKey,
                                                          value:
                                                              model.quantity ??
                                                                  '',
                                                        ),
                                                        DigitGridCell(
                                                          key:
                                                              transactingPartyKey,
                                                          value: facilityMap[model
                                                                      .transactingPartyId]
                                                                  ?.name ??
                                                              model
                                                                  .transactingPartyType ??
                                                              '',
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
                                              padding: const EdgeInsets.all(
                                                kPadding * 2,
                                              ),
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
                    ),
                  );
                },
              ),
            ],
          );
        },
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
}

class _ReportDetailsContent extends StatelessWidget {
  final String title;
  final DigitGridData data;

  const _ReportDetailsContent({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: kPadding * 2),
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
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: kPadding * 2,
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
