import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';
import 'package:inventory_management/inventory_management.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';
import 'package:inventory_management/utils/extensions/extensions.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:registration_delivery/utils/utils.dart' as registration_utils;
import 'package:inventory_management/utils/i18_key_constants.dart' as i18;
import '../../../widgets/localized.dart';
import 'package:inventory_management/blocs/product_variant.dart';
import 'package:inventory_management/blocs/record_stock.dart';
import 'package:inventory_management/widgets/back_navigation_help_header.dart';

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

  bool deliveryTeamSelected = false;
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
        Validators.min(0),
        Validators.max(10000),
      ]),
      _transactionReasonKey: FormControl<String>(),
      _waybillNumberKey: FormControl<String>(
        validators: [Validators.minLength(2), Validators.maxLength(200)],
      ),
      _waybillQuantityKey: FormControl<String>(),
      _vehicleNumberKey: FormControl<String>(),
      _typeOfTransportKey: FormControl<String>(),
      _driverNameKey: FormControl<String>(
        validators: [],
      ),
      _balesQuantityKey: FormControl<int>(
        validators: [],
      ),
      _commentsKey: FormControl<String>(),
      _deliveryTeamKey: FormControl<String>(
        validators: deliveryTeamSelected ? [Validators.required] : [],
      ),
      _manualScanCommentsKey: FormControl<String>(
        validators: [
          Validators.delegate((validator) =>
              registration_utils.CustomValidator.requiredMin(validator))
        ],
      ),
      _baleMismatchCommentsKey: FormControl<String>(
        validators: [
          Validators.delegate((validator) =>
              registration_utils.CustomValidator.requiredMin(validator))
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
                const localModule = i18_local.stockDetails;

                String pageTitle;
                String transactionPartyLabel;
                String balesCountLabel;
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
                    return BlocBuilder<DigitScannerBloc, DigitScannerState>(
                        builder: (context, scannerState) {
                      if (scannerState.barCodes.isNotEmpty) {
                        scannedResources.clear();
                        scannedResources.addAll(scannerState.barCodes);
                      }

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

                                          final waybillNumber = form
                                              .control(_waybillNumberKey)
                                              .value as String?;

                                          final waybillQuantity = form
                                              .control(_waybillQuantityKey)
                                              .value as String?;

                                          final int? balesQuantity = form
                                              .control(_balesQuantityKey)
                                              .value;

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

                                          final List<AdditionalField>
                                              additionalFields = [];
                                          final scannerState = context
                                              .read<DigitScannerBloc>()
                                              .state;
                                          final List<GS1Barcode> barcodes =
                                              scannerState.barCodes;

                                          final List<String> qrCodes =
                                              scannerState.qrCodes;

                                          if ([
                                            StockRecordEntryType.receipt,
                                            StockRecordEntryType.dispatch
                                          ].contains(entryType)) {
                                            if (balesQuantity != null &&
                                                (barcodes.length +
                                                        qrCodes.length) !=
                                                    int.parse(balesQuantity
                                                        .toString()) &&
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

                                            if (qrCodes.isNotEmpty &&
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
                                                        InventorySingleton()
                                                            .loggedInUser
                                                            ?.name,
                                                      ),
                                                      if (waybillQuantity !=
                                                              null &&
                                                          waybillQuantity
                                                              .trim()
                                                              .isNotEmpty)
                                                        AdditionalField(
                                                          'waybill_quantity',
                                                          waybillQuantity,
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
                                                            balesQuantity),
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
                                                        addBarCodesToFields(
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
                                                                  allFacilities))
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
                                                    _waybillNumberKey,
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
                                                  deliveryTeamSelected = false;
                                                  if (isWareHouseMgr) {
                                                    form
                                                        .control(
                                                      _driverNameKey,
                                                    )
                                                        .setValidators(
                                                      [
                                                        Validators.required,
                                                        Validators.minLength(2),
                                                        Validators.maxLength(
                                                            200),
                                                      ],
                                                      updateParent: true,
                                                      autoValidate: true,
                                                    );

                                                    form
                                                        .control(
                                                      _waybillNumberKey,
                                                    )
                                                        .setValidators(
                                                      [
                                                        Validators.required,
                                                        Validators.minLength(2),
                                                        Validators.maxLength(
                                                            200),
                                                      ],
                                                      updateParent: true,
                                                      autoValidate: true,
                                                    );
                                                    form
                                                        .control(
                                                      _waybillQuantityKey,
                                                    )
                                                        .setValidators(
                                                      [
                                                        Validators.required,
                                                        Validators.number(),
                                                        Validators.min(0),
                                                        Validators.max(
                                                            maxCount),
                                                      ],
                                                      updateParent: true,
                                                      autoValidate: true,
                                                    );
                                                    form
                                                        .control(
                                                      _typeOfTransportKey,
                                                    )
                                                        .setValidators(
                                                      [
                                                        Validators.required,
                                                      ],
                                                      updateParent: true,
                                                      autoValidate: true,
                                                    );
                                                    form
                                                        .control(
                                                      _vehicleNumberKey,
                                                    )
                                                        .setValidators(
                                                      [
                                                        Validators.required,
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
                                                  form
                                                      .control(_deliveryTeamKey)
                                                      .value = '';

                                                  final facility =
                                                      await context.router.push(
                                                    InventoryFacilitySelectionRoute(
                                                      facilities: allFacilities,
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
                                                        _waybillNumberKey,
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
                                                            Validators.required,
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
                                                          _waybillNumberKey,
                                                        )
                                                            .setValidators(
                                                          [
                                                            Validators.required,
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
                                                          [
                                                            Validators.required,
                                                            Validators.number(),
                                                            Validators.min(0),
                                                            Validators.max(
                                                                maxCount),
                                                          ],
                                                          updateParent: true,
                                                          autoValidate: true,
                                                        );
                                                        form
                                                            .control(
                                                          _typeOfTransportKey,
                                                        )
                                                            .setValidators(
                                                          [
                                                            Validators.required,
                                                          ],
                                                          updateParent: true,
                                                          autoValidate: true,
                                                        );
                                                        form
                                                            .control(
                                                          _vehicleNumberKey,
                                                        )
                                                            .setValidators(
                                                          [
                                                            Validators.required,
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

                                if ([
                                  StockRecordEntryType.receipt,
                                  StockRecordEntryType.dispatch,
                                  StockRecordEntryType.returned
                                ].contains(entryType))
                                  DigitTextFormField(
                                    keyboardType: TextInputType.number,
                                    label: localizations.translate(
                                      balesCountLabel,
                                    ),
                                    formControlName: _balesQuantityKey,
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

                                Visibility(
                                  visible: true,
                                  child: DigitTextFormField(
                                    isRequired: false,
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
                                    suffix: [
                                      StockRecordEntryType.receipt,
                                      StockRecordEntryType.dispatch,
                                      StockRecordEntryType.returned
                                    ].contains(entryType)
                                        ? IconButton(
                                            onPressed: () {
                                              //[TODO: Add route to auto_route]
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const CustomDigitScannerPage(
                                                    quantity: 1,
                                                    isGS1code: false,
                                                    singleValue: false,
                                                    manualEnabled: false,
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
                                          )
                                        : null,
                                    maxLines: 3,
                                    formControlName: _deliveryTeamKey,
                                  ),
                                ),
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
                                const SizedBox(
                                  height: kPadding,
                                ),
                                if ([
                                  StockRecordEntryType.receipt,
                                  StockRecordEntryType.dispatch,
                                  StockRecordEntryType.returned
                                ].contains(entryType))
                                  DigitTextFormField(
                                    label: localizations.translate(
                                      i18_local.stockDetailsReceiptShowcase
                                          .driverName,
                                    ),
                                    isRequired: false,
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
                                      'min2': (object) => localizations
                                          .translate(
                                              i18.common.min2CharsRequired)
                                          .replaceAll('{}', ''),
                                    },
                                  ),
                                if ([
                                  StockRecordEntryType.receipt,
                                  StockRecordEntryType.dispatch,
                                  StockRecordEntryType.returned
                                ].contains(entryType))
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

                                // todo not yet confirmed if needed or not for issue flow
                                if ([
                                  StockRecordEntryType.receipt,
                                  StockRecordEntryType.dispatch,
                                ].contains(entryType))
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
                                                //[TODO: Add route to auto_route]
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        CustomDigitScannerPage(
                                                      quantity:
                                                          balesQuantityInInt,
                                                      isGS1code: true,
                                                      singleValue: false,
                                                      manualEnabled: false,
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
                                                        //[TODO: Add route to auto_route]
                                                        Navigator.of(context)
                                                            .push(
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                CustomDigitScannerPage(
                                                              quantity:
                                                                  balesQuantityInInt,
                                                              isGS1code: true,
                                                              singleValue:
                                                                  false,
                                                              manualEnabled:
                                                                  false,
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
                                ].contains(entryType))
                                  DigitTextFormField(
                                    label: localizations.translate(
                                      i18_local.stockDetails
                                          .baleMismatchCommentsLabel,
                                    ),
                                    minLines: 2,
                                    maxLines: 3,
                                    formControlName: _baleMismatchCommentsKey,
                                    validationMessages: {
                                      "required": (object) =>
                                          localizations.translate(
                                            i18.common.corecommonRequired,
                                          ),
                                      "min2": (object) =>
                                          localizations.translate(
                                            i18.common.min2CharsRequired,
                                          ),
                                    },
                                  ),
                                if ([
                                  StockRecordEntryType.receipt,
                                  StockRecordEntryType.dispatch,
                                ].contains(entryType))
                                  DigitTextFormField(
                                    label: localizations.translate(
                                      i18_local
                                          .stockDetails.manualScanCommentsLabel,
                                    ),
                                    minLines: 2,
                                    maxLines: 3,
                                    formControlName: _manualScanCommentsKey,
                                    validationMessages: {
                                      "required": (object) =>
                                          localizations.translate(
                                            i18.common.corecommonRequired,
                                          ),
                                      "min2": (object) =>
                                          localizations.translate(
                                            i18.common.min2CharsRequired,
                                          ),
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
  AdditionalField addBarCodesToFields(List<GS1Barcode> barCodes) {
    List<String> keys = [];
    List<String> values = [];
    for (var element in barCodes) {
      for (var e in element.elements.entries) {
        keys.add(e.key.toString());
        values.add(e.value.data.toString());
      }
    }
    return AdditionalField(keys.join('|'), values.join('|'));
  }
}
