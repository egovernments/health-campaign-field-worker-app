// GENERATED using mason_cli
import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/utils/typedefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:inventory_management/utils/typedefs.dart';

part 'entity_create.freezed.dart';

typedef EntityCreateEmitter = Emitter<EntityCreateState>;

class EntityCreateBloc extends Bloc<EntityCreateEvent, EntityCreateState> {
  final StockDataRepository stockDataRepository;

  EntityCreateBloc({
    required this.stockDataRepository,
  }) : super(const EntityCreateState.create()) {
    on<EntityCreateCreateEvent>(_handleCreate);
  }

  FutureOr<void> _handleCreate(
    EntityCreateCreateEvent event,
    EntityCreateEmitter emit,
  ) async {
    emit(const EntityCreateState.loading());

    try {
      for (final entity in event.entities) {
        final repository = getDataRepositoryFromModel(entity as EntityModel);
        await repository.create(entity);
      }

      emit(EntityCreateState.persisted(
          entities: event.entities.cast<EntityModel>()));
    } catch (e) {
      emit(EntityCreateState.error(e.toString()));
    }
  }

  // Now, getDataRepositoryFromModel does not require BuildContext
  DataRepository getDataRepositoryFromModel(EntityModel entity) {
    if (entity is StockModel) {
      return stockDataRepository;
    } else {
      throw Exception(
          'No repository found for entity type: ${entity.runtimeType}');
    }
  }
}

@freezed
class EntityCreateEvent with _$EntityCreateEvent {
  const factory EntityCreateEvent.create({
    required List<Object> entities,
  }) = EntityCreateCreateEvent;
}

@freezed
class EntityCreateState with _$EntityCreateState {
  const factory EntityCreateState.create() = EntityCreateInitialState;
  const factory EntityCreateState.loading() = EntityCreateLoadingState;
  const factory EntityCreateState.persisted({
    required List<EntityModel> entities,
  }) = EntityCreatePersistedState;
  const factory EntityCreateState.error(String message) =
      EntityCreateErrorState;
}

class InvalidRegistrationStateException implements Exception {
  final String? message;

  const InvalidRegistrationStateException([this.message]);
}
