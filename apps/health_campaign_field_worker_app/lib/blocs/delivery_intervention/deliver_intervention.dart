import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/data_repository.dart';
import '../../models/data_model.dart';
import '../../models/entities/additional_fields_type.dart';
import '../../models/entities/deliver_strategy_type.dart';
import '../../models/project_type/project_type_model.dart';

part 'deliver_intervention.freezed.dart';

// Define a custom type for emitting state changes
typedef BeneficiaryRegistrationEmitter = Emitter<DeliverInterventionState>;

// Define a Bloc class for managing state and events
class DeliverInterventionBloc
    extends Bloc<DeliverInterventionEvent, DeliverInterventionState> {
  final DataRepository<TaskModel, TaskSearchModel> taskRepository;

  // Constructor for the DeliverInterventionBloc
  DeliverInterventionBloc(
    super.initialState, {
    required this.taskRepository,
  }) {
    // Define event handlers for different events
    on(_handleSubmit);
    on(_handleSearch);
    on(_handleFutureDeliveries);
    on(_handleActiveCycleDose);
  }

  // Event handler for submitting a task
  FutureOr<void> _handleSubmit(
    DeliverInterventionSubmitEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    // Update loading state to indicate an operation is in progress
    emit(state.copyWith(loading: true));

    try {
      if (event.isEditing) {
        // Update an existing task
        await taskRepository.update(event.task.copyWith(
          // Check if client audit details are available
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
        // Create a new task
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
        // Update the state with the old task
        emit(state.copyWith(
          oldTask: event.task,
        ));
      }
    } catch (error) {
      // Rethrow any errors that occur during processing.
      rethrow;
    } finally {
      // Set the loading state to false after the operation is complete.
      emit(state.copyWith(loading: false));
    }
  }

  // Event handler for searching tasks
  FutureOr<void> _handleSearch(
    DeliverInterventionSearchEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    // Update loading state
    emit(state.copyWith(loading: true));
    try {
      final List<TaskModel> tasks = await taskRepository.search(
        event.taskSearch,
      );
      // Search for tasks and process the results

      final List<TaskModel> futureTask = tasks
          .where((element) =>
              element.additionalFields?.fields
                      .firstWhere(
                        (a) =>
                            a.key ==
                            AdditionalFieldsType.deliveryStrategy.toValue(),
                      )
                      .value ==
                  DeliverStrategyType.indirect.toValue() &&
              element.status == Status.partiallyDelivered.toValue())
          .toList();

      if (tasks.isNotEmpty) {
        emit(state.copyWith(tasks: tasks, futureTask: futureTask));
      } else {
        emit(state.copyWith(tasks: null));
      }
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  // Event handler for handling active cycle and dose selection
  FutureOr<void> _handleActiveCycleDose(
    DeliverInterventionActiveCycleDoseSelectionEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    // Calculate the current running cycle based on start and end dates
    final currentRunningCycle = (event.projectType.cycles?.firstWhere((e) =>
            (e.startDate ?? 1696032000000) <=
                DateTime.now().millisecondsSinceEpoch &&
            (e.endDate ?? 1696032000000) >=
                DateTime.now().millisecondsSinceEpoch))!
        .id;

    if (event.lastCycle == currentRunningCycle) {
      // Calculate the length of deliveries in the current cycle
      final deliveryLength = event.projectType.cycles!
              .firstWhere((c) => c.id == event.lastCycle)
              .deliveries
              ?.length ??
          0;

      // Check if the current dose is not the last dose in the cycle
      final isNotLastDose = event.lastDose < deliveryLength;

      // Get a list of past cycles
      final pastCycles = event.projectType.cycles
          ?.where(
            (p) => p.id != event.lastCycle && p.id < event.lastCycle,
          )
          .toList();

      // Sort the past cycles in descending order by ID
      pastCycles?.sort((a, b) => b.id.compareTo(a.id));

      if (isNotLastDose) {
        // If it's not the last dose, update state accordingly
        emit(state.copyWith(
          cycle: event.lastCycle,
          dose: event.lastDose + 1,
          pastCycles: pastCycles,
          hasCycleArrived: true,
        ));
      } else {
        // If it's the last dose, move to the next cycle
        emit(state.copyWith(
          cycle: event.lastCycle + 1,
          hasCycleArrived: false,
          dose: event.lastDose,
          pastCycles: pastCycles,
        ));
      }
    } else {
      // If the current running cycle is different, update state accordingly
      final pastCycles = event.projectType.cycles
          ?.where(
            (p) => p.id != currentRunningCycle && p.id < currentRunningCycle,
          )
          .toList();

      // Sort the past cycles in descending order by ID
      pastCycles?.sort((a, b) => b.id.compareTo(a.id));

      emit(state.copyWith(
        cycle: currentRunningCycle,
        dose: 1,
        pastCycles: pastCycles,
        hasCycleArrived: true,
      ));
    }
  }

  // Event handler for selecting future deliveries
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

        // Iterate over deliveries starting from the current dose
        for (int index = currentDose;
            index < currentCycle.deliveries!.length;
            index++) {
          var delivery = currentCycle.deliveries![index];

          String? deliveryStrategy = delivery.deliveryStrategy;

          // Check if the delivery strategy is indirect
          if (deliveryStrategy == DeliverStrategyType.indirect.toValue()) {
            futureDeliveries.add(delivery);
          } else if (deliveryStrategy == DeliverStrategyType.direct.toValue()) {
            // If it's direct, stop adding deliveries
            break;
          }
        }

        // Update the state with the list of future deliveries
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
    List<Cycle>? pastCycles,
    @Default(true) bool hasCycleArrived,
    @Default(false) bool isLastDoseOfCycle,
    List<TaskModel>? tasks,
    List<DeliveryModel>? futureDeliveries,
    List<TaskModel>? futureTask,
    TaskModel? oldTask,
  }) = _DeliverInterventionState;
}
