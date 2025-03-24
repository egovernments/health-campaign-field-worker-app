import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/models/entities/individual.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/utils/utils.dart';

import '../../models/entities/household.dart';
import '../../models/entities/household_member.dart';
import '../../models/entities/project_beneficiary.dart';
import '../../models/entities/referral.dart';
import '../../models/entities/side_effect.dart';
import '../../models/entities/status.dart';
import '../../models/entities/task.dart';
import '../../utils/global_search_parameters.dart';

class HouseHoldGlobalSearchBloc extends SearchHouseholdsBloc {
  HouseHoldGlobalSearchBloc({
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
    required super.individualGlobalSearchRepository,
    required super.houseHoldGlobalSearchRepository,
  }) {
    on<HouseHoldGlobalSearchEvent>(_houseHoldGlobalSearch);
  }

  Future<void> _houseHoldGlobalSearch(
    HouseHoldGlobalSearchEvent event,
    SearchHouseholdsEmitter emit,
  ) async {
    final containers = <HouseholdMemberWrapper>[...state.householdMembers];

    List<HouseholdModel> householdList = [];
    List<IndividualModel> individualsList = [];
    List<HouseholdMemberModel> householdMembersList = [];
    List<ProjectBeneficiaryModel> projectBeneficiariesList = [];
    List<TaskModel> taskList = [];
    List<SideEffectModel> sideEffectsList = [];
    List<ReferralModel> referralsList = [];

    emit(state.copyWith(loading: true));

    final results = await houseHoldGlobalSearchRepository.houseHoldGlobalSearch(
      GlobalSearchParameters(
          householdType: event.globalSearchParams.householdType,
          projectId: event.globalSearchParams.projectId,
          isProximityEnabled: event.globalSearchParams.isProximityEnabled,
          latitude: event.globalSearchParams.latitude,
          longitude: event.globalSearchParams.longitude,
          maxRadius: event.globalSearchParams.maxRadius,
          nameSearch: event.globalSearchParams.nameSearch,
          filter: event.globalSearchParams.filter,
          offset: event.globalSearchParams.offset,
          limit: event.globalSearchParams.limit,
          totalCount: state.totalResults,
          identifierId: event.globalSearchParams.identifierId),
    );

    var totalCount = results['total_count'];
    var finalResults = results['data'].map((e) => e).toList();

    if (event.globalSearchParams.filter!.contains(Status.registered.name) ||
        event.globalSearchParams.filter!.contains(Status.notRegistered.name)) {
      late List<String> houseHoldClientReferenceIds = [];

      finalResults.forEach((e) {
        houseHoldClientReferenceIds.add(e.clientReferenceId);
      });

      householdList = await household.search(HouseholdSearchModel(
          clientReferenceId:
              houseHoldClientReferenceIds.map((e) => e.toString()).toList()));

      // Search for individual results using the extracted IDs and search text.
      householdMembersList = await fetchHouseholdMembersBulk(
        null,
        houseHoldClientReferenceIds,
      );

      final List<String> individualClientReferenceIds = householdMembersList
          .map((e) => e.individualClientReferenceId.toString())
          .toList();

      individualsList = await individual.search(
        IndividualSearchModel(clientReferenceId: individualClientReferenceIds),
      );

      projectBeneficiariesList = await projectBeneficiary.search(
          ProjectBeneficiarySearchModel(
              projectId: [RegistrationDeliverySingleton().projectId.toString()],
              beneficiaryClientReferenceId:
                  houseHoldClientReferenceIds.map((e) => e).toList()));

      List<dynamic> tasksRelated = await _processTasksAndRelatedData(
          projectBeneficiariesList, taskList, sideEffectsList, referralsList);

      taskList = tasksRelated[0];
      sideEffectsList = tasksRelated[1];
      referralsList = tasksRelated[2];

      // Process household entries and add to containers
      await _processHouseholdEntries(
        householdMembersList,
        householdList,
        individualsList,
        projectBeneficiariesList,
        taskList,
        sideEffectsList,
        referralsList,
        containers,
      );
    } else if (event.globalSearchParams.filter!.isNotEmpty &&
        event.globalSearchParams.filter != null) {
      late List<String> listOfBeneficiaries = [];
      for (var e in finalResults) {
        !listOfBeneficiaries.contains(e.projectBeneficiaryClientReferenceId)
            ? listOfBeneficiaries.add(e.projectBeneficiaryClientReferenceId!)
            : null;
      }

      projectBeneficiariesList = await projectBeneficiary.search(
          ProjectBeneficiarySearchModel(
              projectId: [RegistrationDeliverySingleton().projectId.toString()],
              clientReferenceId: listOfBeneficiaries));

      late List<String> listOfMembers = [];

      listOfMembers = projectBeneficiariesList
          .map((e) => e.beneficiaryClientReferenceId.toString())
          .toList();

      householdMembersList = await fetchHouseholdMembersBulk(
        null,
        listOfMembers,
      );

      final List<String> individualClientReferenceIds = householdMembersList
          .map((e) => e.individualClientReferenceId.toString())
          .toList();

      individualsList = await individual.search(
        IndividualSearchModel(clientReferenceId: individualClientReferenceIds),
      );

      late List<String> houseHoldClientReferenceIds = [];

      houseHoldClientReferenceIds = householdMembersList
          .map((e) => e.householdClientReferenceId.toString())
          .toList();

      householdList = await household.search(HouseholdSearchModel(
        clientReferenceId: houseHoldClientReferenceIds,
      ));

      finalResults.forEach((element) {
        taskList.add(element);
      });

      List<dynamic> tasksRelated = await _processTasksAndRelatedData(
          projectBeneficiariesList, taskList, sideEffectsList, referralsList);

      taskList = tasksRelated[0];
      sideEffectsList = tasksRelated[1];
      referralsList = tasksRelated[2];

      // Process household entries and add to containers
      await _processHouseholdEntries(
        householdMembersList,
        householdList,
        individualsList,
        projectBeneficiariesList,
        taskList,
        sideEffectsList,
        referralsList,
        containers,
      );
    } else {
      late List<String> houseHoldClientReferenceIds = [];

      finalResults.forEach((e) {
        houseHoldClientReferenceIds.add(e.clientReferenceId);
      });

      householdList = await household.search(HouseholdSearchModel(
          clientReferenceId:
              houseHoldClientReferenceIds.map((e) => e.toString()).toList()));

      // Search for individual results using the extracted IDs and search text.
      householdMembersList = await fetchHouseholdMembersBulk(
        null,
        houseHoldClientReferenceIds,
      );

      final List<String> individualClientReferenceIds = householdMembersList
          .map((e) => e.individualClientReferenceId.toString())
          .toList();

      individualsList = await individual.search(
        IndividualSearchModel(clientReferenceId: individualClientReferenceIds),
      );

      projectBeneficiariesList = await projectBeneficiary.search(
          ProjectBeneficiarySearchModel(
              projectId: [RegistrationDeliverySingleton().projectId.toString()],
              beneficiaryClientReferenceId:
                  houseHoldClientReferenceIds.map((e) => e).toList()));

      List<dynamic> tasksRelated = await _processTasksAndRelatedData(
          projectBeneficiariesList, taskList, sideEffectsList, referralsList);

      taskList = tasksRelated[0];

      sideEffectsList = tasksRelated[1];
      referralsList = tasksRelated[2];

      // Process household entries and add to containers
      await _processHouseholdEntries(
        householdMembersList,
        householdList,
        individualsList,
        projectBeneficiariesList,
        taskList,
        sideEffectsList,
        referralsList,
        containers,
      );
    }
    emit(state.copyWith(
      householdMembers: containers,
      loading: false,
      searchQuery: event.globalSearchParams.nameSearch,
      beneficiaryIdQuery: event.globalSearchParams.identifierId,
      offset:
          event.globalSearchParams.offset! + event.globalSearchParams.limit!,
      limit: event.globalSearchParams.limit!,
      totalResults: containers.isEmpty ? 0 : totalCount,
    ));
  }

