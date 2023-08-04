import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/data_repository.dart';
import '../../models/data_model.dart';

part 'adverse_events.freezed.dart';

typedef BeneficiaryRegistrationEmitter = Emitter<AdverseEventsState>;

class AdverseEventsBloc extends Bloc<AdverseEventsEvent, AdverseEventsState> {
  final DataRepository<TaskModel, TaskSearchModel> taskRepository;

  AdverseEventsBloc(
    super.initialState, {
    required this.taskRepository,
  }) {
    on(_handleSubmit);
    on(_handleSearch);
  }

  FutureOr<void> _handleSubmit(
    AdverseEventsSubmitEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      if (event.isEditing) {
        await taskRepository.update(event.task);
      } else {
        final code = event.boundaryModel.code;
        final name = event.boundaryModel.name;

        final localityModel = code == null || name == null
            ? null
            : LocalityModel(code: code, name: name);

        await taskRepository.create(event.task.copyWith(
          address: event.task.address?.copyWith(
            locality: localityModel,
          ),
        ));
      }
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  FutureOr<void> _handleSearch(
    AdverseEventsSearchEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      final List<TaskModel> tasks = await taskRepository.search(
        event.taskSearch,
      );
      if (tasks.isNotEmpty) {
        emit(state.copyWith(tasks: tasks));
      } else {
        emit(state.copyWith(tasks: null));
      }
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}

@freezed
class AdverseEventsEvent with _$AdverseEventsEvent {
  const factory AdverseEventsEvent.handleSubmit(
    TaskModel task,
    bool isEditing,
    BoundaryModel boundaryModel,
  ) = AdverseEventsSubmitEvent;

  const factory AdverseEventsEvent.handleSearch(
    TaskSearchModel taskSearch,
  ) = AdverseEventsSearchEvent;
}

@freezed
class AdverseEventsState with _$AdverseEventsState {
  const factory AdverseEventsState({
    @Default(false) bool loading,
    @Default(false) bool isEditing,
    List<TaskModel>? tasks,
  }) = _AdverseEventsState;
}
