import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/pages/acknowledgement.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:recase/recase.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';
import '../../../widgets/localized.dart';
import '../../blocs/facility.dart';
import '../../blocs/inventory_listener.dart';
import '../../blocs/product_variant.dart';
import '../../blocs/record_stock.dart';
import '../../models/entities/inventory_facility.dart';
import '../../models/entities/product_variant.dart';
import '../../models/entities/stock.dart';
import '../../models/entities/transaction_reason.dart';
import '../../models/entities/transaction_type.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../facility_selection.dart';

class StockDetailsPage extends LocalizedStatefulWidget {
  final StockRecordEntryType entryType;
  const StockDetailsPage({
    super.key,
    super.appLocalizations,
    required this.entryType,
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
      _productVariantKey: FormControl<ProductVariantModel>(
          // validators: [Validators.required],
          ),
      _secondaryPartyKey: FormControl<String>(
        validators: [Validators.required],
      ),
      _transactionQuantityKey: FormControl<int>(validators: [
        Validators.number,
        Validators.required,
        Validators.min(0),
        Validators.max(10000),
      ]),
      _transactionReasonKey: FormControl<TransactionReason>(),
      _waybillNumberKey: FormControl<String>(),
      _waybillQuantityKey: FormControl<String>(
        validators: [Validators.number],
        value: '0',
      ),
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

    return PopScope(
      onPopInvoked: (didPop) {
        final stockState = context.read<RecordStockBloc>().state;
        if (stockState.primaryId != null) {}
      },
      child: Scaffold(
        body: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, locationState) {
            return BlocConsumer<RecordStockBloc, RecordStockState>(
              listener: (context, stockState) {
                stockState.mapOrNull(persisted: (value) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => InventoryAcknowledgementPage()));
                });
              },
              builder: (context, stockState) {
                StockRecordEntryType entryType = stockState.entryType;

                const module = i18.stockDetails;

                String pageTitle;
                String transactionPartyLabel;
                String quantityCountLabel;
                String? transactionReasonLabel;
                TransactionReason? transactionReason;
                TransactionType transactionType;

                List<TransactionReason>? reasons;

                switch (entryType) {
                  case StockRecordEntryType.receipt:
                    pageTitle = module.receivedPageTitle;
                    transactionPartyLabel =
                        module.selectTransactingPartyReceived;
                    quantityCountLabel = module.quantityReceivedLabel;
                    transactionType = TransactionType.received;

                    break;
                  case StockRecordEntryType.dispatch:
                    pageTitle = module.issuedPageTitle;
                    transactionPartyLabel = module.selectTransactingPartyIssued;
                    quantityCountLabel = module.quantitySentLabel;
                    transactionType = TransactionType.dispatched;

                    break;
                  case StockRecordEntryType.returned:
                    pageTitle = module.returnedPageTitle;
                    transactionPartyLabel =
                        module.selectTransactingPartyReturned;
                    quantityCountLabel = module.quantityReturnedLabel;
                    transactionType = TransactionType.received;
                    break;
                  case StockRecordEntryType.loss:
                    pageTitle = module.lostPageTitle;
                    quantityCountLabel = module.quantityLostLabel;
                    transactionReasonLabel = module.transactionReasonLost;
                    transactionType = TransactionType.dispatched;

                    reasons = [
                      TransactionReason.lostInStorage,
                      TransactionReason.lostInTransit,
                    ];
                    break;
                  case StockRecordEntryType.damaged:
                    pageTitle = module.damagedPageTitle;
                    transactionPartyLabel =
                        module.selectTransactingPartyReceivedFromDamaged;
                    quantityCountLabel = module.quantityDamagedLabel;
                    transactionReasonLabel = module.transactionReasonDamaged;
                    transactionType = TransactionType.dispatched;

                    reasons = [
                      TransactionReason.damagedInStorage,
                      TransactionReason.damagedInTransit,
                    ];
                    break;
                }

                transactionReasonLabel ??= '';

                return ReactiveFormBuilder(
                  form: () => _form(entryType),
                  builder: (context, form, child) {
                    return ScrollableContent(
                      header: Column(children: [
                        BackNavigationHelpHeaderWidget(
                          handleBack: () {
                            final stockState =
                                context.read<RecordStockBloc>().state;
                            if (stockState.primaryId != null) {
                              // context.read<ScannerBloc>().add(
                              //   ScannerEvent.handleScanner(
                              //     [],
                              //     [stockState.primaryId.toString()],
                              //   ),
                              // );
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
                                    final secondaryParty = selectedFacilityId !=
                                            null
                                        ? InventoryFacilityModel(
                                            id: selectedFacilityId.toString(),
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
                                              TransactionReason.received;
                                          break;
                                        case StockRecordEntryType.dispatch:
                                          transactionReason = null;
                                          break;
                                        case StockRecordEntryType.returned:
                                          transactionReason =
                                              TransactionReason.returned;
                                          break;
                                        default:
                                          transactionReason = form
                                              .control(
                                                _transactionReasonKey,
                                              )
                                              .value as TransactionReason?;
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
                                        // auditDetails: AuditDetails(
                                        //   createdBy:
                                        //   context.loggedInUserUuid,
                                        //   createdTime: context
                                        //       .millisecondsSinceEpoch(),
                                        // ),
                                        // clientAuditDetails:
                                        // ClientAuditDetails(
                                        //   createdBy:
                                        //   context.loggedInUserUuid,
                                        //   createdTime: context
                                        //       .millisecondsSinceEpoch(),
                                        //   lastModifiedBy:
                                        //   context.loggedInUserUuid,
                                        //   lastModifiedTime: context
                                        //       .millisecondsSinceEpoch(),
                                        // ),
                                      );

                                      bloc.add(
                                        RecordStockSaveStockDetailsEvent(
                                          stockModel: stockModel,
                                          additionalData: [
                                                    waybillQuantity,
                                                    vehicleNumber,
                                                    comments,
                                                  ].any((element) =>
                                                      element != null) ||
                                                  hasLocationData
                                              ? {
                                                  if (waybillQuantity != null &&
                                                      waybillQuantity
                                                          .trim()
                                                          .isNotEmpty)
                                                    'waybill_quantity':
                                                        waybillQuantity,
                                                  if (vehicleNumber != null &&
                                                      vehicleNumber
                                                          .trim()
                                                          .isNotEmpty)
                                                    'vehicle_number':
                                                        vehicleNumber,
                                                  if (comments != null &&
                                                      comments
                                                          .trim()
                                                          .isNotEmpty)
                                                    'comments': comments,
                                                  if (deliveryTeamName !=
                                                          null &&
                                                      deliveryTeamName
                                                          .trim()
                                                          .isNotEmpty)
                                                    'deliveryTeam':
                                                        deliveryTeamName,
                                                  if (hasLocationData) ...{
                                                    'lat': lat,
                                                    'lng': lng,
                                                  },
                                                }
                                              : null,
                                        ),
                                      );

                                      final submit =
                                          await DigitDialog.show<bool>(
                                        context,
                                        options: DigitDialogOptions(
                                          titleText: localizations.translate(
                                            i18.stockDetails.dialogTitle,
                                          ),
                                          contentText: localizations.translate(
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
                              BlocBuilder<ProductVariantBloc,
                                  ProductVariantState>(
                                builder: (context, state) {
                                  return state.maybeWhen(
                                    orElse: () => const Offstage(),
                                    fetched: (productVariants) {
                                      return DigitReactiveDropdown<
                                          ProductVariantModel>(
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
                                DigitReactiveDropdown<TransactionReason>(
                                  label: localizations.translate(
                                    transactionReasonLabel ?? 'Reason',
                                  ),
                                  menuItems: reasons ?? [],
                                  formControlName: _transactionReasonKey,
                                  valueMapper: (value) => value.name.titleCase,
                                  isRequired: true,
                                ),
                              BlocBuilder<FacilityBloc, FacilityState>(
                                builder: (context, state) {
                                  final facilities = state.whenOrNull(
                                        fetched: (
                                          facilities,
                                        ) =>
                                            facilities,
                                      ) ??
                                      [];

                                  return InkWell(
                                    onTap: () async {
                                      clearQRCodes();
                                      form.control(_deliveryTeamKey).value = '';

                                      final facility =
                                          await Navigator.of(context)
                                              .push<InventoryFacilityModel>(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              FacilitySelectionPage(
                                            facilities: facilities,
                                          ),
                                        ),
                                      );

                                      if (facility == null) return;
                                      form.control(_secondaryPartyKey).value =
                                          localizations.translate(
                                        'FAC_${facility.id}',
                                      );

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
                                        formControlName: _secondaryPartyKey,
                                        onTap: () async {
                                          clearQRCodes();
                                          form.control(_deliveryTeamKey).value =
                                              '';

                                          final facility = await Navigator.of(
                                            context,
                                          ).push<InventoryFacilityModel>(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  FacilitySelectionPage(
                                                facilities: facilities,
                                              ),
                                            ),
                                          );

                                          if (facility == null) return;
                                          form
                                              .control(_secondaryPartyKey)
                                              .value = localizations.translate(
                                            'FAC_${facility.id}',
                                          );

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
                                      ),
                                    ),
                                  );
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
                                      // context.read<ScannerBloc>().add(
                                      //       ScannerEvent.handleScanner(
                                      //         [],
                                      //         [value],
                                      //       ),
                                      //     );
                                    } else {
                                      clearQRCodes();
                                    }
                                  },
                                  suffix: IconButton(
                                    onPressed: () {
                                      // context.router.push(QRScannerRoute(
                                      //   quantity: 5,
                                      //   isGS1code: false,
                                      //   sinlgleValue: false,
                                      // ));
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
                                formControlName: _transactionQuantityKey,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                isRequired: true,
                                validationMessages: {
                                  "number": (object) => localizations.translate(
                                        '${quantityCountLabel}_ERROR',
                                      ),
                                  "max": (object) => localizations.translate(
                                        '${quantityCountLabel}_MAX_ERROR',
                                      ),
                                  "min": (object) => localizations.translate(
                                        '${quantityCountLabel}_MIN_ERROR',
                                      ),
                                },
                                label: localizations.translate(
                                  quantityCountLabel,
                                ),
                              ),
                              if (isWareHouseMgr)
                                DigitTextFormField(
                                  label: localizations.translate(
                                    i18.stockDetails.waybillNumberLabel,
                                  ),
                                  formControlName: _waybillNumberKey,
                                ),
                              if (isWareHouseMgr)
                                DigitTextFormField(
                                  label: localizations.translate(
                                    i18.stockDetails
                                        .quantityOfProductIndicatedOnWaybillLabel,
                                  ),
                                  formControlName: _waybillQuantityKey,
                                  validationMessages: {
                                    "number": (object) =>
                                        localizations.translate(
                                          '${i18.stockDetails.quantityOfProductIndicatedOnWaybillLabel}_ERROR',
                                        ),
                                  },
                                ),
                              if (isWareHouseMgr)
                                transportTypes.isNotEmpty
                                    ? DigitReactiveDropdown<String>(
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
                              DigitOutlineIconButton(
                                buttonStyle: OutlinedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                onPressed: () {
                                  // context.router.push(QRScannerRoute(
                                  //   quantity: 5,
                                  //   isGS1code: true,
                                  //   sinlgleValue: false,
                                  // ));
                                },
                                icon: Icons.qr_code,
                                label: localizations.translate(
                                  i18.common.scanBales,
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
            );
          },
        ),
      ),
    );
  }

  void clearQRCodes() {}
}
