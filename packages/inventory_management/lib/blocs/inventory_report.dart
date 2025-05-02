import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/utils/app_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:inventory_management/utils/utils.dart';

import '../../utils/typedefs.dart';
import '../models/entities/stock.dart';
import '../models/entities/stock_reconciliation.dart';
import '../models/entities/transaction_reason.dart';
import '../models/entities/transaction_type.dart';

part 'inventory_report.freezed.dart';

typedef InventoryReportEmitter = Emitter<InventoryReportState>;

class InventoryReportBloc
    extends Bloc<InventoryReportEvent, InventoryReportState> {
  final StockDataRepository stockRepository;
  final StockReconciliationDataRepository stockReconciliationRepository;

  InventoryReportBloc({
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
      List<String>? receiverId;

      if (reportType == InventoryReportType.receipt) {
        transactionType = [TransactionType.received.toValue()];
        transactionReason = [TransactionReason.received.toValue()];
        receiverId = [facilityId];
        senderId = null;
      } else if (reportType == InventoryReportType.dispatch) {
        transactionType = [TransactionType.dispatched.toValue()];
        transactionReason = [];
        receiverId = null;
        senderId = facilityId;
      } else if (reportType == InventoryReportType.returned) {
        transactionType = [TransactionType.received.toValue()];
        transactionReason = [TransactionReason.returned.toValue()];
        receiverId = [facilityId];
        senderId = null;
      } else if (reportType == InventoryReportType.damage) {
        transactionType = [TransactionType.dispatched.toValue()];
        transactionReason = [
          TransactionReason.damagedInStorage.toValue(),
          TransactionReason.damagedInTransit.toValue(),
        ];
        receiverId = [facilityId];
        senderId = null;
      } else if (reportType == InventoryReportType.loss) {
        transactionType = [TransactionType.dispatched.toValue()];
        transactionReason = [
          TransactionReason.lostInStorage.toValue(),
          TransactionReason.lostInTransit.toValue(),
        ];
        receiverId = [facilityId];
        senderId = null;
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

      final groupedData = data.groupListsBy(
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
