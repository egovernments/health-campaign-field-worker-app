// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/data_model.dart';
import '../../utils/environment_config.dart';
import '../../utils/typedefs.dart';
import '../../utils/utils.dart';

part 'record_stock.freezed.dart';

typedef RecordStockEmitter = Emitter<RecordStockState>;

class RecordStockBloc extends Bloc<RecordStockEvent, RecordStockState> {
  final StockDataRepository stockRepository;

  RecordStockBloc(
    super.initialState, {
    required this.stockRepository,
  }) {
    on(_handleSaveWarehouseDetails);
    on(_handleSaveStockDetails);
    on(_handleCreateStockEntry);
  }

  FutureOr<void> _handleSaveWarehouseDetails(
    RecordStockSaveWarehouseDetailsEvent event,
    RecordStockEmitter emit,
  ) async {
    emit(RecordStockCreateState(
      dateOfRecord: event.dateOfRecord,
      facilityModel: event.facilityModel,
    ));
  }

  FutureOr<void> _handleSaveStockDetails(
    RecordStockSaveStockDetailsEvent event,
    RecordStockEmitter emit,
  ) async {
    state.maybeMap(
      orElse: () {
        throw const InvalidRecordStockStateException();
      },
      create: (value) {
        emit(value.copyWith(stockModel: event.stockModel));
      },
    );
  }

  FutureOr<void> _handleCreateStockEntry(
    RecordStockCreateStockEntryEvent event,
    RecordStockEmitter emit,
  ) async {
    state.maybeMap(
      orElse: () {
        throw const InvalidRecordStockStateException();
      },
      create: (value) async {
        final dateOfRecord = value.dateOfRecord;
        final facilityModel = value.facilityModel;
        final stockModel = value.stockModel;

        if (dateOfRecord == null) {
          throw const InvalidRecordStockStateException(
            'Date of record cannot be null',
          );
        } else if (facilityModel == null) {
          throw const InvalidRecordStockStateException(
            'Facility cannot be null',
          );
        } else if (stockModel == null) {
          throw const InvalidRecordStockStateException(
            'Facility cannot be null',
          );
        }

        emit(value.copyWith(loading: true));

        try {
          await stockRepository.create(
            stockModel.copyWith(
              facilityId: facilityModel.id,
              rowVersion: 1,
              referenceId: '13',
              referenceIdType: 'PROJECT',
              tenantId: envConfig.variables.tenantId,
              clientReferenceId: IdGen.i.identifier,
            ),
          );
        } catch (error) {
          rethrow;
        } finally {
          emit(const RecordStockPersistedState());
        }
      },
    );
  }
}

@freezed
class RecordStockEvent with _$RecordStockEvent {
  const factory RecordStockEvent.saveWarehouseDetails({
    required DateTime dateOfRecord,
    required FacilityModel facilityModel,
  }) = RecordStockSaveWarehouseDetailsEvent;

  const factory RecordStockEvent.saveStockDetails({
    required StockModel stockModel,
  }) = RecordStockSaveStockDetailsEvent;

  const factory RecordStockEvent.createStockEntry() =
      RecordStockCreateStockEntryEvent;
}

@freezed
class RecordStockState with _$RecordStockState {
  const factory RecordStockState.create({
    @Default(false) bool loading,
    DateTime? dateOfRecord,
    FacilityModel? facilityModel,
    StockModel? stockModel,
  }) = RecordStockCreateState;

  const factory RecordStockState.persisted() = RecordStockPersistedState;
}

class InvalidRecordStockStateException implements Exception {
  final String? message;

  const InvalidRecordStockStateException([this.message]);
}
