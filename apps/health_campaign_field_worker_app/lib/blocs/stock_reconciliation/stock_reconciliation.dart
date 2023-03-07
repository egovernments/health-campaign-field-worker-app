// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/data_model.dart';
import '../../utils/typedefs.dart';

part 'stock_reconciliation.freezed.dart';

typedef StockReconciliationEmitter = Emitter<StockReconciliationState>;

class StockReconciliationBloc
    extends Bloc<StockReconciliationEvent, StockReconciliationState> {
  final StockDataRepository stockRepository;
  final StockReconciliationDataRepository stockReconciliationRepository;

  StockReconciliationBloc(
    super.initialState, {
    required this.stockReconciliationRepository,
    required this.stockRepository,
  }) {
    on(_handleSelectFacility);
    on(_handleSelectProduct);
    on(_handleCalculate);
    on(_handleCreate);
  }

  FutureOr<void> _handleSelectFacility(
    StockReconciliationSelectFacilityEvent event,
    StockReconciliationEmitter emit,
  ) async {
    emit(state.copyWith(facilityModel: event.facilityModel));
    add(const StockReconciliationCalculateEvent());
  }

  FutureOr<void> _handleSelectProduct(
    StockReconciliationSelectProductEvent event,
    StockReconciliationEmitter emit,
  ) async {
    emit(state.copyWith(productVariantId: event.productVariantId));
    add(const StockReconciliationCalculateEvent());
  }

  FutureOr<void> _handleCalculate(
    StockReconciliationCalculateEvent event,
    StockReconciliationEmitter emit,
  ) async {
    emit(state.copyWith(loading: true, stockModels: []));

    final productVariantId = state.productVariantId;
    final facilityId = state.facilityModel?.id;

    if (productVariantId == null || facilityId == null) return;

    final stocks = await stockRepository.search(
      StockSearchModel(
        productVariantId: productVariantId,
        facilityId: facilityId,
      ),
    );

    emit(state.copyWith(loading: false, stockModels: stocks));
  }

  FutureOr<void> _handleCreate(
    StockReconciliationCreateEvent event,
    StockReconciliationEmitter emit,
  ) async {
    // handle logic for create here
  }
}

@freezed
class StockReconciliationEvent with _$StockReconciliationEvent {
  const factory StockReconciliationEvent.selectFacility(
    FacilityModel facilityModel,
  ) = StockReconciliationSelectFacilityEvent;

  const factory StockReconciliationEvent.selectProduct(
    String? productVariantId,
  ) = StockReconciliationSelectProductEvent;

  const factory StockReconciliationEvent.calculate() =
      StockReconciliationCalculateEvent;

  const factory StockReconciliationEvent.create(
    StockReconciliationModel stockReconciliationModel,
  ) = StockReconciliationCreateEvent;
}

@freezed
class StockReconciliationState with _$StockReconciliationState {
  StockReconciliationState._();

  factory StockReconciliationState({
    @Default(false) bool loading,
    required DateTime dateOfReconciliation,
    FacilityModel? facilityModel,
    String? productVariantId,
    @Default([]) List<StockModel> stockModels,
    StockReconciliationModel? stockReconciliationModel,
  }) = _StockReconciliationState;

  num get stockReceived => stockModels
      .where((e) => e.transactionType == TransactionType.received)
      .fold<num>(
        0.0,
        (old, e) => (num.tryParse(e.quantity ?? '') ?? 0.0) + old,
      );

  num get stockIssued => 0.0;

  num get stockReturned => stockModels
      .where((e) =>
          e.transactionType == TransactionType.dispatched &&
          e.transactionReason == TransactionReason.returned)
      .fold<num>(
        0.0,
        (old, e) => (num.tryParse(e.quantity ?? '') ?? 0.0) + old,
      );

  num get stockLost => stockModels
      .where((e) =>
          e.transactionReason == TransactionReason.lostInTransit ||
          e.transactionReason == TransactionReason.lostInStorage)
      .fold<num>(
        0.0,
        (old, e) => (num.tryParse(e.quantity ?? '') ?? 0.0) + old,
      );

  num get stockDamaged => stockModels
      .where((e) =>
          e.transactionReason == TransactionReason.damagedInTransit ||
          e.transactionReason == TransactionReason.damagedInStorage)
      .fold<num>(
        0.0,
        (old, e) => (num.tryParse(e.quantity ?? '') ?? 0.0) + old,
      );

  num get stockConsumed {
    return stockIssued + stockReturned + stockLost + stockDamaged;
  }

  num get stockInHand => stockReceived - stockConsumed;
}
