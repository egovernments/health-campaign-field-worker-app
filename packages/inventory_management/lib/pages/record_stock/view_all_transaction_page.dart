import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:inventory_management/blocs/record_stock.dart';
import 'package:inventory_management/blocs/stock.dart';
import 'package:inventory_management/data/repositories/local/stock.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:inventory_management/models/entities/transaction_reason.dart';
import 'package:inventory_management/models/entities/transaction_type.dart';
import 'package:inventory_management/utils/utils.dart';
import 'package:inventory_management/widgets/all_transactions_card.dart';
import 'package:inventory_management/widgets/back_navigation_help_header.dart';

import 'package:collection/collection.dart';
import 'package:inventory_management/widgets/localized.dart';
import '../../utils/i18_key_constants.dart' as i18_local;
import 'package:inventory_management/utils/i18_key_constants.dart' as i18;

@RoutePage()
class ViewAllTransactionsPage extends LocalizedStatefulWidget {
  final String? warehouseId;
  const ViewAllTransactionsPage(
      {super.key, super.appLocalizations, required this.warehouseId});

  @override
  State<ViewAllTransactionsPage> createState() =>
      _ViewAllTransactionsScreenState();
}

class _ViewAllTransactionsScreenState
    extends LocalizedState<ViewAllTransactionsPage> {
  @override
  void initState() {
    super.initState();
    loadLocalStockData();
    final stockState = context.read<RecordStockBloc>().state;
  }

  int? pressedIndex = -1;
  List<StockModel> stockList = [];
  StockModel? selectedStock;

  Future<void> loadLocalStockData() async {
    final repository =
        context.read<LocalRepository<StockModel, StockSearchModel>>()
            as StockLocalRepository;
    String? warehouseId = widget.warehouseId;

    List<StockModel> result;
    List<StockModel> receivedResult;
    // check for valid user
    if (InventorySingleton().isLgaUser ||
        InventorySingleton().isHFU ||
        InventorySingleton().isDistributor) {
      result = await repository.search(StockSearchModel(
          transactionType: [TransactionType.dispatched.toValue()],
          transactionReason: [],
          receiverId: warehouseId ?? ''));
      if (InventorySingleton().isHFU) {
        result = result.where((stock) {
          return stock.senderType == 'WAREHOUSE';
        }).toList();
      }
      receivedResult = await repository.search(StockSearchModel(
          transactionType: [TransactionType.received.toValue()],
          transactionReason: [TransactionReason.received.toValue()],
          receiverId: warehouseId ?? ''));
      result = result.where((stock) {
        String minStock = stock.additionalFields?.fields
                .firstWhere(
                  (field) => field.key == 'materialNoteNumber',
                  orElse: () => const AdditionalField('materialNoteNumber', ''),
                )
                .value
                ?.toString() ??
            'N/A';
        return receivedResult.firstWhereOrNull((item) {
              return item.productVariantId == stock.productVariantId &&
                  item.receiverId == stock.receiverId &&
                  item.senderId == stock.senderId &&
                  minStock ==
                      item.additionalFields?.fields
                          .firstWhere(
                            (field) => field.key == 'materialNoteNumber',
                            orElse: () =>
                                const AdditionalField('materialNoteNumber', ''),
                          )
                          .value
                          ?.toString();
            }) ==
            null;
      }).toList();
    } else {
      result = await repository.search(StockSearchModel(
          transactionType: [TransactionType.received.toValue()],
          transactionReason: [TransactionReason.received.toValue()],
          senderId: warehouseId));
    }

    setState(() {
      stockList = result;
    });
  }

  List<StockModel> groupStockByMrn(List<StockModel> stocks) {
    final List<StockModel> filtered = [];
    for (final stock in stocks) {
      final mrn = stock.additionalFields?.fields
              .firstWhere(
                (f) => f.key == 'materialNoteNumber',
                orElse: () => const AdditionalField('materialNoteNumber', ''),
              )
              .value
              ?.toString() ??
          'UNKNOWN';
      if (mrn != "") {
        filtered.add(stock);
      }
    }
    return filtered.reversed.toList();
  }

  void _navigateToDetails(StockModel stock) {
    final mrnNumber = stock.additionalFields?.fields
            .firstWhere(
              (field) => field.key == 'materialNoteNumber',
              orElse: () => const AdditionalField('materialNoteNumber', ''),
            )
            .value
            ?.toString() ??
        'N/A';

    // Filter stocks with the same MRN number
    final List<StockModel> sameMrnStocks = stockList.where((s) {
      final currentMrn = s.additionalFields?.fields
              .firstWhere(
                (field) => field.key == 'materialNoteNumber',
                orElse: () => const AdditionalField('materialNoteNumber', ''),
              )
              .value
              ?.toString() ??
          'N/A';
      return currentMrn == mrnNumber;
    }).toList();

// TODO: before, to implement
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => ViewStockRecordsLGAPage(
    //       mrnNumber: mrnNumber,
    //       stockRecords: [stock],
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    List<StockModel> filteredStock = groupStockByMrn(stockList);

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            const BackNavigationHelpHeaderWidget(showHelp: false),
            Expanded(
              child: filteredStock.isEmpty
                  ? const Center(child: Text('No transactions available.'))
                  : Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(spacer2),
                      ),
                      margin: const EdgeInsets.all(spacer2),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16.0),
                            Text("Select the MIN number",
                                style: textTheme.headingL),
                            const SizedBox(height: 16.0),
                            Expanded(
                              child: BlocBuilder<StockBloc, StockState>(
                                builder: (context, state) {
                                  return ListView.builder(
                                    // reverse: true,
                                    itemCount: filteredStock.length,
                                    itemBuilder: (context, index) {
                                      final stock = filteredStock[index];
                                      final isSelected = pressedIndex == index;
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (pressedIndex == index) {
                                                pressedIndex = -1;
                                                selectedStock = null;
                                              } else {
                                                pressedIndex = index;
                                                selectedStock = stock;
                                              }
                                            });
                                          },
                                          child: TransactionsCard(
                                            isSelected: isSelected,
                                            minNumber:
                                                stock.additionalFields?.fields
                                                        .firstWhere(
                                                          (field) =>
                                                              field.key ==
                                                              'materialNoteNumber',
                                                          orElse: () =>
                                                              const AdditionalField(
                                                                  'materialNoteNumber',
                                                                  ''),
                                                        )
                                                        .value
                                                        ?.toString() ??
                                                    'N/A',
                                            cddCode: InventorySingleton()
                                                    .loggedInUser
                                                    ?.name ??
                                                (stock.senderId ?? ''),
                                            date: (stock.dateOfEntry != null)
                                                ? DateFormat('d MMMM yyyy')
                                                    .format(
                                                        (stock.dateOfEntryTime ??
                                                                DateTime.now())
                                                            .toLocal())
                                                // TODO:: to remove from single ton
                                                : InventorySingleton()
                                                    .formatDateFromMillis(stock
                                                            .auditDetails
                                                            ?.createdTime ??
                                                        0),
                                            items: [
                                              {
                                                'name': stock.additionalFields
                                                        ?.fields
                                                        .firstWhere(
                                                          (field) =>
                                                              field.key ==
                                                              'productName',
                                                          orElse: () =>
                                                              const AdditionalField(
                                                                  'productName',
                                                                  'N/A'),
                                                        )
                                                        .value
                                                        ?.toString() ??
                                                    'N/A',
                                                'quantity':
                                                    (stock.quantity ?? 0)
                                                        .toString()
                                              }
                                            ],
                                            data: {},
                                            waybillNumber:
                                                ' ${stock.wayBillNumber ?? 'N/A'}',
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            )
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
                      if (pressedIndex != -1) {
                        _navigateToDetails(selectedStock!);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(localizations.translate(
                              //TODO::
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
}
