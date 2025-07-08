import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/input_wrapper.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:inventory_management/blocs/record_stock.dart';
import 'package:inventory_management/blocs/stock.dart';
import 'package:inventory_management/data/repositories/local/stock.dart';
import 'package:inventory_management/models/entities/inventory_transport_type.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:inventory_management/models/entities/transaction_reason.dart';
import 'package:inventory_management/models/entities/transaction_type.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';
import 'package:inventory_management/utils/utils.dart';
import 'package:inventory_management/widgets/localized.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:inventory_management/utils/i18_key_constants.dart' as i18;
import '../../utils/constants.dart';
import '../../utils/extensions/extensions.dart';

class DynamicTabsPage extends LocalizedStatefulWidget {
  const DynamicTabsPage({super.key});

  @override
  LocalizedState<DynamicTabsPage> createState() => _DynamicTabsPageState();
}

class _DynamicTabsPageState extends LocalizedState<DynamicTabsPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  late final Map<String, FormGroup> _forms = {};
  late List<ProductVariantModel> products;
  late String receivedFrom;
  late String secondaryPartyType;
  late List<dynamic> _formkeys;
  final Map<String, StockModel> _tabStocks = {};
  String _sharedMRN = '';
  bool _isInitializing = true;
  String? senderIdToShowOnTab = '';

