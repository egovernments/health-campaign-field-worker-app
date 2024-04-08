import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/pages/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/blocs/inventory_listener.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../../widgets/localized.dart';
import '../../blocs/facility.dart';
import '../../blocs/record_stock.dart';
import '../../blocs/scanner.dart';
import '../../models/entities/inventory_facility.dart';
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
  State<WarehouseDetailsPage> createState() => _WarehouseDetailsPageState();
}

class _WarehouseDetailsPageState extends LocalizedState<WarehouseDetailsPage> {
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
          value: InventorySingleton().boundaryName,
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
        ? const Center(child: Text('No project selected'))
        : BlocConsumer<FacilityBloc, FacilityState>(
            listener: (context, state) {
              state.whenOrNull(
                empty: () => NoFacilitiesAssignedDialog.show(context),
              );
            },
            builder: (ctx, facilityState) {
              final facilities = facilityState.whenOrNull(
                    fetched: (
                      facilities,
                    ) {
                      final teamFacilities = [
                        InventoryFacilityModel(
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
                  child: BlocBuilder<DigitScannerBloc, DigitScannerState>(
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

                                              final facility = deliveryTeamSelected
                                                  ? InventoryFacilityModel(
                                                      id: teamCode ??
                                                          'Delivery Team',
                                                    )
                                                  : selectedFacilityId != null
                                                      ? InventoryFacilityModel(
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
                                              } else if (deliveryTeamSelected &&
                                                  (teamCode == null ||
                                                      teamCode
                                                          .trim()
                                                          .isEmpty)) {
                                                DigitToast.show(
                                                  context,
                                                  options: DigitToastOptions(
                                                    localizations.translate(
                                                      i18.stockDetails
                                                          .teamCodeRequired,
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
                                                        ? InventoryFacilityModel(
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
                                                  StockDetailsRoute(),
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
                                                InventoryFacilitySelectionPage(
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
                                                .read<DigitScannerBloc>()
                                                .add(
                                                  const DigitScannerEvent
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
                                                    InventoryFacilitySelectionPage(
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
                                    if (deliveryTeamSelected)
                                      DigitTextFormField(
                                        label: localizations.translate(
                                          i18.stockReconciliationDetails
                                              .teamCodeLabel,
                                        ),
                                        formControlName: _teamCodeKey,
                                        onChanged: (val) {
                                          String? value = val as String?;
                                          if (value != null &&
                                              value.trim().isNotEmpty) {
                                            context
                                                .read<DigitScannerBloc>()
                                                .add(
                                                  DigitScannerEvent
                                                      .handleScanner(
                                                    barCode: [],
                                                    qrCode: [value],
                                                  ),
                                                );
                                          } else {
                                            clearQRCodes();
                                          }
                                        },
                                        isRequired: true,
                                        suffix: IconButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DigitScannerPage(
                                                  scannerListeners:
                                                      HCMScannerBloc(),
                                                  quantity: 1,
                                                  isGS1code: true,
                                                  singleValue: false,
                                                ),
                                                settings: const RouteSettings(
                                                    name: '/qr-scanner'),
                                              ),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.qr_code_2,
                                            color: theme.colorScheme.secondary,
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
    context.read<DigitScannerBloc>().add(const DigitScannerEvent.handleScanner(
          barCode: [],
          qrCode: [],
        ));
  }
}
