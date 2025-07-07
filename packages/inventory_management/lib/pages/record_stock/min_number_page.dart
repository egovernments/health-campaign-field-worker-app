import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:inventory_management/blocs/record_stock.dart';
import 'package:inventory_management/data/repositories/local/stock.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';
import 'package:inventory_management/utils/i18_key_constants.dart' as i18;
import 'package:inventory_management/utils/utils.dart';
import 'package:inventory_management/widgets/back_navigation_help_header.dart';
import 'package:inventory_management/widgets/inventory/min_number_card.dart';
import 'package:inventory_management/widgets/localized.dart';

@RoutePage()
class MinNumberPage extends LocalizedStatefulWidget {
  final dynamic type;
  const MinNumberPage({
    super.key,
    super.appLocalizations,
    required this.type,
  });

  @override
  State<MinNumberPage> createState() => MinNumberPageState();
}

class MinNumberPageState extends LocalizedState<MinNumberPage> {
  List<StockModel> stockList = [];
  String? selectedMRN;
  List<StockModel> selectedStockList = [];

  @override
  void initState() {
    super.initState();
    loadLocalStockData();
    // Logger().i(
    //     "Stock Type: ${widget.type == StockRecordEntryType.returned ? "RETURNED" : widget.type == StockRecordEntryType.receipt ? "RECEIVED" : "DISPATCHED"}");
  }

