import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/utils/app_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:inventory_management/blocs/inventory_report.dart';
import 'package:inventory_management/utils/utils.dart';

import 'package:inventory_management/utils/typedefs.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:inventory_management/models/entities/stock_reconciliation.dart';
import 'package:inventory_management/models/entities/transaction_reason.dart';
import 'package:inventory_management/models/entities/transaction_type.dart';

typedef InventoryReportEmitter = Emitter<InventoryReportState>;

class CustomInventoryReportBloc
    extends Bloc<InventoryReportEvent, InventoryReportState> {
  final StockDataRepository stockRepository;
  final StockReconciliationDataRepository stockReconciliationRepository;

  CustomInventoryReportBloc({
    required this.stockRepository,
    required this.stockReconciliationRepository,
  }) : super(const InventoryReportEmptyState()) {
    on(_handleLoadDataEvent);
    on(_handleLoadStockReconciliationDataEvent);
    on(_handleLoadingEvent);
  }

  Future<void> _handleLoadDataEvent(
    InventoryReportLoadStockDataEvent event,
    InventoryReportEmitter emit,
  ) async {
    final reportType = event.reportType;
    final facilityId = event.facilityId;
    final productVariantId = event.productVariantId;

    if (facilityId.trim().isEmpty || productVariantId.trim().isEmpty) {
      emit(const InventoryReportEmptyState());
    } else {
      if (reportType == InventoryReportType.reconciliation) {
        throw AppException(
          'Invalid report type: ${event.reportType}',
        );
      }
      emit(const InventoryReportLoadingState());

      List<String>? transactionReason;
      List<String>? transactionType;
      String? senderId;
      String? receiverId;

      if (reportType == InventoryReportType.receipt) {
        transactionType = [TransactionType.received.toValue()];
        transactionReason = [TransactionReason.received.toValue()];
        receiverId = facilityId;
        senderId = null;
      } else if (reportType == InventoryReportType.dispatch) {
        transactionType = [TransactionType.dispatched.toValue()];
        transactionReason = [];
        receiverId = null;
        senderId = facilityId;
      } else if (reportType == InventoryReportType.returned) {
        transactionType = [TransactionType.received.toValue()];
        transactionReason = [TransactionReason.returned.toValue()];
        receiverId = facilityId;
        senderId = null;
      } else if (reportType == InventoryReportType.damage) {
        transactionType = [TransactionType.dispatched.toValue()];
        transactionReason = [
          TransactionReason.damagedInStorage.toValue(),
          TransactionReason.damagedInTransit.toValue(),
        ];
        receiverId = null;
        senderId = facilityId;
      } else if (reportType == InventoryReportType.loss) {
        transactionType = [TransactionType.dispatched.toValue()];
        transactionReason = [
          TransactionReason.lostInStorage.toValue(),
          TransactionReason.lostInTransit.toValue(),
        ];
        receiverId = null;
        senderId = facilityId;
      }
      final data = (receiverId != null
              ? await stockRepository.search(
                  StockSearchModel(
                    transactionType: transactionType,
                    tenantId: InventorySingleton().tenantId,
                    receiverId: receiverId,
                    productVariantId: productVariantId,
                    transactionReason: transactionReason,
                  ),
                )
              : await stockRepository.search(
                  StockSearchModel(
                    transactionType: transactionType,
                    tenantId: InventorySingleton().tenantId,
                    senderId: senderId,
                    productVariantId: productVariantId,
                    transactionReason: transactionReason,
                  ),
                ))
          .where((element) =>
              element.auditDetails != null &&
              element.auditDetails?.createdBy ==
                  InventorySingleton().loggedInUserUuid);

      // Added data filter for dispatch because of no transaction reasons
      // We are removing all the loss and damage stocks from here
      var newData = data;
      if (reportType == InventoryReportType.dispatch && data.isNotEmpty) {
        newData = data.where((e) {
          return [
                TransactionReason.damagedInStorage.toValue(),
                TransactionReason.damagedInTransit.toValue(),
                TransactionReason.lostInStorage.toValue(),
                TransactionReason.lostInTransit.toValue()
              ].contains(e.transactionReason) ==
              false;
        });
      }
      final groupedData = newData.groupListsBy(
        (element) => DateFormat('dd MMM yyyy').format(
          DateTime.fromMillisecondsSinceEpoch(
            element.auditDetails!.createdTime,
          ),
        ),
      );

      emit(InventoryReportStockState(stockData: groupedData));
    }
  }

  Future<void> _handleLoadingEvent(
    InventoryReportLoadingEvent event,
    InventoryReportEmitter emit,
  ) async {
    emit(const InventoryReportLoadingState());
  }

  Future<void> _handleLoadStockReconciliationDataEvent(
    InventoryReportLoadStockReconciliationDataEvent event,
    InventoryReportEmitter emit,
  ) async {
    emit(const InventoryReportLoadingState());
    final data = await stockReconciliationRepository.search(
      StockReconciliationSearchModel(
        tenantId: InventorySingleton().tenantId,
        facilityId: event.facilityId,
        productVariantId: event.productVariantId,
      ),
    );

    final groupedData = data.groupListsBy(
      (element) => DateFormat('dd MMM yyyy').format(
        element.dateOfReconciliationTime,
      ),
    );

    emit(InventoryReportStockReconciliationState(
      data: groupedData,
    ));
  }
}
