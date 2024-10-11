import 'dart:async';

import 'package:collection/collection.dart';

import '../../models/data_model.dart';
import 'search_households.dart';

class SearchBySchoolBloc extends SearchHouseholdsBloc {
  SearchBySchoolBloc({
    required super.userUid,
    required super.projectId,
    required super.individual,
    required super.householdMember,
    required super.household,
    required super.projectBeneficiary,
    required super.taskDataRepository,
    required super.beneficiaryType,
    required super.sideEffectDataRepository,
    required super.addressRepository,
    required super.referralDataRepository,
    required super.customHouseHoldRepo,
  }) {
    on<SearchHouseholdsSearchBySchoolNameEvent>(
      _handleSearchBySchool,
      transformer: debounce<SearchHouseholdsSearchBySchoolNameEvent>(
        const Duration(milliseconds: 100),
      ),
    );
  }

  FutureOr<void> _handleSearchBySchool(
    SearchHouseholdsSearchBySchoolNameEvent event,
    SearchHouseholdsEmitter emit,
  ) async {
    List<HouseholdModel> householdList = [];
    List<IndividualModel> individualsList = [];
    List<HouseholdMemberModel> householdMembersList = [];
    List<ProjectBeneficiaryModel> projectBeneficiariesList = [];
    List<TaskModel> taskList = [];
    List<SideEffectModel> sideEffectsList = [];
    List<ReferralModel> referralsList = [];

    emit(state.copyWith(loading: true));

    var school = await customHouseHoldRepo?.customSchoolSearch(
        event.searchText, event.boundaryCode);
    print('school ${school!}');

    if (school.isNotEmpty) {
      householdList = await household.search(HouseholdSearchModel(
        clientReferenceId: [school.firstOrNull!.clientReferenceId],
      ));
    }

    if (householdList.isNotEmpty) {
      final householdClientReferenceIds =
          householdList.map((e) => e.clientReferenceId).toList();
      householdMembersList = await fetchHouseholdMembersBulk(
        null,
        householdClientReferenceIds,
      );
      final List<String> individualClientReferenceIds = householdMembersList
          .map((e) => e.individualClientReferenceId.toString())
          .toList();
      individualsList = await individual.search(
        IndividualSearchModel(clientReferenceId: individualClientReferenceIds),
      );
      projectBeneficiariesList = await fetchProjectBeneficiary(
        beneficiaryType != BeneficiaryType.individual
            ? householdClientReferenceIds
            : individualClientReferenceIds,
      );
      if (projectBeneficiariesList.isNotEmpty) {
        // Search for tasks and side effects based on project beneficiaries.
        taskList =
            await fetchTaskbyProjectBeneficiary(projectBeneficiariesList);
        sideEffectsList =
            await sideEffectDataRepository.search(SideEffectSearchModel(
          taskClientReferenceId:
              taskList.map((e) => e.clientReferenceId).toList(),
        ));
        referralsList = await referralDataRepository.search(ReferralSearchModel(
          projectBeneficiaryClientReferenceId:
              projectBeneficiariesList.map((e) => e.clientReferenceId).toList(),
        ));
      }
      // Initialize a list to store household member wrappers.
      final containers = <HouseholdMemberWrapper>[];
      // Group household members by household client reference ID.
      final groupedHouseholdsMembers = householdMembersList
          .groupListsBy((element) => element.householdClientReferenceId);
      // Iterate through grouped households and retrieve additional data.
      for (final entry in groupedHouseholdsMembers.entries) {
        HouseholdModel filteredHousehold;
        List<IndividualModel> filteredIndividuals;
        List<ProjectBeneficiaryModel> filteredBeneficiaries;
        List<TaskModel> filteredTasks;
        final householdId = entry.key;
        if (householdId == null) continue;
        filteredHousehold =
            householdList.firstWhere((e) => e.clientReferenceId == householdId);
        filteredIndividuals = individualsList
            .where((element) => entry.value
                .map((e) => e.individualClientReferenceId)
                .contains(element.clientReferenceId))
            .toList();
        filteredBeneficiaries = projectBeneficiariesList
            .where((element) => beneficiaryType == BeneficiaryType.individual
                ? entry.value
                    .map((e) => e.individualClientReferenceId)
                    .contains(element.beneficiaryClientReferenceId)
                : entry.key == element.beneficiaryClientReferenceId)
            .toList();
        filteredTasks = taskList
            .where((element) => filteredBeneficiaries
                .where((e) =>
                    e.clientReferenceId ==
                    element.projectBeneficiaryClientReferenceId)
                .isNotEmpty)
            .toList();
        // Find the head of household from the individuals.
        final head = filteredIndividuals.firstWhereOrNull(
          (element) =>
              element.clientReferenceId ==
              entry.value
                  .firstWhereOrNull(
                    (element) => element.isHeadOfHousehold,
                  )
                  ?.individualClientReferenceId,
        );
        if (head == null) continue;
        // Create a container for household members and associated data.
        if (filteredBeneficiaries.isNotEmpty) {
          containers.add(
            HouseholdMemberWrapper(
              household: filteredHousehold,
              headOfHousehold: head,
              members: filteredIndividuals,
              projectBeneficiaries: filteredBeneficiaries,
              tasks: filteredTasks.isEmpty ? null : filteredTasks,
              sideEffects: sideEffectsList.isEmpty ? null : sideEffectsList,
              referrals: referralsList.isEmpty ? null : referralsList,
            ),
          );
        }
      }
      emit(state.copyWith(
        householdMembers: containers,
        loading: false,
      ));
    } else {
      emit(state.copyWith(
        loading: false,
        householdMembers: [],
      ));
    }
  }
}