// fields to capture stock metadata
  String? senderId;
  String? senderType;
  String? receiverId;
  String? receiverType;
  String? transactionType;
  String? transactionReason;
  String? receiverIdForCDD;

  static const _productVariantKey = 'productVariant';
  static const _secondaryPartyKey = 'secondaryParty';
  static const _transactionReasonKey = 'transactionReason';
  static const _transactionQuantityKey = 'quantity';
  static const _waybillNumberKey = 'waybillNumber';
  // static const _waybillQuantityKey = 'waybillQuantity';
  static const _batchNumberKey = 'batchNumberKey';
  static const _vehicleNumberKey = 'vehicleNumber';
  static const _typeOfTransportKey = 'typeOfTransport';
  static const _commentsKey = 'comments';
  static const _deliveryTeamKey = 'deliveryTeam';
  // static const _unusedBlistersReturnedKey = 'unusedBlistersReturned';
  static const _partiallyUsedBlistersReturnedKey =
      'partiallyUsedBlistersReturned';
  static const _wastedBlistersReturnedKey = 'wastedBlistersReturned';
  List<InventoryTransportTypes> transportTypes = [];

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    try {
      // Generate unique MRN first
      final mrnNumbers = await UniqueIdGeneration()
          .generateUniqueMaterialNoteNumber(
            loggedInUserId: InventorySingleton().loggedInUserUuid,
            returnCombinedIds: true,
          )
          .timeout(const Duration(seconds: 5));

      if (mrnNumbers.isEmpty) {
        throw Exception('Failed to generate MRN number');
      }

      _sharedMRN = mrnNumbers.first;

      transportTypes = InventorySingleton().transportType;
      context.read<LocationBloc>().add(const LoadLocationEvent());

      final state = context.read<StockBloc>().state;
      if (state is StockSelectedState) {
        products = state.selectedProducts;
        receivedFrom = state.receivedFrom;
        secondaryPartyType = state.secondaryPartyType;
        _tabController = TabController(length: products.length, vsync: this);
        _formkeys =
            List.generate(products.length, (_) => GlobalKey<FormState>());

        await _initializeForms();
        await _initializeStocks();
      }
    } on TimeoutException {
      _sharedMRN = 'MRN-${DateTime.now().millisecondsSinceEpoch}';
      debugPrint('MRN generation timed out, using fallback');
    } catch (e) {
      _sharedMRN = 'MRN-${DateTime.now().millisecondsSinceEpoch}';
      debugPrint('Error generating MRN: $e');
    } finally {
      setState(() => _isInitializing = false);
    }
  }

  Future<void> _initializeForms() async {
    final state = context.read<RecordStockBloc>().state;
    final entryType = state.entryType;

    final repository =
        context.read<LocalRepository<StockModel, StockSearchModel>>()
            as StockLocalRepository;

    final Map<String, FormGroup> tempForms = {};

    for (final product in products) {
      final List<StockModel> stockModel = await CustomStockMethods()
          .getStockBasedonProductVariantId(repository, product.id!);

      tempForms[product.sku!] = FormGroup({
        'materialNoteNumber': FormControl<String>(value: _sharedMRN),
        _transactionReasonKey: FormControl<String>(),
        _waybillNumberKey: FormControl<String>(
          validators: InventorySingleton().isWareHouseMgr
              ? [
                  Validators.minLength(2),
                  Validators.maxLength(200),
                  Validators.required,
                  Validators.delegate((control) {
                    final value = control.value?.toString();
                    if (value == null || value.isEmpty) return null;

                    final emojiRegex = RegExp(
                      r'(\p{Emoji_Presentation}|\p{Extended_Pictographic}|\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
                      unicode: true,
                    );
                    if (emojiRegex.hasMatch(value)) {
                      return {'noEmojis': true};
                    }

                    final validWaybillRegex =
                        RegExp(r'^[a-zA-Z0-9\-_/#:.,() ]+$');
                    if (!validWaybillRegex.hasMatch(value)) {
                      return {'invalidCharacters': true};
                    }

                    for (final specialChar in [
                      '-',
                      '.',
                      ',',
                      ')',
                      '(',
                      '/',
                      '#',
                      ':',
                      '_'
                    ]) {
                      if (value
                          .contains('$specialChar$specialChar$specialChar')) {
                        return {'repeatedChars': true};
                      }
                    }

                    final repeatedCharsPattern = RegExp(r'(.)\1{3,}');
                    if (repeatedCharsPattern.hasMatch(value)) {
                      return {'repeatedChars': true};
                    }

                    return null;
                  }),
                ]
              : [],
        ),
        _transactionQuantityKey: FormControl<int>(
          validators: [
            Validators.number(),
            Validators.required,
            Validators.min(1),
            Validators.max(Constants.stockMaxLimit),
            Validators.delegate(
              (control) => _createStockQuantityValidator(
                product.sku!,
                control,
                stockModel.isEmpty
                    ? 0
                    : stockModel
                        .map((e) => int.parse(e.quantity ?? '0'))
                        .reduce((value, element) => value + element),
              ),
            ),
          ],
        ),
        _batchNumberKey: FormControl<String>(),
        _commentsKey: FormControl<String>(),
        _partiallyUsedBlistersReturnedKey: FormControl<int>(),
        _wastedBlistersReturnedKey: FormControl<int>(),
      });
    }

    _forms.addAll(tempForms);
  }

  /// Custom validator for stock quantity based on product type and available stock
  Map<String, dynamic>? _createStockQuantityValidator(
      String productName, AbstractControl<dynamic> control, int availableQty) {
    // Only validate for dispatch operations and exclude CDD roles
    final state = context.read<RecordStockBloc>().state;
    if (state.entryType != StockRecordEntryType.dispatch ||
        InventorySingleton().isCDD) {
      return null;
    }

    final enteredQuantity = control.value;
    if (enteredQuantity == null || enteredQuantity == 0) {
      return null; // Let required validator handle this
    }

    // Check if entered quantity exceeds available stock
    if (enteredQuantity > availableQty) {
      return {
        'insufficientStock': localizations.translate(
          "i18.stockDetails.issueStockLabelExceeded",
        )
        // 'Can\'t issue more ${productDisplayName.toLowerCase()} than available ($availableQuantity)'
      };
    }

    return null;
  }

  Future<void> _initializeStocks() async {
    for (final product in products) {
      _tabStocks[product.sku ?? ''] = await _createEmptyStock(product);
    }
  }

  Future<StockModel> _createEmptyStock(ProductVariantModel product) async {
    final productSku = product.sku ?? '';
    final state = context.read<RecordStockBloc>().state;
    StockRecordEntryType entryType = state.entryType;

    // info setting the transaction related info here for the stock the model

    // setTransactionTypeAndReason(
    //   entryType,
    //   transactionType,
    //   transactionReason,
    // );

    switch (entryType) {
      case StockRecordEntryType.receipt:
        transactionType = TransactionType.received.toValue();
        transactionReason = TransactionReason.received.toValue();

        break;
      case StockRecordEntryType.dispatch:
        transactionType = TransactionType.dispatched.toValue();

        break;
      case StockRecordEntryType.returned:
        transactionType = TransactionType.received.toValue();
        transactionReason = TransactionReason.returned.toValue();

        break;
      case StockRecordEntryType.loss:
        transactionType = TransactionType.dispatched.toValue();

        break;
      case StockRecordEntryType.damaged:
        transactionType = TransactionType.dispatched.toValue();
        break;
    }

    // setSenderReceiverIdAndType(
    //     entryType, senderId, senderType, receiverId, receiverType);
    final secondartParty = receivedFrom.contains(("FAC_"))
        ? receivedFrom.replaceFirst("FAC_", "")
        : receivedFrom;

    final primaryType = BlocProvider.of<RecordStockBloc>(
      context,
    ).state.primaryType;

    final primaryId = BlocProvider.of<RecordStockBloc>(
      context,
    ).state.primaryId;

    switch (entryType) {
      case StockRecordEntryType.receipt:
      case StockRecordEntryType.loss:
      case StockRecordEntryType.damaged:
      case StockRecordEntryType.returned:
        senderId = secondaryPartyType == 'STAFF'
            ? secondartParty.split(pipeSeparator).last
            : secondartParty;
        senderType = secondaryPartyType;
        receiverId = primaryId;
        receiverType = primaryType;
        senderIdToShowOnTab = senderId;
        receiverIdForCDD = primaryId?.split(pipeSeparator).first;
        break;
      case StockRecordEntryType.dispatch:
        receiverId = secondaryPartyType == 'STAFF'
            ? secondartParty.split(pipeSeparator).last
            : secondartParty;
        receiverType = secondaryPartyType;
        senderId = primaryId;
        senderType = primaryType;
        senderIdToShowOnTab = senderId;
        receiverIdForCDD = secondartParty.split(pipeSeparator).first;
        break;
    }

    String? distributorName = secondaryPartyType == 'STAFF'
        ? secondartParty.split(pipeSeparator).first
        : null;

    return StockModel(
      id: null,
      facilityId: receivedFrom,
      productVariantId: product.id,
      quantity: _forms[productSku]
              ?.control(_transactionQuantityKey)
              ?.value
              ?.toString() ??
          '0',
      wayBillNumber:
          _forms[productSku]!.control(_waybillNumberKey).value?.toString(),
      transactionReason: transactionReason ??
          _forms[productSku]?.control(_transactionReasonKey).value?.toString(),
      clientReferenceId: IdGen.i.identifier,
      additionalFields: StockAdditionalFields(
        version: 1,
        fields: [
          AdditionalField('productName', product.sku),
          AdditionalField('variation', product.variation),
          AdditionalField('materialNoteNumber', _sharedMRN),
          if (distributorName != null)
            AdditionalField('distributorName', distributorName),
        ],
      ),
      referenceId: InventorySingleton().projectId,
      referenceIdType: 'PROJECT',
      transactingPartyId: null,
      transactingPartyType: null,
      receiverId: receiverId,
      receiverType: receiverType,
      senderId: senderId,
      senderType: senderType,
      nonRecoverableError: false,
      rowVersion: null,
      transactionType: transactionType,
      auditDetails: AuditDetails(
        createdBy: InventorySingleton().loggedInUserUuid,
        createdTime: context.millisecondsSinceEpoch(),
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: InventorySingleton().loggedInUserUuid,
        createdTime: context.millisecondsSinceEpoch(),
        lastModifiedBy: InventorySingleton().loggedInUserUuid,
        lastModifiedTime: context.millisecondsSinceEpoch(),
      ),
    );
  }

  void setTransactionTypeAndReason(StockRecordEntryType entryType,
      String? transactionType, String? transactionReason) {
    // todo set the reasons , for othe entryType (can capture from field once added)

    switch (entryType) {
      case StockRecordEntryType.receipt:
        transactionType = TransactionType.received.toValue();
        transactionReason = TransactionReason.received.toValue();

        break;
      case StockRecordEntryType.dispatch:
        transactionType = TransactionType.dispatched.toValue();

        break;
      case StockRecordEntryType.returned:
        transactionType = TransactionType.received.toValue();
        transactionReason = TransactionReason.returned.toValue();

        break;
      case StockRecordEntryType.loss:
        transactionType = TransactionType.dispatched.toValue();

        break;
      case StockRecordEntryType.damaged:
        transactionType = TransactionType.dispatched.toValue();
        break;
    }
  }

  void setSenderReceiverIdAndType(
    StockRecordEntryType entryType,
    String? senderId,
    String? senderType,
    String? receiverId,
    String? receiverType,
  ) {
    // info captured on the transaction details , secondaryParty
    // additionalCheck to correct this ,(TODO :correct this at stock detail page )

    final secondartParty = receivedFrom.contains(("FAC_"))
        ? receivedFrom.replaceFirst("FAC_", "")
        : receivedFrom;

    final primaryType = BlocProvider.of<RecordStockBloc>(
      context,
    ).state.primaryType;

    final primaryId = BlocProvider.of<RecordStockBloc>(
      context,
    ).state.primaryId;

    switch (entryType) {
      case StockRecordEntryType.receipt:
      case StockRecordEntryType.loss:
      case StockRecordEntryType.damaged:
      case StockRecordEntryType.returned:
        senderId = secondartParty;
        senderType = "WAREHOUSE";
        receiverId = primaryId;
        receiverType = primaryType;

        break;
      case StockRecordEntryType.dispatch:
        receiverId = secondartParty;
        receiverType = "WAREHOUSE";
        senderId = primaryId;
        senderType = primaryType;
        break;
    }
  }

  Widget _buildTabContent(
      BuildContext context, String productName, String receivedFrom) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    final isDistributor = InventorySingleton().isDistributor;

    final stockState = context.read<RecordStockBloc>().state;
    bool isWareHouseMgr = InventorySingleton().isWareHouseMgr;
    final form = _forms[productName]!;
    StockRecordEntryType entryType = stockState.entryType;
    bool isLastTab = _tabController.index == _tabController.length - 1;
    String quantityCountLabel;
    String partiallyUsedQuantityCountLabel = 'partiallyUsedQuantityCountLabel';
    String wastedQuantityCountLabel = 'wastedQuantityCountLabel';
    String pageTitle;

    switch (entryType) {
      case StockRecordEntryType.receipt:
        pageTitle = i18.stockDetails.receivedPageTitle;
        if (productName == "Blue VAS" || productName == "Red VAS") {
          quantityCountLabel = "i18.stockDetails.quantityCapsuleReceivedLabel";
        } else {
          quantityCountLabel = i18.stockDetails.quantityReceivedLabel;
        }
        break;
      case StockRecordEntryType.dispatch:
        pageTitle = pageTitle = InventorySingleton().isWareHouseMgr
            ? i18.stockDetails.issuedPageTitle
            : i18.stockDetails.returnedPageTitle;
        if (productName == "Blue VAS" || productName == "Red VAS") {
          quantityCountLabel = InventorySingleton().isWareHouseMgr
              ? "i18.stockDetails.quantityCapsuleSentLabel"
              : "i18.stockDetails.quantityCapsuleUnusedReturnedLabel";
          partiallyUsedQuantityCountLabel =
              "i18.stockDetails.quantityCapsulePartiallyUsedReturnedLabel";
          wastedQuantityCountLabel =
              "i18.stockDetails.quantityCapsuleWastedReturnedLabel";
        } else {
          quantityCountLabel = InventorySingleton().isWareHouseMgr
              ? i18.stockDetails.quantitySentLabel
              : "i18.stockDetails.quantityUnusedReturnedLabel";
          partiallyUsedQuantityCountLabel =
              "i18.stockDetails.quantityPartiallyUsedReturnedLabel";
          wastedQuantityCountLabel =
              "i18.stockDetails.quantityWastedReturnedLabel";
        }
        break;
      case StockRecordEntryType.returned:
        pageTitle = i18.stockDetails.returnedPageTitle;
        if (productName == "Blue VAS" || productName == "Red VAS") {
          quantityCountLabel =
              "i18.stockDetails.quantityCapsuleUnusedReturnedLabel";

          partiallyUsedQuantityCountLabel =
              "i18.stockDetails.quantityCapsulePartiallyUsedReturnedLabel";
          wastedQuantityCountLabel =
              "i18.stockDetails.quantityCapsuleWastedReturnedLabel";
        } else {
          quantityCountLabel = "i18.stockDetails.quantityUnusedReturnedLabel";

          partiallyUsedQuantityCountLabel =
              "i18.stockDetails.quantityPartiallyUsedReturnedLabel";
          wastedQuantityCountLabel =
              "i18.stockDetails.quantityWastedReturnedLabel";
        }
        break;
      case StockRecordEntryType.loss:
        pageTitle = i18.stockDetails.lostPageTitle;
        quantityCountLabel = i18.stockDetails.quantityLostLabel;

        break;
      case StockRecordEntryType.damaged:
        pageTitle = i18.stockDetails.damagedPageTitle;
        quantityCountLabel = i18.stockDetails.quantityDamagedLabel;
        break;
    }

    if ((entryType == StockRecordEntryType.dispatch &&
            InventorySingleton().isCommunityDistributor) ||
        entryType == StockRecordEntryType.returned) {
      form.control(_partiallyUsedBlistersReturnedKey).setValidators([
        Validators.number(),
        Validators.required,
        Validators.min(0),
        Validators.max(Constants.stockMaxLimit),
      ], autoValidate: true);
    }
    if (entryType == StockRecordEntryType.dispatch &&
        InventorySingleton().isCommunityDistributor) {
      form.control(_wastedBlistersReturnedKey).setValidators([
        Validators.number(),
        Validators.required,
        Validators.min(0),
        Validators.max(Constants.stockMaxLimit),
      ], autoValidate: true);
    }

    return _KeepAliveTabContent(
      child: ReactiveForm(
        formGroup: form,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            DigitCard(
              padding: const EdgeInsets.all(16),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      localizations.translate(pageTitle),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Expanded(child: Text('Resource')),
                        Expanded(child: Text(productName)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text((entryType ==
                                  StockRecordEntryType.returned)
                              ? localizations.translate(i18
                                  .stockDetails.selectTransactingPartyReturned)
                              : localizations.translate(
                                  '${pageTitle}_${i18.stockReconciliationDetails.stockLabel}')),
                        ),
                        Expanded(
                          child: Text(
                            senderIdToShowOnTab == null
                                ? localizations
                                    .translate(i18.common.noMatchFound)
                                : (entryType == StockRecordEntryType.dispatch ||
                                        entryType ==
                                            StockRecordEntryType.returned)
                                    ? (InventorySingleton()
                                            .isHealthFacilitySupervisor)
                                        ? localizations
                                            .translate('FAC_Delivery Team')
                                        // localizations
                                        //     .translate(receiverIdForCDD!)
                                        : localizations
                                            .translate('FAC_$receiverId')
                                    : localizations
                                        .translate('FAC_$senderIdToShowOnTab'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            DigitCard(
              padding: const EdgeInsets.all(16),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Stock Details',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    if (isWareHouseMgr)
                      ReactiveWrapperField(
                          formControlName: _waybillNumberKey,
                          validationMessages: {
                            'required': (object) =>
                                'Waybill number is required',
                            'minLength': (object) =>
                                'Waybill number must be at least 2 characters',
                            'maxLength': (object) =>
                                'Waybill number cannot exceed 200 characters',
                            'noEmojis': (object) =>
                                'Waybill number cannot contain emoji characters',
                            'invalidCharacters': (object) =>
                                'Waybill number contains invalid characters. Only use letters, numbers, and basic punctuation',
                            'repeatedChars': (object) =>
                                'Waybill number cannot contain excessive repetition of the same character',
                          },
                          builder: (field) {
                            return LabeledField(
                              label: localizations.translate(
                                i18.stockDetails.waybillNumberLabel,
                              ),
                              isRequired: true,
                              child: BaseDigitFormInput(
                                errorMessage: field.errorText,
                                inputFormatters: [
                                  // Allow only letters, numbers, and specific special characters commonly used in waybill numbers
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z0-9\-_/#:.,() ]'),
                                  ),
                                  LengthLimitingTextInputFormatter(200),
                                  // Prevent excessive repetition of characters
                                  TextInputFormatter.withFunction(
                                    (oldValue, newValue) {
                                      final text = newValue.text;
                                      // Check for repetitions of special characters
                                      for (final specialChar in [
                                        '-',
                                        '.',
                                        ',',
                                        ')',
                                        '(',
                                        '/',
                                        '#',
                                        ':',
                                        '_'
                                      ]) {
                                        if (text.contains(
                                            '$specialChar$specialChar$specialChar')) {
                                          return oldValue;
                                        }
                                      }

                                      // Check for any character repeated excessively (4+ times)
                                      final repeatedCharsPattern =
                                          RegExp(r'(.)\1{3,}');
                                      if (repeatedCharsPattern.hasMatch(text)) {
                                        return oldValue;
                                      }

                                      return newValue;
                                    },
                                  ),
                                ],
                                onChange: (val) {
                                  field.control.markAsTouched();
                                  field.control.value = val;
                                },
                              ),
                            );
                          }),
                    if (isWareHouseMgr &&
                        entryType != StockRecordEntryType.returned)
                      ReactiveWrapperField(
                          formControlName: _batchNumberKey,
                          builder: (field) {
                            return InputField(
                              type: InputType.text,
                              label: localizations.translate(
                                "i18.stockDetails.batchNumberLabel",
                              ),
                              errorMessage: field.errorText,
                              onChange: (val) {
                                if (val == '') {
                                  field.control.value = '0';
                                } else {
                                  field.control.value = val;
                                }
                              },
                            );
                          }),
                    const SizedBox(height: 16),
                    // if (entryType == StockRecordEntryType.returned) ...[
                    Offstage(
                      offstage: !((entryType == StockRecordEntryType.dispatch &&
                              InventorySingleton().isCommunityDistributor) ||
                          entryType == StockRecordEntryType.returned),
                      child: Column(
                        children: [
                          ReactiveWrapperField(
                            formControlName: _partiallyUsedBlistersReturnedKey,
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
                            showErrors: (control) =>
                                control.invalid && control.touched,
                            builder: (field) {
                              return LabeledField(
                                label: localizations.translate(
                                  partiallyUsedQuantityCountLabel,
                                ),
                                isRequired: true,
                                child: BaseDigitFormInput(
                                  errorMessage: field.errorText,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: false),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]'),
                                    ),
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  onChange: (val) {
                                    field.control.markAsTouched();
                                    if (int.parse(val) > 10000000000) {
                                      field.control.value =
                                          Constants.stockMaxLimit;
                                    } else {
                                      if (val != '') {
                                        field.control.value = int.parse(val);
                                      } else {
                                        field.control.value = null;
                                      }
                                    }
                                  },
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),

                    Offstage(
                      offstage: !(entryType == StockRecordEntryType.dispatch &&
                          InventorySingleton().isCommunityDistributor),
                      child: Column(
                        children: [
                          ReactiveWrapperField(
                            formControlName: _wastedBlistersReturnedKey,
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
                            showErrors: (control) =>
                                control.invalid && control.touched,
                            builder: (field) {
                              return LabeledField(
                                label: localizations.translate(
                                  wastedQuantityCountLabel,
                                ),
                                isRequired: true,
                                child: BaseDigitFormInput(
                                  errorMessage: field.errorText,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: false),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]'),
                                    ),
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  onChange: (val) {
                                    field.control.markAsTouched();
                                    if (int.parse(val) > 10000000000) {
                                      field.control.value =
                                          Constants.stockMaxLimit;
                                    } else {
                                      if (val != '') {
                                        field.control.value = int.parse(val);
                                      } else {
                                        field.control.value = null;
                                      }
                                    }
                                  },
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),

                    ReactiveWrapperField(
                        formControlName: _transactionQuantityKey,
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
                          "insufficientStock": (error) => error.toString(),
                        },
                        showErrors: (control) =>
                            control.invalid && control.touched,
                        builder: (field) {
                          return LabeledField(
                            label: localizations.translate(
                              quantityCountLabel,
                            ),
                            isRequired: true,
                            child: BaseDigitFormInput(
                              errorMessage: field.errorText,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]'),
                                ),
                                LengthLimitingTextInputFormatter(10),
                              ],
                              onChange: (val) {
                                field.control.markAsTouched();
                                if (val.isNotEmpty &&
                                    int.tryParse(val) != null) {
                                  final parsedVal = int.parse(val);
                                  if (parsedVal > 10000000000) {
                                    field.control.value =
                                        Constants.stockMaxLimit;
                                  } else {
                                    field.control.value = parsedVal;
                                  }
                                } else {
                                  field.control.value = null;
                                }
                              },
                            ),
                          );
                        }),

                    const SizedBox(height: 16),
                    ReactiveWrapperField(
                      formControlName: _commentsKey,
                      builder: (field) {
                        return InputField(
                          type: InputType.textArea,
                          label: localizations.translate(
                            i18.stockDetails.commentsLabel,
                          ),
                          errorMessage: field.errorText,
                          onChange: (val) => field.control.value = val,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DigitButton(
                  size: DigitButtonSize.large,
                  type: DigitButtonType.primary,
                  onPressed: () async {
                    if (form.valid) {
                      bool isValid =
                          await _saveCurrentTabData(productName, entryType);
                      if (!isValid) {
                        return;
                      }

                      if (_tabController.index < products.length - 1) {
                        if (form.valid) {
                          _tabController.animateTo(_tabController.index + 1);
                        }
                      } else {
                        int index = 0;
                        for (final form in _forms.values) {
                          form.markAllAsTouched();
                          if (form.invalid) {
                            _tabController.animateTo(index);
                            return;
                          }
                          index++;
                        }
                        await _handleFinalSubmission(context, entryType);
                      }
                    } else {
                      form.markAllAsTouched();
                    }
                  },
                  label: isLastTab
                      ? localizations.translate(i18.common.coreCommonSubmit)
                      : localizations.translate(i18.common.coreCommonNext),
                ),
                const SizedBox(height: 12),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _saveCurrentTabData(
      String productName, StockRecordEntryType entryType) async {
    final form = _forms[productName]!;
    final currentStock = _tabStocks[productName]!;

    final existingFields = currentStock.additionalFields?.fields ?? [];

    final filteredFields = existingFields
        .where(
          (field) => ![
            'partialBlistersReturned',
            'wastedBlistersReturned',
            'batchNumber',
            'comments',
          ].contains(field.key),
        )
        .toList();
    _tabStocks[productName] = currentStock.copyWith(
      quantity: form.control(_transactionQuantityKey).value?.toString() != "0"
          ? form.control(_transactionQuantityKey).value?.toString()
          : (_forms[productName]?.value)?["quantity"] as String?,
      // TODO: need to check selected project id
      referenceId: InventorySingleton().projectId,
      wayBillNumber: form.control(_waybillNumberKey).value?.toString() ??
          (_forms[productName]?.value)?["waybillNumber"] as String?,
      transactionReason:
          form.control(_transactionReasonKey).value?.toString() ??
              transactionReason,
      additionalFields: currentStock.additionalFields?.copyWith(
        fields: [
          ...filteredFields,
          if (entryType == StockRecordEntryType.returned ||
              (entryType == StockRecordEntryType.dispatch &&
                  InventorySingleton().isCDD)) ...[
            AdditionalField(
                'partialBlistersReturned',
                form
                        .control(_partiallyUsedBlistersReturnedKey)
                        .value
                        ?.toString() ??
                    // _forms[productName]
                    //     ?.control(_partiallyUsedBlistersReturnedKey)
                    //     ?.value
                    //     ?.toString() ??
                    '0'),
          ],
          if (entryType == StockRecordEntryType.dispatch &&
              InventorySingleton().isCDD) ...[
            AdditionalField(
                'wastedBlistersReturned',
                form.control(_wastedBlistersReturnedKey).value?.toString() ??
                    // _forms[productName]
                    //     ?.control(_wastedBlistersReturnedKey)
                    //     ?.value
                    //     ?.toString() ??
                    '0'),
          ],
          if (form.control(_batchNumberKey).value != null) ...[
            AdditionalField('batchNumber', form.control(_batchNumberKey).value),
          ] else if ((_forms[productName]?.value)?["batchNumberKey"] !=
              null) ...[
            AdditionalField(
                'batchNumber', (_forms[productName]?.value)?["batchNumberKey"]),
          ],
          if (form.control(_commentsKey).value != null) ...[
            AdditionalField('comments', form.control(_commentsKey).value),
          ] else if ((_forms[productName]?.value)?["comments"] != null) ...[
            AdditionalField(
                'comments', (_forms[productName]?.value)?["comments"]),
          ]
        ],
      ),
    );

    final recordStock = context.read<RecordStockBloc>().state;
    context.read<RecordStockBloc>().add(
          RecordStockSaveStockDetailsEvent(
            stockModel: currentStock,
          ),
        );

    return true;
  }

  Future<void> _handleFinalSubmission(
      BuildContext context, StockRecordEntryType entryType) async {
    final theme = Theme.of(context);
    final lastProduct = products.last.sku ?? '';

    final repository =
        context.read<LocalRepository<StockModel, StockSearchModel>>()
            as StockLocalRepository;

    for (StockModel stock in _tabStocks.values) {
      String productName = stock.additionalFields?.fields
          .firstWhereOrNull((element) => element.key == 'productName')
          ?.value;
      bool valid = await _saveCurrentTabData(productName, entryType);
      if (!valid) {
        return;
      }
    }

    final submit = await showCustomPopup(
      context: context,
      builder: (popupContext) => Popup(
        title: localizations.translate(i18.stockDetails.dialogTitle),
        onOutsideTap: () {
          Navigator.of(popupContext).pop(false);
        },
        description: localizations.translate(
          i18.stockDetails.dialogContent,
        ),
        type: PopUpType.simple,
        actions: [
          DigitButton(
            label: localizations.translate(
              i18.common.coreCommonSubmit,
            ),
            onPressed: () {
              Navigator.of(
                popupContext,
              ).pop(true);
              // (context.router.parent() as StackRouter).maybePop();
              // context.router.push(CustomAcknowledgementRoute(
              //     mrnNumber: _sharedMRN,
              //     stockRecords: _tabStocks.values.toList(),
              //     entryType: entryType));
            },
            type: DigitButtonType.primary,
            size: DigitButtonSize.large,
          ),
          DigitButton(
            label: localizations.translate(
              i18.common.coreCommonCancel,
            ),
            onPressed: () {
              Navigator.of(
                popupContext,
              ).pop(false);
            },
            type: DigitButtonType.secondary,
            size: DigitButtonSize.large,
          ),
        ],
      ),
    ) as bool;

    if (submit && context.mounted) {
      // TODO: commented by pitabash
      // int spaq1Count = 0;
      // int spaq2Count = 0;

      // int blueVasCount = 0;
      // int redVasCount = 0;

// TODO: old code
      // int currentSpaq1Count = context.spaq1;
      // int currentSpaq2Count = context.spaq2;
      // int currentBlueVasCount = context.blueVas;
      // int currentRedVasCount = context.redVas;

      // int currentSpaq1Count = 190;
      // int currentSpaq2Count = 190;
      // int currentBlueVasCount = 190;
      // int currentRedVasCount = 190;

      // Loop through all stocks and dispatch individual events
      for (final stockModel in _tabStocks.values) {
        final ss = int.parse(stockModel.quantity.toString());

        int quantityWasted = int.parse(stockModel.additionalFields?.fields
                .firstWhereOrNull(
                    (element) => element.key == 'wastedBlistersReturned')
                ?.value
                ?.toString() ??
            '0');

        int quantityPartiallyUsed = int.parse(stockModel
                .additionalFields?.fields
                .firstWhereOrNull(
                    (element) => element.key == 'partialBlistersReturned')
                ?.value
                ?.toString() ??
            '0');

        final totalQty =
            ((entryType == StockRecordEntryType.dispatch) ? ss * -1 : ss) -
                quantityWasted -
                ((InventorySingleton().isCDD) ? quantityPartiallyUsed : 0);

        String? productName = stockModel.additionalFields?.fields
            .firstWhereOrNull((element) => element.key == 'productName')
            ?.value;

        // Accumulate quantities based on product
        //TODO: commented by pitabash
        // if (productName == Constants.spaq1) {
        //   spaq1Count = totalQty;
        // } else if (productName == Constants.spaq2) {
        //   spaq2Count = totalQty;
        // } else if (productName == Constants.blueVAS) {
        //   blueVasCount = totalQty;
        // } else if (productName == Constants.redVAS) {
        //   redVasCount = totalQty;
        // }

        final List<StockModel> sm = await CustomStockMethods()
            .getStockBasedonProductVariantId(
                repository, stockModel.productVariantId!);

        final int currentCount = sm.isEmpty
            ? 0
            : sm
                .map((e) => int.parse(e.quantity ?? '0'))
                .reduce((value, element) => value + element);

        if (entryType == StockRecordEntryType.dispatch) {
          if ((currentCount + totalQty < 0)) {
            Toast.showToast(
              context,
              message: localizations.translate(
                InventorySingleton().isCDD
                    ? "i18.beneficiaryDetails.validationForExcessStockReturn"
                    : "i18.beneficiaryDetails.validationForExcessStockDispatch",
              ),
              type: ToastType.error,
            );
            return;
          }
//TODO: commented by pitabash
          // else if (productName == Constants.spaq2 &&
          //     (currentSpaq2Count + totalQty < 0)) {
          //   Toast.showToast(
          //     context,
          //     message: localizations.translate(
          //       InventorySingleton().isCDD
          //           ? "i18.beneficiaryDetails.validationForExcessStockReturn"
          //           : "i18.beneficiaryDetails.validationForExcessStockDispatch",
          //     ),
          //     type: ToastType.error,
          //   );
          //   return;
          // } else if (productName == Constants.blueVAS &&
          //     (currentBlueVasCount + totalQty < 0)) {
          //   Toast.showToast(
          //     context,
          //     message: localizations.translate(
          //       InventorySingleton().isCDD
          //           ? "i18.beneficiaryDetails.validationForExcessStockReturn"
          //           : "i18.beneficiaryDetails.validationForExcessStockDispatch",
          //     ),
          //     type: ToastType.error,
          //   );
          //   return;
          // } else if (productName == Constants.redVAS &&
          //     (currentRedVasCount + totalQty < 0)) {
          //   Toast.showToast(
          //     context,
          //     message: localizations.translate(
          //       InventorySingleton().isCDD
          //           ? "i18.beneficiaryDetails.validationForExcessStockReturn"
          //           : "i18.beneficiaryDetails.validationForExcessStockDispatch",
          //     ),
          //     type: ToastType.error,
          //   );
          //   return;
          // }
        }

        context.read<RecordStockBloc>().add(
              RecordStockSaveStockDetailsEvent(
                stockModel: stockModel,
              ),
            );
        context.read<RecordStockBloc>().add(
              const RecordStockCreateStockEntryEvent(),
            );
      }

      //TODO: to discuss with @naveen j

      // context.read<AuthBloc>().add(
      //       AuthAddSpaqCountsEvent(
      //         spaq1Count: spaq1Count,
      //         spaq2Count: spaq2Count,
      //         blueVasCount: blueVasCount,
      //         redVasCount: redVasCount,
      //       ),
      //     );

      (context.router.parent() as StackRouter).maybePop();

// TODO:to uncomment
      // context.router.push(AcknowledgementRoute(
      //     mrnNumber: _sharedMRN,
      //     stockRecords: _tabStocks.values.toList(),
      //     entryType: entryType));

      // my implimentation

      context.router.push(InventoryAcknowledgementRoute(
          mrrnNumber: _sharedMRN,
          stockRecords: _tabStocks.values.toList(),
          entryType: entryType));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isInitializing) {
      return const Center(child: CircularProgressIndicator());
    }

    final selectedProducts =
        products.map((variant) => variant.sku).whereType<String>().toList();

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: selectedProducts
              .map((product) => Tab(text: product.toUpperCase()))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: selectedProducts
            .map((product) => _buildTabContent(context, product, receivedFrom))
            .toList(),
      ),
    );
  }

  void _nextTab() {
    if (_tabController.index < _tabController.length - 1) {
      _tabController.animateTo(_tabController.index + 1);
    }
  }

// TODO: to remove it as it is unused
  String? wastageQuantity(FormGroup form, BuildContext context) {
    final quantity = form.control(_transactionQuantityKey).value;
    final partialBlisters = form.control(_transactionQuantityKey).value;

    if (quantity == null || partialBlisters == null) {
      return null;
    }

    int totalQuantity = 0;
    //TODO: old code
    // int totalRemainingQuantityInMl = context.spaq1;
    int totalRemainingQuantityInMl = 190;

    int totalExpectedUnusedBottles =
        totalRemainingQuantityInMl ~/ Constants.mlPerBottle;

    int totalExpectedPartialQuantityInMl =
        totalRemainingQuantityInMl % Constants.mlPerBottle;

    int totalExpectedPartialBottles =
        totalRemainingQuantityInMl % Constants.mlPerBottle != 0 ? 1 : 0;

    totalQuantity = quantity != null ? int.parse(quantity.toString()) : 0;

    return (((totalExpectedUnusedBottles - totalQuantity) *
                Constants.mlPerBottle) +
            ((totalExpectedPartialBottles >
                    (partialBlisters != null
                        ? int.parse(partialBlisters.toString())
                        : 0))
                ? totalExpectedPartialQuantityInMl
                : 0))
        .toString();
  }

  num _getQuantityCount(Iterable<StockModel> stocks) {
    return stocks.fold<num>(
      0.0,
      (old, e) => (num.tryParse(e.quantity ?? '') ?? 0.0) + old,
    );
  }

  void clearQRCodes() {
    context.read<DigitScannerBloc>().add(const DigitScannerEvent.handleScanner(
          barCode: [],
          qrCode: [],
        ));
  }

  bool _isCurrentTabValid() {
    return _formkeys[_tabController.index].currentState?.validate() ?? false;
  }
}

class _KeepAliveTabContent extends StatefulWidget {
  final Widget child;

  const _KeepAliveTabContent({required this.child});

  @override
  State<_KeepAliveTabContent> createState() => _KeepAliveTabContentState();
}

class _KeepAliveTabContentState extends State<_KeepAliveTabContent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
