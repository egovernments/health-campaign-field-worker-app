import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_households.dart';
import '../../models/entities/address.dart';
import '../../models/entities/beneficiary_type.dart';
import '../../models/entities/household.dart';
import '../../models/entities/household_member.dart';
import '../../models/entities/individual.dart';
import '../../models/entities/project_beneficiary.dart';
import '../../models/entities/referral.dart';
import '../../models/entities/side_effect.dart';
import '../../models/entities/task.dart';

class ProximitySearchBloc extends SearchHouseholdsBloc {
  ProximitySearchBloc({
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
  }) {
    on<SearchHouseholdsByProximityEvent>(_handleSearchByProximity);
  }

  Future<void> _handleSearchByProximity(
    SearchHouseholdsByProximityEvent event,
    Emitter<SearchHouseholdsState> emit,
  ) async {
    emit(state.copyWith(loading: true));
    // Fetch individual results based on proximity and other criteria.
    final List<HouseholdModel> proximityBasedHouseholdsResults =
        await addressRepository.searchHouseHoldbyAddress(AddressSearchModel(
      latitude: event.latitude,
      longitude: event.longititude,
      maxRadius: event.maxRadius,
      offset: event.offset,
      limit: event.limit,
    ));

    // Extract individual IDs from proximity-based individual results.
    final houseHoldIds = proximityBasedHouseholdsResults
        .map((e) => e.clientReferenceId)
        .toList();

    final List<HouseholdMemberModel> householdMembers =
        await fetchHouseholdMembersBulk(
      null,
      houseHoldIds,
    );

    final List<String> individualClientReferenceIds = householdMembers
        .map((e) => e.individualClientReferenceId.toString())
        .toList();

    final List<IndividualModel> individuals = await individual.search(
      IndividualSearchModel(clientReferenceId: individualClientReferenceIds),
    );

    final projectBeneficiaries = await fetchProjectBeneficiary(
      beneficiaryType != BeneficiaryType.individual
          ? houseHoldIds
          : individualClientReferenceIds,
    );

    List<SideEffectModel> sideEffects = [];
    List<ReferralModel> referrals = [];
    List<TaskModel> tasks = [];
    if (projectBeneficiaries.isNotEmpty) {
      // Search for tasks and side effects based on project beneficiaries.
      tasks = await fetchTaskbyProjectBeneficiary(projectBeneficiaries);

      sideEffects = await sideEffectDataRepository.search(SideEffectSearchModel(
        taskClientReferenceId: tasks.map((e) => e.clientReferenceId).toList(),
      ));

      referrals = await referralDataRepository.search(ReferralSearchModel(
        projectBeneficiaryClientReferenceId:
            projectBeneficiaries.map((e) => e.clientReferenceId).toList(),
      ));
    }

    // Initialize a list to store household member wrappers.
    final containers = <HouseholdMemberWrapper>[...state.householdMembers];

    // Group household members by household client reference ID.
    final groupedHouseholds = householdMembers
        .groupListsBy((element) => element.householdClientReferenceId);

    // Iterate through grouped households and retrieve additional data.
    for (final entry in groupedHouseholds.entries) {
      final householdId = entry.key;

      if (householdId == null) continue;

      // Search for households based on client reference ID and proximity.

      // Retrieve the first household result.
      final houseHoldResult = proximityBasedHouseholdsResults
          .firstWhere((e) => e.clientReferenceId == householdId);
      // Search for individuals based on proximity, beneficiary type, and search text.
      final List<String?> membersIds =
          entry.value.map((e) => e.individualClientReferenceId).toList();
      final List<IndividualModel> individualMemebrs = individuals
          .where((element) => membersIds.contains(element.clientReferenceId))
          .toList();
      final List<ProjectBeneficiaryModel> beneficiaries = projectBeneficiaries
          .where((element) => beneficiaryType == BeneficiaryType.individual
              ? individualClientReferenceIds
                  .contains(element.beneficiaryClientReferenceId)
              : houseHoldIds.contains(element.beneficiaryClientReferenceId))
          .toList();
      // Find the head of household from the individuals.
      final head = individuals.firstWhereOrNull(
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
      if (beneficiaries.isNotEmpty) {
        containers.add(
          HouseholdMemberWrapper(
            household: houseHoldResult,
            headOfHousehold: head,
            members: individualMemebrs,
            projectBeneficiaries: beneficiaries,
            tasks: tasks.isEmpty ? null : tasks,
            sideEffects: sideEffects.isEmpty ? null : sideEffects,
            referrals: referrals.isEmpty ? null : referrals,
          ),
        );
      }
    }
    // Update the state with the   results and mark the search as completed.
    emit(state.copyWith(
      householdMembers: containers,
      loading: false,
    ));
  }
}
