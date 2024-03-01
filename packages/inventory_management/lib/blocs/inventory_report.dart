import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:inventory_management/models/entities/transaction_reason.dart';
import 'package:inventory_management/models/entities/transaction_type.dart';

import '../models/entities/stock_reconciliation.dart';

part 'inventory_report.freezed.dart';

typedef InventoryReportEmitter = Emitter<InventoryReportState>;

class InventoryReportBloc
    extends Bloc<InventoryReportEvent, InventoryReportState> {


  InventoryReportBloc() : super(const InventoryReportEmptyState()) {
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

    if (reportType == InventoryReportType.reconciliation) {

    }
    emit(const InventoryReportLoadingState());

    List<TransactionReason>? transactionReason;
    List<TransactionType>? transactionType;
    String? senderId;
    String? receiverId;

    if (reportType == InventoryReportType.receipt) {
      transactionType = [TransactionType.received];
      transactionReason = [TransactionReason.received];
      receiverId = facilityId;
      senderId = null;
    } else if (reportType == InventoryReportType.dispatch) {
      transactionType = [TransactionType.dispatched];
      transactionReason = [];
      receiverId = null;
      senderId = facilityId;
    } else if (reportType == InventoryReportType.returned) {
      transactionType = [TransactionType.received];
      transactionReason = [TransactionReason.returned];
      receiverId = null;
      senderId = facilityId;
    } else if (reportType == InventoryReportType.damage) {
      transactionType = [TransactionType.dispatched];
      transactionReason = [
        TransactionReason.damagedInStorage,
        TransactionReason.damagedInTransit,
      ];
      receiverId = facilityId;
      senderId = null;
    } else if (reportType == InventoryReportType.loss) {
      transactionType = [TransactionType.dispatched];
      transactionReason = [
        TransactionReason.lostInStorage,
        TransactionReason.lostInTransit,
      ];
      receiverId = facilityId;
      senderId = null;
    }
    // final user = await LocalSecureStore.instance.userRequestModel;

    // final data = (receiverId != null
    //     ? await stockRepository.search(
    //   HcmStockSearchModel(
    //     stock: StockSearchModel(
    //       transactionType: transactionType,
    //       tenantId: envConfig.variables.tenantId,
    //       receiverId: receiverId,
    //       productVariantId: productVariantId,
    //       transactionReason: transactionReason,
    //     ),
    //   ),
    // )
    //     : await stockRepository.search(
    //   HcmStockSearchModel(
    //     stock: StockSearchModel(
    //       transactionType: transactionType,
    //       tenantId: envConfig.variables.tenantId,
    //       senderId: senderId,
    //       productVariantId: productVariantId,
    //       transactionReason: transactionReason,
    //     ),
    //   ),
    // ))
    //     .where((element) =>
    // element.auditDetails != null &&
    //     element.auditDetails?.createdBy == user?.uuid);

    // final groupedData = data.groupListsBy(
    //       (element) => DateFormat('dd MMM yyyy').format(
    //     DateTime.fromMillisecondsSinceEpoch(
    //       element.auditDetails!.createdTime,
    //     ),
    //   ),
    // );

    emit(InventoryReportStockState(
        // stockData: groupedData
    ));
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
    // final data = await stockReconciliationRepository.search(
    //   StockReconciliationSearchModel(
    //     tenantId: event.tenantId,
    //     facilityId: event.facilityId,
    //     productVariantId: event.productVariantId,
    //   ),
    // );
    //
    // final groupedData = data.groupListsBy(
    //       (element) => DateFormat('dd MMM yyyy').format(
    //     element.dateOfReconciliationTime,
    //   ),
    // );

    emit(InventoryReportStockReconciliationState(
      // data: groupedData,
    ));
  }
}

@freezed
class InventoryReportEvent with _$InventoryReportEvent {
  const factory InventoryReportEvent.loadStockData({
    required InventoryReportType reportType,
    required String facilityId,
    required String productVariantId,
  }) = InventoryReportLoadStockDataEvent;

  const factory InventoryReportEvent.loadStockReconciliationData({
    required String facilityId,
    required String productVariantId,
  }) = InventoryReportLoadStockReconciliationDataEvent;

  const factory InventoryReportEvent.loading() = InventoryReportLoadingEvent;
}

@freezed
class InventoryReportState with _$InventoryReportState {
  const factory InventoryReportState.loading() = InventoryReportLoadingState;
  const factory InventoryReportState.empty() = InventoryReportEmptyState;

  const factory InventoryReportState.stock({
    @Default({}) Map<String, List<StockModel>> stockData,
  }) = InventoryReportStockState;

  const factory InventoryReportState.stockReconciliation({
    @Default({}) Map<String, List<StockReconciliationModel>> data,
  }) = InventoryReportStockReconciliationState;
}

enum InventoryReportType {
  receipt,
  dispatch,
  returned,
  damage,
  loss,
  reconciliation,
}