  Future<void> loadLocalStockData() async {
    final repository =
        context.read<LocalRepository<StockModel, StockSearchModel>>()
            as StockLocalRepository;

    final currentUserUuid = InventorySingleton().loggedInUserUuid;

    final result = await repository.search(
        StockSearchModel(), InventorySingleton().loggedInUserUuid);

    String? transactionType;
    String? transactionReason;

    if (widget.type == StockRecordEntryType.returned) {
      transactionType = 'RECEIVED';
      transactionReason = 'RETURNED';
    } else if (widget.type == StockRecordEntryType.receipt) {
      transactionType = 'RECEIVED';
    } else if (widget.type == StockRecordEntryType.dispatch) {
      transactionType = 'DISPATCHED';
    }

    for (final stock in result) {
      final createdBy = stock.clientAuditDetails?.createdBy;
      final isMatch = createdBy == currentUserUuid;
      // Logger().d(
      //     "Stock Created By: $createdBy | Current User: $currentUserUuid | Match: $isMatch");
    }

    List<StockModel> filteredResult = result.where((stock) {
      if (transactionType == null) return false;

      final createdBy = stock.clientAuditDetails?.createdBy;

      if (widget.type == StockRecordEntryType.dispatch) {
        return stock.transactionType == transactionType &&
            createdBy == currentUserUuid;
      } else if (widget.type == StockRecordEntryType.receipt) {
        return stock.transactionType == transactionType &&
            stock.transactionReason != 'RETURNED' &&
            createdBy == currentUserUuid;
      } else {
        return stock.transactionType == transactionType &&
            stock.transactionReason == transactionReason &&
            createdBy == currentUserUuid;
      }
    }).toList();

    filteredResult = filteredResult.reversed.toList();

    // Logger().i("Filtered Stock Count: ${filteredResult.length}");
    // Logger().i(
    //     "First filtered stock: ${filteredResult.isNotEmpty ? filteredResult.first.toJson() : 'None'}");

    setState(() {
      stockList = filteredResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    // Group stockList by materialNoteNumber
    final Map<String, List<StockModel>> groupedStock = {};
    for (final stock in stockList) {
      final mrn = stock.additionalFields?.fields
          .firstWhere((f) => f.key == 'materialNoteNumber',
              orElse: () => const AdditionalField('', ''))
          .value;

      // Logger().i('MRN: $mrn');

      if (mrn == null || mrn.isEmpty) continue;

      groupedStock.putIfAbsent(mrn, () => []);
      groupedStock[mrn]!.add(stock);
    }

    final groupedEntries = groupedStock.entries.toList();
    List<StockModel> finalStocks = [];

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            const BackNavigationHelpHeaderWidget(showHelp: false),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(spacer2),
                ),
                margin: const EdgeInsets.all(spacer2),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: groupedEntries.isEmpty
                      ? const Center(child: Text("No transactions found."))
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16.0),
                            Text(
                                widget.type == StockRecordEntryType.dispatch
                                    ? "Select the MIN number"
                                    : "Select the MRN number",
                                style: textTheme.headingL),
                            const SizedBox(height: 16.0),
                            Expanded(
                              // height: MediaQuery.of(context).size.height * 0.65,
                              child: ListView.builder(
                                // reverse: true,
                                itemCount: groupedEntries.length,
                                itemBuilder: (context, index) {
                                  final mrn = groupedEntries[index].key;
                                  finalStocks = [];
                                  for (StockModel stockModel
                                      in groupedEntries[index].value) {
                                    finalStocks
                                        .add(condenseStockObject(stockModel));
                                  }
                                  final stocks = groupedEntries[index].value;
                                  final isSelected = selectedMRN == mrn;
                                  final jsonStr = jsonEncode(finalStocks);

                                  final compressed =
                                      zlib.encode(utf8.encode(jsonStr));
                                  final encoded = base64Url.encode(compressed);
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (selectedMRN == mrn) {
                                            selectedMRN = null;
                                            selectedStockList = [];
                                          } else {
                                            selectedMRN = mrn;
                                            selectedStockList = stocks;
                                          }
                                        });
                                      },
                                      child: MinNumberCard(
                                        data: encoded,
                                        entryType: widget.type,
                                        minNumber: mrn,
                                        cddCode: stocks
                                                .first.additionalFields?.fields
                                                .firstWhereOrNull((e) =>
                                                    e.key == 'distributorName')
                                                ?.value ??
                                            "",
                                        date: InventorySingleton()
                                            .formatDateFromMillis(stocks
                                                    .first
                                                    .auditDetails
                                                    ?.createdTime ??
                                                0),
                                        items: stocks.map((s) {
                                          final name = (s
                                                      .additionalFields?.fields
                                                      .firstWhere(
                                                          (f) =>
                                                              f.key ==
                                                              'productName',
                                                          orElse: () =>
                                                              const AdditionalField(
                                                                  '', ''))
                                                      .value ??
                                                  'N/A')
                                              .toString();
                                          final quantity =
                                              (s.quantity ?? 0).toString();
                                          return {
                                            'name': name,
                                            'quantity': quantity,
                                          };
                                        }).toList(),
                                        waybillNumber: InventorySingleton()
                                                .isDistributor
                                            ? null
                                            : stocks.first.wayBillNumber ?? "",
                                        isSelected: isSelected,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
            // footer:
            SizedBox(
              height: 80,
              child: DigitCard(
                margin: const EdgeInsets.fromLTRB(0, spacer2, 0, 0),
                children: [
                  DigitButton(
                    type: DigitButtonType.primary,
                    mainAxisSize: MainAxisSize.max,
                    size: DigitButtonSize.large,
                    label: localizations.translate(
                      i18.householdDetails.actionLabel,
                    ),
                    onPressed: () {
                      if (selectedMRN != null && selectedStockList.isNotEmpty) {
                        // TODO::: comment for now , need to umcomment to navigate
                        context.router.push(
                          ViewStockRecordsRoute(
                            mrnNumber: selectedMRN!,
                            stockRecords: selectedStockList,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(localizations.translate(
                              "i18.householdDetails.selectRecordErrorMsg",
                            )),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  StockModel condenseStockObject(StockModel stockModel) {
    return stockModel.copyWith(
      auditDetails: null,
      clientAuditDetails: null,
      additionalFields: stockModel.additionalFields?.copyWith(
        fields: [
          ...(stockModel.additionalFields?.fields ?? []),
        ],
      ),
    );
  }
}
