import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/pages/qr_scanner.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/input_wrapper.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../../widgets/localized.dart';
import '../../blocs/record_stock.dart';
import '../../utils/constants.dart';
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/inventory/no_facilities_assigned_dialog.dart';

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
                                  ? scannerState.qrCodes.firstOrNull
                                  : '';

                          return ScrollableContent(
                            header: const Column(children: [
                              BackNavigationHelpHeaderWidget(),
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
                                          isDisabled: !form.valid,
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
                                                        primaryId: facility
                                                                    .id ==
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
                                        );
                                      },
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
                                            label: localizations.translate(
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
                                            initialValue: DateFormat('dd/MM/yy')
                                                .format(field.control.value),
                                            readOnly: true,
                                          );
                                        }),
                                    ReactiveWrapperField(
                                        formControlName: _administrativeUnitKey,
                                        builder: (field) {
                                          return InputField(
                                            type: InputType.text,
                                            label: localizations.translate(
                                              i18.warehouseDetails
                                                  .administrativeUnit,
                                            ),
                                            initialValue: field.control.value,
                                            readOnly: true,
                                          );
                                        }),
                                    ReactiveWrapperField(
                                      formControlName: _warehouseKey,
                                      builder: (field) => LabeledField(
                                          label: localizations.translate(
                                            i18.stockReconciliationDetails
                                                .facilityLabel,
                                          ),
                                          isRequired: true,
                                          child: DigitDropdown(
                                            sentenceCaseEnabled: false,
                                            selectedOption: DropdownItem(
                                              name: form
                                                      .control(_warehouseKey)
                                                      .value ??
                                                  '',
                                              code: selectedFacilityId ?? '',
                                            ),
                                            isSearchable: true,
                                            emptyItemText:
                                                localizations.translate(
                                                    i18.common.noMatchFound),
                                            errorMessage: field.errorText,
                                            onSelect: (value) {
                                              clearQRCodes();
                                              form.control(_teamCodeKey).value =
                                                  '';

                                              form
                                                      .control(_warehouseKey)
                                                      .value =
                                                  localizations.translate(
                                                      'FAC_${value.code}');
                                              controller1.text =
                                                  localizations.translate(
                                                      'FAC_${value.code}');

                                              setState(() {
                                                selectedFacilityId = value.code;
                                              });

                                              if (value.code ==
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
                                            items: facilities.map((e) {
                                              return DropdownItem(
                                                name: localizations.translate(
                                                    '$facilityPrefix${e.id}'),
                                                code: e.id,
                                              );
                                            }).toList(),
                                          )),
                                    ),
                                    if (deliveryTeamSelected)
                                      ReactiveWrapperField(
                                          formControlName: _teamCodeKey,
                                          builder: (field) {
                                            return InputField(
                                              type: InputType.search,
                                              label: localizations.translate(
                                                i18.stockReconciliationDetails
                                                    .teamCodeLabel,
                                              ),
                                              initialValue: form
                                                  .control(_teamCodeKey)
                                                  .value,
                                              isRequired: deliveryTeamSelected,
                                              suffixIcon: Icons.qr_code_2,
                                              onSuffixTap: (value) {
                                                //[TODO: Add route to auto_route]
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const DigitScannerPage(
                                                      quantity: 5,
                                                      isGS1code: false,
                                                      singleValue: false,
                                                    ),
                                                    settings:
                                                        const RouteSettings(
                                                            name:
                                                                '/qr-scanner'),
                                                  ),
                                                );
                                              },
                                              onChange: (val) {
                                                String? value = val;
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
}
