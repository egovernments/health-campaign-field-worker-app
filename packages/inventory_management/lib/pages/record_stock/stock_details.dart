import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/pages/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';
import 'package:inventory_management/utils/extensions/extensions.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';
import '../../../widgets/localized.dart';
import '../../blocs/product_variant.dart';
import '../../blocs/record_stock.dart';
import '../../models/entities/inventory_transport_type.dart';
import '../../models/entities/stock.dart';
import '../../models/entities/transaction_reason.dart';
import '../../models/entities/transaction_type.dart';
import '../../widgets/back_navigation_help_header.dart';

@RoutePage()
class StockDetailsPage extends LocalizedStatefulWidget {
  const StockDetailsPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<StockDetailsPage> createState() => _StockDetailsPageState();
}

class _StockDetailsPageState extends LocalizedState<StockDetailsPage> {
  static const _productVariantKey = 'productVariant';
  static const _secondaryPartyKey = 'secondaryParty';
  static const _transactionQuantityKey = 'quantity';
  static const _transactionReasonKey = 'transactionReason';
  static const _waybillNumberKey = 'waybillNumber';
  static const _waybillQuantityKey = 'waybillQuantity';
  static const _vehicleNumberKey = 'vehicleNumber';
  static const _typeOfTransportKey = 'typeOfTransport';
  static const _commentsKey = 'comments';
  static const _deliveryTeamKey = 'deliveryTeam';
  bool deliveryTeamSelected = false;
  String? selectedFacilityId;
  List<InventoryTransportTypes> transportTypes = [];

  FormGroup _form(StockRecordEntryType stockType) {
    return fb.group({
      _productVariantKey: FormControl<ProductVariantModel>(),
      _secondaryPartyKey: FormControl<String>(
        validators: [Validators.required],
      ),
      _transactionQuantityKey: FormControl<int>(validators: [
        Validators.number,
        Validators.required,
        Validators.min(0),
        Validators.max(10000),
      ]),
      _transactionReasonKey: FormControl<String>(),
      _waybillNumberKey: FormControl<String>(),
      _waybillQuantityKey: FormControl<String>(),
      _vehicleNumberKey: FormControl<String>(),
      _typeOfTransportKey: FormControl<String>(),
      _commentsKey: FormControl<String>(),
      _deliveryTeamKey: FormControl<String>(
        validators: deliveryTeamSelected ? [Validators.required] : [],
      ),
    });
  }

