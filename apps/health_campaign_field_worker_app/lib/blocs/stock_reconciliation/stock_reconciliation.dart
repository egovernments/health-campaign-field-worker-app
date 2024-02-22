// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/local_store/secure_store/secure_store.dart';
import '../../models/data_model.dart';
import '../../utils/environment_config.dart';
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
    add(StockReconciliationCalculateEvent(
      isDistributor: event.isDistributor,
    ));
  }

  FutureOr<void> _handleCalculate(
    StockReconciliationCalculateEvent event,
    StockReconciliationEmitter emit,
  ) async {
    emit(state.copyWith(loading: true, stockModels: []));

    final productVariantId = state.productVariantId;
    final facilityId = state.facilityModel?.id;

    if ((productVariantId == null) ||
        (!event.isDistributor && facilityId == null)) return;

    final user = await LocalSecureStore.instance.userRequestModel;

    final receivedStocks = (await stockRepository.search(
      StockSearchModel(
        productVariantId: productVariantId,
        receiverId: facilityId,
      ),
    ))
        .where((element) =>
            element.auditDetails != null &&
            element.auditDetails?.createdBy == user?.uuid)
        .toList();
    final sentStocks = (await stockRepository.search(
      StockSearchModel(
        productVariantId: productVariantId,
        senderId: facilityId,
      ),
    ))
        .where((element) =>
            element.auditDetails != null &&
            element.auditDetails?.createdBy == user?.uuid)
        .toList();

    emit(state.copyWith(
      loading: false,
      stockModels: [...receivedStocks, ...sentStocks],
    ));
  }

  FutureOr<void> _handleCreate(
    StockReconciliationCreateEvent event,
    StockReconciliationEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    stockReconciliationRepository.create(
      event.stockReconciliationModel.copyWith(
        tenantId: envConfig.variables.tenantId,
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
    emit(
      state.copyWith(
        loading: false,
        persisted: true,
      ),
    );
  }
}

@freezed
class StockReconciliationEvent with _$StockReconciliationEvent {
  const factory StockReconciliationEvent.selectFacility(
    FacilityModel facilityModel, {
    @Default(false) bool isDistributor,
  }) = StockReconciliationSelectFacilityEvent;

  const factory StockReconciliationEvent.selectProduct(
    String? productVariantId, {
    @Default(false) bool isDistributor,
  }) = StockReconciliationSelectProductEvent;

  const factory StockReconciliationEvent.calculate({
    @Default(false) bool isDistributor,
  }) = StockReconciliationCalculateEvent;

  const factory StockReconciliationEvent.create(
    StockReconciliationModel stockReconciliationModel,
  ) = StockReconciliationCreateEvent;
}

@freezed
class StockReconciliationState with _$StockReconciliationState {
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

  num get stockReceived => _getQuantityCount(
        stockModels.where((e) =>
            e.transactionType == TransactionType.received &&
            e.transactionReason == TransactionReason.received),
      );

  num get stockIssued => _getQuantityCount(
        stockModels.where((e) =>
            e.transactionType == TransactionType.dispatched &&
            e.transactionReason == null),
      );

  num get stockReturned => _getQuantityCount(
        stockModels.where((e) =>
            e.transactionType == TransactionType.received &&
            e.transactionReason == TransactionReason.returned),
      );

  num get stockLost => _getQuantityCount(
        stockModels.where((e) =>
            e.transactionType == TransactionType.dispatched &&
            (e.transactionReason == TransactionReason.lostInTransit ||
                e.transactionReason == TransactionReason.lostInStorage)),
      );

  num get stockDamaged => _getQuantityCount(
        stockModels.where((e) =>
            e.transactionType == TransactionType.dispatched &&
            (e.transactionReason == TransactionReason.damagedInTransit ||
                e.transactionReason == TransactionReason.damagedInStorage)),
      );

  num get stockInHand =>
      (stockReceived + stockReturned) -
      (stockIssued + stockDamaged + stockLost);

  num _getQuantityCount(Iterable<StockModel> stocks) {
    return stocks.fold<num>(
      0.0,
      (old, e) => (num.tryParse(e.quantity ?? '') ?? 0.0) + old,
    );
  }
}
