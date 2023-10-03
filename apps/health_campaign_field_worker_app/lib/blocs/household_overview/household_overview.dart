// GENERATED using mason_cli
import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart';

import '../../models/data_model.dart';
import '../../models/entities/adverse_event.dart';
import '../../utils/typedefs.dart';
import '../search_households/search_households.dart';

part 'household_overview.freezed.dart';

typedef HouseholdOverviewEmitter = Emitter<HouseholdOverviewState>;

class HouseholdOverviewBloc
    extends Bloc<HouseholdOverviewEvent, HouseholdOverviewState> {
  final IndividualDataRepository individualRepository;
  final HouseholdDataRepository householdRepository;
  final HouseholdMemberDataRepository householdMemberRepository;
  final ProjectBeneficiaryDataRepository projectBeneficiaryRepository;
  final TaskDataRepository taskDataRepository;
  final AdverseEventDataRepository adverseEventDataRepository;

  HouseholdOverviewBloc(
    super.initialState, {
    required this.projectBeneficiaryRepository,
    required this.householdRepository,
    required this.individualRepository,
    required this.householdMemberRepository,
    required this.taskDataRepository,
    required this.adverseEventDataRepository,
  }) {
    on(_handleDeleteHousehold);
    on(_handleDeleteIndividual);
    on(_handleSetAsHead);
    on(_handleReloadMember);
    on(_selectedIndividual);
    on(_updateFutureTask);
  }

  FutureOr<void> _selectedIndividual(
    HouseholdOverviewSelectIndividualEvent event,
    Emitter<HouseholdOverviewState> emit,
  ) async {
    emit(state.copyWith(selectedIndividual: event.individualModel));
  }

  FutureOr<void> _handleReloadMember(
    HouseholdOverviewReloadEvent event,
    Emitter<HouseholdOverviewState> emit,
  ) async {
    emit(state.copyWith(loading: true));
    final members = await householdMemberRepository.search(
      HouseholdMemberSearchModel(
        householdClientReferenceId:
            state.householdMemberWrapper.household.clientReferenceId,
      ),
    );

    final groupedHouseholds = members.groupListsBy(
      (element) => element.householdClientReferenceId,
    );

    final householdId =
        state.householdMemberWrapper.household.clientReferenceId;

    if (!groupedHouseholds.containsKey(householdId)) {
      emit(state.copyWith(loading: false));

      return;
    }

    final householdMemberList = groupedHouseholds[householdId]!;

    final individualIds = householdMemberList
        .map((e) => e.individualClientReferenceId)
        .whereNotNull()
        .toList();

    final households = await householdRepository.search(
      HouseholdSearchModel(clientReferenceId: [householdId]),
    );

    if (households.isEmpty) {
      emit(state.copyWith(loading: false));

      return;
    }

    final resultHousehold = households.first;
    final individuals = await individualRepository.search(
      IndividualSearchModel(clientReferenceId: individualIds),
    );

    final head = individuals.firstWhereOrNull(
      (i) =>
          i.clientReferenceId ==
          householdMemberList
              .firstWhereOrNull((h) => h.isHeadOfHousehold)
              ?.individualClientReferenceId,
    );

    if (head == null) {
      emit(state.copyWith(loading: false));

      return;
    }

    final projectBeneficiaries = await projectBeneficiaryRepository.search(
      ProjectBeneficiarySearchModel(
        beneficiaryClientReferenceId:
            event.projectBeneficiaryType == BeneficiaryType.individual
                ? individualIds
                : [resultHousehold.clientReferenceId],
        projectId: event.projectId,

        // [TODO] Need to pass as a  based on Beneficiary Type
      ),
    );

    if (projectBeneficiaries.isEmpty) {
      emit(state.copyWith(loading: false));

      return;
    }

    final tasks = await taskDataRepository.search(TaskSearchModel(
      projectBeneficiaryClientReferenceId:
          projectBeneficiaries.map((e) => e.clientReferenceId).toList(),
    ));

    final adverseEvents =
        await adverseEventDataRepository.search(AdverseEventSearchModel(
      taskClientReferenceId:
          tasks.map((e) => e.clientReferenceId).whereNotNull().toList(),
    ));

    emit(
      state.copyWith(
        householdMemberWrapper: HouseholdMemberWrapper(
          household: resultHousehold,
          headOfHousehold: head,
          members: individuals,
          tasks: tasks.isEmpty ? null : tasks,
          projectBeneficiaries: projectBeneficiaries,
          adverseEvents: adverseEvents,
        ),
        loading: false,
      ),
    );
  }

  FutureOr<void> _handleDeleteHousehold(
    HouseholdOverviewDeleteHouseholdEvent event,
    HouseholdOverviewEmitter emit,
  ) async {
    await householdRepository.delete(
      event.householdModel.copyWith(
        rowVersion: event.householdModel.rowVersion,
      ),
    );
    for (final i in event.members) {
      await individualRepository.delete(i);
      final householdMember =
          await householdMemberRepository.search(HouseholdMemberSearchModel(
        householdClientReferenceId: event.householdModel.clientReferenceId,
        individualClientReferenceId: i.clientReferenceId,
      ));

      for (final j in householdMember) {
        await householdMemberRepository.delete(
          j.copyWith(
            rowVersion: j.rowVersion,
          ),
        );
      }
    }

    await projectBeneficiaryRepository.delete(
      event.projectBeneficiaryModel.copyWith(
        rowVersion: event.projectBeneficiaryModel.rowVersion,
      ),
    );
  }

  FutureOr<void> _handleDeleteIndividual(
    HouseholdOverviewDeleteIndividualEvent event,
    HouseholdOverviewEmitter emit,
  ) async {
    await individualRepository.delete(event.individualModel);
    final householdMembers = await householdMemberRepository.search(
      HouseholdMemberSearchModel(
        individualClientReferenceId: event.individualModel.clientReferenceId,
        householdClientReferenceId: event.householdModel.clientReferenceId,
      ),
    );

    for (final i in householdMembers) {
      await householdMemberRepository.delete(
        i.copyWith(
          rowVersion: i.rowVersion,
          clientAuditDetails: (i.clientAuditDetails?.createdBy != null &&
                  i.clientAuditDetails?.createdTime != null)
              ? ClientAuditDetails(
                  createdBy: i.clientAuditDetails!.createdBy,
                  createdTime: i.clientAuditDetails!.createdTime,
                  lastModifiedBy: i.clientAuditDetails!.lastModifiedBy,
                  lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
                )
              : null,
        ),
      );
    }

    add(HouseholdOverviewReloadEvent(
      projectId: event.projectId,
      projectBeneficiaryType: event.projectBeneficiaryType,
    ));
  }

  FutureOr<void> _handleSetAsHead(
    HouseholdOverviewSetAsHeadEvent event,
    HouseholdOverviewEmitter emit,
  ) async {
    final members = await householdMemberRepository.search(
      HouseholdMemberSearchModel(
        householdClientReferenceId: event.householdModel.clientReferenceId,
      ),
    );

    final updatedMembers = members.map((i) {
      final individualId = event.individualModel.clientReferenceId;
      final memberId = i.individualClientReferenceId;

      if (individualId == memberId) {
        if (!i.isHeadOfHousehold) {
          return i.copyWith(
            isHeadOfHousehold: true,
            rowVersion: i.rowVersion,
          );
        }
      } else {
        if (i.isHeadOfHousehold) {
          return i.copyWith(
            isHeadOfHousehold: false,
            rowVersion: i.rowVersion,
          );
        }
      }

      return i;
    }).toList();

    for (final element in updatedMembers) {
      await householdMemberRepository.update(
        element.copyWith(
          rowVersion: element.rowVersion,
          clientAuditDetails: (element.clientAuditDetails?.createdBy != null &&
                  element.clientAuditDetails?.createdTime != null)
              ? ClientAuditDetails(
                  createdBy: element.clientAuditDetails!.createdBy,
                  createdTime: element.clientAuditDetails!.createdTime,
                  lastModifiedBy: element.clientAuditDetails?.lastModifiedBy,
                  lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
                )
              : null,
        ),
      );
    }

    add(HouseholdOverviewReloadEvent(
      projectId: event.projectId,
      projectBeneficiaryType: event.projectBeneficiaryType,
    ));
  }

  FutureOr<void> _updateFutureTask(
    HouseholdOverviewUpdateFutureTaskEvent event,
    HouseholdOverviewEmitter emit,
  ) async {
    // Set the loading state to true to indicate that an operation is in progress.
    emit(state.copyWith(loading: true));

    final List<TaskModel> filteredFutureTask = event.task.where((element) {
      return element.additionalFields?.fields
              .firstWhereOrNull((element) => element.key == 'DeliveryStrategy')
              ?.value ==
          'INDIRECT';
    }).toList();

    emit(
      state.copyWith(filteredFutureTask: filteredFutureTask, loading: false),
    );
  }
}

