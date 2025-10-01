// GENERATED using mason_cli
import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/typedefs.dart';
import '../models/entities/transaction_reason.dart';
import '../models/entities/transaction_type.dart';
import '../utils/utils.dart';

part 'stock_reconciliation.freezed.dart';

typedef StockReconciliationEmitter = Emitter<StockReconciliationState>;

// Bloc for handling stock reconciliation related events and states
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

  // Event handler for selecting a facility
  FutureOr<void> _handleSelectFacility(
    StockReconciliationSelectFacilityEvent event,
    StockReconciliationEmitter emit,
  ) async {
    // Emitting the state with the selected facility
    emit(state.copyWith(facilityModel: event.facilityModel));
    add(const StockReconciliationCalculateEvent());
  }

  // Event handler for selecting a product
  FutureOr<void> _handleSelectProduct(
    StockReconciliationSelectProductEvent event,
    StockReconciliationEmitter emit,
  ) async {
    // Emitting the state with the selected product
    emit(state.copyWith(productVariantId: event.productVariantId));
    add(StockReconciliationCalculateEvent(
      isDistributor: event.isDistributor,
    ));
  }

  // Event handler for calculating stock reconciliation
  FutureOr<void> _handleCalculate(
    StockReconciliationCalculateEvent event,
    StockReconciliationEmitter emit,
  ) async {
    // Emitting the loading state
    emit(state.copyWith(loading: true, stockModels: []));

    final productVariantId = state.productVariantId;
    final facilityId = state.facilityModel?.id;

    if ((productVariantId == null) ||
        (!event.isDistributor && facilityId == null)) return;

    // Fetching the stock reconciliation details
    final receivedStocks = (await stockRepository.search(
      StockSearchModel(
          productVariantId: productVariantId,
          receiverId: [facilityId!],
          transactionType: [TransactionType.received.toValue()]),
    ))
        .where((element) =>
            element.auditDetails != null &&
            element.auditDetails?.createdBy ==
                InventorySingleton().loggedInUserUuid)
        .toList();
    final sentStocks = (await stockRepository.search(
      StockSearchModel(
          productVariantId: productVariantId,
          senderId: facilityId,
          transactionType: [TransactionType.dispatched.toValue()]),
    ))
        .where((element) =>
            element.auditDetails != null &&
            element.auditDetails?.createdBy ==
                InventorySingleton().loggedInUserUuid)
        .toList();

    // Emitting the state with the fetched stock reconciliation details
    emit(state.copyWith(
      loading: false,
      stockModels: [...receivedStocks, ...sentStocks],
    ));
  }

  // Event handler for creating a stock reconciliation
  FutureOr<void> _handleCreate(
    StockReconciliationCreateEvent event,
    StockReconciliationEmitter emit,
  ) async {
    // Emitting the loading state
    emit(state.copyWith(loading: true));
    // Saving the stock reconciliation details
    stockReconciliationRepository.create(
      event.stockReconciliationModel.copyWith(
        tenantId: InventorySingleton().tenantId,
        referenceId: state.projectId,
        referenceIdType: 'PROJECT',
        additionalFields: StockReconciliationAdditionalFields(
          version: 1,
          fields: [
            AdditionalField('received', state.stockReceived),
            AdditionalField('issued', state.stockIssued),
            AdditionalField('returned', state.stockReturned),
            AdditionalField('lost', state.stockLost),
            AdditionalField('damaged', state.stockDamaged),
            AdditionalField('inHand', state.stockInHand),
          ],
        ),
        rowVersion: 1,
      ),
    );
    // Emitting the state with the persisted stock reconciliation details
    emit(
      state.copyWith(
        loading: false,
        persisted: true,
      ),
    );
  }
}

// Freezed union class for stock reconciliation events
@freezed
class StockReconciliationEvent with _$StockReconciliationEvent {
  // Event for selecting a facility
  const factory StockReconciliationEvent.selectFacility(
    FacilityModel facilityModel, {
    @Default(false) bool isDistributor,
  }) = StockReconciliationSelectFacilityEvent;

  // Event for selecting a product
  const factory StockReconciliationEvent.selectProduct(
    String? productVariantId, {
    @Default(false) bool isDistributor,
  }) = StockReconciliationSelectProductEvent;

  // Event for calculating stock reconciliation
  const factory StockReconciliationEvent.calculate({
    @Default(false) bool isDistributor,
  }) = StockReconciliationCalculateEvent;

  // Event for creating a stock reconciliation
  const factory StockReconciliationEvent.create(
    StockReconciliationModel stockReconciliationModel,
  ) = StockReconciliationCreateEvent;
}

// Freezed union class for stock reconciliation states
@freezed
class StockReconciliationState with _$StockReconciliationState {
  // State for stock reconciliation
  StockReconciliationState._();

  factory StockReconciliationState({
    @Default(false) bool loading,
    @Default(false) bool persisted,
    required String projectId,
    required DateTime dateOfReconciliation,
    FacilityModel? facilityModel,
    String? productVariantId,
    @Default([]) List<StockModel> stockModels,
    StockReconciliationModel? stockReconciliationModel,
  }) = _StockReconciliationState;

  // Getter for received stock
  num get stockReceived => _getQuantityCount(
        stockModels.where((e) =>
            e.transactionType == TransactionType.received.toValue() &&
            e.transactionReason == TransactionReason.received.toValue()),
      );

  // Getter for issued stock
  num get stockIssued => _getQuantityCount(
        stockModels.where((e) =>
            e.transactionType == TransactionType.dispatched.toValue() &&
            e.transactionReason == null),
      );

  // Getter for returned stock
  num get stockReturned => _getQuantityCount(
        stockModels.where((e) =>
            e.transactionType == TransactionType.received.toValue() &&
            e.transactionReason == TransactionReason.returned.toValue()),
      );

  // Getter for lost stock
  num get stockLost => _getQuantityCount(
        stockModels.where((e) =>
            e.transactionType == TransactionType.dispatched.toValue() &&
            (e.transactionReason == TransactionReason.lostInTransit.toValue() ||
                e.transactionReason ==
                    TransactionReason.lostInStorage.toValue())),
      );

  // Getter for damaged stock
  num get stockDamaged => _getQuantityCount(
        stockModels.where((e) =>
            e.transactionType == TransactionType.dispatched.toValue() &&
            (e.transactionReason ==
                    TransactionReason.damagedInTransit.toValue() ||
                e.transactionReason ==
                    TransactionReason.damagedInStorage.toValue())),
      );

  // Getter for in-hand stock
  num get stockInHand =>
      (stockReceived + stockReturned) -
      (stockIssued + stockDamaged + stockLost);

  // Method for calculating quantity count
  num _getQuantityCount(Iterable<StockModel> stocks) {
    return stocks.fold<num>(
      0.0,
      (old, e) => (num.tryParse(e.quantity ?? '') ?? 0.0) + old,
    );
  }
}
