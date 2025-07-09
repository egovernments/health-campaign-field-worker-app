// GENERATED using mason_cli
import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/utils/typedefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registration_delivery/models/entities/household.dart';
import 'package:registration_delivery/models/entities/household_member.dart';
import 'package:registration_delivery/models/entities/project_beneficiary.dart';
import 'package:registration_delivery/models/entities/task.dart';
import 'package:registration_delivery/utils/typedefs.dart';

part 'entity_create.freezed.dart';

typedef EntityCreateEmitter = Emitter<EntityCreateState>;

class EntityCreateBloc extends Bloc<EntityCreateEvent, EntityCreateState> {
  final IndividualDataRepository individualRepository;
  final HouseholdDataRepository householdRepository;
  final HouseholdMemberDataRepository householdMemberRepository;
  final ProjectBeneficiaryDataRepository projectBeneficiaryRepository;
  final TaskDataRepository taskDataRepository;

  EntityCreateBloc({
    required this.individualRepository,
    required this.householdRepository,
    required this.householdMemberRepository,
    required this.projectBeneficiaryRepository,
    required this.taskDataRepository,
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

      emit(EntityCreateState.persisted(entities: event.entities.cast<EntityModel>()));
    } catch (e) {
      emit(EntityCreateState.error(e.toString()));
    }
  }


  // Now, getDataRepositoryFromModel does not require BuildContext
  DataRepository getDataRepositoryFromModel(EntityModel entity) {
    if (entity is HouseholdModel) {
      return householdRepository;
    } else if (entity is HouseholdMemberModel) {
      return householdMemberRepository;
    } else if (entity is IndividualModel) {
      return individualRepository;
    } else if (entity is ProjectBeneficiaryModel) {
      return projectBeneficiaryRepository;
    } else if (entity is TaskModel) {
      return taskDataRepository;
    } else {
      throw Exception('No repository found for entity type: ${entity.runtimeType}');
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
  const factory EntityCreateState.error(String message) = EntityCreateErrorState;
}

class InvalidRegistrationStateException implements Exception {
  final String? message;

  const InvalidRegistrationStateException([this.message]);
}
