// GENERATED using mason_cli
import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/data_model.dart';
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
  }

  // This function handles the selection of an individual in the household overview.
  FutureOr<void> _selectedIndividual(
    HouseholdOverviewSelectIndividualEvent event,
    Emitter<HouseholdOverviewState> emit,
  ) async {
    // Update the state with the selected individual.
    emit(state.copyWith(selectedIndividual: event.individualModel));
  }

  // This function handles reloading and updating the household overview state.
  FutureOr<void> _handleReloadMember(
    HouseholdOverviewReloadEvent event,
    Emitter<HouseholdOverviewState> emit,
  ) async {
    // Set the loading state to indicate that data is being loaded.
    emit(state.copyWith(loading: true));

    // Retrieve household members based on certain criteria.
    final members = await householdMemberRepository.search(
      HouseholdMemberSearchModel(
        householdClientReferenceId:
            state.householdMemberWrapper.household.clientReferenceId,
      ),
    );

    // Group household members by household ID.
    final groupedHouseholds = members.groupListsBy(
      (element) => element.householdClientReferenceId,
    );

    final householdId =
        state.householdMemberWrapper.household.clientReferenceId;

    // Check if the current household has any members.
    if (!groupedHouseholds.containsKey(householdId)) {
      // If there are no members, stop loading and return.
      emit(state.copyWith(loading: false));

      return;
    }

    // Retrieve the list of household members for the current household.
    final householdMemberList = groupedHouseholds[householdId]!;

    // Extract individual IDs from the household member list.
    final individualIds = householdMemberList
        .map((e) => e.individualClientReferenceId)
        .whereNotNull()
        .toList();

    // Search for households with the specified client reference ID.
    final households = await householdRepository.search(
      HouseholdSearchModel(clientReferenceId: [householdId]),
    );

    // Check if any households were found.
    if (households.isEmpty) {
      // If no households were found, stop loading and return.
      emit(state.copyWith(loading: false));

      return;
    }

    // Retrieve the result household (assuming there's only one).
    final resultHousehold = households.first;

    // Search for individuals based on their client reference IDs.
    final individuals = await individualRepository.search(
      IndividualSearchModel(clientReferenceId: individualIds),
    );

    // Find the head of the household.
    final head = individuals.firstWhereOrNull(
      (i) =>
          i.clientReferenceId ==
          householdMemberList
              .firstWhereOrNull((h) => h.isHeadOfHousehold)
              ?.individualClientReferenceId,
    );

    // Check if a head of household was found.
    if (head == null) {
      // If no head of household was found, stop loading and return.
      emit(state.copyWith(loading: false));

      return;
    }

    // Search for project beneficiaries based on specified criteria.
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

    // Check if any project beneficiaries were found.
    if (projectBeneficiaries.isEmpty) {
      // If no project beneficiaries were found, stop loading and return.
      emit(state.copyWith(loading: false));

      return;
    }

    // Search for tasks associated with project beneficiaries.
    final tasks = await taskDataRepository.search(TaskSearchModel(
      projectBeneficiaryClientReferenceId:
          projectBeneficiaries.map((e) => e.clientReferenceId).toList(),
    ));

    // Search for adverse events associated with tasks.
    final adverseEvents =
        await adverseEventDataRepository.search(AdverseEventSearchModel(
      taskClientReferenceId:
          tasks.map((e) => e.clientReferenceId).whereNotNull().toList(),
    ));

    // Update the state with the loaded data and stop loading.
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

  // This function handles the deletion of a household and its associated members and beneficiaries.
  FutureOr<void> _handleDeleteHousehold(
    HouseholdOverviewDeleteHouseholdEvent event,
    HouseholdOverviewEmitter emit,
  ) async {
    // Delete the household from the repository.
    await householdRepository.delete(
      event.householdModel.copyWith(
        rowVersion: event.householdModel.rowVersion,
      ),
    );

    // Iterate through individual members of the household.
    for (final i in event.members) {
      // Delete the individual from the repository.
      await individualRepository.delete(i);

      // Search for household members associated with the deleted individual.
      final householdMember =
          await householdMemberRepository.search(HouseholdMemberSearchModel(
        householdClientReferenceId: event.householdModel.clientReferenceId,
        individualClientReferenceId: i.clientReferenceId,
      ));

      // Delete the associated household members.
      for (final j in householdMember) {
        await householdMemberRepository.delete(
          j.copyWith(
            rowVersion: j.rowVersion,
          ),
        );
      }
    }

    // Delete the project beneficiary associated with the household.
    await projectBeneficiaryRepository.delete(
      event.projectBeneficiaryModel.copyWith(
        rowVersion: event.projectBeneficiaryModel.rowVersion,
      ),
    );
  }

  // This function handles the deletion of an individual from a household.
  FutureOr<void> _handleDeleteIndividual(
    HouseholdOverviewDeleteIndividualEvent event,
    HouseholdOverviewEmitter emit,
  ) async {
    // Delete the individual from the repository.
    await individualRepository.delete(event.individualModel);

    // Search for household members associated with the deleted individual.
    final householdMembers = await householdMemberRepository.search(
      HouseholdMemberSearchModel(
        individualClientReferenceId: event.individualModel.clientReferenceId,
        householdClientReferenceId: event.householdModel.clientReferenceId,
      ),
    );

    // Delete the associated household members.
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

    // Trigger a reload event to update the household overview.
    add(HouseholdOverviewReloadEvent(
      projectId: event.projectId,
      projectBeneficiaryType: event.projectBeneficiaryType,
    ));
  }

  // This function handles setting an individual as the head of a household.
  FutureOr<void> _handleSetAsHead(
    HouseholdOverviewSetAsHeadEvent event,
    HouseholdOverviewEmitter emit,
  ) async {
    // Retrieve household members based on certain criteria.
    final members = await householdMemberRepository.search(
      HouseholdMemberSearchModel(
        householdClientReferenceId: event.householdModel.clientReferenceId,
      ),
    );

    // Update the household members based on the given conditions.
    final updatedMembers = members.map((i) {
      final individualId = event.individualModel.clientReferenceId;
      final memberId = i.individualClientReferenceId;

      if (individualId == memberId) {
        // If the individual is not already the head, set them as the head.
        if (!i.isHeadOfHousehold) {
          return i.copyWith(
            isHeadOfHousehold: true,
            rowVersion: i.rowVersion,
          );
        }
      } else {
        // If another individual is currently the head, remove their head status.
        if (i.isHeadOfHousehold) {
          return i.copyWith(
            isHeadOfHousehold: false,
            rowVersion: i.rowVersion,
          );
        }
      }

      return i;
    }).toList();

    // Update the household members in the repository.
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

    // Trigger a reload event to update the household overview.
    add(HouseholdOverviewReloadEvent(
      projectId: event.projectId,
      projectBeneficiaryType: event.projectBeneficiaryType,
    ));
  }

// This function updates the state based on certain conditions and filters the tasks.
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
}

@freezed
class HouseholdOverviewState with _$HouseholdOverviewState {
  const factory HouseholdOverviewState({
    @Default(false) bool loading,
    required HouseholdMemberWrapper householdMemberWrapper,
    IndividualModel? selectedIndividual,
  }) = _HouseholdOverviewState;
}
