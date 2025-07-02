import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/pages/qr_scanner.dart';
import 'package:digit_scanner/router/digit_scanner_router.gm.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/input_wrapper.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:inventory_management/blocs/stock.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';
import 'package:inventory_management/utils/constants.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../../widgets/localized.dart';
import '../../blocs/record_stock.dart';
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/inventory/no_facilities_assigned_dialog.dart';
import '../facility_selection.dart';

@RoutePage()
class WarehouseDetailsPage extends LocalizedStatefulWidget {
  const WarehouseDetailsPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<WarehouseDetailsPage> createState() => WarehouseDetailsPageState();
}

class WarehouseDetailsPageState extends LocalizedState<WarehouseDetailsPage> {
  static const _dateOfEntryKey = 'dateOfReceipt';
  static const _administrativeUnitKey = 'administrativeUnit';
  static const _warehouseKey = 'warehouse';
  static const _teamCodeKey = 'teamCode';
  bool deliveryTeamSelected = false;
  String? selectedFacilityId;
  TextEditingController controller1 = TextEditingController();

  @override
  void initState() {
    clearQRCodes();
    final stockState = context.read<RecordStockBloc>().state;
    setState(() {
      selectedFacilityId = stockState.primaryId;
    });
    super.initState();
  }

  FormGroup buildForm(bool isDistributor, RecordStockState stockState) =>
      fb.group(<String, Object>{
        _dateOfEntryKey: FormControl<DateTime>(value: DateTime.now()),
        _administrativeUnitKey: FormControl<String>(
          value: localizations
              .translate(InventorySingleton().boundary!.code ?? ''),
        ),
        _warehouseKey: FormControl<String>(
          validators: [Validators.required],
        ),
        _teamCodeKey: FormControl<String>(
          value: stockState.primaryId ?? '',
          validators: deliveryTeamSelected ? [Validators.required] : [],
        ),
      });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final recordStockBloc = BlocProvider.of<RecordStockBloc>(context);
    final textTheme = theme.digitTextTheme(context);

