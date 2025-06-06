// GENERATED using mason_cli
import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/utils/typedefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:registration_delivery/utils/global_search_parameters.dart';
import 'package:survey_form/models/entities/service.dart';

import '../../data/repositories/local/individual_global_search.dart';
import '../../models/entities/status.dart';

part 'household_overview.freezed.dart';

typedef HouseholdOverviewEmitter = Emitter<HouseholdOverviewState>;

class HouseholdOverviewBloc
    extends Bloc<HouseholdOverviewEvent, HouseholdOverviewState> {
  final BeneficiaryType beneficiaryType;
  final IndividualDataRepository individualRepository;
  final HouseholdDataRepository householdRepository;
  final HouseholdMemberDataRepository householdMemberRepository;
  final ProjectBeneficiaryDataRepository projectBeneficiaryRepository;
  final TaskDataRepository taskDataRepository;
  final SideEffectDataRepository sideEffectDataRepository;
  final ReferralDataRepository referralDataRepository;
  final IndividualGlobalSearchRepository individualGlobalSearchRepository;
  final ServiceDataRepository serviceDataRepository;

  HouseholdOverviewBloc(
    super.initialState, {
    required this.projectBeneficiaryRepository,
    required this.householdRepository,
    required this.individualRepository,
    required this.householdMemberRepository,
    required this.taskDataRepository,
    required this.sideEffectDataRepository,
    required this.referralDataRepository,
    required this.beneficiaryType,
    required this.individualGlobalSearchRepository,
    required this.serviceDataRepository,
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

    if (event.searchByName == null &&
        (event.selectedFilter == null || event.selectedFilter!.isEmpty)) {
      // Retrieve household members based on certain criteria.
      final members = event.limit != null
          ? await householdMemberRepository.search(
              HouseholdMemberSearchModel(
                householdClientReferenceId:
                    state.householdMemberWrapper.household != null
                        ? [
                            state.householdMemberWrapper.household!
                                .clientReferenceId
                          ]
                        : [],
                limit: event.limit,
                offset: event.offset,
              ),
            )
          : await householdMemberRepository.search(HouseholdMemberSearchModel(
              householdClientReferenceId: state
                          .householdMemberWrapper.household !=
                      null
                  ? [state.householdMemberWrapper.household!.clientReferenceId]
                  : []));

      // Group household members by household ID.
      final groupedHouseholds = members.groupListsBy(
        (element) => element.householdClientReferenceId,
      );

      final householdId =
          state.householdMemberWrapper.household?.clientReferenceId;

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
        HouseholdSearchModel(
            clientReferenceId: householdId != null ? [householdId] : []),
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
      var individuals = await individualRepository.search(
        IndividualSearchModel(
          clientReferenceId: individualIds,
        ),
      );

      List<IndividualModel> sortedIndividuals = [];
      for (var e in individuals) {
        e.identifiers?.sort((a, b) => a.clientAuditDetails!.lastModifiedTime!
            .compareTo(b.clientAuditDetails!.lastModifiedTime!));

        sortedIndividuals.add(e);
      }

      individuals = sortedIndividuals;

      // Search for project beneficiaries based on specified criteria.
      final projectBeneficiaries = await projectBeneficiaryRepository.search(
        ProjectBeneficiarySearchModel(
          beneficiaryClientReferenceId:
              event.projectBeneficiaryType == BeneficiaryType.individual
                  ? individualIds
                  : [resultHousehold.clientReferenceId],
          projectId: [event.projectId],
          // [TODO] Need to pass as a  based on Beneficiary Type
        ),
      );

      // Check if any project beneficiaries were found.
      if (projectBeneficiaries.isEmpty) {
        // If no project beneficiaries were found, stop loading and return.
        emit(state.copyWith(loading: false));

        return;
      }

      final beneficiaryClientReferenceIds = projectBeneficiaries
          .map((e) => e.beneficiaryClientReferenceId)
          .toList();

      final List<IndividualModel> beneficiaryIndividuals = individuals
          .where((element) =>
              beneficiaryClientReferenceIds.contains(element.clientReferenceId))
          .toList();

      // Find the head of the household.
      final head = (event.projectBeneficiaryType == BeneficiaryType.individual
              ? beneficiaryIndividuals
              : individuals)
          .firstWhereOrNull(
        (i) =>
            i.clientReferenceId ==
            householdMemberList
                .firstWhereOrNull((h) => h.isHeadOfHousehold)
                ?.individualClientReferenceId,
      );

      // Search for tasks associated with project beneficiaries.
      var tasks = await taskDataRepository.search(TaskSearchModel(
          projectBeneficiaryClientReferenceId:
              projectBeneficiaries.map((e) => e.clientReferenceId).toList()));

      // Search for adverse events associated with tasks.
      final sideEffects =
          await sideEffectDataRepository.search(SideEffectSearchModel(
        taskClientReferenceId:
            tasks.map((e) => e.clientReferenceId).whereNotNull().toList(),
      ));

      final referrals = await referralDataRepository.search(ReferralSearchModel(
        projectBeneficiaryClientReferenceId: projectBeneficiaries
            .map((e) => e.clientReferenceId)
            .whereNotNull()
            .toList(),
      ));

      final householdChecklist =
          await serviceDataRepository.search(ServiceSearchModel(
        referenceIds: [resultHousehold.clientReferenceId],
      ));

      final memberChecklist =
          await serviceDataRepository.search(ServiceSearchModel(
        referenceIds: members
            .map((e) => e.individualClientReferenceId)
            .whereNotNull()
            .toList(),
      ));

      individuals.sort((a, b) => (a.clientAuditDetails?.createdTime ?? 0)
          .compareTo(b.clientAuditDetails?.createdTime ?? 0));

      beneficiaryIndividuals.sort((a, b) =>
          (a.clientAuditDetails?.createdTime ?? 0)
              .compareTo(b.clientAuditDetails?.createdTime ?? 0));

      // Check if a head of household was found.
      if (head == null) {
        // If head is not found, append the new data to the existing state.

        emit(state.copyWith(
          loading: false,
          offset: members.isNotEmpty && members.length == (event.limit ?? 10)
              ? (event.offset ?? 0) + (event.limit ?? 10)
              : null,
          householdMemberWrapper: state.householdMemberWrapper.copyWith(
            members:
                (event.projectBeneficiaryType == BeneficiaryType.individual)
                    ? [
                        ...state.householdMemberWrapper.members ?? [],
                        ...beneficiaryIndividuals,
                      ]
                    : [
                        ...state.householdMemberWrapper.members ?? [],
                        ...individuals,
                      ],
            projectBeneficiaries: [
              ...state.householdMemberWrapper.projectBeneficiaries ?? [],
              ...projectBeneficiaries,
            ],
            tasks: [
              ...?state.householdMemberWrapper.tasks,
              ...tasks,
            ],
            sideEffects: [
              ...?state.householdMemberWrapper.sideEffects,
              ...sideEffects,
            ],
            referrals: [
              ...?state.householdMemberWrapper.referrals,
              ...referrals,
            ],
            householdMembers: [
              ...?state.householdMemberWrapper.householdMembers,
              ...householdMemberList
            ],
            householdChecklists: [
              ...?state.householdMemberWrapper.householdChecklists,
              ...householdChecklist,
            ],
            individualChecklists: [
              ...?state.householdMemberWrapper.individualChecklists,
              ...memberChecklist,
            ],
          ),
        ));

        return;
      }

      // Update the state with the loaded data and stop loading.
      emit(
        state.copyWith(
          householdMemberWrapper: HouseholdMemberWrapper(
            household: resultHousehold,
            headOfHousehold: head,
            members: (event.projectBeneficiaryType == BeneficiaryType.individual
                ? beneficiaryIndividuals
                : individuals),
            tasks: tasks.isEmpty ? null : tasks,
            projectBeneficiaries: projectBeneficiaries,
            sideEffects: sideEffects,
            referrals: referrals,
            householdMembers: householdMemberList,
            householdChecklists: householdChecklist,
            individualChecklists: memberChecklist,
          ),
          loading: false,
          offset: members.isNotEmpty
              ? (event.offset ?? 0) + (event.limit ?? 10)
              : null,
          limit: event.limit,
        ),
      );
    } else {
      final totalResult = await individualGlobalSearchRepository
          .individualGlobalSearch(GlobalSearchParameters(
              householdType: RegistrationDeliverySingleton().householdType,
              householdClientReferenceId:
                  state.householdMemberWrapper.household!.clientReferenceId,
              isProximityEnabled: false,
              projectId: RegistrationDeliverySingleton().projectId,
              latitude: null,
              longitude: null,
              maxRadius: null,
              nameSearch: event.searchByName,
              offset: event.offset,
              limit: event.limit,
              filter: event.selectedFilter));
      var result = totalResult['data'].map((e) => e).toList();

      if (result.isEmpty) {
        emit(state.copyWith(
          loading: false,
          householdMemberWrapper: HouseholdMemberWrapper(
            household: state.householdMemberWrapper.household,
            headOfHousehold: state.householdMemberWrapper.headOfHousehold,
            members: [],
            tasks: null,
            projectBeneficiaries: null,
            sideEffects: null,
            referrals: null,
          ),
        ));
        return;
      }
      if (event.selectedFilter!.contains(Status.registered.name) ||
          event.selectedFilter!.contains(Status.notRegistered.name)) {
        late List<String> individualClientReferenceIds = [];

        result.forEach((e) {
          individualClientReferenceIds.add(e.clientReferenceId);
        });

        List<IndividualModel> individuals = await individualRepository.search(
            IndividualSearchModel(
                clientReferenceId: individualClientReferenceIds
                    .map((e) => e.toString())
                    .toList()));

        final projectBeneficiaries = await projectBeneficiaryRepository.search(
          ProjectBeneficiarySearchModel(
            beneficiaryClientReferenceId: event.projectBeneficiaryType ==
                    BeneficiaryType.individual
                ? individualClientReferenceIds
                : [state.householdMemberWrapper.household!.clientReferenceId],
            projectId: [event.projectId],
          ),
        );

        final beneficiaryClientReferenceIds = projectBeneficiaries
            .map((e) => e.beneficiaryClientReferenceId)
            .toList();

        final List<IndividualModel> beneficiaryIndividuals = individuals
            .where((element) => beneficiaryClientReferenceIds
                .contains(element.clientReferenceId))
            .toList();

        final tasks = await taskDataRepository.search(TaskSearchModel(
          projectBeneficiaryClientReferenceId:
              projectBeneficiaries.map((e) => e.clientReferenceId).toList(),
          projectId: event.projectId,
        ));

        // Search for adverse events associated with tasks.
        final sideEffects =
            await sideEffectDataRepository.search(SideEffectSearchModel(
          taskClientReferenceId:
              tasks.map((e) => e.clientReferenceId).whereNotNull().toList(),
        ));

        final referrals =
            await referralDataRepository.search(ReferralSearchModel(
          projectBeneficiaryClientReferenceId: projectBeneficiaries
              .map((e) => e.clientReferenceId)
              .whereNotNull()
              .toList(),
        ));

        emit(state.copyWith(
          loading: false,
          offset: individuals.isNotEmpty && individuals.length == event.limit
              ? (event.offset ?? 0) + (event.limit ?? 10)
              : null,
          householdMemberWrapper: state.householdMemberWrapper.copyWith(
            members: event.offset == 0
                ? (event.projectBeneficiaryType == BeneficiaryType.individual)
                    ? beneficiaryIndividuals
                    : individuals
                : [
                    ...{
                      ...state.householdMemberWrapper.members ?? [],
                      ...((event.projectBeneficiaryType ==
                              BeneficiaryType.individual)
                          ? beneficiaryIndividuals
                          : individuals),
                    },
                  ],
            projectBeneficiaries: event.offset == 0
                ? projectBeneficiaries
                : [
                    ...{
                      ...state.householdMemberWrapper.projectBeneficiaries ??
                          [],
                      ...projectBeneficiaries,
                    },
                  ],
            tasks: event.offset == 0
                ? tasks
                : [
                    ...{...?state.householdMemberWrapper.tasks, ...tasks},
                  ],
            sideEffects: event.offset == 0
                ? sideEffects
                : [
                    ...{
                      ...?state.householdMemberWrapper.sideEffects,
                      ...sideEffects,
                    },
                  ],
            referrals: event.offset == 0
                ? referrals
                : [
                    ...{
                      ...?state.householdMemberWrapper.referrals,
                      ...referrals,
                    },
                  ],
          ),
          limit: event.limit,
        ));
      } else if (event.selectedFilter != null &&
          event.selectedFilter!.isNotEmpty) {
        late List<String> listOfBeneficiaries = [];
        for (var e in result) {
          !listOfBeneficiaries.contains(e.projectBeneficiaryClientReferenceId)
              ? listOfBeneficiaries.add(e.projectBeneficiaryClientReferenceId)
              : null;
        }

        List<ProjectBeneficiaryModel> projectBeneficiariesList =
            await projectBeneficiaryRepository.search(
                ProjectBeneficiarySearchModel(projectId: [
          RegistrationDeliverySingleton().projectId.toString()
        ], clientReferenceId: listOfBeneficiaries));

        late List<String> listOfMembers = [];

        listOfMembers = projectBeneficiariesList
            .map((e) => e.beneficiaryClientReferenceId.toString())
            .toList();

        List<HouseholdMemberModel> householdMemberList =
            await householdMemberRepository.search(HouseholdMemberSearchModel(
                individualClientReferenceId: listOfMembers));

        final List<String> individualClientReferenceIds = householdMemberList
            .map((e) => e.individualClientReferenceId.toString())
            .toList();

        final List<IndividualModel> individualsList =
            await individualRepository.search(
          IndividualSearchModel(
              clientReferenceId: individualClientReferenceIds),
        );

        late List<String> householdClientReferenceIds = [];

        householdClientReferenceIds = householdMemberList
            .map((e) => e.householdClientReferenceId.toString())
            .toList();

        final projectBeneficiaries = await projectBeneficiaryRepository.search(
          ProjectBeneficiarySearchModel(
            beneficiaryClientReferenceId: event.projectBeneficiaryType ==
                    BeneficiaryType.individual
                ? individualClientReferenceIds
                : [state.householdMemberWrapper.household!.clientReferenceId],
            projectId: [event.projectId],
          ),
        );

        final beneficiaryClientReferenceIds = projectBeneficiaries
            .map((e) => e.beneficiaryClientReferenceId)
            .toList();

        final List<IndividualModel> beneficiaryIndividuals = individualsList
            .where((element) => beneficiaryClientReferenceIds
                .contains(element.clientReferenceId))
            .toList();

        final tasks = await taskDataRepository.search(TaskSearchModel(
          projectBeneficiaryClientReferenceId:
              projectBeneficiaries.map((e) => e.clientReferenceId).toList(),
          projectId: event.projectId,
        ));

        // Search for adverse events associated with tasks.
        final sideEffects =
            await sideEffectDataRepository.search(SideEffectSearchModel(
          taskClientReferenceId:
              tasks.map((e) => e.clientReferenceId).whereNotNull().toList(),
        ));

        final referrals =
            await referralDataRepository.search(ReferralSearchModel(
          projectBeneficiaryClientReferenceId: projectBeneficiaries
              .map((e) => e.clientReferenceId)
              .whereNotNull()
              .toList(),
        ));

        emit(state.copyWith(
          loading: false,
          offset: individualsList.isNotEmpty &&
                  individualsList.length == event.limit
              ? (event.offset ?? 0) + (event.limit ?? 10)
              : null,
          householdMemberWrapper: state.householdMemberWrapper.copyWith(
            members: event.offset == 0
                ? (event.projectBeneficiaryType == BeneficiaryType.individual)
                    ? beneficiaryIndividuals
                    : individualsList
                : [
                    ...{
                      ...state.householdMemberWrapper.members ?? [],
                      ...((event.projectBeneficiaryType ==
                              BeneficiaryType.individual)
                          ? beneficiaryIndividuals
                          : individualsList),
                    },
                  ],
            projectBeneficiaries: event.offset == 0
                ? projectBeneficiaries
                : [
                    ...{
                      ...state.householdMemberWrapper.projectBeneficiaries ??
                          [],
                      ...projectBeneficiaries,
                    },
                  ],
            tasks: event.offset == 0
                ? tasks
                : [
                    ...{...?state.householdMemberWrapper.tasks, ...tasks},
                  ],
            sideEffects: event.offset == 0
                ? sideEffects
                : [
                    ...{
                      ...?state.householdMemberWrapper.sideEffects,
                      ...sideEffects,
                    },
                  ],
            householdMembers: event.offset == 0
                ? householdMemberList
                : [
              ...{
                ...?state.householdMemberWrapper.householdMembers,
                ...householdMemberList,
              },
            ],
            referrals: event.offset == 0
                ? referrals
                : [
                    ...{
                      ...?state.householdMemberWrapper.referrals,
                      ...referrals,
                    },
                  ],
          ),
          limit: event.limit,
        ));
      } else {
        late List<String> individualClientReferenceIds = [];

        result.forEach((e) {
          individualClientReferenceIds.add(e.clientReferenceId);
        });

        List<IndividualModel> individuals = await individualRepository.search(
            IndividualSearchModel(
                clientReferenceId: individualClientReferenceIds
                    .map((e) => e.toString())
                    .toList()));

        final projectBeneficiaries = await projectBeneficiaryRepository.search(
          ProjectBeneficiarySearchModel(
            beneficiaryClientReferenceId: event.projectBeneficiaryType ==
                    BeneficiaryType.individual
                ? individualClientReferenceIds
                : [state.householdMemberWrapper.household!.clientReferenceId],
            projectId: [event.projectId],
          ),
        );

        final beneficiaryClientReferenceIds = projectBeneficiaries
            .map((e) => e.beneficiaryClientReferenceId)
            .toList();

        final List<IndividualModel> beneficiaryIndividuals = individuals
            .where((element) => beneficiaryClientReferenceIds
                .contains(element.clientReferenceId))
            .toList();

        final tasks = await taskDataRepository.search(TaskSearchModel(
          projectBeneficiaryClientReferenceId:
              projectBeneficiaries.map((e) => e.clientReferenceId).toList(),
          projectId: event.projectId,
        ));

        // Search for adverse events associated with tasks.
        final sideEffects =
            await sideEffectDataRepository.search(SideEffectSearchModel(
          taskClientReferenceId:
              tasks.map((e) => e.clientReferenceId).whereNotNull().toList(),
        ));

        final referrals =
            await referralDataRepository.search(ReferralSearchModel(
          projectBeneficiaryClientReferenceId: projectBeneficiaries
              .map((e) => e.clientReferenceId)
              .whereNotNull()
              .toList(),
        ));

        emit(state.copyWith(
          loading: false,
          offset: individuals.isNotEmpty && individuals.length == event.limit
              ? (event.offset ?? 0) + (event.limit ?? 10)
              : null,
          householdMemberWrapper: state.householdMemberWrapper.copyWith(
            members: event.offset == 0
                ? (event.projectBeneficiaryType == BeneficiaryType.individual)
                    ? beneficiaryIndividuals
                    : individuals
                : [
                    ...{
                      ...state.householdMemberWrapper.members ?? [],
                      ...((event.projectBeneficiaryType ==
                              BeneficiaryType.individual)
                          ? beneficiaryIndividuals
                          : individuals),
                    },
                  ],
            projectBeneficiaries: event.offset == 0
                ? projectBeneficiaries
                : [
                    ...{
                      ...state.householdMemberWrapper.projectBeneficiaries ??
                          [],
                      ...projectBeneficiaries,
                    },
                  ],
            tasks: event.offset == 0
                ? tasks
                : [
                    ...{...?state.householdMemberWrapper.tasks, ...tasks},
                  ],
            sideEffects: event.offset == 0
                ? sideEffects
                : [
                    ...{
                      ...?state.householdMemberWrapper.sideEffects,
                      ...sideEffects,
                    },
                  ],
            referrals: event.offset == 0
                ? referrals
                : [
                    ...{
                      ...?state.householdMemberWrapper.referrals,
                      ...referrals,
                    },
                  ],
          ),
          limit: event.limit,
        ));
      }
    }
  }

  // This function handles the deletion of a household and its associated members and beneficiaries.
  FutureOr<void> _handleDeleteHousehold(
    HouseholdOverviewDeleteHouseholdEvent event,
    HouseholdOverviewEmitter emit,
  ) async {
    // Delete the household from the repository.
    final HouseholdModel? existingHousehold =
        (await householdRepository.search(HouseholdSearchModel(
      clientReferenceId: [event.householdModel.clientReferenceId],
    )))
            .firstOrNull;
    await householdRepository.delete(
      event.householdModel.copyWith(
        id: existingHousehold?.id,
        rowVersion: existingHousehold?.rowVersion ?? 1,
        nonRecoverableError: existingHousehold?.nonRecoverableError ?? false,
      ),
    );

    // Iterate through individual members of the household.
    for (final i in event.members) {
// Delete the individual from the repository.
      final IndividualModel? existingIndividual =
          (await individualRepository.search(IndividualSearchModel(
        clientReferenceId: [i.clientReferenceId],
      )))
              .firstOrNull;
      await individualRepository.delete(i.copyWith(
        id: existingIndividual?.id,
        rowVersion: existingIndividual?.rowVersion ?? 1,
        nonRecoverableError: existingIndividual?.nonRecoverableError ?? false,
      ));
      if (event.projectBeneficiaryType == BeneficiaryType.individual) {
        // Search for project beneficiary associated with the deleted individual.
        final projectBeneficiaries = await projectBeneficiaryRepository.search(
          ProjectBeneficiarySearchModel(
            beneficiaryClientReferenceId: [
              i.clientReferenceId,
            ],
          ),
        );
        // Delete the associated project beneficiaries.
        for (final projectBeneficiary in projectBeneficiaries) {
          await projectBeneficiaryRepository.delete(
            projectBeneficiary.copyWith(
              rowVersion: projectBeneficiary.rowVersion,
              clientAuditDetails: (projectBeneficiary
                              .clientAuditDetails?.createdBy !=
                          null &&
                      projectBeneficiary.clientAuditDetails?.createdTime !=
                          null)
                  ? ClientAuditDetails(
                      createdBy:
                          projectBeneficiary.clientAuditDetails!.createdBy,
                      createdTime:
                          projectBeneficiary.clientAuditDetails!.createdTime,
                      lastModifiedBy:
                          projectBeneficiary.clientAuditDetails!.lastModifiedBy,
                      lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
                    )
                  : null,
            ),
          );
        }
      }

      // Search for household members associated with the deleted individual.
      final householdMember =
          await householdMemberRepository.search(HouseholdMemberSearchModel(
        householdClientReferenceId: [event.householdModel.clientReferenceId],
        individualClientReferenceId: [i.clientReferenceId],
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

    if (BeneficiaryType.household == event.projectBeneficiaryType) {
      // Delete the project beneficiary associated with the household.
      final ProjectBeneficiaryModel? existingProjectBeneficiary =
          (await projectBeneficiaryRepository
                  .search(ProjectBeneficiarySearchModel(
        clientReferenceId: [event.projectBeneficiaryModel.clientReferenceId],
      )))
              .firstOrNull;
      await projectBeneficiaryRepository.delete(
        event.projectBeneficiaryModel.copyWith(
          id: existingProjectBeneficiary?.id,
          rowVersion: existingProjectBeneficiary?.rowVersion ?? 1,
          nonRecoverableError:
              existingProjectBeneficiary?.nonRecoverableError ?? false,
        ),
      );
    }
  }

  // This function handles the deletion of an individual from a household.
  FutureOr<void> _handleDeleteIndividual(
    HouseholdOverviewDeleteIndividualEvent event,
    HouseholdOverviewEmitter emit,
  ) async {
// Delete the individual from the repository.
    final IndividualModel? existingIndividual =
        (await individualRepository.search(IndividualSearchModel(
      clientReferenceId: [event.individualModel.clientReferenceId],
    )))
            .firstOrNull;
    await individualRepository.delete(event.individualModel.copyWith(
      id: existingIndividual?.id,
      rowVersion: existingIndividual?.rowVersion ?? 1,
      nonRecoverableError: existingIndividual?.nonRecoverableError ?? false,
    ));
    if (event.projectBeneficiaryType == BeneficiaryType.individual) {
      // Search for project beneficiary associated with the deleted individual.
      final projectBeneficiaries = await projectBeneficiaryRepository.search(
        ProjectBeneficiarySearchModel(
          beneficiaryClientReferenceId: [
            event.individualModel.clientReferenceId,
          ],
        ),
      );
      // Delete the associated project beneficiaries.
      for (final projectBeneficiary in projectBeneficiaries) {
        await projectBeneficiaryRepository.delete(
          projectBeneficiary.copyWith(
            rowVersion: projectBeneficiary.rowVersion,
            clientAuditDetails: (projectBeneficiary
                            .clientAuditDetails?.createdBy !=
                        null &&
                    projectBeneficiary.clientAuditDetails?.createdTime != null)
                ? ClientAuditDetails(
                    createdBy: projectBeneficiary.clientAuditDetails!.createdBy,
                    createdTime:
                        projectBeneficiary.clientAuditDetails!.createdTime,
                    lastModifiedBy:
                        projectBeneficiary.clientAuditDetails!.lastModifiedBy,
                    lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
                  )
                : null,
          ),
        );
      }
    }
    // Search for household members associated with the deleted individual.
    final householdMembers = await householdMemberRepository.search(
      HouseholdMemberSearchModel(
        individualClientReferenceId: [event.individualModel.clientReferenceId],
        householdClientReferenceId: [event.householdModel.clientReferenceId],
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
          memberRelationships: i.memberRelationships?.map((e) => e.copyWith(
            clientAuditDetails: (e.clientAuditDetails?.createdBy != null &&
                e.clientAuditDetails?.createdTime != null)
                ? ClientAuditDetails(
              createdBy: e.clientAuditDetails!.createdBy,
              createdTime: e.clientAuditDetails!.createdTime,
              lastModifiedBy: e.clientAuditDetails!.lastModifiedBy,
              lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
            ): null,
            rowVersion: e.rowVersion,
          )).toList(),
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
        householdClientReferenceId: [event.householdModel.clientReferenceId],
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

  const factory HouseholdOverviewEvent.reload(
      {required String projectId,
      required BeneficiaryType projectBeneficiaryType,
      int? offset,
      int? limit,
      List<String>? selectedFilter,
      String? searchByName}) = HouseholdOverviewReloadEvent;
}

@freezed
class HouseholdOverviewState with _$HouseholdOverviewState {
  const factory HouseholdOverviewState({
    @Default(false) bool loading,
    required HouseholdMemberWrapper householdMemberWrapper,
    IndividualModel? selectedIndividual,
    int? offset,
    int? limit,
  }) = _HouseholdOverviewState;
}