@freezed
class HouseholdOverviewEvent with _$HouseholdOverviewEvent {
  const factory HouseholdOverviewEvent.deleteHousehold({
    required String projectId,
    required HouseholdModel householdModel,
    required List<IndividualModel> members,
    required ProjectBeneficiaryModel projectBeneficiaryModel,
    required BeneficiaryType projectBeneficiaryType,
  }) = HouseholdOverviewDeleteHouseholdEvent;

  const factory HouseholdOverviewEvent.deleteIndividual({
    required String projectId,
    required HouseholdModel householdModel,
    required IndividualModel individualModel,
    required BeneficiaryType projectBeneficiaryType,
  }) = HouseholdOverviewDeleteIndividualEvent;

  const factory HouseholdOverviewEvent.setAsHead({
    required String projectId,
    required IndividualModel individualModel,
    required HouseholdModel householdModel,
    required BeneficiaryType projectBeneficiaryType,
  }) = HouseholdOverviewSetAsHeadEvent;

  const factory HouseholdOverviewEvent.selectedIndividual({
    required IndividualModel individualModel,
  }) = HouseholdOverviewSelectIndividualEvent;

  const factory HouseholdOverviewEvent.reload({
    required String projectId,
    required BeneficiaryType projectBeneficiaryType,
  }) = HouseholdOverviewReloadEvent;

  const factory HouseholdOverviewEvent.updateFutureTask(
    List<TaskModel> task,
  ) = HouseholdOverviewUpdateFutureTaskEvent;
}

@freezed
class HouseholdOverviewState with _$HouseholdOverviewState {
  const factory HouseholdOverviewState({
    @Default(false) bool loading,
    required HouseholdMemberWrapper householdMemberWrapper,
    IndividualModel? selectedIndividual,
    List<TaskModel>? filteredFutureTask,
  }) = _HouseholdOverviewState;
}
