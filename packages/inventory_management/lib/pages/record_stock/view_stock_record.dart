import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/input_wrapper.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/blocs/record_stock.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:inventory_management/models/entities/transaction_reason.dart';
import 'package:inventory_management/models/entities/transaction_type.dart';
import 'package:inventory_management/utils/i18_key_constants.dart' as i18;
import 'package:inventory_management/utils/utils.dart';
import 'package:inventory_management/widgets/localized.dart';

@RoutePage()
class ViewStockRecordsPage extends LocalizedStatefulWidget {
  final String mrnNumber;
  final List<StockModel> stockRecords;

  const ViewStockRecordsPage({
    super.key,
    super.appLocalizations,
    required this.mrnNumber,
    required this.stockRecords,
  });

  @override
  State<ViewStockRecordsPage> createState() => _ViewStockRecordsPageState();
}

class _ViewStockRecordsPageState extends LocalizedState<ViewStockRecordsPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.stockRecords.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          labelColor: Colors.white,
          indicator: const BoxDecoration(
            border: Border(
              left: BorderSide(color: Colors.orange),
              right: BorderSide(color: Colors.orange),
              bottom: BorderSide(color: Colors.orange),
              top: BorderSide(color: Colors.orange),
            ),
          ),
          indicatorPadding: const EdgeInsets.fromLTRB(0.1, 0, 0.1, 0.1),
          controller: _tabController,
          isScrollable: true,
          tabs: widget.stockRecords
              .map((stock) => Tab(
                    text: stock.additionalFields?.fields
                            .firstWhere(
                              (field) => field.key == 'productName',
                              orElse: () =>
                                  const AdditionalField('productName', ''),
                            )
                            .value
                            ?.toString() ??
                        '',
                  ))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: widget.stockRecords.map(_buildStockRecordTab).toList(),
      ),
    );
  }

  Widget _buildStockRecordTab(StockModel stock) {
    final senderIdToShowOnTab = stock.senderId;
    String productName = stock.additionalFields?.fields
            .firstWhere(
              (field) => field.key == 'productName',
              orElse: () => const AdditionalField('productName', ''),
            )
            .value
            ?.toString() ??
        '';
    Map<String, StockRecordEntryType> transactionToEntryType = {
      TransactionReason.received.toValue(): StockRecordEntryType.receipt,
      TransactionReason.returned.toValue(): StockRecordEntryType.returned,
      TransactionType.dispatched.toValue(): StockRecordEntryType.dispatch,
    };
    final transaction = (stock.transactionReason ?? stock.transactionType ?? '')
        .toString()
        .toUpperCase();
    StockRecordEntryType entryType = StockRecordEntryType.values.firstWhere(
      (e) {
        final enumName = e.toString().toUpperCase().split('.').last;
        if (transaction != '' &&
            transactionToEntryType.containsKey(transaction)) {
          return enumName ==
              transactionToEntryType[transaction]!
                  .toString()
                  .toUpperCase()
                  .split('.')
                  .last;
        } else {
          return enumName == transaction;
        }
      },
      orElse: () => StockRecordEntryType.receipt,
    );

    String quantityCountLabel;
    String unusedQuantityCountLabel = 'unusedQuantityCountLabel';
    String partiallyUsedQuantityCountLabel = 'partiallyUsedQuantityCountLabel';
    String wastedQuantityCountLabel = 'wastedQuantityCountLabel';
    String quantitySentByWarehouse = 'quantitySentByWarehouse';
    bool isWareHouseMgr = InventorySingleton().isWareHouseMgr;

    switch (entryType) {
      case StockRecordEntryType.receipt:
        if (productName == "Blue VAS" || productName == "Red VAS") {
          quantityCountLabel = "i18.stockDetails.quantityCapsuleReceivedLabel";
          quantitySentByWarehouse =
              "i18.inventoryReportDetails.quantityCapsuleSentByWarehouse";
        } else {
          quantityCountLabel = i18.stockDetails.quantityReceivedLabel;
          quantitySentByWarehouse =
              "i18.inventoryReportDetails.quantitySentByWarehouse";
        }
        break;
      case StockRecordEntryType.dispatch:
        if (productName == "Blue VAS" || productName == "Red VAS") {
          quantityCountLabel = InventorySingleton().isWareHouseMgr
              ? "i18.stockDetails.quantityCapsuleSentLabel"
              : "i18.stockDetails.quantityCapsuleUnusedReturnedLabel";
          unusedQuantityCountLabel =
              "i18.stockDetails.quantityCapsuleUnusedReturnedLabel";
          partiallyUsedQuantityCountLabel =
              "i18.stockDetails.quantityCapsulePartiallyUsedReturnedLabel";
          wastedQuantityCountLabel =
              "i18.stockDetails.quantityCapsuleWastedReturnedLabel";
        } else {
          quantityCountLabel = InventorySingleton().isWareHouseMgr
              ? i18.stockDetails.quantitySentLabel
              : i18.stockDetails.quantityReturnedLabel;
          unusedQuantityCountLabel =
              "i18.stockDetails.quantityUnusedReturnedLabel";
          partiallyUsedQuantityCountLabel =
              "i18.stockDetails.quantityPartiallyUsedReturnedLabel";
          wastedQuantityCountLabel =
              "i18.stockDetails.quantityWastedReturnedLabel";
        }
        break;
      case StockRecordEntryType.returned:
        if (productName == "Blue VAS" || productName == "Red VAS") {
          quantityCountLabel = "i18.stockDetails.quantityCapsuleReturnedLabel";
          unusedQuantityCountLabel =
              "i18.stockDetails.quantityCapsuleUnusedReturnedLabel";
          partiallyUsedQuantityCountLabel =
              "i18.stockDetails.quantityCapsulePartiallyUsedReturnedLabel";
          wastedQuantityCountLabel =
              "i18.stockDetails.quantityCapsuleWastedReturnedLabel";
        } else {
          quantityCountLabel = i18.stockDetails.quantityReturnedLabel;
          unusedQuantityCountLabel =
              "i18.stockDetails.quantityUnusedReturnedLabel";
          partiallyUsedQuantityCountLabel =
              "i18.stockDetails.quantityPartiallyUsedReturnedLabel";
          wastedQuantityCountLabel =
              "i18.stockDetails.quantityWastedReturnedLabel";
        }
        break;
      case StockRecordEntryType.loss:
        quantityCountLabel = i18.stockDetails.quantityLostLabel;
        break;
      case StockRecordEntryType.damaged:
        quantityCountLabel = i18.stockDetails.quantityDamagedLabel;
        break;
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // MRN Card
          DigitCard(
            padding: const EdgeInsets.all(16),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Stock Receipt Details',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                          child: Text(entryType == StockRecordEntryType.dispatch
                              ? 'MIN Number'
                              : 'MRN Number')),
                      Expanded(child: Text(widget.mrnNumber)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Expanded(child: Text('Resource')),
                      Expanded(
                        child: Text(
                          stock.additionalFields?.fields
                                  .firstWhere(
                                    (field) => field.key == 'productName',
                                    orElse: () => const AdditionalField(
                                        'productName', ''),
                                  )
                                  .value
                                  ?.toString() ??
                              '',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      // const Expanded(child: Text('Received From')),
                      Expanded(
                        //     child: Text(localizations
                        //         .translate('FAC_$senderIdToShowOnTab'))),
                        child: Text(localizations.translate(getEntryTypeLabel(
                            widget.stockRecords.firstOrNull))),
                      ),
                      Expanded(
                          child: Text(localizations.translate(
                              (!InventorySingleton().isCDD)
                                  ? getSecondaryPartyValue(
                                      widget.stockRecords.firstOrNull)
                                  : getSecondaryPartyValue(
                                      widget.stockRecords.firstOrNull)))),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Stock Details Card

          DigitCard(
            padding: const EdgeInsets.all(16),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Stock Details',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  if (InventorySingleton().isDistributor != true) ...[
                    // Waybill Number
                    InputField(
                      type: InputType.text,
                      label: 'Waybill Number *',
                      initialValue: stock.wayBillNumber ?? '',
                      isDisabled: true,
                      readOnly: true,
                    ),
                    if (isWareHouseMgr &&
                        entryType != StockRecordEntryType.returned)
                      const SizedBox(height: 12),
                    // Batch Number
                    if (isWareHouseMgr &&
                        entryType != StockRecordEntryType.returned)
                      InputField(
                        type: InputType.text,
                        label: 'Batch Number',
                        initialValue: (() {
                          final value = stock.additionalFields?.fields
                              .firstWhere(
                                (field) => field.key == 'batchNumber',
                                orElse: () =>
                                    const AdditionalField('batchNumber', ''),
                              )
                              .value
                              ?.toString();

                          return value == '0' ? '' : value ?? '';
                        })(),
                        isDisabled: true,
                        readOnly: true,
                      ),
                    const SizedBox(height: 12),
                  ],

                  // Quantity
                  Offstage(
                      offstage: (stock.additionalFields?.fields ?? [])
                          .any((e) => e.key == "partialBlistersReturned"),
                      child: InputField(
                        type: InputType.text,
                        label: (stock.additionalFields?.fields ?? [])
                                .any((e) => e.key == "quantityReceived")
                            ? '${localizations.translate(quantitySentByWarehouse)} *'
                            : '${localizations.translate(quantityCountLabel)} *',
                        initialValue: (stock.additionalFields?.fields ?? [])
                                .any((e) => e.key == "quantityReceived")
                            ? (stock.additionalFields?.fields ?? [])
                                .firstWhere(
                                  (e) => e.key == "quantitySent",
                                  orElse: () =>
                                      const AdditionalField('quantitySent', ''),
                                )
                                .value
                                ?.toString()
                            : stock.quantity ?? '',
                        isDisabled: true,
                        readOnly: true,
                      )),
                  Offstage(
                      offstage: !(stock.additionalFields?.fields ?? [])
                          .any((e) => e.key == "partialBlistersReturned"),
                      child: Column(
                        children: [
                          InputField(
                            type: InputType.text,
                            label:
                                '${localizations.translate(partiallyUsedQuantityCountLabel)} *',
                            initialValue: (stock.additionalFields?.fields ?? [])
                                    .firstWhere(
                                      (e) => e.key == "partialBlistersReturned",
                                      orElse: () => const AdditionalField(
                                          'partialBlistersReturned', ''),
                                    )
                                    .value
                                    ?.toString() ??
                                '',
                            isDisabled: true,
                            readOnly: true,
                          ),
                          if (InventorySingleton().isCDD) ...{
                            const SizedBox(height: 12),
                            InputField(
                              type: InputType.text,
                              label:
                                  '${localizations.translate(wastedQuantityCountLabel)} *',
                              initialValue: (stock.additionalFields?.fields ??
                                          [])
                                      .firstWhere(
                                        (e) =>
                                            e.key == "wastedBlistersReturned",
                                        orElse: () => const AdditionalField(
                                            'wastedBlistersReturned', ''),
                                      )
                                      .value
                                      ?.toString() ??
                                  '',
                              isDisabled: true,
                              readOnly: true,
                            ),
                          },
                          const SizedBox(height: 12),
                          InputField(
                            type: InputType.text,
                            label:
                                '${localizations.translate(unusedQuantityCountLabel)} *',
                            initialValue: (() {
                              final unusedBlisters =
                                  (stock.additionalFields?.fields ?? [])
                                      .firstWhere(
                                        (e) =>
                                            e.key == "unusedBlistersReturned",
                                        orElse: () => const AdditionalField(
                                            'unusedBlistersReturned', ''),
                                      )
                                      .value;
                              if (unusedBlisters != null &&
                                  unusedBlisters.toString().isNotEmpty &&
                                  int.tryParse(unusedBlisters.toString()) !=
                                      null &&
                                  int.parse(unusedBlisters.toString()) > 0) {
                                return unusedBlisters.toString();
                              } else {
                                return stock.quantity ?? '';
                              }
                            })(),
                            isDisabled: true,
                            readOnly: true,
                          ),
                          const SizedBox(height: 12),
                        ],
                      )),
                  const SizedBox(height: 12),
                  Offstage(
                    offstage: !(stock.additionalFields?.fields ?? [])
                        .any((e) => e.key == "quantityReceived"),
                    child: InputField(
                      type: InputType.text,
                      label: (productName == "Blue VAS" ||
                              productName == "Red VAS")
                          ? '${localizations.translate("i18.stockDetails.totalQuantityCapsuleReceivedLabel")} *'
                          : '${localizations.translate("i18.stockDetails.totalQuantityBlistersReceivedLabel")} *',
                      initialValue: (stock.additionalFields?.fields ?? [])
                              .firstWhere(
                                (e) => e.key == "quantityReceived",
                                orElse: () => const AdditionalField(
                                    'quantityReceived', ''),
                              )
                              .value
                              ?.toString() ??
                          '',
                      isDisabled: true,
                      readOnly: true,
                    ),
                  ),
                  // Comments
                  InputField(
                    type: InputType.textArea,
                    label: 'Comments',
                    initialValue: stock.additionalFields?.fields
                            .firstWhere(
                              (field) => field.key == 'comments',
                              orElse: () =>
                                  const AdditionalField('comments', ''),
                            )
                            .value
                            ?.toString() ??
                        '',
                    isDisabled: true,
                    readOnly: true,
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 24),
          DigitButton(
            label: localizations.translate(i18.common.corecommonclose),
            onPressed: () => context.router.pop(),
            type: DigitButtonType.secondary,
            size: DigitButtonSize.large,
          ),
        ],
      ),
    );
  }

  Widget _buildReadOnlyField({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(value),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  String getEntryTypeLabel(StockModel? stock) {
    String label =
        '${i18.stockDetails.receivedPageTitle}_${i18.stockReconciliationDetails.stockLabel}';

    if (stock != null) {
      if (stock.transactionType == "RECEIVED" &&
          stock.transactionReason == "RETURNED") {
        label = "i18.stockDetails.selectTransactingPartyReturnedFrom";
      } else if (stock.transactionType == "DISPATCHED" &&
          stock.senderType == "STAFF") {
        label = "i18.stockDetails.returnedTo";
      } else if (stock.transactionType == "DISPATCHED") {
        label =
            '${i18.stockDetails.issuedPageTitle}_${i18.stockReconciliationDetails.stockLabel}';
      }
    }

    return label;
  }
}
