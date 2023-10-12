import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:recase/recase.dart';

import '../../../blocs/app_initialization/app_initialization.dart';
import '../../../blocs/facility/facility.dart';
import '../../../blocs/product_variant/product_variant.dart';
import '../../../blocs/record_stock/record_stock.dart';
import '../../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../../models/auth/auth_model.dart';
import '../../../models/data_model.dart';
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';
import '../../../widgets/header/back_navigation_help_header.dart';
import '../../../widgets/localized.dart';
import '../facility_selection.dart';

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

  FormGroup _form(StockRecordEntryType stockType) {
    return fb.group({
      _productVariantKey: FormControl<ProductVariantModel>(
        validators: [Validators.required],
      ),
      _secondaryPartyKey: FormControl<FacilityModel>(
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
      _deliveryTeamKey: FormControl<String>(),
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    //[TODO]: WAREHOUSE_MANAGER need to make in enum

    bool isWareHouseMgr = context.loggedInUserRoles
        .where(
          (role) => role.code == "WAREHOUSE_MANAGER",
        )
        .toList()
        .isNotEmpty;

    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, locationState) {
          return BlocConsumer<RecordStockBloc, RecordStockState>(
            listener: (context, stockState) {
              stockState.mapOrNull(
                persisted: (value) {
                  final parent = context.router.parent() as StackRouter;
                  parent.replace(AcknowledgementRoute());
                },
              );
            },
            builder: (context, stockState) {
              StockRecordEntryType entryType = stockState.entryType;

              const module = i18.stockDetails;

              String pageTitle;
              String quantityCountLabel;
              String? transactionReasonLabel;
              TransactionReason? transactionReason;
              TransactionType transactionType;

              List<TransactionReason>? reasons;

              switch (entryType) {
                case StockRecordEntryType.receipt:
                  pageTitle = module.receivedPageTitle;
                  quantityCountLabel = module.quantityReceivedLabel;
                  transactionType = TransactionType.received;

                  break;
                case StockRecordEntryType.dispatch:
                  pageTitle = module.issuedPageTitle;
                  quantityCountLabel = module.quantitySentLabel;
                  transactionType = TransactionType.dispatched;

                  break;
                case StockRecordEntryType.returned:
                  pageTitle = module.returnedPageTitle;
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
                    header: const Column(children: [
                      BackNavigationHelpHeaderWidget(),
                    ]),
                    footer: SizedBox(
                      height: 85,
                      child: DigitCard(
                        margin:
                            const EdgeInsets.only(left: 0, right: 0, top: 10),
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
                                    if (deliveryTeamSelected &&
                                        (form.control(_deliveryTeamKey).value ==
                                                null ||
                                            form
                                                .control(_deliveryTeamKey)
                                                .value
                                                .toString()
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
                                              .control(_transactionReasonKey)
                                              .value as TransactionReason?;
                                          break;
                                      }

                                      final secondaryParty = form
                                          .control(_secondaryPartyKey)
                                          .value as FacilityModel;

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
                                            senderId = secondaryParty.id;
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
                                            receiverId = secondaryParty.id;
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
                                          createdBy: context.loggedInUserUuid,
                                          createdTime:
                                              context.millisecondsSinceEpoch(),
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
                                                  if (waybillQuantity != null)
                                                    AdditionalField(
                                                      'waybill_quantity',
                                                      waybillQuantity,
                                                    ),
                                                  if (vehicleNumber != null)
                                                    AdditionalField(
                                                      'vehicle_number',
                                                      vehicleNumber,
                                                    ),
                                                  if (comments != null)
                                                    AdditionalField(
                                                      'comments',
                                                      comments,
                                                    ),
                                                  if (deliveryTeamName != null)
                                                    AdditionalField(
                                                      'deliveryTeam',
                                                      deliveryTeamName,
                                                    ),
                                                  if (hasLocationData) ...[
                                                    AdditionalField('lat', lat),
                                                    AdditionalField('lng', lng),
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
                                      fetched: (_, facilities) => facilities,
                                    ) ??
                                    [];

                                return DigitTextFormField(
                                  valueAccessor: FacilityValueAccessor(
                                    facilities,
                                  ),
                                  label: localizations.translate(
                                    '${pageTitle}_${i18.stockReconciliationDetails.stockLabel}',
                                  ),
                                  isRequired: true,
                                  suffix: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.search),
                                  ),
                                  formControlName: _secondaryPartyKey,
                                  readOnly: true,
                                  onTap: () async {
                                    final parent =
                                        context.router.parent() as StackRouter;
                                    final facility =
                                        await parent.push<FacilityModel>(
                                      FacilitySelectionRoute(
                                        facilities: facilities,
                                      ),
                                    );

                                    if (facility == null) return;
                                    form.control(_secondaryPartyKey).value =
                                        facility;
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
                                );
                              },
                            ),
                            Visibility(
                              visible: deliveryTeamSelected,
                              child: DigitTextFormField(
                                label: localizations.translate(
                                  i18.stockReconciliationDetails.teamCodeLabel,
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
                                  "number": (object) => localizations.translate(
                                        '${i18.stockDetails.quantityOfProductIndicatedOnWaybillLabel}_ERROR',
                                      ),
                                },
                              ),
                            if (isWareHouseMgr)
                              BlocBuilder<AppInitializationBloc,
                                  AppInitializationState>(
                                builder: (context, state) => state.maybeWhen(
                                  orElse: () => const Offstage(),
                                  initialized: (appConfiguration, _) {
                                    final transportTypeOptions =
                                        appConfiguration.transportTypes ??
                                            <TransportTypes>[];

                                    return DigitReactiveDropdown<String>(
                                      isRequired: false,
                                      label: localizations.translate(
                                        i18.stockDetails.transportTypeLabel,
                                      ),
                                      valueMapper: (e) => e,
                                      onChanged: (value) {
                                        setState(() {
                                          form.control(_typeOfTransportKey);
                                        });
                                      },
                                      initialValue: transportTypeOptions
                                          .firstOrNull?.name,
                                      menuItems: transportTypeOptions.map(
                                        (e) {
                                          return localizations
                                              .translate(e.name);
                                        },
                                      ).toList(),
                                      formControlName: _typeOfTransportKey,
                                    );
                                  },
                                ),
                              ),
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
    );
  }
}
