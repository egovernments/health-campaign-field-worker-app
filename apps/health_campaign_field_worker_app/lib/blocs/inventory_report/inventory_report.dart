import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/data_model.dart';
import '../../utils/typedefs.dart';

part 'inventory_report.freezed.dart';

typedef InventoryReportEmitter = Emitter<InventoryReportState>;

class InventoryReportBloc
    extends Bloc<InventoryReportEvent, InventoryReportState> {
  final StockDataRepository stockRepository;
  final StockReconciliationDataRepository stockReconciliationRepository;

  InventoryReportBloc({
    required this.stockRepository,
    required this.stockReconciliationRepository,
  }) : super(const InventoryReportState()) {
    on(_handleLoadDataEvent);
    on(_handleLoadStockReconciliationDataEvent);
  }

  Future<void> _handleLoadDataEvent(
    InventoryReportLoadStockDataEvent event,
    InventoryReportEmitter emit,
  ) async {
    emit(const InventoryReportStockState(loading: true));

    List<TransactionReason>? transactionReason;
    TransactionType? transactionType;

    switch (event.reportType) {
      case InventoryReportType.receipt:
        transactionType = TransactionType.received;
        transactionReason = [TransactionReason.received];
        break;
      case InventoryReportType.dispatch:
        transactionType = TransactionType.dispatched;
        break;
      case InventoryReportType.returned:
        transactionType = TransactionType.received;
        transactionReason = [TransactionReason.returned];
        break;
      case InventoryReportType.damage:
        transactionType = TransactionType.dispatched;
        transactionReason = [
          TransactionReason.damagedInStorage,
          TransactionReason.damagedInTransit,
        ];

        break;
      case InventoryReportType.loss:
        transactionType = TransactionType.dispatched;
        transactionReason = [
          TransactionReason.lostInStorage,
          TransactionReason.lostInTransit,
        ];

        break;
    }

    final data = await stockRepository.search(
      StockSearchModel(),
    );

    emit(const InventoryReportStockState(loading: false));
  }

  Future<void> _handleLoadStockReconciliationDataEvent(
    InventoryReportLoadStockReconciliationDataEvent event,
    InventoryReportEmitter emit,
  ) async {
    emit(const InventoryReportStockReconciliationState(loading: true));

    emit(const InventoryReportStockReconciliationState(loading: false));
  }
}

@freezed
class InventoryReportEvent with _$InventoryReportEvent {
  const factory InventoryReportEvent.loadStockData({
    required InventoryReportType reportType,
  }) = InventoryReportLoadStockDataEvent;

  const factory InventoryReportEvent.loadStockReconciliationData() =
      InventoryReportLoadStockReconciliationDataEvent;
}

@freezed
class InventoryReportState with _$InventoryReportState {
  const factory InventoryReportState() = InventoryReportInitialState;

  const factory InventoryReportState.stock({
    @Default(false) bool loading,
  }) = InventoryReportStockState;

  const factory InventoryReportState.stockReconciliation({
    @Default(false) bool loading,
  }) = InventoryReportStockReconciliationState;
}

enum InventoryReportType {
  receipt,
  dispatch,
  returned,
  damage,
  loss,
}
