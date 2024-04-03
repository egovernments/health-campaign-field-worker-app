import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_management/models/entities/stock.dart';

import '../models/entities/stock_reconciliation.dart';
import 'inventory_listener.dart';

part 'inventory_report.freezed.dart';

typedef InventoryReportEmitter = Emitter<InventoryReportState>;

// Bloc for handling inventory report related events and states
class InventoryReportBloc
    extends Bloc<InventoryReportEvent, InventoryReportState> {
  final InventorySingleton inventorySingleton;

  // Constructor for the bloc
  InventoryReportBloc({required this.inventorySingleton})
      : super(const InventoryReportEmptyState()) {
    // Registering the event handlers
    on(_handleLoadDataEvent);
    on(_handleLoadStockReconciliationDataEvent);
    on(_handleLoadingEvent);
  }

  // Event handler for loading stock data
  Future<void> _handleLoadDataEvent(
    InventoryReportLoadStockDataEvent event,
    InventoryReportEmitter emit,
  ) async {
    // Emitting the loading state
    emit(const InventoryReportLoadingState());
    // Fetching the inventory reports
    // Fetching the inventory reports
    Map<String, List<StockModel>> stocks =
        await inventorySingleton.fetchInventoryReports(
      FetchInventoryReports(
        reportType: event.reportType,
        facilityId: event.facilityId,
        productVariantId: event.productVariantId,
      ),
    );
    // Emitting the fetched state with the fetched stock data
    emit(InventoryReportStockState(stockData: stocks));
  }

  // Event handler for loading state
  Future<void> _handleLoadingEvent(
    InventoryReportLoadingEvent event,
    InventoryReportEmitter emit,
  ) async {
    // Emitting the loading state
    emit(const InventoryReportLoadingState());
  }

  // Event handler for loading stock reconciliation data
  Future<void> _handleLoadStockReconciliationDataEvent(
    InventoryReportLoadStockReconciliationDataEvent event,
    InventoryReportEmitter emit,
  ) async {
    // Emitting the loading state
    emit(const InventoryReportLoadingState());
    // Handling the stock reconciliation report
    // Fetching the stock reconciliation reports
    Map<String, List<StockReconciliationModel>> data =
        await inventorySingleton.handleStockReconciliationReport(
      StockReconciliationReport(
        facilityId: event.facilityId,
        productVariantId: event.productVariantId,
      ),
    );
    // Emitting the fetched state with the fetched stock data
    emit(InventoryReportStockReconciliationState(data: data));
  }
}

// Freezed union class for inventory report events
@freezed
class InventoryReportEvent with _$InventoryReportEvent {
  // Event for loading stock data
  const factory InventoryReportEvent.loadStockData({
    required InventoryReportType reportType,
    required String facilityId,
    required String productVariantId,
  }) = InventoryReportLoadStockDataEvent;

  // Event for loading stock reconciliation data
  const factory InventoryReportEvent.loadStockReconciliationData({
    required String facilityId,
    required String productVariantId,
  }) = InventoryReportLoadStockReconciliationDataEvent;

  // Event for loading state
  const factory InventoryReportEvent.loading() = InventoryReportLoadingEvent;
}

// Freezed union class for inventory report states
@freezed
class InventoryReportState with _$InventoryReportState {
  // State for when the inventory report is being loaded
  const factory InventoryReportState.loading() = InventoryReportLoadingState;

  // State for when there are no inventory reports
  const factory InventoryReportState.empty() = InventoryReportEmptyState;

  // State for when the stock data has been fetched
  const factory InventoryReportState.stock({
    @Default({}) Map<String, List<StockModel>> stockData,
  }) = InventoryReportStockState;

  // State for when the stock reconciliation data has been fetched
  const factory InventoryReportState.stockReconciliation({
    @Default({}) Map<String, List<StockReconciliationModel>> data,
    @Default([{}]) Iterable<Iterable<MapEntry<String, dynamic>>> additionalData,
  }) = InventoryReportStockReconciliationState;
}

// Enum for inventory report type
enum InventoryReportType {
  receipt,
  dispatch,
  returned,
  damage,
  loss,
  reconciliation,
}
