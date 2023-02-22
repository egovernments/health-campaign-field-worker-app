import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/data_repository.dart';
import '../../models/data_model.dart';
import '../../models/entities/task.dart';

part 'deliver_intervention.freezed.dart';

typedef BeneficiaryRegistrationEmitter = Emitter<DeliverInterventionState>;

class DeliverInterventionBloc
    extends Bloc<DeliverInterventionEvent, DeliverInterventionState> {
  final DataRepository<TaskModel, TaskSearchModel> taskRepository;

  DeliverInterventionBloc(
    super.initialState, {
    required this.taskRepository,
  }) {
    on(_handleSubmit);
    on(_handleUpdate);
    on(_handleSearch);
  }

  FutureOr<void> _handleSubmit(
    DeliverInterventionSubmitEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      await taskRepository.create(event.task);
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  FutureOr<void> _handleSearch(
    DeliverInterventionSearchEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      final List<TaskModel> tasks =
          await taskRepository.search(event.taskSearch);
      if (tasks.isNotEmpty) emit(state.copyWith(task: tasks.first));
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  FutureOr<void> _handleUpdate(
    DeliverInterventionUpdateEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      print(await taskRepository.update(event.task));
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}

@freezed
class DeliverInterventionEvent with _$DeliverInterventionEvent {
  const factory DeliverInterventionEvent.handleSubmit(
    TaskModel task,
  ) = DeliverInterventionSubmitEvent;

  const factory DeliverInterventionEvent.handleUpdate(
    TaskModel task,
  ) = DeliverInterventionUpdateEvent;

  const factory DeliverInterventionEvent.handleSearch(
    TaskSearchModel taskSearch,
  ) = DeliverInterventionSearchEvent;
}

@freezed
class DeliverInterventionState with _$DeliverInterventionState {
  const factory DeliverInterventionState({
    @Default(false) bool loading,
    @Default(false) bool isEditing,
    TaskModel? task,
  }) = _DeliverInterventionState;
}
