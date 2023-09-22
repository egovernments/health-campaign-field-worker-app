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
      emit(state.copyWith(cycle: event.cycle, dose: event.dose));
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  FutureOr<void> _handleFutureDeliveries(
    DeliverInterventionCycleFutureDoseSelectionEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      List<Map<String, dynamic>> futureDeliveries = [];
      int currentDose = event.dose + 1;
      int currentDoses = event.dose;

      print("current dose for bloc $currentDoses");
      Cycle? currentCycle = event.cycle;

      if (currentCycle.deliveries != null) {
        for (int index = 0; index < currentCycle.deliveries!.length; index++) {
          var delivery = currentCycle.deliveries![index];
          String? deliveryStrategy = delivery.deliveryStrategy;

          if (index == currentDose) {
            if (deliveryStrategy?.toLowerCase() ==
                DeliverStrategyType.indirect.name.toLowerCase()) {
              final List<Map<String, dynamic>> productVariantsList =
                  delivery.productVariants?.map((productVariant) {
                        return {
                          'productVariantId': productVariant.productVariantId,
                          'quantity': productVariant.quantity,
                        };
                      }).toList() ??
                      [];

              futureDeliveries.addAll(productVariantsList);
            } else if (deliveryStrategy?.toLowerCase() ==
                DeliverStrategyType.direct.name.toLowerCase()) {
              break;
            }
          }
        }
      }

      emit(state.copyWith(futureDeliveries: futureDeliveries));
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
  // FutureOr<void> _handleFutureDeliveries(
  //   DeliverInterventionCycleFutureDoseSelectionEvent event,
  //   BeneficiaryRegistrationEmitter emit,
  // ) async {
  //   emit(state.copyWith(loading: true));
  //   try {
  //     int currentDose = event.dose + 1;
  //     Cycle? currentCycle = event.cycle;

  //     if (currentCycle.deliveries != null) {
  //       List<Map<String, dynamic>> futureDeliveries = [];

  //       for (int index = currentDose;
  //           index < currentCycle.deliveries!.length;
  //           index++) {
  //         var delivery = currentCycle.deliveries![index];
  //         String? deliveryStrategy = delivery.deliveryStrategy;

  //         if (deliveryStrategy == DeliverStrategyType.indirect.name) {
  //           for (var productVariant in delivery.productVariants ?? []) {
  //             futureDeliveries.add({
  //               'productVariantId': productVariant.productVariantId,
  //               'quantity': productVariant.quantity,
  //             });
  //           }
  //         } else if (deliveryStrategy == DeliverStrategyType.direct.name) {
  //           break;
  //         }
  //       }

  //       print("futureDeliveries JSON: $futureDeliveries");
  //       emit(state.copyWith(futureDeliveries: futureDeliveries));
  //     }
  //   } catch (error) {
  //     rethrow;
  //   } finally {
  //     emit(state.copyWith(loading: false));
  //   }
  // }
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

  const factory DeliverInterventionEvent.selectCycleDose(
    int dose,
    int cycle,
  ) = DeliverInterventionCycleDoseSelectionEvent;

  const factory DeliverInterventionEvent.selectFutureCycleDose(
    int dose,
    Cycle cycle,
  ) = DeliverInterventionCycleFutureDoseSelectionEvent;
}

@freezed
class DeliverInterventionState with _$DeliverInterventionState {
  const factory DeliverInterventionState({
    @Default(false) bool loading,
    @Default(false) bool isEditing,
    @Default(0) int cycle,
    @Default(0) int dose,
    List<TaskModel>? tasks,
    List<Map<String, dynamic>>? futureDeliveries,
  }) = _DeliverInterventionState;
}
