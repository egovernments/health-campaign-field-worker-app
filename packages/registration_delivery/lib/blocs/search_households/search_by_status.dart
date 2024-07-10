import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:digit_data_model/models/entities/address.dart';
import 'package:digit_data_model/models/entities/beneficiary_type.dart';
import 'package:digit_data_model/models/entities/individual.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/models/entities/status.dart';
import 'package:registration_delivery/models/entities/task.dart';
import 'package:registration_delivery/registration_delivery.dart';

import '../../models/entities/household.dart';
import '../../models/entities/household_member.dart';
import '../../models/entities/project_beneficiary.dart';
import '../../models/entities/referral.dart';
import '../../models/entities/side_effect.dart';

class StatusSearchBloc extends SearchHouseholdsBloc {
  StatusSearchBloc(
      {required super.userUid,
      required super.projectId,
      required super.individual,
      required super.householdMember,
      required super.household,
      required super.projectBeneficiary,
      required super.taskDataRepository,
      required super.beneficiaryType,
      required super.sideEffectDataRepository,
      required super.referralDataRepository,
      required super.addressRepository}) {
    // Register the event handler for searching households by status
    on<SearchHouseholdsByStatusEvent>(_searchByStatus);
  }

  FutureOr<void> _searchByStatus(SearchHouseholdsByStatusEvent event,
      Emitter<SearchHouseholdsState> emit) {
    // Initialize lists to store fetched data
    List<HouseholdModel> householdList = [];
    List<IndividualModel> individualsList = [];
    List<HouseholdMemberModel> householdMembersList = [];
    List<ProjectBeneficiaryModel> projectBeneficiariesList = [];
    List<TaskModel> taskList = [];
    List<SideEffectModel> sideEffectsList = [];
    List<ReferralModel> referralsList = [];
    // Initialize a list to store household member wrappers
    final containers = <HouseholdMemberWrapper>[...state.householdMembers];

    // Emit loading state
    emit(state.copyWith(loading: true));
    try {
      switch (event.status.first) {
        case Status.registered:
          fetchRegisteredResults(
              event,
              containers,
              householdList,
              individualsList,
              householdMembersList,
              projectBeneficiariesList,
              taskList,
              sideEffectsList,
              referralsList);
        case Status.notRegistered:
          fetchNotRegisteredResults(
              event,
              containers,
              householdList,
              individualsList,
              householdMembersList,
              projectBeneficiariesList,
              taskList,
              sideEffectsList,
              referralsList);
        default:
          print('status not found');
          break;
      }

      // Emit the updated state with household members and loading status
      emit(state.copyWith(
        householdMembers: containers,
        loading: false,
        offset: event.offset + event.limit,
        limit: event.limit,
      ));
    } catch (e) {
      // Handle errors and emit the error state
      print('error searching by status: $e');
      emit(state.copyWith(
        loading: false,
        householdMembers: [],
      ));
    }
  }

