import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/models/entities/individual.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';

import '../../models/entities/household.dart';
import '../../models/entities/household_member.dart';
import '../../models/entities/project_beneficiary.dart';
import '../../models/entities/referral.dart';
import '../../models/entities/side_effect.dart';
import '../../models/entities/task.dart';
import '../../utils/global_search_parameters.dart';

class IndividualGlobalSearchBloc extends SearchHouseholdsBloc {
  IndividualGlobalSearchBloc(
      {required super.userUid,
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
      required super.houseHoldGlobalSearchRepository}) {
    on<IndividualGlobalSearchEvent>(_individualGlobalSearch);
  }

  Future<void> _individualGlobalSearch(
    IndividualGlobalSearchEvent event,
    SearchHouseholdsEmitter emit,
  ) async {
    final containers = <HouseholdMemberWrapper>[...state.householdMembers];

    List<HouseholdModel> householdList = [];
    List<IndividualModel> individualsList = [];
    List<ProjectBeneficiaryModel> projectBeneficiariesList = [];
    List<TaskModel> taskList = [];
    List<SideEffectModel> sideEffectsList = [];
    List<ReferralModel> referralsList = [];

    emit(state.copyWith(loading: true));

    final results =
        await individualGlobalSearchRepository.individualGlobalSearch(
      GlobalSearchParameters(
        isProximityEnabled: event.globalSearchParams.isProximityEnabled,
        latitude: event.globalSearchParams.latitude,
        longitude: event.globalSearchParams.longitude,
        maxRadius: event.globalSearchParams.maxRadius,
        nameSearch: event.globalSearchParams.nameSearch,
        filter: event.globalSearchParams.filter,
        offset: event.globalSearchParams.offset,
        limit: event.globalSearchParams.limit,
      ),
    );

    var list = results.map((e) => e).toList();

    late List<String> individualClientReferenceIds = [];

    list.forEach((e) {
      individualClientReferenceIds.add(e.clientReferenceId);
    });

    individualsList = await individual.search(IndividualSearchModel(
        clientReferenceId:
            individualClientReferenceIds.map((e) => e.toString()).toList()));

    // Search for individual results using the extracted IDs and search text.
    final List<HouseholdMemberModel> householdMembers =
        await fetchHouseholdMembersBulk(
      individualClientReferenceIds,
      null,
    );

    // Group household members by household client reference ID
    final groupedHouseholdsMembers = householdMembers
        .groupListsBy((element) => element.householdClientReferenceId);

    householdList = await household.search(HouseholdSearchModel(
      clientReferenceId: householdMembers
          .map((e) => e.householdClientReferenceId.toString())
          .toList(),
    ));

    projectBeneficiariesList = await projectBeneficiary.search(
        ProjectBeneficiarySearchModel(
            beneficiaryClientReferenceId:
                individualClientReferenceIds.map((e) => e).toList()));

    if (projectBeneficiariesList.isNotEmpty) {
      taskList = await fetchTaskbyProjectBeneficiary(projectBeneficiariesList);
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

    for (final entry in groupedHouseholdsMembers.entries) {
      HouseholdModel filteredHousehold;
      List<IndividualModel> filteredIndividuals;
      List<TaskModel> filteredTasks;
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

      // Filter tasks based on project beneficiary client reference IDs
      filteredTasks = taskList
          .where((element) => filteredIndividuals
              .where((e) =>
                  e.clientReferenceId ==
                  element.projectBeneficiaryClientReferenceId)
              .isNotEmpty)
          .toList();

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
          projectBeneficiaries: projectBeneficiariesList,
          tasks: filteredTasks.isEmpty ? null : filteredTasks,
          sideEffects: sideEffectsList.isEmpty ? null : sideEffectsList,
          referrals: referralsList.isEmpty ? null : referralsList,
        ),
      );
    }

    emit(state.copyWith(
      householdMembers: containers,
      loading: false,
      searchQuery: event.globalSearchParams.nameSearch,
      offset:
          event.globalSearchParams.offset! + event.globalSearchParams.limit!,
      limit: event.globalSearchParams.limit!,
    ));
  }
}
