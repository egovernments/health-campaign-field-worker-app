import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/data_repository.dart';
import '../../models/data_model.dart';
import '../../models/entities/delivery_strategy_type.dart';
import '../../models/project_type/project_type_model.dart';

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
    on(_handleSearch);
    on(_handleCycleDoseSelection);
    on(_handleFutureDeliveries);
    on(_handleActiveCycleDose);
  }

  FutureOr<void> _handleSubmit(
    DeliverInterventionSubmitEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      if (event.isEditing) {
        await taskRepository.update(event.task.copyWith(
          clientAuditDetails: (event.task.clientAuditDetails?.createdBy !=
                      null &&
                  event.task.clientAuditDetails?.createdTime != null)
              ? ClientAuditDetails(
                  createdBy: event.task.clientAuditDetails!.createdBy,
                  createdTime: event.task.clientAuditDetails!.createdTime,
                  lastModifiedBy: event.task.clientAuditDetails!.lastModifiedBy,
                  lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
                )
              : null,
        ));
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
    DeliverInterventionSearchEvent event,
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

  FutureOr<void> _handleCycleDoseSelection(
    DeliverInterventionCycleDoseSelectionEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      emit(state.copyWith(
        cycle: event.cycle,
        dose: event.dose,
        isLastDoseOfCycle: event.isLastDoseOfCycle,
      ));
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  FutureOr<void> _handleActiveCycleDose(
    DeliverInterventionActiveCycleDoseSelectionEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    final currentRunningCycle = (event.projectType.cycles?.indexWhere((e) =>
            DateTime.now().millisecondsSinceEpoch >=
                (e.startDate ?? 1695772800000) &&
            DateTime.now().millisecondsSinceEpoch <
                (e.endDate ?? 1695945600000)))! +
        1;
    if (event.lastCycle == currentRunningCycle) {
      final isNotLastDose = event.lastDose <
          event.projectType.cycles![event.lastCycle].deliveries!.length;
      if (isNotLastDose) {
        emit(state.copyWith(cycle: event.lastCycle, dose: event.lastDose + 1));
      }
    } else {
      emit(state.copyWith(cycle: currentRunningCycle ?? 1, dose: 1));
    }
  }

  FutureOr<void> _handleFutureDeliveries(
    DeliverInterventionCycleFutureDoseSelectionEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    // Set the loading state to true to indicate that an operation is in progress.
    emit(state.copyWith(loading: true));

    try {
      int currentDose = event.dose;
      Cycle? currentCycle = event.cycle;

      if (currentCycle.deliveries != null) {
        List<DeliveryModel> futureDeliveries = [];
        for (int index = currentDose;
            index < currentCycle.deliveries!.length;
            index++) {
          var delivery = currentCycle.deliveries![index];

          String? deliveryStrategy = delivery.deliveryStrategy;

          if (deliveryStrategy?.toLowerCase() ==
              DeliverStrategyType.indirect.name) {
            futureDeliveries.add(delivery);
          } else if (deliveryStrategy?.toLowerCase() ==
              DeliverStrategyType.direct.name) {
            break;
          }
        }

        emit(state.copyWith(futureDeliveries: futureDeliveries));
      }
    } catch (error) {
      // Rethrow any errors that occur during processing.
      rethrow;
    } finally {
      // Set the loading state to false after the operation is complete.
      emit(state.copyWith(loading: false));
    }
  }
}

@freezed
class DeliverInterventionEvent with _$DeliverInterventionEvent {
  const factory DeliverInterventionEvent.handleSubmit(
    TaskModel task,
    bool isEditing,
    BoundaryModel boundaryModel,
  ) = DeliverInterventionSubmitEvent;

  const factory DeliverInterventionEvent.handleSearch(
    TaskSearchModel taskSearch,
  ) = DeliverInterventionSearchEvent;

  // [TODO: Need to remove this event
  const factory DeliverInterventionEvent.selectCycleDose(
    int dose,
    int cycle,
    bool isLastDoseOfCycle,
  ) = DeliverInterventionCycleDoseSelectionEvent;

  const factory DeliverInterventionEvent.selectFutureCycleDose(
    int dose,
    Cycle cycle,
  ) = DeliverInterventionCycleFutureDoseSelectionEvent;

  const factory DeliverInterventionEvent.setActiveCycleDose(
    int lastDose,
    int lastCycle,
    ProjectType projectType,
  ) = DeliverInterventionActiveCycleDoseSelectionEvent;
}

@freezed
class DeliverInterventionState with _$DeliverInterventionState {
  const factory DeliverInterventionState({
    @Default(false) bool loading,
    @Default(false) bool isEditing,
    @Default(1) int cycle,
    @Default(1) int dose,
    @Default(false) bool isLastDoseOfCycle,
    List<TaskModel>? tasks,
    List<DeliveryModel>? futureDeliveries,
  }) = _DeliverInterventionState;
}
