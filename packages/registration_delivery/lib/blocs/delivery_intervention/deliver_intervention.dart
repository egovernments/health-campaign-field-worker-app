import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';

import '../../models/entities/additional_fields_type.dart';
import '../../models/entities/deliver_strategy_type.dart';
import '../../models/entities/status.dart';
import '../../models/entities/task.dart';

part 'deliver_intervention.freezed.dart';

typedef DeliveryInterventionEmitter = Emitter<DeliverInterventionState>;

class DeliverInterventionBloc
    extends Bloc<DeliverInterventionEvent, DeliverInterventionState> {
  final DataRepository<TaskModel, TaskSearchModel> taskRepository;

  DeliverInterventionBloc(
    super.initialState, {
    required this.taskRepository,
  }) {
    on(_handleSubmit);
    on(_handleSearch);
    on(_handleFutureDeliveries);
    on(_handleActiveCycleDose);
  }

  // Event handler for submitting a task
  FutureOr<void> _handleSubmit(
    DeliverInterventionSubmitEvent event,
    DeliveryInterventionEmitter emit,
  ) async {
    // Update loading state to indicate an operation is in progress
    emit(state.copyWith(loading: true));
    try {
      if (event.isEditing) {
        if (!event.navigateToSummary) {
          await taskRepository.update(event.task.copyWith(
            clientAuditDetails: (event.task.clientAuditDetails?.createdBy !=
                        null &&
                    event.task.clientAuditDetails?.createdTime != null)
                ? ClientAuditDetails(
                    createdBy: event.task.clientAuditDetails!.createdBy,
                    createdTime: event.task.clientAuditDetails!.createdTime,
                    lastModifiedBy: event.task.auditDetails?.lastModifiedBy ??
                        event.task.clientAuditDetails!.createdBy,
                    lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
                  )
                : null,
          ));
        }

        emit(state.copyWith(
            oldTask: event.task,
            householdMemberWrapper: event.householdMemberWrapper));
        // Update an existing task
      } else {
        // Create a new task
        final code = event.boundaryModel.code;
        final name = event.boundaryModel.name;

        final localityModel = code == null || name == null
            ? null
            : LocalityModel(code: code, name: name);

        if (!event.navigateToSummary) {
          await taskRepository.create(event.task.copyWith(
            address: event.task.address?.copyWith(
              locality: localityModel,
            ),
          ));
        }

        emit(state.copyWith(
            oldTask: event.task,
            householdMemberWrapper: event.householdMemberWrapper));
      }
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  // Search for tasks and process the results
  FutureOr<void> _handleSearch(
    DeliverInterventionSearchEvent event,
    DeliveryInterventionEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      final List<TaskModel> tasks = await taskRepository.search(
        event.taskSearch,
      );

      final List<TaskModel> futureTask = tasks
          .where((element) => element.additionalFields != null
              ? element.additionalFields!.fields
                          .firstWhereOrNull(
                            (a) =>
                                a.key ==
                                AdditionalFieldsType.deliveryStrategy.toValue(),
                          )
                          ?.value ==
                      DeliverStrategyType.indirect.toValue() &&
                  element.status == Status.delivered.toValue()
              : false)
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
    DeliveryInterventionEmitter emit,
  ) async {
    // Calculate the current running cycle based on start and end dates
    final currentRunningCycle = (event.projectType.cycles?.firstWhere(
          (e) =>
              (e.startDate) < DateTime.now().millisecondsSinceEpoch &&
              (e.endDate) > DateTime.now().millisecondsSinceEpoch,
        ))?.id ??
        0;

    // If the current running cycle is different, update state accordingly
    if (currentRunningCycle != 0) {
      if (event.lastCycle == currentRunningCycle) {
        // Calculate the length of deliveries in the current cycle
        final deliveryLength = event.projectType.cycles!
                .firstWhere((c) => c.id == event.lastCycle)
                .deliveries
                ?.length ??
            0;
        final isNotLastDose = event.lastDose < deliveryLength;
        // Get a list of past cycles
        final pastCycles = event.projectType.cycles
            ?.where(
              (p) => p.id != event.lastCycle && p.id < event.lastCycle,
            )
            .toList();

        // If it's not the last dose, update state accordingly
        if (isNotLastDose) {
          emit(state.copyWith(
            cycle: event.lastCycle,
            dose: event.lastDose + 1,
            pastCycles: pastCycles,
            hasCycleArrived: true,
          ));
        }
        // If it's the last dose, move to the next cycle
        else {
          final pastCycles = event.projectType.cycles
              ?.where(
                (p) => p.id <= event.lastCycle,
              )
              .toList();

          emit(state.copyWith(
            cycle: event.lastCycle,
            hasCycleArrived: false,
            dose: event.lastDose,
            pastCycles: pastCycles,
          ));
        }
      } else {
        final pastCycles = event.projectType.cycles
            ?.where(
              (p) => p.id != currentRunningCycle && p.id < currentRunningCycle,
            )
            .toList();
        emit(state.copyWith(
          cycle: currentRunningCycle,
          dose: 1,
          pastCycles: pastCycles,
          hasCycleArrived: true,
        ));
      }
    } else {
      final pastCycles = event.projectType.cycles
          ?.where(
            (p) => p.id != currentRunningCycle,
          )
          .toList();
      emit(state.copyWith(
        cycle: event.lastCycle,
        dose: 1,
        hasCycleArrived: false,
        pastCycles: pastCycles,
      ));
    }
  }

  // Event handler for selecting future deliveries
  FutureOr<void> _handleFutureDeliveries(
    DeliverInterventionCycleFutureDoseSelectionEvent event,
    DeliveryInterventionEmitter emit,
  ) async {
    // Set the loading state to true to indicate that an operation is in progress.
    emit(state.copyWith(loading: true));

    try {
      int currentDose = event.dose;
      ProjectCycle? currentCycle = event.cycle;

      final deliveriesList = currentCycle.deliveries;

      if (deliveriesList != null) {
        List<ProjectCycleDelivery> futureDeliveries = [];
        // Iterate over deliveries starting from the current dose
        for (int index = currentDose; index < deliveriesList.length; index++) {
          var delivery = deliveriesList[index];

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
  const factory DeliverInterventionEvent.handleSubmit({
    required TaskModel task,
    required bool isEditing,
    required BoundaryModel boundaryModel,
    @Default(false) bool navigateToSummary,
    HouseholdMemberWrapper? householdMemberWrapper,
  }) = DeliverInterventionSubmitEvent;

  const factory DeliverInterventionEvent.handleSearch({
    required TaskSearchModel taskSearch,
  }) = DeliverInterventionSearchEvent;

  const factory DeliverInterventionEvent.selectFutureCycleDose({
    required int dose,
    required ProjectCycle cycle,
    required IndividualModel? individualModel,
  }) = DeliverInterventionCycleFutureDoseSelectionEvent;

  const factory DeliverInterventionEvent.setActiveCycleDose({
    required int lastDose,
    required int lastCycle,
    required IndividualModel? individualModel,
    required ProjectTypeModel projectType,
  }) = DeliverInterventionActiveCycleDoseSelectionEvent;
}

@freezed
class DeliverInterventionState with _$DeliverInterventionState {
  const factory DeliverInterventionState({
    @Default(false) bool loading,
    @Default(false) bool isEditing,
    @Default(1) int cycle,
    @Default(1) int dose,
    List<ProjectCycle>? pastCycles,
    @Default(true) bool hasCycleArrived,
    @Default(false) bool isLastDoseOfCycle,
    HouseholdMemberWrapper? householdMemberWrapper,
    List<TaskModel>? tasks,
    List<ProjectCycleDelivery>? futureDeliveries,
    List<TaskModel>? futureTask,
    TaskModel? oldTask,
  }) = _DeliverInterventionState;
}
