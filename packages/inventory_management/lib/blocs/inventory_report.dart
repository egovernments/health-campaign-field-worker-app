import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:inventory_management/models/entities/transaction_reason.dart';
import 'package:inventory_management/models/entities/transaction_type.dart';

import '../models/entities/stock_reconciliation.dart';
import 'inventory_listener.dart';

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
    emit(const InventoryReportLoadingState());
    await InventorySingleton().fetchInventoryReports(
      FetchInventoryReports(
        reportType: event.reportType,
        facilityId: event.facilityId,
        productVariantId: event.productVariantId,
        stocks: (stocks) {
          emit(InventoryReportStockState(
            stockData: stocks,
          ));
        },
      ),
    );
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