    return InventorySingleton().projectId.isEmpty
        ? Center(
            child: Text(localizations
                .translate(i18.stockReconciliationDetails.noProjectSelected)))
        : BlocConsumer<FacilityBloc, FacilityState>(
            listener: (context, state) {
              state.whenOrNull(
                empty: () =>
                    NoFacilitiesAssignedDialog.show(context, localizations),
              );
            },
            builder: (ctx, facilityState) {
              final facilities = facilityState.whenOrNull(
                    fetched: (facilities, allfacilities) {
                      // if (ctx.selectedProject.address?.boundaryType ==
                      //     Constants.stateBoundaryLevel)
                      if (true) {
                        List<FacilityModel> filteredFacilities = [];
                        // facilities
                        //     .where(
                        //       (element) =>
                        //           element.usage == Constants.stateFacility,
                        //     )
                        //     .toList();
                        facilities = filteredFacilities.isEmpty
                            ? facilities
                            : filteredFacilities;
                      }
                      //  else if (ctx.selectedProject.address?.boundaryType ==
                      //     Constants.lgaBoundaryLevel) {
                      //   List<FacilityModel> filteredFacilities = [];
                      //   //TODO:
                      //   //  facilities
                      //   //     .where(
                      //   //       (element) =>
                      //   //           element.usage == Constants.lgaFacility,
                      //   //     )
                      //   //     .toList();
                      //   facilities = filteredFacilities.isEmpty
                      //       ? facilities
                      //       : filteredFacilities;
                      // }

                      else {
                        List<FacilityModel> filteredFacilities = [];
                        //TODO:
                        // facilities
                        //     .where(
                        //       (element) =>
                        //           element.usage == Constants.healthFacility,
                        //     )
                        //     .toList();
                        facilities = filteredFacilities.isEmpty
                            ? facilities
                            : filteredFacilities;
                      }
                      final teamFacilities = [
                        FacilityModel(
                          id: 'Delivery Team',
                          name: 'Delivery Team',
                        ),
                      ];
                      teamFacilities.addAll(
                        facilities,
                      );

                      return InventorySingleton().isDistributor &&
                              !InventorySingleton().isWareHouseMgr
                          ? teamFacilities
                          : facilities;
                    },
                  ) ??
                  [];
              final stockState = recordStockBloc.state;

              return Scaffold(
                body: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: BlocBuilder<DigitScannerBloc, DigitScannerState>(
                    builder: (context, scannerState) {
                      return ReactiveFormBuilder(
                        form: () => buildForm(
                            InventorySingleton().isDistributor! &&
                                !InventorySingleton().isWareHouseMgr!,
                            stockState),
                        builder: (context, form, child) {
                          // form.control(_teamCodeKey).value =
                          //     scannerState.qrCodes.isNotEmpty
                          //         ? scannerState.qrCodes.firstOrNull
                          //         : '';

                          return ScrollableContent(
                            header: const Column(children: [
                              BackNavigationHelpHeaderWidget(
                                showHelp: false,
                              ),
                            ]),
                            footer: SizedBox(
                              child: DigitCard(
                                  margin: const EdgeInsets.fromLTRB(
                                      0, spacer2, 0, 0),
                                  children: [
                                    ReactiveFormConsumer(
                                      builder: (context, form, child) {
                                        return DigitButton(
                                          type: DigitButtonType.primary,
                                          mainAxisSize: MainAxisSize.max,
                                          size: DigitButtonSize.large,
                                          // isDisabled: !form.valid,
                                          label: localizations.translate(
                                            i18.householdDetails.actionLabel,
                                          ),
                                          onPressed: !form.valid
                                              ? () {}
                                              : () {
                                                  form.markAllAsTouched();
                                                  if (!form.valid) {
                                                    return;
                                                  }
                                                  final dateOfRecord = form
                                                      .control(_dateOfEntryKey)
                                                      .value as DateTime;

                                                  final teamCode = form
                                                      .control(_teamCodeKey)
                                                      .value as String?;

                                                  final facility =
                                                      InventorySingleton()
                                                              .isDistributor
                                                          ? FacilityModel(
                                                              id: teamCode ??
                                                                  'Delivery Team',
                                                            )
                                                          : selectedFacilityId !=
                                                                  null
                                                              ? FacilityModel(
                                                                  id: selectedFacilityId
                                                                      .toString(),
                                                                )
                                                              : null;

                                                  context
                                                      .read<DigitScannerBloc>()
                                                      .add(
                                                        const DigitScannerEvent
                                                            .handleScanner(
                                                            qrCode: [],
                                                            barCode: []),
                                                      );
                                                  if (facility == null) {
                                                    Toast.showToast(
                                                      type: ToastType.error,
                                                      context,
                                                      message: localizations
                                                          .translate(
                                                        i18.stockDetails
                                                            .facilityRequired,
                                                      ),
                                                    );
                                                  } else if (deliveryTeamSelected &&
                                                      (teamCode == null ||
                                                          teamCode
                                                              .trim()
                                                              .isEmpty)) {
                                                    Toast.showToast(
                                                      context,
                                                      type: ToastType.error,
                                                      message: localizations
                                                          .translate(
                                                        i18.stockDetails
                                                            .teamCodeRequired,
                                                      ),
                                                    );
                                                  } else {
                                                    recordStockBloc.add(
                                                      RecordStockSaveTransactionDetailsEvent(
                                                        dateOfRecord:
                                                            dateOfRecord,
                                                        facilityModel: InventorySingleton()
                                                                    .isDistributor! &&
                                                                !InventorySingleton()
                                                                    .isWareHouseMgr!
                                                            ? FacilityModel(
                                                                id: teamCode
                                                                    .toString(),
                                                              )
                                                            : facility,
                                                        primaryId:
                                                            InventorySingleton()
                                                                    .isDistributor
                                                                ? (teamCode ??
                                                                        '')
                                                                    .split(
                                                                        pipeSeparator)
                                                                    .last
                                                                : facility.id,
                                                        primaryType:
                                                            InventorySingleton()
                                                                    .isCDD
                                                                ? "STAFF"
                                                                : "WAREHOUSE",
                                                      ),
                                                    );
                                                    if ((InventorySingleton().isWareHouseMgr &&
                                                            !InventorySingleton()
                                                                .isLgaUser &&
                                                            !InventorySingleton()
                                                                .isHFU &&
                                                            !InventorySingleton()
                                                                .isCDD) ||
                                                        (recordStockBloc.state
                                                                .entryType ==
                                                            StockRecordEntryType
                                                                .dispatch) ||
                                                        (recordStockBloc.state
                                                                .entryType ==
                                                            StockRecordEntryType
                                                                .returned)) {
                                                      context.router.push(
                                                        StockDetailsRoute(),
                                                      );
                                                    } else {
                                                      context.router.push(ViewAllTransactionsRoute(
                                                          warehouseId: InventorySingleton()
                                                                  .isDistributor
                                                              ? (teamCode ?? '')
                                                                  .split(
                                                                      pipeSeparator)
                                                                  .last
                                                              : selectedFacilityId));
                                                    }
                                                  }
                                                },
                                        );
                                      },
                                    ),
                                    if (InventorySingleton().isDistributor &&
                                        stockState.entryType !=
                                            StockRecordEntryType.dispatch)
                                      DigitButton(
                                        label: "Scan Resource",
                                        onPressed: _handleSubmission,
                                        type: DigitButtonType.primary,
                                        mainAxisSize: MainAxisSize.max,
                                        size: DigitButtonSize.large,
                                      ),
                                  ]),
                            ),
                            children: [
                              DigitCard(
                                  margin: const EdgeInsets.all(spacer2),
                                  children: [
                                    Text(
                                      InventorySingleton().isDistributor! &&
                                              !InventorySingleton()
                                                  .isWareHouseMgr!
                                          ? localizations.translate(
                                              i18.stockDetails
                                                  .transactionDetailsLabel,
                                            )
                                          : localizations.translate(
                                              i18.warehouseDetails
                                                  .warehouseDetailsLabel,
                                            ),
                                      style: textTheme.headingXl,
                                    ),
                                    ReactiveWrapperField(
                                        formControlName: _dateOfEntryKey,
                                        builder: (field) {
                                          return InputField(
                                            type: InputType.date,
                                            label: stockState.entryType ==
                                                    StockRecordEntryType
                                                        .returned
                                                ? localizations.translate(
                                                    "i18.warehouseDetailsShowcase.dateOfReturn",
                                                  )
                                                : localizations.translate(
                                                    i18.warehouseDetails
                                                        .dateOfReceipt,
                                                  ),
                                            confirmText:
                                                localizations.translate(
                                              i18.common.coreCommonOk,
                                            ),
                                            cancelText: localizations.translate(
                                              i18.common.coreCommonCancel,
                                            ),
                                            initialValue: DateFormat(
                                                    'dd MMM yyyy')
                                                .format(field.control.value),
                                            readOnly: true,
                                          );
                                        }),
                                    ReactiveWrapperField(
                                        formControlName: _administrativeUnitKey,
                                        builder: (field) {
                                          return InputField(
                                            isRequired: true,
                                            type: InputType.text,
                                            label: localizations.translate(i18
                                                .warehouseDetails
                                                .administrativeUnit),
                                            initialValue: field.control.value,
                                            readOnly: true,
                                          );
                                        }),
                                    if (!InventorySingleton().isDistributor)
                                      InkWell(
                                        onTap: () async {
                                          // clearQRCodes();
                                          // form.control(_teamCodeKey).value = '';

                                          final facility =
                                              await Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  InventoryFacilitySelectionPage(
                                                facilities: facilities,
                                              ),
                                            ),
                                          );

                                          if (facility == null) return;
                                          form.control(_warehouseKey).value =
                                              localizations.translate(
                                                  'FAC_${facility.id}');
                                          controller1.text = localizations
                                              .translate('FAC_${facility.id}');

                                          setState(() {
                                            selectedFacilityId = facility.id;
                                          });
                                          if (facility.id == 'Delivery Team') {
                                            setState(() {
                                              deliveryTeamSelected = true;
                                            });
                                          } else {
                                            setState(() {
                                              deliveryTeamSelected = false;
                                            });
                                          }
                                        },
                                        child: IgnorePointer(
                                          child: ReactiveWrapperField(
                                              formControlName: _warehouseKey,
                                              validationMessages: {
                                                'required': (object) =>
                                                    localizations.translate(
                                                      '${i18.individualDetails.nameLabelText}_IS_REQUIRED',
                                                    ),
                                              },
                                              showErrors: (control) =>
                                                  control.invalid &&
                                                  control.touched,
                                              builder: (field) {
                                                return InputField(
                                                  type: InputType.search,
                                                  label:
                                                      localizations.translate(
                                                    i18.stockReconciliationDetails
                                                        .facilityLabel,
                                                  ),
                                                  controller: controller1,
                                                  isRequired: true,
                                                  errorMessage: field.errorText,
                                                  onChange: (value) {
                                                    field.control
                                                        .markAsTouched();
                                                  },
                                                );
                                              }),
                                        ),
                                      ),
                                    if (InventorySingleton().isDistributor)
                                      ReactiveWrapperField(
                                          formControlName: _teamCodeKey,
                                          builder: (field) {
                                            return InputField(
                                              type: InputType.text,
                                              isDisabled: true,
                                              label: localizations.translate(
                                                "i18.stockDetails.cddCodeLabel",
                                              ),
                                              initialValue: form
                                                  .control(_teamCodeKey)
                                                  .value,
                                              isRequired: InventorySingleton()
                                                  .isDistributor,
                                            );
                                          })
                                  ]),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              );
            },
          );
  }

  void clearQRCodes() {
    context.read<DigitScannerBloc>().add(const DigitScannerEvent.handleScanner(
          barCode: [],
          qrCode: [],
        ));
  }

  void _handleSubmission() {
    if (InventorySingleton().isDistributor) {
      context.router.push(DigitScannerRoute(
        quantity: 1,
        isGS1code: false,
        singleValue: true,
      ));
    }
  }
}
