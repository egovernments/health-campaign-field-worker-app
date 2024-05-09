// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_management/inventory_management.dart';
import 'package:digit_data_model/data_model.dart';

import '../utils/utils.dart';

part 'record_stock.freezed.dart';

typedef RecordStockEmitter = Emitter<RecordStockState>;

// Bloc for handling record stock related events and states
class RecordStockBloc extends Bloc<RecordStockEvent, RecordStockState> {
  final InventorySingleton inventorySingleton;

  // Constructor for the bloc
  RecordStockBloc(super.initialState, {required this.inventorySingleton}) {
    // Registering the event handlers
    on(_handleSaveWarehouseDetails);
    on(_handleSaveStockDetails);
    on(_handleCreateStockEntry);
    on(_handleSaveTransactionDetails);
  }

  // Event handler for saving warehouse details
  FutureOr<void> _handleSaveWarehouseDetails(
    RecordStockSaveWarehouseDetailsEvent event,
    RecordStockEmitter emit,
  ) async {
    // Emitting the state with the saved warehouse details
    state.maybeMap(
      orElse: () {
        throw const InvalidRecordStockStateException();
      },
      create: (value) {
        emit(
          value.copyWith(
            dateOfRecord: event.dateOfRecord,
            facilityModel: event.facilityModel,
          ),
        );
      },
    );
  }

  // Event handler for saving transaction details
  FutureOr<void> _handleSaveTransactionDetails(
    RecordStockSaveTransactionDetailsEvent event,
    RecordStockEmitter emit,
  ) async {
    // Emitting the state with the saved transaction details
    state.maybeMap(
      orElse: () {
        throw const InvalidRecordStockStateException();
      },
      create: (value) {
        emit(
          value.copyWith(
            dateOfRecord: event.dateOfRecord,
            facilityModel: event.facilityModel,
            primaryType: event.primaryType,
            primaryId: event.primaryId,
          ),
        );
      },
    );
  }

  // Event handler for saving stock details
  FutureOr<void> _handleSaveStockDetails(
    RecordStockSaveStockDetailsEvent event,
    RecordStockEmitter emit,
  ) async {
    // Emitting the state with the saved stock details
    state.maybeMap(
      orElse: () {
        throw const InvalidRecordStockStateException();
      },
      create: (value) {
        emit(value.copyWith(
          stockModel: event.stockModel,
        ));
      },
    );
  }

  // Event handler for creating a stock entry
  FutureOr<void> _handleCreateStockEntry(
    RecordStockCreateStockEntryEvent event,
    RecordStockEmitter emit,
  ) async {
    bool? stockSaved = false;

    await state.maybeMap(
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

        stockSaved = await inventorySingleton.saveStockDetails(
          SaveStockDetails(
            stockModel: stockModel.copyWith(
              facilityId: facilityModel.id,
              rowVersion: 1,
            ),
          ),
        );

        if (stockSaved!) {
          emit(
            RecordStockPersistedState(
              entryType: value.entryType,
              projectId: value.projectId,
              stockModel: value.stockModel,
              facilityModel: value.facilityModel,
              dateOfRecord: value.dateOfRecord,
            ),
          );
        }
      },
    );
  }
}

// Freezed union class for record stock events
@freezed
class RecordStockEvent with _$RecordStockEvent {
  // Event for saving warehouse details
  const factory RecordStockEvent.saveWarehouseDetails({
    required DateTime dateOfRecord,
    required FacilityModel facilityModel,
  }) = RecordStockSaveWarehouseDetailsEvent;

  // Event for saving stock details
  const factory RecordStockEvent.saveStockDetails({
    required StockModel stockModel,
  }) = RecordStockSaveStockDetailsEvent;

  // Event for creating a stock entry
  const factory RecordStockEvent.createStockEntry() =
      RecordStockCreateStockEntryEvent;

  // Event for saving transaction details
  const factory RecordStockEvent.saveTransactionDetails({
    required DateTime dateOfRecord,
    required String primaryType,
    required String primaryId,
    FacilityModel? facilityModel,
  }) = RecordStockSaveTransactionDetailsEvent;
}

// Freezed union class for record stock states
@freezed
class RecordStockState with _$RecordStockState {
  // State for creating a record stock
  const factory RecordStockState.create({
    required StockRecordEntryType entryType,
    @Default(false) bool loading,
    required String projectId,
    DateTime? dateOfRecord,
    String? primaryType,
    String? primaryId,
    FacilityModel? facilityModel,
    StockModel? stockModel,
  }) = RecordStockCreateState;

  // State for a persisted record stock
  const factory RecordStockState.persisted({
    required StockRecordEntryType entryType,
    required String projectId,
    DateTime? dateOfRecord,
    FacilityModel? facilityModel,
    String? primaryType,
    String? primaryId,
    StockModel? stockModel,
  }) = RecordStockPersistedState;
}

// Exception for invalid record stock state
class InvalidRecordStockStateException implements Exception {
  final String? message;

  const InvalidRecordStockStateException([this.message]);
}

// Enum for stock record entry type
enum StockRecordEntryType {
  receipt,
  dispatch,
  returned,
  loss,
  damaged,
}
