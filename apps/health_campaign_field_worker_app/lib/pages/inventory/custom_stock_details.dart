import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';
import 'package:health_campaign_field_worker_app/blocs/scanner/custom_digit_scanner_bloc.dart';
import 'package:inventory_management/blocs/stock_reconciliation.dart';
import 'package:inventory_management/inventory_management.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';
import 'package:inventory_management/utils/extensions/extensions.dart';
import 'package:inventory_management/utils/typedefs.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:registration_delivery/utils/utils.dart' as registration_utils;
import 'package:inventory_management/utils/i18_key_constants.dart' as i18;
import '../../../widgets/localized.dart';
import 'package:inventory_management/blocs/product_variant.dart';
import 'package:inventory_management/blocs/record_stock.dart';
import 'package:inventory_management/widgets/back_navigation_help_header.dart';

import '../../router/app_router.dart';
import '../../utils/utils.dart' show StockCustomValidator;
import '../../utils/constants.dart';
import '../../utils/i18_key_constants.dart' as i18_local;
import '../custom_qr_scanner.dart';

@RoutePage()
class CustomStockDetailsPage extends LocalizedStatefulWidget {
  const CustomStockDetailsPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<CustomStockDetailsPage> createState() => CustomStockDetailsPageState();
}

class CustomStockDetailsPageState
    extends LocalizedState<CustomStockDetailsPage> {
  static const _productVariantKey = 'productVariant';
  static const _secondaryPartyKey = 'secondaryParty';
  static const _looseQuantityKey = 'looseQuantity';
  static const _transactionQuantityKey = 'quantity';
  static const _transactionReasonKey = 'transactionReason';
  static const _waybillNumberKey = 'waybillNumber';
  static const _waybillQuantityKey = 'waybillQuantity';
  static const _balesQuantityKey = 'balesQuantity';
  static const _vehicleNumberKey = 'vehicleNumber';
  static const _typeOfTransportKey = 'typeOfTransport';
  static const _commentsKey = 'comments';
  static const _driverNameKey = 'driverName';
  static const _deliveryTeamKey = 'deliveryTeam';
  static const _manualScanCommentsKey = 'manualScanComments';
  static const _baleMismatchCommentsKey = 'baleMismatchCommentsKey';

  late ProductVariantModel selectedProductVariant;
  bool deliveryTeamSelected = false;
  TransactionReason? transactionReasonType;
  String? selectedFacilityId;
  List<InventoryTransportTypes> transportTypes = [];
  int maxCount = 100000000;

  List<GS1Barcode> scannedResources = [];

  FormGroup _form(StockRecordEntryType stockType) {
    return fb.group({
      _productVariantKey: FormControl<ProductVariantModel>(),
      _secondaryPartyKey: FormControl<String>(
        validators: [Validators.required],
      ),
      _transactionQuantityKey: FormControl<int>(validators: [
        Validators.number(),
        Validators.required,
        Validators.min(1),
        Validators.max(10000),
      ]),
      _looseQuantityKey: FormControl<int>(validators: []),
      _transactionReasonKey: FormControl<String>(validators: []),
      _waybillNumberKey: FormControl<String>(
        validators: [],
      ),
      _waybillQuantityKey: FormControl<int>(),
      _vehicleNumberKey: FormControl<String>(),
      _typeOfTransportKey: FormControl<String>(),
      _driverNameKey: FormControl<String>(
        validators: [Validators.required],
      ),
      _balesQuantityKey: FormControl<int>(
        validators: [
          StockRecordEntryType.receipt,
          StockRecordEntryType.dispatch,
          StockRecordEntryType.returned
        ].contains(stockType)
            ? [
                Validators.number(),
                Validators.required,
                Validators.min(0),
                Validators.max(10000),
              ]
            : [],
      ),
      _commentsKey: FormControl<String>(
        validators: [
          Validators.delegate((validator) =>
              registration_utils.CustomValidator.sizeLessThan2(validator))
        ],
      ),
      _deliveryTeamKey: FormControl<String>(
        validators: deliveryTeamSelected ? [Validators.required] : [],
      ),
      _manualScanCommentsKey: FormControl<String>(
        validators: [
          Validators.delegate((validator) =>
              registration_utils.CustomValidator.sizeLessThan2(validator))
        ],
      ),
      _baleMismatchCommentsKey: FormControl<String>(
        validators: [
          Validators.delegate((validator) =>
              registration_utils.CustomValidator.sizeLessThan2(validator))
        ],
      )
    });
  }

  @override
  void initState() {
    clearQRCodes();
    transportTypes = InventorySingleton().transportType;
    context.read<LocationBloc>().add(const LoadLocationEvent());
    super.initState();
  }

  Future<(bool, int)> stockReturnValidation(
      int returned, productVariantId, senderId, receiverId) async {
    StockDataRepository stockRepository =
        context.repository<StockModel, StockSearchModel>(context);
    List<StockModel> stockModelsIssued = await stockRepository.search(
      StockSearchModel(
          productVariantId: productVariantId,
          senderId: senderId,
          receiverId: receiverId,
          transactionReason: [],
          transactionType: [TransactionType.dispatched.toValue()]),
    );
    List<StockModel> stockModelsReturned = await stockRepository.search(
      StockSearchModel(
          productVariantId: productVariantId,
          senderId: receiverId,
          receiverId: senderId,
          transactionReason: [TransactionReason.returned.toValue()],
          transactionType: [TransactionType.received.toValue()]),
    );
    int issuedStock = 0;
    int preReturnedStock = 0;
    for (var stock in stockModelsIssued) {
      issuedStock += int.parse(stock.quantity ?? "0");
    }
    for (var stock in stockModelsReturned) {
      preReturnedStock += int.parse(stock.quantity ?? "0");
    }
    bool isValidate = (returned <= (issuedStock - preReturnedStock));
    return (isValidate, issuedStock - preReturnedStock);
  }

  List<FacilityModel> filterFacilities(
      List<FacilityModel> facilities, List<FacilityModel> allFacilities) {
    List<FacilityModel> filteredFacilities = [];

    filteredFacilities.addAll(facilities
        .where((e) => e.usage == Constants.districtWarehouse)
        .toList());

    // add national level facility to the list
    filteredFacilities.addAll(allFacilities
        .where((element) => element.usage == Constants.nationalWarehouse)
        .toList());
    // add district facility to the list
    filteredFacilities.addAll(allFacilities
        .where((element) => element.usage == Constants.deliveryTeam)
        .toList());
    return filteredFacilities;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final stockReconciliationBloc =
        BlocProvider.of<StockReconciliationBloc>(context);

    bool isWareHouseMgr = InventorySingleton().isWareHouseMgr;

    return PopScope(
      onPopInvoked: (didPop) {
        final stockState = context.read<RecordStockBloc>().state;
        if (stockState.primaryId != null) {
          context.read<CustomDigitScannerBloc>().add(
                CustomDigitScannerEvent.handleScanner(
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
                const localModule = i18_local.stockDetails;

                String pageTitle;
                String transactionPartyLabel;
                String balesCountLabel;
                String quantityCountLabel;
                String looseQuantityCountLabel =
                    i18_local.stockDetails.looseQuantityLabel;
                String? transactionReasonLabel;
                String? transactionReason;
                String transactionType;

                List<String>? reasons;

                switch (entryType) {
                  case StockRecordEntryType.receipt:
                    pageTitle = module.receivedPageTitle;
                    transactionPartyLabel =
                        module.selectTransactingPartyReceived;
                    balesCountLabel = localModule.balesReceivedCountLabel;
                    quantityCountLabel = module.quantityReceivedLabel;
                    transactionType = TransactionType.received.toValue();

                    break;
                  case StockRecordEntryType.dispatch:
                    pageTitle = module.issuedPageTitle;
                    transactionPartyLabel = module.selectTransactingPartyIssued;
                    balesCountLabel = localModule.balesSentCountLabel;
                    quantityCountLabel = module.quantitySentLabel;
                    transactionType = TransactionType.dispatched.toValue();

                    break;
                  case StockRecordEntryType.returned:
                    pageTitle = module.returnedPageTitle;
                    transactionPartyLabel =
                        module.selectTransactingPartyReturned;
                    balesCountLabel = localModule.balesReturnedCountLabel;
                    quantityCountLabel = module.quantityReturnedLabel;
                    transactionType = TransactionType.received.toValue();
                    break;
                  case StockRecordEntryType.loss:
                    pageTitle = module.lostPageTitle;
                    quantityCountLabel = module.quantityLostLabel;
                    balesCountLabel = localModule.balesLostCountLabel;
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
                    balesCountLabel = localModule.balesDamagedCountLabel;
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
                    return BlocBuilder<CustomDigitScannerBloc,
                            CustomDigitScannerState>(
                        builder: (context, scannerState) {
                      if (scannerState.barCodes.isNotEmpty) {
                        scannedResources.clear();
                        scannedResources.addAll(
                            scannerState.barCodes.map((e) => e.$2).toList());
                      }

                      return ScrollableContent(
                        header: Column(children: [
                          // Back Button
                          BackNavigationHelpHeaderWidget(
                            handleBack: () {
                              final stockState =
                                  context.read<RecordStockBloc>().state;
                              if (stockState.primaryId != null) {
                                context.read<CustomDigitScannerBloc>().add(
                                      CustomDigitScannerEvent.handleScanner(
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
                        // Submit Button
                        footer: DigitCard(
                          margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                          padding: const EdgeInsets.fromLTRB(
                            kPadding,
                            0,
                            kPadding,
                            0,
                          ),
                          child: ReactiveFormConsumer(
                              builder: (context, form, child) {
                            if (form
                                    .control(_deliveryTeamKey)
                                    .value
                                    .toString()
                                    .isEmpty ||
                                form.control(_deliveryTeamKey).value == null ||
                                scannerState.qrCodes.isNotEmpty) {
                              form.control(_deliveryTeamKey).value =
                                  scannerState.qrCodes.isNotEmpty
                                      ? scannerState.qrCodes.last
                                      : '';
                            }
                            return DigitElevatedButton(
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
                                        context
                                            .read<LocationBloc>()
                                            .add(const LoadLocationEvent());
                                        DigitComponentsUtils()
                                            .showLocationCapturingDialog(
                                                context,
                                                localizations.translate(i18
                                                    .common.locationCapturing),
                                                DigitSyncDialogType.inProgress);
                                        Future.delayed(
                                            const Duration(seconds: 2),
                                            () async {
                                          DigitComponentsUtils()
                                              .hideDialog(context);
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

                                          final looseQuantity = form
                                              .control(_looseQuantityKey)
                                              .value as int?;

                                          final waybillNumber = form
                                              .control(_waybillNumberKey)
                                              .value as String?;

                                          final waybillQuantity = form
                                              .control(_waybillQuantityKey)
                                              .value as int?;

                                          final balesQuantity = form
                                              .control(_balesQuantityKey)
                                              .value as int?;

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

                                          final manualScanComments = form
                                              .control(
                                                _manualScanCommentsKey,
                                              )
                                              .value as String?;

                                          final baleMismtachComments = form
                                              .control(
                                                _baleMismatchCommentsKey,
                                              )
                                              .value as String?;

                                          final driverName = (form
                                                  .control(_driverNameKey)
                                                  .value as String?)
                                              ?.trim();

                                          final deliveryTeamName = form
                                              .control(_deliveryTeamKey)
                                              .value as String?;

                                          final transportTypeName = form
                                              .control(_typeOfTransportKey)
                                              .value as String?;

                                          final List<AdditionalField>
                                              additionalFields = [];
                                          final scannerState = context
                                              .read<CustomDigitScannerBloc>()
                                              .state;
                                          final List<
                                                  (BarcodeScanType, GS1Barcode)>
                                              barcodes = scannerState.barCodes;

                                          final ifManualBaleScan = barcodes
                                                  .where((element) =>
                                                      element.$1 ==
                                                      BarcodeScanType.manual)
                                                  .isEmpty
                                              ? false
                                              : true;

                                          final List<String> qrCodes =
                                              scannerState.qrCodes;

                                          if ([
                                                StockRecordEntryType.receipt,
                                                StockRecordEntryType.dispatch
                                              ].contains(entryType) ||
                                              transactionReasonType ==
                                                  TransactionReason
                                                      .damagedInTransit) {
                                            if (balesQuantity != null &&
                                                (barcodes.length) !=
                                                    balesQuantity &&
                                                (baleMismtachComments == null ||
                                                    baleMismtachComments
                                                        .isEmpty)) {
                                              await DigitToast.show(
                                                context,
                                                options: DigitToastOptions(
                                                  localizations.translate(i18_local
                                                      .stockDetails
                                                      .baleMismatchCommentRequired),
                                                  true,
                                                  theme,
                                                ),
                                              );

                                              return;
                                            }

                                            if (ifManualBaleScan &&
                                                (manualScanComments == null ||
                                                    manualScanComments
                                                        .isEmpty)) {
                                              await DigitToast.show(
                                                context,
                                                options: DigitToastOptions(
                                                  localizations.translate(i18_local
                                                      .stockDetails
                                                      .manualScanCommentRequired),
                                                  true,
                                                  theme,
                                                ),
                                              );

                                              return;
                                            }

                                            int qrCodeCount = 0;
                                            //TODO :  change this , as on this page no manual qr entry ,only qr scanning
                                            // so change this to save those

                                            for (var qrCode in qrCodes) {
                                              additionalFields.add(
                                                AdditionalField(
                                                  'manualScan-$qrCodeCount',
                                                  qrCode,
                                                ),
                                              );
                                              qrCodeCount = qrCodeCount + 1;
                                            }
                                          }

                                          StockReconciliationState
                                              stockReconciliationState =
                                              stockReconciliationBloc.state;

                                          if (entryType ==
                                              StockRecordEntryType.returned) {
                                            (bool, int) returnValidation =
                                                await stockReturnValidation(
                                                    quantity,
                                                    productVariant.id,
                                                    stockState
                                                        .facilityModel!.id,
                                                    selectedFacilityId);
                                            if (returnValidation.$1 == false) {
                                              final alert =
                                                  await DigitDialog.show<bool>(
                                                context,
                                                options: DigitDialogOptions(
                                                  titleText:
                                                      localizations.translate(
                                                    i18_local.stockDetails
                                                        .countDialogTitle,
                                                  ),
                                                  contentText: localizations
                                                      .translate(
                                                        i18_local.stockDetails
                                                            .countContentValidation,
                                                      )
                                                      .replaceAll(
                                                          '{}',
                                                          returnValidation.$2
                                                              .toString()),
                                                  primaryAction:
                                                      DigitDialogActions(
                                                    label:
                                                        localizations.translate(
                                                      i18_local.stockDetails
                                                          .countDialogSuccess,
                                                    ),
                                                    action: (context) {
                                                      Navigator.of(
                                                        context,
                                                        rootNavigator: true,
                                                      ).pop(false);
                                                    },
                                                  ),
                                                ),
                                              );

                                              if (!(alert ?? false)) {
                                                return;
                                              }
                                            }
                                          }

                                          if (stockReconciliationState
                                                      .stockInHand <
                                                  int.parse(
                                                      quantity.toString()) &&
                                              [
                                                StockRecordEntryType.dispatch,
                                                StockRecordEntryType.damaged,
                                                StockRecordEntryType.loss
                                              ].contains(entryType)) {
                                            final alert =
                                                await DigitDialog.show<bool>(
                                              context,
                                              options: DigitDialogOptions(
                                                titleText:
                                                    localizations.translate(
                                                  i18_local.stockDetails
                                                      .countDialogTitle,
                                                ),
                                                contentText: localizations
                                                    .translate(
                                                      i18_local.stockDetails
                                                          .countContent,
                                                    )
                                                    .replaceAll(
                                                      '{}',
                                                      stockReconciliationState
                                                          .stockInHand
                                                          .toString(),
                                                    ),
                                                primaryAction:
                                                    DigitDialogActions(
                                                  label:
                                                      localizations.translate(
                                                    i18_local.stockDetails
                                                        .countDialogSuccess,
                                                  ),
                                                  action: (context) {
                                                    Navigator.of(
                                                      context,
                                                      rootNavigator: true,
                                                    ).pop(false);
                                                  },
                                                ),
                                              ),
                                            );

                                            if (!(alert ?? false)) {
                                              return;
                                            }
                                          }

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
                                            case StockRecordEntryType.loss:
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
                                            case StockRecordEntryType.damaged:
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
                                            case StockRecordEntryType.returned:
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
                                          UserModel? loggedInUserModel =
                                              InventorySingleton().loggedInUser;
                                          final stockModel = StockModel(
                                            clientReferenceId:
                                                IdGen.i.identifier,
                                            productVariantId: productVariant.id,
                                            transactionReason:
                                                transactionReason,
                                            transactionType: transactionType,
                                            referenceId: stockState.projectId,
                                            referenceIdType: 'PROJECT',
                                            quantity: quantity.toString(),
                                            wayBillNumber: waybillNumber,
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
                                              lastModifiedBy:
                                                  InventorySingleton()
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
                                                      AdditionalField(
                                                        InventoryManagementEnums
                                                            .name
                                                            .toValue(),
                                                        loggedInUserModel?.name,
                                                      ),
                                                      if (waybillQuantity !=
                                                          null)
                                                        AdditionalField(
                                                          'waybill_quantity',
                                                          waybillQuantity
                                                              .toString(),
                                                        ),
                                                      if (vehicleNumber !=
                                                              null &&
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
                                                      if (manualScanComments !=
                                                              null &&
                                                          manualScanComments
                                                              .trim()
                                                              .isNotEmpty)
                                                        AdditionalField(
                                                          _manualScanCommentsKey,
                                                          manualScanComments,
                                                        ),
                                                      if (baleMismtachComments !=
                                                              null &&
                                                          baleMismtachComments
                                                              .trim()
                                                              .isNotEmpty)
                                                        AdditionalField(
                                                          _baleMismatchCommentsKey,
                                                          baleMismtachComments,
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
                                                      if (driverName != null &&
                                                          driverName.isNotEmpty)
                                                        AdditionalField(
                                                          'driver_name',
                                                          driverName,
                                                        ),
                                                      if (balesQuantity != null)
                                                        AdditionalField(
                                                            _balesQuantityKey,
                                                            balesQuantity
                                                                .toString()),
                                                      if (looseQuantity != null)
                                                        AdditionalField(
                                                            _looseQuantityKey,
                                                            looseQuantity
                                                                .toString()),
                                                      if (transportTypeName !=
                                                          null)
                                                        AdditionalField(
                                                            _typeOfTransportKey,
                                                            transportTypeName),
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
                                                      if (scannerState
                                                          .barCodes.isNotEmpty)
                                                        ...addBarCodesToFields(
                                                            scannerState
                                                                .barCodes),
                                                      // adding qrcodes data if any
                                                      if (additionalFields
                                                          .isNotEmpty)
                                                        ...additionalFields,
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
                                              titleText:
                                                  localizations.translate(
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
                                              secondaryAction:
                                                  DigitDialogActions(
                                                label: localizations.translate(
                                                  i18.common.coreCommonCancel,
                                                ),
                                                action: (context) =>
                                                    Navigator.of(
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
                                        });
                                      }
                                    },
                              child: Center(
                                child: Text(
                                  localizations
                                      .translate(i18.common.coreCommonSubmit),
                                ),
                              ),
                            );
                          }),
                        ),
                        children: [
                          DigitCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //Title
                                Text(
                                  localizations.translate(pageTitle),
                                  style: theme.textTheme.displayMedium,
                                ),
                                //Product Variant Dropdown Selection
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
                                        form.control(_productVariantKey).value =
                                            productVariants.first;
                                        selectedProductVariant =
                                            productVariants.first;

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
                                                localizations.translate(
                                                    '${module.selectProductLabel}_IS_REQUIRED'),
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                                //Product Return Reason
                                if ([
                                  StockRecordEntryType.loss,
                                  StockRecordEntryType.damaged,
                                ].contains(entryType))
                                  DigitReactiveDropdown<String>(
                                      key: const Key(_transactionReasonKey),
                                      label: localizations.translate(
                                        transactionReasonLabel ?? 'Reason',
                                      ),
                                      isRequired: true,
                                      menuItems: reasons ?? [],
                                      formControlName: _transactionReasonKey,
                                      onChanged: (value) {
                                        form.control(_balesQuantityKey).value =
                                            null;
                                        form.control(_looseQuantityKey).value =
                                            null;
                                        form
                                            .control(_transactionQuantityKey)
                                            .value = null;
                                        form
                                            .control(_balesQuantityKey)
                                            .setValidators([],
                                                autoValidate: true);

                                        form
                                            .control(_waybillQuantityKey)
                                            .setValidators([
                                          Validators.minLength(2),
                                          Validators.maxLength(200)
                                        ], autoValidate: true);
                                        if (value ==
                                            TransactionReason.damagedInTransit
                                                .toValue()) {
                                          form
                                              .control(_balesQuantityKey)
                                              .setValidators([
                                            Validators.required,
                                            Validators.number(),
                                            Validators.min(0),
                                            Validators.max(10000),
                                          ], autoValidate: true);
                                          transactionReasonType =
                                              TransactionReason
                                                  .damagedInTransit;
                                        } else if (value ==
                                            TransactionReason.damagedInStorage
                                                .toValue()) {
                                          form
                                              .control(_waybillQuantityKey)
                                              .setValidators([],
                                                  autoValidate: true);
                                          transactionReasonType =
                                              TransactionReason
                                                  .damagedInStorage;
                                        } else if (value ==
                                            TransactionReason.lostInTransit
                                                .toValue()) {
                                          transactionReasonType =
                                              TransactionReason.lostInTransit;
                                        } else if (value ==
                                            TransactionReason.lostInStorage
                                                .toValue()) {
                                          form
                                              .control(_waybillQuantityKey)
                                              .setValidators([],
                                                  autoValidate: true);

                                          transactionReasonType =
                                              TransactionReason.lostInStorage;
                                        }
                                        setState(() {});
                                      },
                                      valueMapper: (value) {
                                        return localizations.translate(value);
                                      }),
                                //Product Facility
                                BlocBuilder<FacilityBloc, FacilityState>(
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                        orElse: () => const Offstage(),
                                        loading: () => const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                        fetched: (facilities, allFacilities) {
                                          List<FacilityModel>
                                              filteredFacilities =
                                              filterFacilities(
                                                  facilities, allFacilities);

                                          return InkWell(
                                            onTap: () async {
                                              clearQRCodes();
                                              stockReconciliationBloc.add(
                                                StockReconciliationSelectFacilityEvent(
                                                  stockState.facilityModel!,
                                                ),
                                              );
                                              stockReconciliationBloc.add(
                                                StockReconciliationSelectProductEvent(
                                                  selectedProductVariant.id,
                                                  isDistributor:
                                                      !InventorySingleton()
                                                          .isWareHouseMgr!,
                                                ),
                                              );
                                              form
                                                  .control(_deliveryTeamKey)
                                                  .value = '';

                                              final facility = await context
                                                      .router
                                                      .push(CustomInventoryFacilitySelectionRoute(
                                                          facilities:
                                                              filteredFacilities))
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
                                              if (facility.usage ==
                                                  Constants.deliveryTeam) {
                                                setState(() {
                                                  deliveryTeamSelected = true;

                                                  form
                                                      .control(
                                                    _driverNameKey,
                                                  )
                                                      .setValidators(
                                                    [
                                                      Validators.minLength(2),
                                                      Validators.maxLength(200),
                                                    ],
                                                    updateParent: true,
                                                    autoValidate: true,
                                                  );

                                                  form
                                                      .control(
                                                    _typeOfTransportKey,
                                                  )
                                                      .setValidators(
                                                    [],
                                                    updateParent: true,
                                                    autoValidate: true,
                                                  );
                                                  form
                                                      .control(
                                                    _vehicleNumberKey,
                                                  )
                                                      .setValidators(
                                                    [
                                                      Validators.minLength(2),
                                                      Validators.maxLength(200),
                                                    ],
                                                    updateParent: true,
                                                    autoValidate: true,
                                                  );

                                                  form
                                                      .control(
                                                    _deliveryTeamKey,
                                                  )
                                                      .setValidators(
                                                    [Validators.required],
                                                    updateParent: true,
                                                    autoValidate: true,
                                                  );
                                                  form
                                                      .control(
                                                        _deliveryTeamKey,
                                                      )
                                                      .touched;
                                                });
                                              } else {
                                                setState(() {
                                                  deliveryTeamSelected = false;
                                                  if (isWareHouseMgr) {
                                                    form
                                                        .control(
                                                      _deliveryTeamKey,
                                                    )
                                                        .setValidators(
                                                      [],
                                                      updateParent: true,
                                                      autoValidate: true,
                                                    );
                                                    form
                                                        .control(
                                                      _driverNameKey,
                                                    )
                                                        .setValidators(
                                                      [
                                                        Validators.minLength(2),
                                                        Validators.maxLength(
                                                            200),
                                                      ],
                                                      updateParent: true,
                                                      autoValidate: true,
                                                    );

                                                    form
                                                        .control(
                                                      _typeOfTransportKey,
                                                    )
                                                        .setValidators(
                                                      [],
                                                      updateParent: true,
                                                      autoValidate: true,
                                                    );
                                                    form
                                                        .control(
                                                      _vehicleNumberKey,
                                                    )
                                                        .setValidators(
                                                      [
                                                        Validators.minLength(2),
                                                        Validators.maxLength(
                                                            200),
                                                      ],
                                                      updateParent: true,
                                                      autoValidate: true,
                                                    );

                                                    form
                                                        .control(
                                                          _driverNameKey,
                                                        )
                                                        .touched;
                                                    form
                                                        .control(
                                                          _waybillNumberKey,
                                                        )
                                                        .touched;
                                                    form
                                                        .control(
                                                          _waybillQuantityKey,
                                                        )
                                                        .touched;
                                                    form
                                                        .control(
                                                          _typeOfTransportKey,
                                                        )
                                                        .touched;
                                                    form
                                                        .control(
                                                          _vehicleNumberKey,
                                                        )
                                                        .touched;
                                                  }
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
                                                  stockReconciliationBloc.add(
                                                    StockReconciliationSelectFacilityEvent(
                                                      stockState.facilityModel!,
                                                    ),
                                                  );
                                                  stockReconciliationBloc.add(
                                                    StockReconciliationSelectProductEvent(
                                                      selectedProductVariant.id,
                                                      isDistributor:
                                                          !InventorySingleton()
                                                              .isWareHouseMgr!,
                                                    ),
                                                  );
                                                  form
                                                      .control(_deliveryTeamKey)
                                                      .value = '';

                                                  final facility =
                                                      await context.router.push(
                                                    CustomInventoryFacilitySelectionRoute(
                                                      facilities:
                                                          filteredFacilities,
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
                                                  if (facility.usage ==
                                                      Constants.deliveryTeam) {
                                                    setState(() {
                                                      deliveryTeamSelected =
                                                          true;
                                                      form
                                                          .control(
                                                        _driverNameKey,
                                                      )
                                                          .setValidators(
                                                        [],
                                                        updateParent: true,
                                                        autoValidate: true,
                                                      );

                                                      form
                                                          .control(
                                                        _waybillQuantityKey,
                                                      )
                                                          .setValidators(
                                                        [],
                                                        updateParent: true,
                                                        autoValidate: true,
                                                      );
                                                      form
                                                          .control(
                                                        _typeOfTransportKey,
                                                      )
                                                          .setValidators(
                                                        [],
                                                        updateParent: true,
                                                        autoValidate: true,
                                                      );
                                                      form
                                                          .control(
                                                        _vehicleNumberKey,
                                                      )
                                                          .setValidators(
                                                        [],
                                                        updateParent: true,
                                                        autoValidate: true,
                                                      );

                                                      form
                                                          .control(
                                                        _deliveryTeamKey,
                                                      )
                                                          .setValidators(
                                                        [Validators.required],
                                                        updateParent: true,
                                                        autoValidate: true,
                                                      );

                                                      form
                                                          .control(
                                                            _deliveryTeamKey,
                                                          )
                                                          .touched;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      deliveryTeamSelected =
                                                          false;
                                                      if (isWareHouseMgr) {
                                                        form
                                                            .control(
                                                          _driverNameKey,
                                                        )
                                                            .setValidators(
                                                          [
                                                            Validators
                                                                .minLength(2),
                                                            Validators
                                                                .maxLength(200),
                                                          ],
                                                          updateParent: true,
                                                          autoValidate: true,
                                                        );

                                                        form
                                                            .control(
                                                          _waybillQuantityKey,
                                                        )
                                                            .setValidators(
                                                          [],
                                                          updateParent: true,
                                                          autoValidate: true,
                                                        );
                                                        form
                                                            .control(
                                                          _typeOfTransportKey,
                                                        )
                                                            .setValidators(
                                                          [],
                                                          updateParent: true,
                                                          autoValidate: true,
                                                        );
                                                        form
                                                            .control(
                                                          _vehicleNumberKey,
                                                        )
                                                            .setValidators(
                                                          [
                                                            Validators
                                                                .minLength(2),
                                                            Validators
                                                                .maxLength(200),
                                                          ],
                                                          updateParent: true,
                                                          autoValidate: true,
                                                        );

                                                        form
                                                            .control(
                                                              _driverNameKey,
                                                            )
                                                            .touched;
                                                        form
                                                            .control(
                                                              _waybillNumberKey,
                                                            )
                                                            .touched;
                                                        form
                                                            .control(
                                                              _waybillQuantityKey,
                                                            )
                                                            .touched;
                                                        form
                                                            .control(
                                                              _typeOfTransportKey,
                                                            )
                                                            .touched;
                                                        form
                                                            .control(
                                                              _vehicleNumberKey,
                                                            )
                                                            .touched;
                                                      }
                                                    });
                                                  }
                                                },
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                ),
                                //Bales Quantity
                                if ([
                                      StockRecordEntryType.receipt,
                                      StockRecordEntryType.dispatch,
                                      StockRecordEntryType.returned
                                    ].contains(entryType) ||
                                    transactionReasonType ==
                                        TransactionReason.damagedInTransit)
                                  DigitTextFormField(
                                    key: const Key(_balesQuantityKey),
                                    formControlName: _balesQuantityKey,
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                    label: localizations.translate(
                                      balesCountLabel,
                                    ),
                                    isRequired: true,
                                    validationMessages: {
                                      "number": (object) =>
                                          localizations.translate(
                                            i18_local.stockDetails
                                                .balesQuantityRequiredError,
                                          ),
                                      // todo : add the max quantity here
                                      "max": (object) =>
                                          "${localizations.translate(
                                            '${quantityCountLabel}_MAX_ERROR',
                                          )} ${0}",
                                      "min": (object) =>
                                          localizations.translate(
                                            '${quantityCountLabel}_MIN_ERROR',
                                          ),
                                    },
                                    onChanged: (formGroup) {
                                      calculateFinalQuantity(form);
                                      form
                                          .control(_balesQuantityKey)
                                          .markAsTouched();
                                    },
                                  ),
                                //Loose Quantity
                                if ([
                                      StockRecordEntryType.receipt,
                                      StockRecordEntryType.dispatch,
                                      StockRecordEntryType.returned
                                    ].contains(entryType) ||
                                    transactionReasonType ==
                                        TransactionReason.damagedInTransit)
                                  DigitTextFormField(
                                    key: const Key(_looseQuantityKey),
                                    formControlName: _looseQuantityKey,
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                    isRequired: false,
                                    validationMessages: {
                                      "number": (object) =>
                                          localizations.translate(
                                            '${quantityCountLabel}_ERROR',
                                          ),
                                      "max": (object) =>
                                          localizations.translate(
                                            '${quantityCountLabel}_MAX_ERROR',
                                          ),
                                      "min": (object) =>
                                          localizations.translate(
                                            '${quantityCountLabel}_MIN_ERROR',
                                          ),
                                    },
                                    onChanged: (val) {
                                      calculateFinalQuantity(form);
                                      form
                                          .control(_looseQuantityKey)
                                          .markAsTouched();
                                      if (val.value != null) {
                                        form
                                            .control(_looseQuantityKey)
                                            .setValidators(
                                          [
                                            Validators.number(),
                                            Validators.min(0),
                                            Validators.max(10000),
                                          ],
                                          autoValidate: true,
                                        );
                                      } else {
                                        form
                                            .control(_looseQuantityKey)
                                            .setValidators([],
                                                autoValidate: true);
                                      }
                                    },
                                    label: localizations.translate(
                                      looseQuantityCountLabel,
                                    ),
                                  ),
                                //Transaction Quantity
                                DigitTextFormField(
                                  key: const Key(_transactionQuantityKey),
                                  formControlName: _transactionQuantityKey,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  isRequired: true,
                                  readOnly: ([
                                        StockRecordEntryType.receipt,
                                        StockRecordEntryType.dispatch,
                                        StockRecordEntryType.returned
                                      ].contains(entryType) ||
                                      transactionReasonType ==
                                          TransactionReason.damagedInTransit),
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
                                    form
                                        .control(_transactionQuantityKey)
                                        .markAsTouched();
                                  },
                                  label: ([
                                            StockRecordEntryType.receipt,
                                            StockRecordEntryType.dispatch,
                                            StockRecordEntryType.returned
                                          ].contains(entryType) ||
                                          transactionReasonType ==
                                              TransactionReason
                                                  .damagedInTransit)
                                      ? "${localizations.translate(quantityCountLabel)} (${localizations.translate(balesCountLabel)} * x + ${localizations.translate(looseQuantityCountLabel)})"
                                      : localizations
                                          .translate(quantityCountLabel),
                                ),
                                //Delivery Team
                                AbsorbPointer(
                                  absorbing: !deliveryTeamSelected,
                                  child: DigitTextFormField(
                                    readOnly: true,
                                    label: localizations.translate(
                                      i18.stockReconciliationDetails
                                          .teamCodeLabel,
                                    ),
                                    isRequired: deliveryTeamSelected,
                                    onChanged: (val) {
                                      String? value = val.value as String?;
                                      if (value != null &&
                                          value.trim().isNotEmpty) {
                                        context
                                            .read<CustomDigitScannerBloc>()
                                            .add(
                                              CustomDigitScannerEvent
                                                  .handleScanner(
                                                barCode: [],
                                                qrCode: [value],
                                                manualCode: value,
                                              ),
                                            );
                                      } else {
                                        clearQRCodes();
                                      }
                                    },
                                    suffix: !deliveryTeamSelected
                                        ? null
                                        : IconButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const CustomDigitScannerPage(
                                                    quantity: 1,
                                                    isGS1code: false,
                                                    singleValue: false,
                                                    manualEnabled: false,
                                                    scanType: ScanType.stock,
                                                  ),
                                                  settings: const RouteSettings(
                                                      name: '/qr-scanner'),
                                                ),
                                              );
                                            },
                                            icon: Icon(
                                              Icons.qr_code_2,
                                              color:
                                                  theme.colorScheme.secondary,
                                            ),
                                          ),
                                    maxLines: 3,
                                    formControlName: _deliveryTeamKey,
                                  ),
                                ),
                                //Waybill Number
                                if ([
                                      StockRecordEntryType.receipt,
                                    ].contains(entryType) ||
                                    (transactionReasonType ==
                                            TransactionReason
                                                .damagedInTransit ||
                                        transactionReasonType ==
                                            TransactionReason.lostInTransit))
                                  DigitTextFormField(
                                      key: const Key(_waybillNumberKey),
                                      label: localizations.translate(
                                        i18.stockDetails.waybillNumberLabel,
                                      ),
                                      isRequired: false,
                                      formControlName: _waybillNumberKey,
                                      onChanged: (value) {
                                        if (value.value == "") {
                                          form
                                              .control(_waybillNumberKey)
                                              .setValidators(
                                            [],
                                            updateParent: true,
                                            autoValidate: true,
                                          );
                                        } else {
                                          form
                                              .control(_waybillNumberKey)
                                              .setValidators(
                                            [
                                              Validators.minLength(2),
                                              Validators.maxLength(200)
                                            ],
                                            updateParent: true,
                                            autoValidate: true,
                                          );
                                        }
                                      },
                                      validationMessages: {
                                        'maxLength': (object) => localizations
                                            .translate(
                                                i18.common.maxCharsRequired)
                                            .replaceAll('{}', '200'),
                                        'minLength': (object) => localizations
                                            .translate(
                                                i18.common.min2CharsRequired)
                                            .replaceAll('{}', ''),
                                      }),
                                //Quantity of Products on Waybill
                                if ([
                                      StockRecordEntryType.receipt,
                                    ].contains(entryType) ||
                                    (transactionReasonType ==
                                            TransactionReason
                                                .damagedInTransit ||
                                        transactionReasonType ==
                                            TransactionReason.lostInTransit))
                                  DigitTextFormField(
                                    label: localizations.translate(
                                      i18.stockDetails
                                          .quantityOfProductIndicatedOnWaybillLabel,
                                    ),
                                    formControlName: _waybillQuantityKey,
                                    onChanged: (val) {
                                      if (val.value == null ||
                                          val.value != "") {
                                        form
                                            .control(_waybillQuantityKey)
                                            .setValidators(
                                          [],
                                          autoValidate: true,
                                          updateParent: true,
                                        );
                                      } else {
                                        form
                                            .control(_waybillQuantityKey)
                                            .setValidators(
                                          [
                                            Validators.number(),
                                            Validators.min(0),
                                            Validators.max(maxCount),
                                            // Validators.delegate(StockCustomValidator.max)
                                          ],
                                          autoValidate: true,
                                          updateParent: true,
                                        );
                                      }
                                    },
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                  ),
                                //Transport Type
                                if ([
                                      StockRecordEntryType.receipt,
                                    ].contains(entryType) ||
                                    (transactionReasonType ==
                                            TransactionReason
                                                .damagedInTransit ||
                                        transactionReasonType ==
                                            TransactionReason.lostInTransit))
                                  transportTypes.isNotEmpty
                                      ? DigitReactiveDropdown<String>(
                                          key: const Key(_typeOfTransportKey),
                                          label: localizations.translate(
                                            i18.stockDetails.transportTypeLabel,
                                          ),
                                          valueMapper: (e) => e,
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
                                const SizedBox(
                                  height: kPadding,
                                ),
                                //Driver Name
                                if ([
                                  StockRecordEntryType.receipt,
                                ].contains(entryType))
                                  DigitTextFormField(
                                    label: localizations.translate(
                                      i18_local.stockDetailsReceiptShowcase
                                          .driverName,
                                    ),
                                    isRequired: true,
                                    formControlName: _driverNameKey,
                                    validationMessages: {
                                      'required': (object) =>
                                          localizations.translate(
                                            i18.common.corecommonRequired,
                                          ),
                                      'maxLength': (object) => localizations
                                          .translate(
                                              i18.common.maxCharsRequired)
                                          .replaceAll('{}', '200'),
                                      'minLength': (object) => localizations
                                          .translate(
                                              i18.common.min2CharsRequired)
                                          .replaceAll('{}', '200'),
                                      'min2': (object) => localizations
                                          .translate(
                                              i18.common.min2CharsRequired)
                                          .replaceAll('{}', ''),
                                    },
                                  ),
                                //Vehicle Number
                                if ([
                                  StockRecordEntryType.receipt,
                                ].contains(entryType))
                                  DigitTextFormField(
                                    label: localizations.translate(
                                      i18.stockDetails.vehicleNumberLabel,
                                    ),
                                    formControlName: _vehicleNumberKey,
                                    validationMessages: {
                                      'minLength': (object) => localizations
                                          .translate(
                                              i18.common.min2CharsRequired)
                                          .replaceAll('{}', '200'),
                                    },
                                  ),
                                //Comments
                                DigitTextFormField(
                                  label: localizations.translate(
                                    i18.stockDetails.commentsLabel,
                                  ),
                                  minLines: 2,
                                  maxLines: 3,
                                  formControlName: _commentsKey,
                                  onChanged: (value) {
                                    if (value.value == "") {
                                      form.control(_commentsKey).setValidators(
                                        [],
                                        updateParent: true,
                                        autoValidate: true,
                                      );
                                    } else {
                                      form.control(_commentsKey).setValidators(
                                        [
                                          Validators.delegate((validator) =>
                                              registration_utils.CustomValidator
                                                  .sizeLessThan2(validator))
                                        ],
                                        updateParent: true,
                                        autoValidate: true,
                                      );
                                    }
                                  },
                                  validationMessages: {
                                    'sizeLessThan2': (object) =>
                                        localizations.translate(
                                            i18_local.common.min3CharsRequired),
                                    'minLength': (object) => localizations
                                        .translate(i18.common.min2CharsRequired)
                                        .replaceAll('{}', '200'),
                                  },
                                ),

                                if ([
                                      StockRecordEntryType.receipt,
                                      StockRecordEntryType.dispatch,
                                    ].contains(entryType) ||
                                    transactionReasonType ==
                                        TransactionReason.damagedInTransit)
                                  scannerState.barCodes.isEmpty
                                      ? DigitOutlineIconButton(
                                          buttonStyle: OutlinedButton.styleFrom(
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero,
                                            ),
                                          ),
                                          onPressed: () async {
                                            final balesQuantity = form
                                                .control(_balesQuantityKey)
                                                .value;

                                            try {
                                              int balesQuantityInInt =
                                                  balesQuantity != null
                                                      ? int.parse(
                                                          balesQuantity
                                                              .toString(),
                                                        )
                                                      : 0;

                                              if (balesQuantityInInt > 0) {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        CustomDigitScannerPage(
                                                      quantity:
                                                          balesQuantityInInt,
                                                      isGS1code: true,
                                                      singleValue: false,
                                                      manualEnabled: true,
                                                    ),
                                                    settings:
                                                        const RouteSettings(
                                                            name:
                                                                '/qr-scanner'),
                                                  ),
                                                );
                                              } else {
                                                await DigitToast.show(
                                                  context,
                                                  options: DigitToastOptions(
                                                    localizations.translate(
                                                        i18_local.stockDetails
                                                            .balesQuantityRequiredError),
                                                    true,
                                                    theme,
                                                  ),
                                                );
                                              }
                                            } catch (_) {
                                              await DigitToast.show(
                                                context,
                                                options: DigitToastOptions(
                                                  localizations.translate(i18_local
                                                      .stockDetails
                                                      .balesQuantityRequiredError),
                                                  true,
                                                  theme,
                                                ),
                                              );
                                            }
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
                                                  color: theme
                                                      .colorScheme.secondary,
                                                  icon: const Icon(Icons.edit),
                                                  onPressed: () async {
                                                    final balesQuantity = form
                                                        .control(
                                                            _balesQuantityKey)
                                                        .value;

                                                    try {
                                                      int balesQuantityInInt =
                                                          balesQuantity != null
                                                              ? int.parse(
                                                                  balesQuantity
                                                                      .toString(),
                                                                )
                                                              : 0;
                                                      if (balesQuantityInInt >
                                                          0) {
                                                        Navigator.of(context)
                                                            .push(
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                CustomDigitScannerPage(
                                                              quantity:
                                                                  balesQuantityInInt,
                                                              isGS1code: true,
                                                              gs1CodeList:
                                                                  scannerState
                                                                      .barCodes,
                                                              singleValue:
                                                                  false,
                                                              manualEnabled:
                                                                  true,
                                                            ),
                                                            settings:
                                                                const RouteSettings(
                                                                    name:
                                                                        '/qr-scanner'),
                                                          ),
                                                        );
                                                      } else {
                                                        await DigitToast.show(
                                                          context,
                                                          options:
                                                              DigitToastOptions(
                                                            localizations.translate(
                                                                i18_local
                                                                    .stockDetails
                                                                    .balesQuantityRequiredError),
                                                            true,
                                                            theme,
                                                          ),
                                                        );
                                                      }
                                                    } catch (_) {
                                                      await DigitToast.show(
                                                        context,
                                                        options:
                                                            DigitToastOptions(
                                                          localizations.translate(
                                                              i18_local
                                                                  .stockDetails
                                                                  .balesQuantityRequiredError),
                                                          true,
                                                          theme,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          ...scannedResources.map((e) => Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(e
                                                    .elements.values.first.data
                                                    .toString()),
                                              ))
                                        ]),

                                if ([
                                      StockRecordEntryType.receipt,
                                      StockRecordEntryType.dispatch,
                                    ].contains(entryType) ||
                                    transactionReasonType ==
                                        TransactionReason.damagedInTransit)
                                  DigitTextFormField(
                                    label: localizations.translate(
                                      i18_local.stockDetails
                                          .baleMismatchCommentsLabel,
                                    ),
                                    minLines: 2,
                                    maxLines: 3,
                                    onChanged: (value) {
                                      if (value.value == "") {
                                        form
                                            .control(_baleMismatchCommentsKey)
                                            .setValidators(
                                          [],
                                          updateParent: true,
                                          autoValidate: true,
                                        );
                                      } else {
                                        form
                                            .control(_baleMismatchCommentsKey)
                                            .setValidators(
                                          [
                                            Validators.delegate((validator) =>
                                                registration_utils
                                                        .CustomValidator
                                                    .sizeLessThan2(validator))
                                          ],
                                          updateParent: true,
                                          autoValidate: true,
                                        );
                                      }
                                    },
                                    formControlName: _baleMismatchCommentsKey,
                                    validationMessages: {
                                      "required": (object) =>
                                          localizations.translate(
                                            i18.common.corecommonRequired,
                                          ),
                                      'sizeLessThan2': (object) =>
                                          localizations.translate(i18_local
                                              .common.min3CharsRequired),
                                    },
                                  ),
                                if ([
                                      StockRecordEntryType.receipt,
                                      StockRecordEntryType.dispatch,
                                    ].contains(entryType) ||
                                    transactionReasonType ==
                                        TransactionReason.damagedInTransit)
                                  DigitTextFormField(
                                    label: localizations.translate(
                                      i18_local
                                          .stockDetails.manualScanCommentsLabel,
                                    ),
                                    minLines: 2,
                                    maxLines: 3,
                                    formControlName: _manualScanCommentsKey,
                                    onChanged: (value) {
                                      if (value.value == "") {
                                        form
                                            .control(_manualScanCommentsKey)
                                            .setValidators(
                                          [],
                                          updateParent: true,
                                          autoValidate: true,
                                        );
                                      } else {
                                        form
                                            .control(_manualScanCommentsKey)
                                            .setValidators(
                                          [
                                            Validators.delegate((validator) =>
                                                registration_utils
                                                        .CustomValidator
                                                    .sizeLessThan2(validator))
                                          ],
                                          updateParent: true,
                                          autoValidate: true,
                                        );
                                      }
                                    },
                                    validationMessages: {
                                      "required": (object) =>
                                          localizations.translate(
                                            i18.common.corecommonRequired,
                                          ),
                                      'sizeLessThan2': (object) =>
                                          localizations.translate(i18_local
                                              .common.min3CharsRequired),
                                    },
                                  ),
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

// sets final quantity value based on other quantity
  void calculateFinalQuantity(FormGroup form) {
    final balesQuantity = form.control(_balesQuantityKey).value as int?;
    final looseQuantity = form.control(_looseQuantityKey).value as int?;

    if (balesQuantity != null) {
      final quantity = balesQuantity * 50 + (looseQuantity ?? 0);

      setState(() {
        form.control(_transactionQuantityKey).value = quantity;
        form.control(_transactionQuantityKey).markAsTouched();
      });
    } else {
      form.control(_transactionQuantityKey).value = null;
      form.control(_transactionQuantityKey).markAsTouched();
    }
  }

  void clearQRCodes() {
    context
        .read<CustomDigitScannerBloc>()
        .add(const CustomDigitScannerEvent.handleScanner(
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
  List<AdditionalField> addBarCodesToFields(
      List<(BarcodeScanType, GS1Barcode)> barCodes) {
    List<AdditionalField> additionalFields = [];
    for (var element in barCodes) {
      List<String> keys = [];
      List<String> values = [];
      BarcodeScanType barcodeScanType = element.$1;
      for (var e in element.$2.elements.entries) {
        String key = e.key.toString();
        if (barcodeScanType == BarcodeScanType.manual) {
          key = "manual_${e.key}";
        }
        keys.add(key);
        values.add(e.value.data.toString());
      }
      additionalFields.add(AdditionalField(keys.join('|'), values.join('|')));
    }
    return additionalFields;
  }
}

class DisableWidget extends StatelessWidget {
  final bool disable;
  final Widget child;
  const DisableWidget({super.key, this.disable = true, required this.child});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disable,
      child: Opacity(opacity: disable ? 0.5 : 1, child: child),
    );
  }
}