  Future<void> _processHouseholdEntries(
    List<HouseholdMemberModel> householdMembersList,
    List<HouseholdModel> householdList,
    List<IndividualModel> individualsList,
    List<ProjectBeneficiaryModel> projectBeneficiariesList,
    List<TaskModel> taskList,
    List<SideEffectModel> sideEffectsList,
    List<ReferralModel> referralsList,
    List<HouseholdMemberWrapper> containers,
  ) async {
    final groupedHouseholdsMembers = householdMembersList
        .groupListsBy((element) => element.householdClientReferenceId);

    for (final entry in groupedHouseholdsMembers.entries) {
      HouseholdModel filteredHousehold;
      List<IndividualModel> filteredIndividuals;
      List<TaskModel> filteredTasks = [];
      List<ProjectBeneficiaryModel> filteredBeneficiaries = [];
      final householdId = entry.key;
      if (householdId == null) continue;

      // Filter household based on household ID
      filteredHousehold =
          householdList.firstWhere((e) => e.clientReferenceId == householdId);

      // Extract individual client reference IDs from household members
      final List<String?> membersIds =
          entry.value.map((e) => e.individualClientReferenceId).toList();

      // Filter individuals based on individual client reference IDs
      filteredIndividuals = individualsList
          .where((element) => membersIds.contains(element.clientReferenceId))
          .toList();

      // Filter beneficiaries based on filtered household client reference IDs
      filteredBeneficiaries = projectBeneficiariesList
          .where((element) =>
              element.beneficiaryClientReferenceId ==
              filteredHousehold.clientReferenceId)
          .toList();

      // Filter tasks based on project beneficiary client reference IDs
      for (var beneficiary in filteredBeneficiaries) {
        var tasksForBeneficiary = taskList.where((element) =>
            beneficiary.clientReferenceId ==
            element.projectBeneficiaryClientReferenceId);

        filteredTasks.addAll(tasksForBeneficiary);
      }

      // Find the head of the household
      final head = filteredIndividuals.firstWhereOrNull(
        (element) =>
            element.clientReferenceId ==
            entry.value
                .firstWhereOrNull(
                  (element) => element.isHeadOfHousehold,
                )
                ?.individualClientReferenceId,
      );

      // Skip if no head of household or no filtered beneficiaries
      if (head == null) continue;

      // Add household member wrapper to containers
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

  Future<List<dynamic>> _processTasksAndRelatedData(
    List<ProjectBeneficiaryModel> projectBeneficiariesList,
    List<TaskModel> taskList,
    List<SideEffectModel> sideEffectsList,
    List<ReferralModel> referralsList,
  ) async {
    if (projectBeneficiariesList.isNotEmpty) {
      if (taskList.isEmpty) {
        taskList =
            await fetchTaskByProjectBeneficiary(projectBeneficiariesList);
      }
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
    return [
      taskList,
      sideEffectsList,
      referralsList,
    ];
  }
}
