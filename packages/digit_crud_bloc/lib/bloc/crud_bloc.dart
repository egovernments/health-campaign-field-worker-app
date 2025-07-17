/// CrudBloc handles CRUD operations for dynamic entities using CrudService.
///
/// Events:
///   - initialize: Initializes the service.
///   - search: Searches entities with filters.
///   - create: Creates new entities.
///   - update: Updates existing entities.
///   - delete: Deletes entities.
///
/// States:
///   - initial: Initial state.
///   - loading: Operation in progress.
///   - loaded: Data loaded successfully.
///   - persisted: Data persisted (created/updated/deleted).
///   - error: Operation failed.

import 'dart:async';
import 'package:digit_crud_bloc/models/global_search_params.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../service/crud_service.dart';

part 'crud_bloc.freezed.dart';

typedef CrudEmitter = Emitter<CrudState>;

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  final RegistrationService service;

  CrudBloc({required this.service}) : super(const CrudState.initial()) {
    on<CrudEventInitialize>(_onInitialize);
    on<CrudEventSearch>(_onSearch);
    on<CrudEventCreate>(_onCreate);
    on<CrudEventUpdate>(_onUpdate);
    on<CrudEventDelete>(_onDelete);
  }

  FutureOr<void> _onInitialize(
    CrudEventInitialize event,
    CrudEmitter emit,
  ) async {
    service.init();
    emit(const CrudState.initial());
  }

  FutureOr<void> _onSearch(
    CrudEventSearch event,
    CrudEmitter emit,
  ) async {
    emit(const CrudState.loading());
    if (event.searchParams.filters.isEmpty) {
      emit(const CrudState.error('Search failed: No filters provided.'));
      return;
    }
    try {
      final (results, totalCount) = await service.searchHouseholds(query: event.searchParams);
      emit(CrudState.loaded(
        results: results,
        totalCount: totalCount > -1 ? totalCount : null,
      ));
    } catch (e) {
      emit(CrudState.error('Search failed: ${e.toString()}'));
    }
  }

  FutureOr<void> _onCreate(
    CrudEventCreate event,
    CrudEmitter emit,
  ) async {
    emit(const CrudState.loading());
    try {
      await service.registerEntities(event.entities);
      emit(CrudState.persisted(event.entities));
    } catch (e) {
      emit(CrudState.error('Create failed: ${e.toString()}'));
    }
  }

  FutureOr<void> _onUpdate(
    CrudEventUpdate event,
    CrudEmitter emit,
  ) async {
    emit(const CrudState.loading());
    try {
      await service.updateEntities(event.entities);
      emit(CrudState.persisted(event.entities));
    } catch (e) {
      emit(CrudState.error('Update failed: ${e.toString()}'));
    }
  }

  FutureOr<void> _onDelete(
    CrudEventDelete event,
    CrudEmitter emit,
  ) async {
    emit(const CrudState.loading());
    try {
      await service.deleteEntities(event.entities);
      emit(CrudState.persisted(event.entities));
    } catch (e) {
      emit(CrudState.error('Delete failed: ${e.toString()}'));
    }
  }
}

@freezed
class CrudEvent with _$CrudEvent {
  const factory CrudEvent.initialize() = CrudEventInitialize;
  const factory CrudEvent.search(GlobalSearchParameters searchParams) = CrudEventSearch;
  const factory CrudEvent.create({required List<EntityModel> entities}) = CrudEventCreate;
  const factory CrudEvent.update({required List<EntityModel> entities}) = CrudEventUpdate;
  const factory CrudEvent.delete({required List<EntityModel> entities}) = CrudEventDelete;
}

@freezed
class CrudState with _$CrudState {
  const factory CrudState.initial() = CrudStateInitial;
  const factory CrudState.loading() = CrudStateLoading;
  const factory CrudState.loaded({required Map<String, List<EntityModel>> results, int? totalCount}) = CrudStateLoaded;
  const factory CrudState.persisted(List<EntityModel> entities) = CrudStatePersisted;
  const factory CrudState.error(String message) = CrudStateError;
}
