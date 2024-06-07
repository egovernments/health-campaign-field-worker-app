import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/facility/facility.dart';
import '../../blocs/inventory_report/inventory_report.dart';
import '../../blocs/performanceSummaryReport/performance_summary_report.dart';
import '../../blocs/product_variant/product_variant.dart';
import '../../blocs/stock_reconciliation/stock_reconciliation.dart';
import '../../data/local_store/sql_store/tables/individual.dart';
import '../../data/repositories/local/household.dart';
import '../../data/repositories/local/individual.dart';
import '../../data/repositories/local/task.dart';
import '../../models/data_model.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';
import '../../widgets/component_wrapper/facility_bloc_wrapper.dart';
import '../../widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/inventory/no_facilities_assigned_dialog.dart';
import '../../widgets/localized.dart';
import '../../widgets/reports/readonly_pluto_grid.dart';
import '../inventory/facility_selection.dart';

class PerformamnceSummaryReportDetailsPage extends LocalizedStatefulWidget
    with AutoRouteWrapper {
  const PerformamnceSummaryReportDetailsPage({
    Key? key,
    super.appLocalizations,
  }) : super(key: key);

  @override
  State<PerformamnceSummaryReportDetailsPage> createState() =>
      _PerformamnceSummaryReportDetailsPageState();

/* created a wrapper  Router which handles the BlocProvider 
and attached the event to load the data*/
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return PerformannceSummaryReportBloc(
          individualRepository: context.read<IndividualSearchModel>()
              as IndividualLocalRepository,
          householdRepository:
              context.read<HouseholdSearchModel>() as HouseholdLocalRepository,
          taskRepository:
              context.read<HouseholdSearchModel>() as TaskLocalRepository,
        );
      },
      child: this,
    );
  }
}