  @override
  void initState() {
    clearQRCodes();
    transportTypes = InventorySingleton().transportType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    bool isWareHouseMgr = InventorySingleton().isWareHouseMgr;
    final parser = GS1BarcodeParser.defaultParser();

    return PopScope(
      onPopInvoked: (didPop) {
        final stockState = context.read<RecordStockBloc>().state;
        if (stockState.primaryId != null) {
          context.read<DigitScannerBloc>().add(
                DigitScannerEvent.handleScanner(
                  barCode: [],
                  qrCode: [stockState.primaryId.toString()],
                ),
              );
        }
      },
      child: Scaffold(
        body: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, locationState) {
            return BlocConsumer<RecordStockBloc, RecordStockState>(
              listener: (context, stockState) {
                stockState.mapOrNull(
                  persisted: (value) {
                    final parent = context.router.parent() as StackRouter;
                    parent.replace(
                      InventoryAcknowledgementRoute(),
                    );
                  },
                );
              },
              builder: (context, stockState) {
                StockRecordEntryType entryType = stockState.entryType;

                const module = i18.stockDetails;

                String pageTitle;
                String transactionPartyLabel;
                String quantityCountLabel;
                String? transactionReasonLabel;
                String? transactionReason;
                String transactionType;

                List<String>? reasons;

                switch (entryType) {
                  case StockRecordEntryType.receipt:
                    pageTitle = module.receivedPageTitle;
                    transactionPartyLabel =
                        module.selectTransactingPartyReceived;
                    quantityCountLabel = module.quantityReceivedLabel;
                    transactionType = TransactionType.received.toValue();

                    break;
                  case StockRecordEntryType.dispatch:
                    pageTitle = module.issuedPageTitle;
                    transactionPartyLabel = module.selectTransactingPartyIssued;
                    quantityCountLabel = module.quantitySentLabel;
                    transactionType = TransactionType.dispatched.toValue();

                    break;
                  case StockRecordEntryType.returned:
                    pageTitle = module.returnedPageTitle;
                    transactionPartyLabel =
                        module.selectTransactingPartyReturned;
                    quantityCountLabel = module.quantityReturnedLabel;
                    transactionType = TransactionType.received.toValue();
                    break;
                  case StockRecordEntryType.loss:
                    pageTitle = module.lostPageTitle;
                    quantityCountLabel = module.quantityLostLabel;
                    transactionReasonLabel = module.transactionReasonLost;
                    transactionType = TransactionType.dispatched.toValue();

                    reasons = [
                      TransactionReason.lostInStorage.toValue(),
                      TransactionReason.lostInTransit.toValue(),
                    ];
                    break;
                  case StockRecordEntryType.damaged:
                    pageTitle = module.damagedPageTitle;
                    transactionPartyLabel =
                        module.selectTransactingPartyReceivedFromDamaged;
                    quantityCountLabel = module.quantityDamagedLabel;
                    transactionReasonLabel = module.transactionReasonDamaged;
                    transactionType = TransactionType.dispatched.toValue();

                    reasons = [
                      TransactionReason.damagedInStorage.toValue(),
                      TransactionReason.damagedInTransit.toValue(),
                    ];
                    break;
                }

                transactionReasonLabel ??= '';

                return ReactiveFormBuilder(
                  form: () => _form(entryType),
                  builder: (context, form, child) {
                    return BlocBuilder<DigitScannerBloc, DigitScannerState>(
                        builder: (context, scannerState) {
                      return ScrollableContent(
                        header: Column(children: [
                          BackNavigationHelpHeaderWidget(
                            handleBack: () {
                              final stockState =
                                  context.read<RecordStockBloc>().state;
                              if (stockState.primaryId != null) {
                                context.read<DigitScannerBloc>().add(
                                      DigitScannerEvent.handleScanner(
                                        barCode: [],
                                        qrCode: [
                                          stockState.primaryId.toString()
                                        ],
                                      ),
                                    );
                              }
                            },
                          ),
                        ]),
                        enableFixedButton: true,
                        footer: DigitCard(
                          margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                          padding: const EdgeInsets.fromLTRB(
                            kPadding,
                            0,
                            kPadding,
                            0,
                          ),
                          child: ReactiveFormConsumer(
                            builder: (context, form, child) =>
                                DigitElevatedButton(
                              onPressed: !form.valid
                                  ? null
                                  : () async {
                                      form.markAllAsTouched();
                                      if (!form.valid) {
                                        return;
                                      }
                                      final primaryId =
                                          BlocProvider.of<RecordStockBloc>(
                                        context,
                                      ).state.primaryId;
                                      final secondaryParty =
                                          selectedFacilityId != null
                                              ? FacilityModel(
                                                  id: selectedFacilityId
                                                      .toString(),
                                                )
                                              : null;
                                      final deliveryTeamName = form
                                          .control(_deliveryTeamKey)
                                          .value as String?;

                                      if (deliveryTeamSelected &&
                                          (form
                                                      .control(
                                                        _deliveryTeamKey,
                                                      )
                                                      .value ==
                                                  null ||
                                              form
                                                  .control(_deliveryTeamKey)
                                                  .value
                                                  .toString()
                                                  .trim()
                                                  .isEmpty)) {
                                        DigitToast.show(
                                          context,
                                          options: DigitToastOptions(
                                            localizations.translate(
                                              i18.stockDetails.teamCodeRequired,
                                            ),
                                            true,
                                            theme,
                                          ),
                                        );
                                      } else if ((primaryId ==
                                              secondaryParty?.id) ||
                                          (primaryId == deliveryTeamName)) {
                                        DigitToast.show(
                                          context,
                                          options: DigitToastOptions(
                                            localizations.translate(
                                              i18.stockDetails
                                                  .senderReceiverValidation,
                                            ),
                                            true,
                                            theme,
                                          ),
                                        );
                                      } else {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();

                                        final bloc =
                                            context.read<RecordStockBloc>();

                                        final productVariant = form
                                            .control(_productVariantKey)
                                            .value as ProductVariantModel;

                                        switch (entryType) {
                                          case StockRecordEntryType.receipt:
                                            transactionReason =
                                                TransactionReason.received
                                                    .toValue();
                                            break;
                                          case StockRecordEntryType.dispatch:
                                            transactionReason = null;
                                            break;
                                          case StockRecordEntryType.returned:
                                            transactionReason =
                                                TransactionReason.returned
                                                    .toValue();
                                            break;
                                          default:
                                            transactionReason = form
                                                .control(
                                                  _transactionReasonKey,
                                                )
                                                .value as String?;
                                            break;
                                        }

                                        final quantity = form
                                            .control(_transactionQuantityKey)
                                            .value;

                                        final waybillNumber = form
                                            .control(_waybillNumberKey)
                                            .value as String?;

                                        final waybillQuantity = form
                                            .control(_waybillQuantityKey)
                                            .value as String?;

                                        final vehicleNumber = form
                                            .control(_vehicleNumberKey)
                                            .value as String?;

                                        final lat = locationState.latitude;
                                        final lng = locationState.longitude;

                                        final hasLocationData =
                                            lat != null && lng != null;

                                        final comments = form
                                            .control(_commentsKey)
                                            .value as String?;

                                        final deliveryTeamName = form
                                            .control(_deliveryTeamKey)
                                            .value as String?;

                                        String? senderId;
                                        String? senderType;
                                        String? receiverId;
                                        String? receiverType;

                                        final primaryType =
                                            BlocProvider.of<RecordStockBloc>(
                                          context,
                                        ).state.primaryType;

                                        final primaryId =
                                            BlocProvider.of<RecordStockBloc>(
                                          context,
                                        ).state.primaryId;

                                        switch (entryType) {
                                          case StockRecordEntryType.receipt:
                                          case StockRecordEntryType.loss:
                                          case StockRecordEntryType.damaged:
                                            if (deliveryTeamSelected) {
                                              senderId = deliveryTeamName;
                                              senderType = "STAFF";
                                            } else {
                                              senderId = secondaryParty?.id;
                                              senderType = "WAREHOUSE";
                                            }
                                            receiverId = primaryId;
                                            receiverType = primaryType;

                                            break;
                                          case StockRecordEntryType.dispatch:
                                          case StockRecordEntryType.returned:
                                            if (deliveryTeamSelected) {
                                              receiverId = deliveryTeamName;
                                              receiverType = "STAFF";
                                            } else {
                                              receiverId = secondaryParty?.id;
                                              receiverType = "WAREHOUSE";
                                            }
                                            senderId = primaryId;
                                            senderType = primaryType;
                                            break;
                                        }

                                        final stockModel = StockModel(
                                          clientReferenceId: IdGen.i.identifier,
                                          productVariantId: productVariant.id,
                                          transactionReason: transactionReason,
                                          transactionType: transactionType,
                                          referenceId: stockState.projectId,
                                          referenceIdType: 'PROJECT',
                                          quantity: quantity.toString(),
                                          waybillNumber: waybillNumber,
                                          receiverId: receiverId,
                                          receiverType: receiverType,
                                          senderId: senderId,
                                          senderType: senderType,
                                          auditDetails: AuditDetails(
                                            createdBy: InventorySingleton()
                                                .loggedInUserUuid,
                                            createdTime: context
                                                .millisecondsSinceEpoch(),
                                          ),
                                          clientAuditDetails:
                                              ClientAuditDetails(
                                            createdBy: InventorySingleton()
                                                .loggedInUserUuid,
                                            createdTime: context
                                                .millisecondsSinceEpoch(),
                                            lastModifiedBy: InventorySingleton()
                                                .loggedInUserUuid,
                                            lastModifiedTime: context
                                                .millisecondsSinceEpoch(),
                                          ),
                                          additionalFields: [
                                                    waybillQuantity,
                                                    vehicleNumber,
                                                    comments,
                                                  ].any((element) =>
                                                      element != null) ||
                                                  hasLocationData
                                              ? StockAdditionalFields(
                                                  version: 1,
                                                  fields: [
                                                    if (waybillQuantity !=
                                                            null &&
                                                        waybillQuantity
                                                            .trim()
                                                            .isNotEmpty)
                                                      AdditionalField(
                                                        'waybill_quantity',
                                                        waybillQuantity,
                                                      ),
                                                    if (vehicleNumber != null &&
                                                        vehicleNumber
                                                            .trim()
                                                            .isNotEmpty)
                                                      AdditionalField(
                                                        'vehicle_number',
                                                        vehicleNumber,
                                                      ),
                                                    if (comments != null &&
                                                        comments
                                                            .trim()
                                                            .isNotEmpty)
                                                      AdditionalField(
                                                        'comments',
                                                        comments,
                                                      ),
                                                    if (deliveryTeamName !=
                                                            null &&
                                                        deliveryTeamName
                                                            .trim()
                                                            .isNotEmpty)
                                                      AdditionalField(
                                                        'deliveryTeam',
                                                        deliveryTeamName,
                                                      ),
                                                    if (hasLocationData) ...[
                                                      AdditionalField(
                                                        'lat',
                                                        lat,
                                                      ),
                                                      AdditionalField(
                                                        'lng',
                                                        lng,
                                                      ),
                                                    ],
                                                  ],
                                                )
                                              : null,
                                        );

                                        bloc.add(
                                          RecordStockSaveStockDetailsEvent(
                                            stockModel: stockModel,
                                          ),
                                        );

                                        final submit =
                                            await DigitDialog.show<bool>(
                                          context,
                                          options: DigitDialogOptions(
                                            key: const Key('submitDialog'),
                                            titleText: localizations.translate(
                                              i18.stockDetails.dialogTitle,
                                            ),
                                            contentText:
                                                localizations.translate(
                                              i18.stockDetails.dialogContent,
                                            ),
                                            primaryAction: DigitDialogActions(
                                              label: localizations.translate(
                                                i18.common.coreCommonSubmit,
                                              ),
                                              action: (context) {
                                                Navigator.of(
                                                  context,
                                                  rootNavigator: true,
                                                ).pop(true);
                                              },
                                            ),
                                            secondaryAction: DigitDialogActions(
                                              label: localizations.translate(
                                                i18.common.coreCommonCancel,
                                              ),
                                              action: (context) => Navigator.of(
                                                context,
                                                rootNavigator: true,
                                              ).pop(false),
                                            ),
                                          ),
                                        );

                                        if (submit ?? false) {
                                          bloc.add(
                                            const RecordStockCreateStockEntryEvent(),
                                          );
                                        }
                                      }
                                    },
                              child: Center(
                                child: Text(
                                  localizations
                                      .translate(i18.common.coreCommonSubmit),
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
                                  localizations.translate(pageTitle),
                                  style: theme.textTheme.displayMedium,
                                ),
                                BlocBuilder<InventoryProductVariantBloc,
                                    InventoryProductVariantState>(
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                      orElse: () => const Offstage(),
                                      loading: () => const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                      empty: () => Center(
                                        child: Text(localizations.translate(
                                          i18.stockDetails.noProductsFound,
                                        )),
                                      ),
                                      fetched: (productVariants) {
                                        return DigitReactiveDropdown<
                                            ProductVariantModel>(
                                          key: const Key(_productVariantKey),
                                          formControlName: _productVariantKey,
                                          label: localizations.translate(
                                            module.selectProductLabel,
                                          ),
                                          isRequired: true,
                                          valueMapper: (value) {
                                            return localizations.translate(
                                              value.sku ?? value.id,
                                            );
                                          },
                                          menuItems: productVariants,
                                          validationMessages: {
                                            'required': (object) =>
                                                '${module.selectProductLabel}_IS_REQUIRED',
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                                if ([
                                  StockRecordEntryType.loss,
                                  StockRecordEntryType.damaged,
                                ].contains(entryType))
                                  DigitReactiveDropdown<String>(
                                    key: const Key(_transactionReasonKey),
                                    label: localizations.translate(
                                      transactionReasonLabel ?? 'Reason',
                                    ),
                                    menuItems: reasons ?? [],
                                    formControlName: _transactionReasonKey,
                                    valueMapper: (value) =>
                                        localizations.translate(value),
                                    isRequired: true,
                                  ),
                                BlocBuilder<FacilityBloc, FacilityState>(
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                        orElse: () => const Offstage(),
                                        loading: () => const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                        fetched: (facilities, allFacilities) {
                                          return InkWell(
                                            onTap: () async {
                                              clearQRCodes();
                                              form
                                                  .control(_deliveryTeamKey)
                                                  .value = '';

                                              final facility =
                                                  await context.router.push(
                                                          InventoryFacilitySelectionRoute(
                                                              facilities:
                                                                  facilities))
                                                      as FacilityModel?;

                                              if (facility == null) return;
                                              form
                                                      .control(_secondaryPartyKey)
                                                      .value =
                                                  localizations.translate(
                                                'FAC_${facility.id}',
                                              );

                                              setState(() {
                                                selectedFacilityId =
                                                    facility.id;
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
                                            child: IgnorePointer(
                                              child: DigitTextFormField(
                                                key: const Key(
                                                    _secondaryPartyKey),
                                                hideKeyboard: true,
                                                label: localizations.translate(
                                                  '${pageTitle}_${i18.stockReconciliationDetails.stockLabel}',
                                                ),
                                                isRequired: true,
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
                                                formControlName:
                                                    _secondaryPartyKey,
                                                onTap: () async {
                                                  clearQRCodes();
                                                  form
                                                      .control(_deliveryTeamKey)
                                                      .value = '';

                                                  final facility =
                                                      await context.router.push(
                                                    InventoryFacilitySelectionRoute(
                                                      facilities: facilities,
                                                    ),
                                                  ) as FacilityModel?;

                                                  if (facility == null) return;
                                                  form
                                                          .control(
                                                              _secondaryPartyKey)
                                                          .value =
                                                      localizations.translate(
                                                    'FAC_${facility.id}',
                                                  );

                                                  setState(() {
                                                    selectedFacilityId =
                                                        facility.id;
                                                  });
                                                  if (facility.id ==
                                                      'Delivery Team') {
                                                    setState(() {
                                                      deliveryTeamSelected =
                                                          true;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      deliveryTeamSelected =
                                                          false;
                                                    });
                                                  }
                                                },
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                ),
                                Visibility(
                                  visible: deliveryTeamSelected,
                                  child: DigitTextFormField(
                                    label: localizations.translate(
                                      i18.stockReconciliationDetails
                                          .teamCodeLabel,
                                    ),
                                    onChanged: (val) {
                                      String? value = val.value as String?;
                                      if (value != null &&
                                          value.trim().isNotEmpty) {
                                        context.read<DigitScannerBloc>().add(
                                              DigitScannerEvent.handleScanner(
                                                barCode: [],
                                                qrCode: [value],
                                                manualCode: value,
                                              ),
                                            );
                                      } else {
                                        clearQRCodes();
                                      }
                                    },
                                    suffix: IconButton(
                                      onPressed: () {
                                        //[TODO: Add route to auto_route]
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const DigitScannerPage(
                                              quantity: 5,
                                              isGS1code: false,
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
                                    isRequired: deliveryTeamSelected,
                                    maxLines: 3,
                                    formControlName: _deliveryTeamKey,
                                  ),
                                ),
                                DigitTextFormField(
                                  key: const Key(_transactionQuantityKey),
                                  formControlName: _transactionQuantityKey,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  isRequired: true,
                                  validationMessages: {
                                    "number": (object) =>
                                        localizations.translate(
                                          '${quantityCountLabel}_ERROR',
                                        ),
                                    "max": (object) => localizations.translate(
                                          '${quantityCountLabel}_MAX_ERROR',
                                        ),
                                    "min": (object) => localizations.translate(
                                          '${quantityCountLabel}_MIN_ERROR',
                                        ),
                                  },
                                  onChanged: (val) {
                                    if (val.value != null) {
                                      if (val.value > 10000000000) {
                                        form
                                            .control(_transactionQuantityKey)
                                            .value = 10000;
                                      }
                                    }
                                  },
                                  label: localizations.translate(
                                    quantityCountLabel,
                                  ),
                                ),
                                if (isWareHouseMgr)
                                  DigitTextFormField(
                                    key: const Key(_waybillNumberKey),
                                    label: localizations.translate(
                                      i18.stockDetails.waybillNumberLabel,
                                    ),
                                    formControlName: _waybillNumberKey,
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                  ),
                                if (isWareHouseMgr)
                                  DigitTextFormField(
                                      label: localizations.translate(
                                        i18.stockDetails
                                            .quantityOfProductIndicatedOnWaybillLabel,
                                      ),
                                      formControlName: _waybillQuantityKey,
                                      onChanged: (val) {
                                        if (val.toString().isEmpty ||
                                            val.value == null) {
                                          form
                                              .control(_waybillQuantityKey)
                                              .value = '0';
                                        }
                                      }),
                                if (isWareHouseMgr)
                                  transportTypes.isNotEmpty
                                      ? DigitReactiveDropdown<String>(
                                          key: const Key(_typeOfTransportKey),
                                          isRequired: false,
                                          label: localizations.translate(
                                            i18.stockDetails.transportTypeLabel,
                                          ),
                                          valueMapper: (e) => e,
                                          onChanged: (value) {
                                            setState(() {
                                              form.control(
                                                _typeOfTransportKey,
                                              );
                                            });
                                          },
                                          initialValue:
                                              transportTypes.firstOrNull?.name,
                                          menuItems: transportTypes.map(
                                            (e) {
                                              return localizations
                                                  .translate(e.name);
                                            },
                                          ).toList(),
                                          formControlName: _typeOfTransportKey,
                                        )
                                      : const Offstage(),
                                if (isWareHouseMgr)
                                  DigitTextFormField(
                                    label: localizations.translate(
                                      i18.stockDetails.vehicleNumberLabel,
                                    ),
                                    formControlName: _vehicleNumberKey,
                                  ),
                                DigitTextFormField(
                                  label: localizations.translate(
                                    i18.stockDetails.commentsLabel,
                                  ),
                                  minLines: 2,
                                  maxLines: 3,
                                  formControlName: _commentsKey,
                                ),
                                scannerState.barCodes.isEmpty
                                    ? DigitOutlineIconButton(
                                        buttonStyle: OutlinedButton.styleFrom(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero,
                                          ),
                                        ),
                                        onPressed: () {
                                          //[TODO: Add route to auto_route]
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const DigitScannerPage(
                                                quantity: 5,
                                                isGS1code: true,
                                                singleValue: false,
                                              ),
                                              settings: const RouteSettings(
                                                  name: '/qr-scanner'),
                                            ),
                                          );
                                        },
                                        icon: Icons.qr_code,
                                        label: localizations.translate(
                                          i18.common.scanBales,
                                        ),
                                      )
                                    : Column(children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                localizations.translate(i18
                                                    .stockDetails
                                                    .scannedResources),
                                                style: DigitTheme
                                                    .instance
                                                    .mobileTheme
                                                    .textTheme
                                                    .labelSmall,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: kPadding * 2,
                                              ),
                                              child: IconButton(
                                                alignment:
                                                    Alignment.centerRight,
                                                color:
                                                    theme.colorScheme.secondary,
                                                icon: const Icon(Icons.edit),
                                                onPressed: () {
                                                  //[TODO: Add route to auto_route]
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const DigitScannerPage(
                                                        quantity: 5,
                                                        isGS1code: true,
                                                        singleValue: false,
                                                      ),
                                                      settings:
                                                          const RouteSettings(
                                                              name:
                                                                  '/qr-scanner'),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        ...scannerState.barCodes
                                            .map((e) => Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(e.elements.values
                                                      .first.data
                                                      .toString()),
                                                ))
                                      ])
                              ],
                            ),
                          ),
                        ],
                      );
                    });
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  void clearQRCodes() {
    context.read<DigitScannerBloc>().add(const DigitScannerEvent.handleScanner(
          barCode: [],
          qrCode: [],
        ));
  }

  /// This function processes a list of GS1 barcodes and returns a map where the keys and values are joined by '|'.
  ///
  /// It takes a list of GS1Barcode objects as a parameter. Each GS1Barcode object represents a barcode that has been scanned.
  ///
  /// The function first initializes two empty lists: one for the keys and one for the values.
  ///
  /// It then iterates over each barcode in the list. For each barcode, it iterates over each element in the barcode.
  /// Each element is a MapEntry object, where the key is the identifier of the data field and the value is the data itself.
  ///
  /// The function adds the key and value of each element to the respective lists. The key and value are both converted to strings.
  ///
  /// After all barcodes have been processed, the function returns a map where the keys and values are joined by '|'.
  ///
  /// @param barCodes The list of GS1Barcode objects to be processed.
  /// @return A map where the keys and values are joined by '|'.
  Map<String, String> addBarCodesToFields(List<GS1Barcode> barCodes) {
    List<String> keys = [];
    List<String> values = [];
    for (var element in barCodes) {
      for (var e in element.elements.entries) {
        keys.add(e.key.toString());
        values.add(e.value.data.toString());
      }
    }
    return {
      keys.join('|'): values.join('|'),
    };
  }
}
