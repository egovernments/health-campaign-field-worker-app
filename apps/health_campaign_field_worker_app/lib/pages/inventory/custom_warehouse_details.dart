import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/pages/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_campaign_field_worker_app/blocs/scanner/custom_digit_scanner_bloc.dart';
import 'package:health_campaign_field_worker_app/pages/inventory/custom_inventory_facility_selection.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:inventory_management/utils/i18_key_constants.dart' as i18;
import 'package:inventory_management/widgets/localized.dart';
import 'package:inventory_management/blocs/record_stock.dart';
import 'package:inventory_management/utils/utils.dart';
import 'package:inventory_management/widgets/back_navigation_help_header.dart';
import 'package:inventory_management/widgets/inventory/no_facilities_assigned_dialog.dart';
import 'package:inventory_management/pages/facility_selection.dart';

import '../../router/app_router.dart';

@RoutePage()
class CustomWarehouseDetailsPage extends LocalizedStatefulWidget {
  const CustomWarehouseDetailsPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<CustomWarehouseDetailsPage> createState() =>
      CustomWarehouseDetailsPageState();
}

class CustomWarehouseDetailsPageState
    extends LocalizedState<CustomWarehouseDetailsPage> {
  static const _dateOfEntryKey = 'dateOfReceipt';
  static const _administrativeUnitKey = 'administrativeUnit';
  static const _warehouseKey = 'warehouse';
  static const _teamCodeKey = 'teamCode';
  bool deliveryTeamSelected = false;
  String? selectedFacilityId;

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
          value: localizations.translate(InventorySingleton().boundaryName),
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
                    fetched: (facilities, allFacilities) {
                      final teamFacilities = [
                        FacilityModel(
                          id: 'Delivery Team',
                        ),
                      ];
                      teamFacilities.addAll(
                        facilities,
                      );

                      return InventorySingleton().isDistributor! &&
                              !InventorySingleton().isWareHouseMgr!
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
                  child: BlocBuilder<CustomDigitScannerBloc,
                      CustomDigitScannerState>(
                    builder: (context, scannerState) {
                      return ReactiveFormBuilder(
                        form: () => buildForm(
                            InventorySingleton().isDistributor! &&
                                !InventorySingleton().isWareHouseMgr!,
                            stockState),
                        builder: (context, form, child) {
                          form.control(_teamCodeKey).value =
                              scannerState.qrCodes.isNotEmpty
                                  ? scannerState.qrCodes.last
                                  : '';

                          return ScrollableContent(
                            header: const Column(children: [
                              BackNavigationHelpHeaderWidget(),
                            ]),
                            footer: SizedBox(
                              child: DigitCard(
                                margin: const EdgeInsets.fromLTRB(
                                    0, kPadding, 0, 0),
                                padding: const EdgeInsets.fromLTRB(
                                  kPadding,
                                  0,
                                  kPadding,
                                  0,
                                ),
                                child: ReactiveFormConsumer(
                                  builder: (context, form, child) {
                                    return DigitElevatedButton(
                                      onPressed: !form.valid
                                          ? null
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
                                                  deliveryTeamSelected
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
                                                  .read<
                                                      CustomDigitScannerBloc>()
                                                  .add(
                                                    const CustomDigitScannerEvent
                                                        .handleScanner(
                                                        qrCode: [],
                                                        barCode: []),
                                                  );
                                              if (facility == null) {
                                                DigitToast.show(
                                                  context,
                                                  options: DigitToastOptions(
                                                    localizations.translate(
                                                      i18.stockDetails
                                                          .facilityRequired,
                                                    ),
                                                    true,
                                                    theme,
                                                  ),
                                                );
                                              } else {
                                                recordStockBloc.add(
                                                  RecordStockSaveTransactionDetailsEvent(
                                                    dateOfRecord: dateOfRecord,
                                                    facilityModel: InventorySingleton()
                                                                .isDistributor! &&
                                                            !InventorySingleton()
                                                                .isWareHouseMgr!
                                                        ? FacilityModel(
                                                            id: teamCode
                                                                .toString(),
                                                          )
                                                        : facility,
                                                    primaryId: facility.id ==
                                                            "Delivery Team"
                                                        ? teamCode ?? ''
                                                        : facility.id,
                                                    primaryType: (InventorySingleton()
                                                                    .isDistributor! &&
                                                                !InventorySingleton()
                                                                    .isWareHouseMgr! &&
                                                                deliveryTeamSelected) ||
                                                            deliveryTeamSelected
                                                        ? "STAFF"
                                                        : "WAREHOUSE",
                                                  ),
                                                );
                                                context.router.push(
                                                  CustomStockDetailsRoute(),
                                                );
                                              }
                                            },
                                      child: child!,
                                    );
                                  },
                                  child: Center(
                                    child: Text(
                                      localizations.translate(
                                        i18.householdDetails.actionLabel,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            children: [
                              DigitCard(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
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
                                      style: theme.textTheme.displayMedium,
                                    ),
                                    Column(children: [
                                      DigitDateFormPicker(
                                        isEnabled: false,
                                        formControlName: _dateOfEntryKey,
                                        label: localizations.translate(
                                          i18.warehouseDetails.dateOfReceipt,
                                        ),
                                        isRequired: false,
                                        confirmText: localizations.translate(
                                          i18.common.coreCommonOk,
                                        ),
                                        cancelText: localizations.translate(
                                          i18.common.coreCommonCancel,
                                        ),
                                      ),
                                      DigitTextFormField(
                                        readOnly: true,
                                        formControlName: _administrativeUnitKey,
                                        label: localizations.translate(
                                          i18.warehouseDetails
                                              .administrativeUnit,
                                        ),
                                      ),
                                    ]),
                                    InkWell(
                                      onTap: () async {
                                        clearQRCodes();
                                        form.control(_teamCodeKey).value = '';

                                        final facility =
                                            await Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CustomInventoryFacilitySelectionPage(
                                              facilities: facilities,
                                            ),
                                          ),
                                        );

                                        if (facility == null) return;
                                        form.control(_warehouseKey).value =
                                            localizations.translate(
                                                'FAC_${facility.id}');

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
                                        child: DigitTextFormField(
                                          hideKeyboard: true,
                                          padding: const EdgeInsets.only(
                                            bottom: kPadding,
                                          ),
                                          isRequired: true,
                                          label: localizations.translate(
                                            i18.stockReconciliationDetails
                                                .facilityLabel,
                                          ),
                                          validationMessages: {
                                            'required': (object) =>
                                                localizations.translate(
                                                  '${i18.individualDetails.nameLabelText}_IS_REQUIRED',
                                                ),
                                          },
                                          suffix: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(Icons.search),
                                          ),
                                          formControlName: _warehouseKey,
                                          readOnly: true,
                                          onTap: () async {
                                            context
                                                .read<CustomDigitScannerBloc>()
                                                .add(
                                                  const CustomDigitScannerEvent
                                                      .handleScanner(
                                                    barCode: [],
                                                    qrCode: [],
                                                  ),
                                                );
                                            form.control(_teamCodeKey).value =
                                                '';
                                            final facility =
                                                await Navigator.of(context)
                                                    .push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CustomInventoryFacilitySelectionPage(
                                                  facilities: facilities,
                                                ),
                                              ),
                                            );

                                            if (facility == null) return;
                                            form.control(_warehouseKey).value =
                                                localizations.translate(
                                                    'FAC_${facility.id}');

                                            setState(() {
                                              selectedFacilityId = facility.id;
                                            });
                                            if (facility.id ==
                                                'Delivery Team') {
                                              setState(() {
                                                deliveryTeamSelected = true;
                                              });
                                            } else {
                                              setState(() {
                                                deliveryTeamSelected = false;
                                              });
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
    context
        .read<CustomDigitScannerBloc>()
        .add(const CustomDigitScannerEvent.handleScanner(
          barCode: [],
          qrCode: [],
        ));
  }
}
