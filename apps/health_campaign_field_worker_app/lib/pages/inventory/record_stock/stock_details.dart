import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:recase/recase.dart';

import '../../../blocs/app_initialization/app_initialization.dart';
import '../../../blocs/facility/facility.dart';
import '../../../blocs/product_variant/product_variant.dart';
import '../../../blocs/record_stock/record_stock.dart';
import '../../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../../models/data_model.dart';
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';
import '../../../widgets/header/back_navigation_help_header.dart';
import '../../../widgets/localized.dart';

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
  static const _transactingPartyKey = 'transactingParty';
  static const _transactionQuantityKey = 'quantity';
  static const _transactionReasonKey = 'transactionReason';
  static const _waybillNumberKey = 'waybillNumber';
  static const _waybillQuantityKey = 'waybillQuantity';
  static const _vehicleNumberKey = 'vehicleNumber';
  static const _typeOfTransportKey = 'typeOfTransport';
  static const _commentsKey = 'comments';

  FormGroup _form() {
    return fb.group({
      _productVariantKey: FormControl<ProductVariantModel>(
        validators: [Validators.required],
      ),
      _transactingPartyKey: FormControl<FacilityModel>(
        validators: [Validators.required],
      ),
      _transactionQuantityKey: FormControl<String>(validators: [
        Validators.number,
        Validators.required,
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
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
              String transactionPartyLabel;
              String quantityCountLabel;
              String? transactionReasonLabel;
              TransactionType transactionType;
              TransactionReason? transactionReason;

              List<TransactionReason>? reasons;

              switch (entryType) {
                case StockRecordEntryType.receipt:
                  pageTitle = module.receivedPageTitle;
                  transactionPartyLabel = module.selectTransactingPartyReceived;
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
                  transactionPartyLabel = module.selectTransactingPartyReturned;
                  quantityCountLabel = module.quantityReturnedLabel;
                  transactionType = TransactionType.received;
                  break;
                case StockRecordEntryType.loss:
                  pageTitle = module.lostPageTitle;
                  transactionPartyLabel =
                      module.selectTransactingPartyReceivedFromLost;
                  quantityCountLabel = module.quantityLostLabel;
                  transactionType = TransactionType.dispatched;
                  transactionReasonLabel = module.transactionReasonLost;
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
                  transactionType = TransactionType.dispatched;
                  transactionReasonLabel = module.transactionReasonDamaged;
                  reasons = [
                    TransactionReason.damagedInStorage,
                    TransactionReason.damagedInTransit,
                  ];
                  break;
              }

              transactionReasonLabel ??= '';

              return ReactiveFormBuilder(
                form: _form,
                builder: (context, form, child) {
                  return ScrollableContent(
                    header: Column(children: const [
                      BackNavigationHelpHeaderWidget(),
                    ]),
                    footer: SizedBox(
                      height: 90,
                      child: DigitCard(
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

                                    final transactingParty = form
                                        .control(_transactingPartyKey)
                                        .value as FacilityModel;

                                    final quantity = form
                                        .control(_transactionQuantityKey)
                                        .value as String;

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

                                    final stockModel = StockModel(
                                      clientReferenceId: IdGen.i.identifier,
                                      productVariantId: productVariant.id,
                                      transactingPartyId: transactingParty.id,
                                      transactingPartyType: 'WAREHOUSE',
                                      transactionType: transactionType,
                                      transactionReason: transactionReason,
                                      referenceId: stockState.projectId,
                                      referenceIdType: 'PROJECT',
                                      quantity: quantity.toString(),
                                      waybillNumber: waybillNumber,
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

                                    final submit = await DigitDialog.show<bool>(
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
                                    return DigitDropdown<ProductVariantModel>(
                                      formControlName: _productVariantKey,
                                      label: localizations.translate(
                                        module.selectProductLabel,
                                      ),
                                      valueMapper: (value) {
                                        return localizations.translate(
                                          value.sku ?? value.id,
                                        );
                                      },
                                      menuItems: productVariants,
                                      validationMessages: {
                                        'required': (object) =>
                                            'Field is required',
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
                              DigitDropdown<TransactionReason>(
                                label: localizations.translate(
                                  transactionReasonLabel ?? 'Reason',
                                ),
                                menuItems: reasons ?? [],
                                formControlName: _transactionReasonKey,
                                valueMapper: (value) => value.name.titleCase,
                              ),
                            BlocBuilder<FacilityBloc, FacilityState>(
                              builder: (context, state) {
                                return DigitSearchDropdown<FacilityModel>(
                                  label: localizations.translate(
                                    transactionPartyLabel,
                                  ),
                                  suggestionsCallback: (items, pattern) {
                                    return items
                                        .where((e) => e.id.contains(pattern));
                                  },
                                  menuItems: state.maybeWhen(
                                    orElse: () => [],
                                    fetched: (_, facilities) => facilities,
                                  ),
                                  formControlName: _transactingPartyKey,
                                  valueMapper: (value) => value.id,
                                );
                              },
                            ),
                            DigitTextFormField(
                              formControlName: _transactionQuantityKey,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              isRequired: true,
                              label: localizations.translate(
                                quantityCountLabel,
                              ),
                            ),
                            DigitTextFormField(
                              label: localizations.translate(
                                i18.stockDetails.waybillNumberLabel,
                              ),
                              formControlName: _waybillNumberKey,
                            ),
                            DigitTextFormField(
                              label: localizations.translate(
                                i18.stockDetails
                                    .quantityOfProductIndicatedOnWaybillLabel,
                              ),
                              formControlName: _waybillQuantityKey,
                            ),
                            BlocBuilder<AppInitializationBloc,
                                AppInitializationState>(
                              builder: (context, state) => state.maybeWhen(
                                orElse: () => const Offstage(),
                                initialized: (appConfiguration, _) {
                                  final transportTypeOptions =
                                      appConfiguration.transportTypes ??
                                          <TransportTypes>[];

                                  return DigitDropdown<String>(
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
                                    initialValue:
                                        transportTypeOptions.firstOrNull?.name,
                                    menuItems: transportTypeOptions.map(
                                      (e) {
                                        return localizations.translate(e.name);
                                      },
                                    ).toList(),
                                    formControlName: _typeOfTransportKey,
                                  );
                                },
                              ),
                            ),
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
