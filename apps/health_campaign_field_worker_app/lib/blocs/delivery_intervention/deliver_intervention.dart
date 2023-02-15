import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/data_repository.dart';
import '../../models/entities/task.dart';
import '../../models/entities/task_resource.dart';
import '../../utils/environment_config.dart';
import '../../utils/utils.dart';

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
  }

  FutureOr<void> _handleSubmit(
    DeliverInterventionSubmitEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      await taskRepository.update(TaskModel(
        clientReferenceId: event.task.clientReferenceId,
        tenantId: envConfig.variables.tenantId,
        rowVersion: 1,
        projectId: '',
        resources: [
          TaskResourceModel(
            clientReferenceId: event.taskResource.clientReferenceId,
            tenantId: envConfig.variables.tenantId,
            rowVersion: 1,
            productVariantId: event.taskResource.productVariantId,
          ),
        ],
        status: 'DELIVERED',
        createdDate: DateTime.now().millisecondsSinceEpoch,
        // projectBeneficiaryId: individual.clientReferenceId,
      ));
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
    TaskResourceModel taskResource,
    TaskModel task,
  ) = DeliverInterventionSubmitEvent;
}

@freezed
class DeliverInterventionState with _$DeliverInterventionState {
  const factory DeliverInterventionState({@Default(false) bool loading}) =
      _DeliverInterventionState;
}
