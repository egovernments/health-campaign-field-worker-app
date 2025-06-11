import 'dart:async';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registration_bloc/models/global_search_params.dart';

import '../models/entities/household.dart';
import '../service/registration_service.dart';

part 'registration_bloc.freezed.dart';

typedef RegistrationEmitter = Emitter<RegistrationState>;

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationService service;

  RegistrationBloc({
    required this.service,
  }) : super(const RegistrationState.initial()) {
    on<RegistrationEventSearch>(_handleSearch);
    on<RegistrationEventCreate>(_handleCreate);
    on<RegistrationEventDelete>(_handleDelete);
    on<RegistrationEventUpdate>(_handleUpdate);
  }

  /// Handles the search event for households
  FutureOr<void> _handleSearch(
      RegistrationEventSearch event,
      RegistrationEmitter emit,
      ) async {
    emit(const RegistrationState.loading());
    try {
      final results = await service.searchHouseholds(query: event.searchParams);
      emit(RegistrationState.loaded(results));
    } catch (e) {
      emit(RegistrationState.error('Search failed: ${e.toString()}'));
    }
  }

  /// Handles the create event for entities (like households, individuals, etc.)
  FutureOr<void> _handleCreate(
      RegistrationEventCreate event,
      RegistrationEmitter emit,
      ) async {
    emit(const RegistrationState.loading());
    try {
      await service.registerEntities(event.entities);
      emit(RegistrationState.persisted(event.entities));
    } catch (e) {
      emit(RegistrationState.error('Create failed: ${e.toString()}'));
    }
  }

  /// Handles the update event for entities (like households, individuals, etc.)
  FutureOr<void> _handleUpdate(
      RegistrationEventUpdate event,
      RegistrationEmitter emit,
      ) async {
    emit(const RegistrationState.loading());
    try {
      await service.updateEntities(event.entities);
      emit(RegistrationState.persisted(event.entities));
    } catch (e) {
      emit(RegistrationState.error('Update failed: ${e.toString()}'));
    }
  }
  /// Handles the delete event for a household and re-triggers search
  FutureOr<void> _handleDelete(
      RegistrationEventDelete event,
      RegistrationEmitter emit,
      ) async {
    emit(const RegistrationState.loading());
    try {
      await service.deleteEntities(event.entities);
      emit(RegistrationState.persisted(event.entities));
    } catch (e) {
      emit(RegistrationState.error('Delete failed: ${e.toString()}'));
    }
  }
}



@freezed
class RegistrationEvent with _$RegistrationEvent {
  const factory RegistrationEvent.search(final GlobalSearchParameters searchParams) = RegistrationEventSearch;
  const factory RegistrationEvent.create({
    required List<EntityModel> entities,
  }) = RegistrationEventCreate;
  const factory RegistrationEvent.update({
    required List<EntityModel> entities,
  }) = RegistrationEventUpdate;
  const factory RegistrationEvent.delete({
    required List<EntityModel> entities,
  }) = RegistrationEventDelete;
}


@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState.initial() = RegistrationStateInitial;
  const factory RegistrationState.loading() = RegistrationStateLoading;
  const factory RegistrationState.loaded(FutureOr<List<EntityModel>> results) = RegistrationStateLoaded;
  const factory RegistrationState.persisted(List<EntityModel> entities) = RegistrationStatePersisted;
  const factory RegistrationState.error(String message) = RegistrationStateError;
}