  void fetchRegisteredResults(
      SearchHouseholdsByStatusEvent event,
      List<HouseholdMemberWrapper> containers,
      List<HouseholdModel> householdList,
      List<IndividualModel> individualsList,
      List<HouseholdMemberModel> householdMembersList,
      List<ProjectBeneficiaryModel> projectBeneficiariesList,
      List<TaskModel> taskList,
      List<SideEffectModel> sideEffectsList,
      List<ReferralModel> referralsList) async {
    // Fetch project beneficiaries based on project ID
    List<ProjectBeneficiaryModel> beneficiaries =
        await projectBeneficiary.search(
      ProjectBeneficiarySearchModel(
        projectId: [event.projectId],
      ),
    );

    // Extract individual client reference IDs from beneficiaries
    final List<String> individualClientReferenceIds = beneficiaries
        .map((e) => e.beneficiaryClientReferenceId.toString())
        .toList();

    // Fetch individuals based on client reference IDs
    individualsList = await individual.search(
      IndividualSearchModel(clientReferenceId: individualClientReferenceIds),
    );

    // Fetch household members in bulk based on individual client reference IDs
    householdMembersList = await fetchHouseholdMembersBulk(
      individualClientReferenceIds,
      null,
    );

    // Fetch households based on household client reference IDs from household members
    householdList = await household.search(
      HouseholdSearchModel(
        clientReferenceId: householdMembersList
            .map((e) => e.householdClientReferenceId.toString())
            .toList(),
      ),
    );

    // Fetch project beneficiaries based on household or individual client reference IDs
    projectBeneficiariesList = await fetchProjectBeneficiary(
      beneficiaryType != BeneficiaryType.individual
          ? householdList.map((e) => e.clientReferenceId).toList()
          : individualClientReferenceIds,
    );

    // Group household members by household client reference ID
    final groupedHouseholdsMembers = householdMembersList
        .where((hm) => projectBeneficiariesList
            .map((p) => p.beneficiaryClientReferenceId)
            .toList()
            .contains(beneficiaryType == BeneficiaryType.individual
                ? hm.individualClientReferenceId
                : hm.householdClientReferenceId))
        .groupListsBy((element) => element.householdClientReferenceId);

    // Iterate over grouped household members
    for (final entry in groupedHouseholdsMembers.entries) {
      HouseholdModel filteredHousehold;
      List<IndividualModel> filteredIndividuals;
      List<ProjectBeneficiaryModel> filteredBeneficiaries;
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

      // Filter project beneficiaries based on individual or household client reference IDs
      filteredBeneficiaries = projectBeneficiariesList
          .where((element) => beneficiaryType == BeneficiaryType.individual
              ? membersIds.contains(element.beneficiaryClientReferenceId)
              : householdId == element.beneficiaryClientReferenceId)
          .toList();

      // Filter tasks based on project beneficiary client reference IDs
      filteredTasks = taskList
          .where((element) => filteredBeneficiaries
              .where((e) =>
                  e.clientReferenceId ==
                  element.projectBeneficiaryClientReferenceId)
              .isNotEmpty)
          .toList();

      // Extract beneficiary client reference IDs from filtered beneficiaries
      final beneficiaryClientReferenceIds = filteredBeneficiaries
          .map((e) => e.beneficiaryClientReferenceId)
          .toList();

      // Filter individuals based on beneficiary client reference IDs
      final List<IndividualModel> beneficiaryIndividuals = filteredIndividuals
          .where((element) =>
              beneficiaryClientReferenceIds.contains(element.clientReferenceId))
          .toList();

      // Find the head of the household
      final head = (beneficiaryType == BeneficiaryType.individual
              ? beneficiaryIndividuals
              : filteredIndividuals)
          .firstWhereOrNull(
        (element) =>
            element.clientReferenceId ==
            entry.value
                .firstWhereOrNull(
                  (element) => element.isHeadOfHousehold,
                )
                ?.individualClientReferenceId,
      );

      // Skip if no head of household or no filtered beneficiaries
      if (head == null || filteredBeneficiaries.isEmpty) continue;

      // Add household member wrapper to containers
      if (filteredBeneficiaries.isNotEmpty) {
        containers.add(
          HouseholdMemberWrapper(
            household: filteredHousehold,
            headOfHousehold: head,
            members: beneficiaryType == BeneficiaryType.individual
                ? beneficiaryIndividuals
                : filteredIndividuals,
            projectBeneficiaries: filteredBeneficiaries,
            tasks: filteredTasks.isEmpty ? null : filteredTasks,
            sideEffects: sideEffectsList.isEmpty ? null : sideEffectsList,
            referrals: referralsList.isEmpty ? null : referralsList,
          ),
        );
      }
    }
  }

  void fetchNotRegisteredResults(
      SearchHouseholdsByStatusEvent event,
      List<HouseholdMemberWrapper> containers,
      List<HouseholdModel> householdList,
      List<IndividualModel> individualsList,
      List<HouseholdMemberModel> householdMembersList,
      List<ProjectBeneficiaryModel> projectBeneficiariesList,
      List<TaskModel> taskList,
      List<SideEffectModel> sideEffectsList,
      List<ReferralModel> referralsList) async {
    // Fetch individual results based on proximity and other criteria.
    householdList =
        await addressRepository.searchHouseHoldbyAddress(AddressSearchModel(
      boundaryCode: RegistrationDeliverySingleton().boundary?.code.toString(),
      offset: event.offset,
      limit: event.limit,
    ));

    // Extract individual IDs from proximity-based individual results.
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

// Group household members which do not have project beneficiaries
    final groupedHouseholdsMembersWithoutBeneficiaries = householdMembersList
        .where((hm) => !projectBeneficiariesList
            .map((p) => p.beneficiaryClientReferenceId)
            .toList()
            .contains(beneficiaryType == BeneficiaryType.individual
                ? hm.individualClientReferenceId
                : hm.householdClientReferenceId))
        .groupListsBy((element) => element.householdClientReferenceId);

// Iterate over grouped household members without beneficiaries
    for (final entry in groupedHouseholdsMembersWithoutBeneficiaries.entries) {
      HouseholdModel filteredHousehold;
      List<IndividualModel> filteredIndividuals;
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

      // Skip if no head of household
      if (head == null) continue;

      // Add household member wrapper to containers
      containers.add(
        HouseholdMemberWrapper(
          household: filteredHousehold,
          headOfHousehold: head,
          members: filteredIndividuals,
          projectBeneficiaries: [],
          tasks: null,
          sideEffects: null,
          referrals: null,
        ),
      );
    }
  }
}
