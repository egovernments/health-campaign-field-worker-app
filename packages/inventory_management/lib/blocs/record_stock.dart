// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_management/inventory_management.dart';

import '../models/entities/inventory_facility.dart';

part 'record_stock.freezed.dart';

typedef RecordStockEmitter = Emitter<RecordStockState>;

class RecordStockBloc extends Bloc<RecordStockEvent, RecordStockState> {
  RecordStockBloc(super.initialState) {
    on(_handleSaveWarehouseDetails);
    on(_handleSaveStockDetails);
    on(_handleCreateStockEntry);
    on(_handleSaveTransactionDetails);
  }

  FutureOr<void> _handleSaveWarehouseDetails(
    RecordStockSaveWarehouseDetailsEvent event,
    RecordStockEmitter emit,
  ) async {
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

  FutureOr<void> _handleSaveTransactionDetails(
    RecordStockSaveTransactionDetailsEvent event,
    RecordStockEmitter emit,
  ) async {
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

  FutureOr<void> _handleSaveStockDetails(
    RecordStockSaveStockDetailsEvent event,
    RecordStockEmitter emit,
  ) async {
    state.maybeMap(
      orElse: () {
        throw const InvalidRecordStockStateException();
      },
      create: (value) {
        emit(value.copyWith(
            stockModel: event.stockModel,
            additionalData: event.additionalData));
      },
    );
  }

  FutureOr<void> _handleCreateStockEntry(
    RecordStockCreateStockEntryEvent event,
    RecordStockEmitter emit,
  ) async {
    bool stockSaved = false;

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

        InventorySingleton().saveStockDetails(
          SaveStockDetails(
            stockModel: stockModel.copyWith(
              facilityId: facilityModel.id,
            ),
            additionalData: value.additionalData ?? {},
            isStockSaved: (bool isStockSaved) {
              if (isStockSaved == true) {
                stockSaved = true;
              }
            },
          ),
        );

        if (stockSaved) {
          emit(
            RecordStockPersistedState(
              entryType: value.entryType,
              projectId: value.projectId,
              stockModel: value.stockModel,
              facilityModel: value.facilityModel,
              dateOfRecord: value.dateOfRecord,
              additionalData: value.additionalData,
            ),
          );
        }
      },
    );
  }
}

@freezed
class RecordStockEvent with _$RecordStockEvent {
  const factory RecordStockEvent.saveWarehouseDetails({
    required DateTime dateOfRecord,
    required InventoryFacilityModel facilityModel,
  }) = RecordStockSaveWarehouseDetailsEvent;

  const factory RecordStockEvent.saveStockDetails({
    required StockModel stockModel,
    required Map<String, Object>? additionalData,
  }) = RecordStockSaveStockDetailsEvent;

  const factory RecordStockEvent.createStockEntry() =
      RecordStockCreateStockEntryEvent;

  const factory RecordStockEvent.saveTransactionDetails({
    required DateTime dateOfRecord,
    required String primaryType,
    required String primaryId,
    InventoryFacilityModel? facilityModel,
  }) = RecordStockSaveTransactionDetailsEvent;
}

@freezed
class RecordStockState with _$RecordStockState {
  const factory RecordStockState.create({
    required StockRecordEntryType entryType,
    @Default(false) bool loading,
    required String projectId,
    DateTime? dateOfRecord,
    String? primaryType,
    String? primaryId,
    InventoryFacilityModel? facilityModel,
    StockModel? stockModel,
    Map<String, Object>? additionalData,
  }) = RecordStockCreateState;

  const factory RecordStockState.persisted(
      {required StockRecordEntryType entryType,
      required String projectId,
      DateTime? dateOfRecord,
      InventoryFacilityModel? facilityModel,
      String? primaryType,
      String? primaryId,
      StockModel? stockModel,
      Map<String, Object>? additionalData}) = RecordStockPersistedState;
}

class InvalidRecordStockStateException implements Exception {
  final String? message;

  const InvalidRecordStockStateException([this.message]);
}

enum StockRecordEntryType {
  receipt,
  dispatch,
  returned,
  loss,
  damaged,
}