class _PerformamnceSummaryReportDetailsPageState
    extends LocalizedState<PerformamnceSummaryReportDetailsPage> {
  static const _productVariantKey = 'productVariant';
  static const _facilityKey = 'facilityKey';
  Map<String, FacilityModel> facilityMap = {};
  void handleSelection(FormGroup form) {
    var createdByUserId = context.loggedInUserUuid;
    final event = PerformanceSummaryReportLoadDataEvent(
      userId: createdByUserId.isEmpty ? '' : createdByUserId,
    );

    context.read<PerformannceSummaryReportBloc>().add(
          const PerformanceSummaryReportLoadingEvent(),
        );

    Future.delayed(const Duration(milliseconds: 500), () {
      context.read<PerformannceSummaryReportBloc>().add(event);
    });
  }

  FormGroup _form() {
    return fb.group({
      _facilityKey: FormControl<FacilityModel>(
        validators: [Validators.required],
      ),
      _productVariantKey: FormControl<ProductVariantModel>(),
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDistributor = context.loggedInUserRoles
        .where(
          (role) => role.code == RolesType.distributor.toValue(),
        )
        .toList()
        .isNotEmpty;

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
      body: BlocBuilder<PerformannceSummaryReportBloc,
          PerformanceSummaryReportState>(
        builder: (context, performanceSumamryReportState) {
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
                padding: const EdgeInsets.all(kPadding),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "title",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
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
                                        if (!isDistributor)
                                          BlocConsumer<FacilityBloc,
                                              FacilityState>(
                                            listener: (context, state) =>
                                                state.whenOrNull(
                                              empty: () =>
                                                  NoFacilitiesAssignedDialog
                                                      .show(
                                                context,
                                              ),
                                            ),
                                            builder: (context, state) {
                                              final facilities =
                                                  state.whenOrNull(
                                                        fetched: (facilities, _,
                                                                __) =>
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
                                              for (var element
                                                  in allFacilities) {
                                                facilityMap[element.id] =
                                                    element;
                                              }

                                              return InkWell(
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
                                                child: IgnorePointer(
                                                  child: DigitTextFormField(
                                                    valueAccessor:
                                                        FacilityValueAccessor(
                                                      facilities,
                                                    ),
                                                    label:
                                                        localizations.translate(
                                                      i18.stockReconciliationDetails
                                                          .facilityLabel,
                                                    ),
                                                    suffix: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Icon(Icons.search),
                                                    ),
                                                    formControlName:
                                                        _facilityKey,
                                                    readOnly: false,
                                                    isRequired: true,
                                                    onTap: () async {
                                                      final stockReconciliationBloc =
                                                          context.read<
                                                              StockReconciliationBloc>();

                                                      final facility =
                                                          await context.router
                                                              .push<
                                                                  FacilityModel>(
                                                        FacilitySelectionRoute(
                                                          facilities:
                                                              facilities,
                                                        ),
                                                      );

                                                      if (facility == null)
                                                        return;
                                                      form
                                                          .control(_facilityKey)
                                                          .value = facility;
                                                      stockReconciliationBloc
                                                          .add(
                                                        StockReconciliationSelectFacilityEvent(
                                                          facility,
                                                        ),
                                                      );

                                                      handleSelection(form);
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        BlocBuilder<ProductVariantBloc,
                                            ProductVariantState>(
                                          builder: (context, state) {
                                            return state.maybeWhen(
                                              orElse: () => const Offstage(),
                                              fetched: (productVariants) {
                                                return DigitReactiveSearchDropdown<
                                                    ProductVariantModel>(
                                                  label:
                                                      localizations.translate(
                                                    i18.stockReconciliationDetails
                                                        .productLabel,
                                                  ),
                                                  form: form,
                                                  menuItems: productVariants,
                                                  formControlName:
                                                      _productVariantKey,
                                                  isRequired: true,
                                                  valueMapper: (value) {
                                                    return localizations
                                                        .translate(
                                                      value.sku ?? value.id,
                                                    );
                                                  },
                                                  onSelected: (value) {
                                                    handleSelection(form);
                                                  },
                                                  validationMessage:
                                                      localizations.translate(
                                                    i18.common
                                                        .corecommonRequired,
                                                  ),
                                                  emptyText:
                                                      localizations.translate(
                                                    i18.common.noMatchFound,
                                                  ),
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
                                      child: performanceSumamryReportState.when(
                                        empty: () => _NoReportContent(
                                          title: "",
                                          message: noFilterMessage,
                                        ),
                                        loading: () {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                        summaryData: (data) {
                                          if (data.isEmpty) {
                                            return Padding(
                                              padding: const EdgeInsets.all(
                                                kPadding * 2,
                                              ),
                                              child: _NoReportContent(
                                                title: "",
                                                message: noRecordsMessage,
                                              ),
                                            );
                                          }

                                          const dateKey = 'date';
                                          const waybillKey = 'waybillNumber';
                                          const quantityKey = 'quantity';
                                          const transactingPartyKey =
                                              'transactingParty';
                                          const batchNumberKey = 'batchNumber';
                                          const expiryDateKey = 'dateOfExpiry';

                                          return _ReportDetailsContent(
                                            title: "",
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
                                                  width: 100,
                                                ),
                                                DigitGridColumn(
                                                  label: "",
                                                  key: quantityKey,
                                                  width: 100,
                                                ),
                                                DigitGridColumn(
                                                  label: "",
                                                  key: transactingPartyKey,
                                                  width: 200,
                                                ),
                                                DigitGridColumn(
                                                  label:
                                                      localizations.translate(
                                                    i18.stockDetails
                                                        .batchNumberLabel,
                                                  ),
                                                  key: batchNumberKey,
                                                  width: 100,
                                                ),
                                                DigitGridColumn(
                                                  label:
                                                      localizations.translate(
                                                    i18.stockDetails
                                                        .dateOfExpiryLabel,
                                                  ),
                                                  key: expiryDateKey,
                                                  width: 100,
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
                                                          value: '',
                                                        ),
                                                        DigitGridCell(
                                                          key: quantityKey,
                                                          value: '',
                                                        ),
                                                        DigitGridCell(
                                                          key:
                                                              transactingPartyKey,
                                                          // value: widget
                                                          //                 .reportType ==
                                                          //             InventoryReportType
                                                          //                 .receipt ||
                                                          //         widget.reportType ==
                                                          //             InventoryReportType
                                                          //                 .dispatch ||
                                                          //         widget.reportType ==
                                                          //             InventoryReportType
                                                          //                 .loss ||
                                                          //         widget.reportType ==
                                                          //             InventoryReportType
                                                          //                 .damage
                                                          //     ? model.receiverId ??
                                                          //         model
                                                          //             .receiverType ??
                                                          //         ''
                                                          //     : model.senderId ??
                                                          //         model
                                                          //             .receiverType ??
                                                          //         '',
                                                          value:
                                                              facilityMap[model]
                                                                      ?.name ??
                                                                  '',
                                                        ),
                                                        DigitGridCell(
                                                          key: batchNumberKey,
                                                          value: model
                                                                  .additionalFields
                                                                  ?.fields
                                                                  .firstWhereOrNull(
                                                                    (element) =>
                                                                        element
                                                                            .key ==
                                                                        batchNumberKey,
                                                                  )
                                                                  ?.value ??
                                                              '',
                                                        ),
                                                        DigitGridCell(
                                                          key: expiryDateKey,
                                                          value: model.additionalFields
                                                                      ?.fields
                                                                      .firstWhereOrNull(
                                                                        (element) =>
                                                                            element.key ==
                                                                            expiryDateKey,
                                                                      )
                                                                      ?.value !=
                                                                  null
                                                              ? DateFormat(
                                                                  'dd MMM yyyy',
                                                                ).format(DateTime
                                                                  .fromMillisecondsSinceEpoch(
                                                                  int.parse(model
                                                                          .additionalFields
                                                                          ?.fields
                                                                          .firstWhereOrNull(
                                                                            (element) =>
                                                                                element.key ==
                                                                                expiryDateKey,
                                                                          )
                                                                          ?.value
                                                                          .toString() ??
                                                                      '0'),
                                                                ))
                                                              : '',
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
      padding: const EdgeInsets.all(kPadding),
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
