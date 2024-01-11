// GENERATED using mason_cli
import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../data/repositories/local/address.dart';
import '../../models/data_model.dart';
import '../../utils/typedefs.dart';

part 'search_households.freezed.dart';

typedef SearchHouseholdsEmitter = Emitter<SearchHouseholdsState>;

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class SearchHouseholdsBloc
    extends Bloc<SearchHouseholdsEvent, SearchHouseholdsState> {
  final BeneficiaryType beneficiaryType;
  final String projectId;
  final String userUid;
  final IndividualDataRepository individual;
  final HouseholdDataRepository household;
  final AddressLocalRepository addressRepository;
  final HouseholdMemberDataRepository householdMember;
  final ProjectBeneficiaryDataRepository projectBeneficiary;
  final TaskDataRepository taskDataRepository;
  final SideEffectDataRepository sideEffectDataRepository;
  final ReferralDataRepository referralDataRepository;

  SearchHouseholdsBloc({
    required this.userUid,
    required this.projectId,
    required this.individual,
    required this.householdMember,
    required this.household,
    required this.projectBeneficiary,
    required this.taskDataRepository,
    required this.beneficiaryType,
    required this.sideEffectDataRepository,
    required this.addressRepository,
    required this.referralDataRepository,
  }) : super(const SearchHouseholdsState()) {
    on(
      _handleSearchByHouseholdHead,
      transformer: debounce<SearchHouseholdsSearchByHouseholdHeadEvent>(
        const Duration(milliseconds: 100),
      ),
    );
    on(_handleSearchByProximitity);
    on(_handleClear);
    on(_handleSearchByHousehold);
    on(_handleSearchByTag);
  }

  Future<void> _handleSearchByHousehold(
    SearchHouseholdsByHouseholdsEvent event,
    SearchHouseholdsEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      final householdMembers = await householdMember.search(
        HouseholdMemberSearchModel(
          householdClientReferenceId: event.householdModel.clientReferenceId,
        ),
      );

      final individuals = await fetchIndividuals(
        householdMembers
            .map((e) => e.individualClientReferenceId)
            .whereNotNull()
            .toList(),
        null,
      );

      final projectBeneficiaries = await fetchProjectBeneficiary(
        beneficiaryType == BeneficiaryType.individual
            ? individuals.map((e) => e.clientReferenceId).toList()
            : [event.householdModel.clientReferenceId],
      );

      final headOfHousehold = individuals.firstWhereOrNull(
        (element) =>
            element.clientReferenceId ==
            householdMembers.firstWhereOrNull(
              (element) {
                return element.isHeadOfHousehold;
              },
            )?.individualClientReferenceId,
      );
      final tasks = await fetchTaskbyProjectBeneficiary(projectBeneficiaries);

      final sideEffects =
          await sideEffectDataRepository.search(SideEffectSearchModel(
        taskClientReferenceId: tasks.map((e) => e.clientReferenceId).toList(),
      ));

      final referrals = await referralDataRepository.search(ReferralSearchModel(
        projectBeneficiaryClientReferenceId:
            projectBeneficiaries.map((e) => e.clientReferenceId).toList(),
      ));

      if (headOfHousehold == null) {
        emit(state.copyWith(
          loading: false,
          householdMembers: [],
        ));
      } else {
        final householdMemberWrapper = HouseholdMemberWrapper(
          household: event.householdModel,
          headOfHousehold: headOfHousehold,
          members: individuals,
          projectBeneficiaries: projectBeneficiaries,
          tasks: tasks.isNotEmpty ? tasks : null,
          sideEffects: sideEffects.isNotEmpty ? sideEffects : null,
          referrals: referrals.isNotEmpty ? referrals : null,
        );

        emit(
          state.copyWith(
            loading: false,
            householdMembers: [
              householdMemberWrapper,
            ],
            searchQuery: [
              headOfHousehold.name?.givenName,
              headOfHousehold.name?.familyName,
            ].whereNotNull().join(' '),
          ),
        );
      }
    } catch (error) {
      emit(state.copyWith(
        loading: false,
        householdMembers: [],
      ));
    }
  }

  FutureOr<void> _handleSearchByTag(
    SearchHouseholdsByTagEvent event,
    SearchHouseholdsEmitter emit,
  ) async {
    List<ProjectBeneficiaryModel> beneficiaries =
        await projectBeneficiary.search(
      ProjectBeneficiarySearchModel(
        tag: event.tag,
        projectId: event.projectId,
      ),
    );

/* [TODO: Need to handle the Tag search based on Beneficary Type
 current implementation is based on the individual based project
 ] */
    List<IndividualModel> individuals = [];
    List<HouseholdModel> households = [];

    if (beneficiaryType == BeneficiaryType.household) {
      households = await household.search(HouseholdSearchModel(
        clientReferenceId:
            beneficiaries.map((e) => e.beneficiaryClientReferenceId!).toList(),
      ));
      print(households.length);
    } else {
      individuals = await individual.search(
        IndividualSearchModel(
          clientReferenceId: beneficiaries
              .map((e) => e.beneficiaryClientReferenceId!)
              .toList(),
        ),
      );
      print(individuals.length);
    }

    // Initialize a list to store household member wrappers.
    final containers = <HouseholdMemberWrapper>[];
    if (individuals.isNotEmpty || households.isNotEmpty) {
      final hhMembers = beneficiaryType == BeneficiaryType.individual
          ? await householdMember.search(
              HouseholdMemberSearchModel(
                individualClientReferenceIds:
                    individuals.map((e) => e.clientReferenceId).toList(),
              ),
            )
          : await householdMember.search(
              HouseholdMemberSearchModel(
                householdClientReferenceIds:
                    households.map((e) => e.clientReferenceId).toList(),
              ),
            );
      final head = hhMembers.firstWhere((element) => element.isHeadOfHousehold);

      final members = await householdMember.search(
        HouseholdMemberSearchModel(
          householdClientReferenceId: head.householdClientReferenceId,
          isHeadOfHousehold: true,
        ),
      );

      final individualList = beneficiaryType == BeneficiaryType.household
          ? await individual.search(
              IndividualSearchModel(
                clientReferenceId: hhMembers
                    .map((e) => e.individualClientReferenceId!)
                    .toList(),
              ),
            )
          : individuals;

      final householdList = await household.search(HouseholdSearchModel(
        clientReferenceId: [members.first.householdClientReferenceId!],
      ));

      // Search for tasks and side effects based on project beneficiaries.
      final tasks = await fetchTaskbyProjectBeneficiary(beneficiaries);

      final referrals = await referralDataRepository.search(ReferralSearchModel(
        projectBeneficiaryClientReferenceId:
            beneficiaries.map((e) => e.clientReferenceId).toList(),
      ));
      final sideEffects =
          await sideEffectDataRepository.search(SideEffectSearchModel(
        taskClientReferenceId: tasks.map((e) => e.clientReferenceId).toList(),
      ));

      // Group household members by household client reference ID.

      containers.add(
        HouseholdMemberWrapper(
          household: householdList.first,
          headOfHousehold: individualList.first,
          members: individualList,
          projectBeneficiaries: beneficiaries,
          tasks: tasks.isEmpty ? null : tasks,
          sideEffects: sideEffects.isEmpty ? null : sideEffects,
          referrals: referrals.isEmpty ? null : referrals,
        ),
      );
    }

    emit(state.copyWith(
      householdMembers: containers,
      loading: false,
      tag: event.tag,
    ));
  }

  FutureOr<void> _handleSearchByProximitity(
    SearchHouseholdsByProximityEvent event,
    SearchHouseholdsEmitter emit,
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
    final househHoldIds = proximityBasedHouseholdsResults
        .map((e) => e.clientReferenceId)
        .toList();

    final List<HouseholdMemberModel> householdMembers =
        await fetchHouseholdMembersBulk(
      null,
      househHoldIds,
    );

    final List<String> individualClientReferenceIds = householdMembers
        .map((e) => e.individualClientReferenceId.toString())
        .toList();

    final List<IndividualModel> individuals = await individual.search(
      IndividualSearchModel(clientReferenceId: individualClientReferenceIds),
    );

    final projectBeneficiaries = await fetchProjectBeneficiary(
      beneficiaryType != BeneficiaryType.individual
          ? househHoldIds
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
      final householdresult = proximityBasedHouseholdsResults
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
              : househHoldIds.contains(element.beneficiaryClientReferenceId))
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
            household: householdresult,
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

  FutureOr<void> _handleSearchByHouseholdHead(
    SearchHouseholdsSearchByHouseholdHeadEvent event,
    SearchHouseholdsEmitter emit,
  ) async {
    // Check if the search text is empty; if so, clear the results and return.
    if (event.searchText.trim().isEmpty) {
      emit(state.copyWith(
        householdMembers: [],
        searchQuery: null,
        loading: false,
      ));

      return;
    }

    // Update the state to indicate that the search is in progress.
    emit(state.copyWith(
      loading: true,
      searchQuery: event.searchText,
    ));

    // Perform a series of asynchronous data retrieval operations based on the search criteria.

    // Fetch household results based on proximity and other criteria.

    List<IndividualModel> individuals = [];
    List<IndividualModel> proximityBasedIndividualResults = [];
    List<SideEffectModel> sideEffects = [];
    final containers = <HouseholdMemberWrapper>[];
    List<ReferralModel> referrals = [];
    List<TaskModel> tasks = [];

    if (event.isProximityEnabled) {
      // Fetch individual results based on proximity and other criteria.
      proximityBasedIndividualResults = await addressRepository
          .searchHouseHoldByIndividual(AddressSearchModel(
        latitude: event.latitude,
        longitude: event.longitude,
        maxRadius: event.maxRadius,
      ));
    }
    // Extract individual IDs from proximity-based individual results.
    final List<String> individualIds = proximityBasedIndividualResults
        .map((e) => e.clientReferenceId)
        .toList();

    individuals = await individual.search(
      event.isProximityEnabled
          ? IndividualSearchModel(
              clientReferenceId: individualIds,
              name: NameSearchModel(givenName: event.searchText.trim()),
            )
          : IndividualSearchModel(
              name: NameSearchModel(givenName: event.searchText.trim()),
            ),
    );

    final individualClientReferenceIds =
        individuals.map((e) => e.clientReferenceId).toList();
    // Search for individual results using the extracted IDs and search text.
    final List<HouseholdMemberModel> householdMembers =
        await fetchHouseholdMembersBulk(
      individualClientReferenceIds,
      null,
    );

    final househHoldIds =
        householdMembers.map((e) => e.householdClientReferenceId!).toList();
    final List<HouseholdMemberModel> allhouseholdMembers =
        await fetchHouseholdMembersBulk(
      null,
      househHoldIds,
    );

    final List<IndividualModel> individualMembers =
        await individual.search(IndividualSearchModel(
      clientReferenceId: allhouseholdMembers
          .map((e) => e.individualClientReferenceId.toString())
          .toList(),
    ));
    final List<HouseholdModel> houseHolds = await household.search(
      HouseholdSearchModel(
        clientReferenceId: househHoldIds,
      ),
    );

    final projectBeneficiaries = await fetchProjectBeneficiary(
      beneficiaryType != BeneficiaryType.individual
          ? househHoldIds
          : allhouseholdMembers
              .map((e) => e.individualClientReferenceId.toString())
              .toList(),
    );

    // Search for individual results based on the search text only.

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

    // Initialize a list to store household members.
    final groupedHouseholds = allhouseholdMembers
        .groupListsBy((element) => element.householdClientReferenceId);

    // Iterate through grouped households and retrieve additional data.
    for (final entry in groupedHouseholds.entries) {
      final householdId = entry.key;

      if (householdId == null) continue;
      // Retrieve the first household result.
      final householdresult =
          houseHolds.firstWhere((e) => e.clientReferenceId == householdId);
      // Search for individuals based on proximity, beneficiary type, and search text.
      final List<String?> membersIds =
          entry.value.map((e) => e.individualClientReferenceId).toList();
      final List<IndividualModel> individualMembersList = individualMembers
          .where((element) => membersIds.contains(element.clientReferenceId))
          .toList();
      final List<ProjectBeneficiaryModel> beneficiaries = projectBeneficiaries
          .where((element) => beneficiaryType == BeneficiaryType.individual
              ? individualClientReferenceIds
                  .contains(element.beneficiaryClientReferenceId)
              : (househHoldIds).contains(element.beneficiaryClientReferenceId))
          .toList();
      // Find the head of household from the individuals.
      final head = individualMembersList.firstWhereOrNull(
        (element) =>
            element.clientReferenceId ==
            entry.value
                .firstWhereOrNull(
                  (element) => element.isHeadOfHousehold,
                )
                ?.individualClientReferenceId,
      );

      if (head == null) continue;

      // Search for project beneficiaries based on client reference ID and project.

      if (beneficiaries.isNotEmpty) {
        // Create a container for household members and associated data.
        containers.add(
          HouseholdMemberWrapper(
            household: householdresult,
            headOfHousehold: head,
            members: individualMembersList,
            projectBeneficiaries: beneficiaries,
            tasks: tasks.isEmpty ? null : tasks,
            sideEffects: sideEffects.isEmpty ? null : sideEffects,
            referrals: referrals.isEmpty ? null : referrals,
          ),
        );
      }

      // Update the state with the results and mark the search as completed.
    }
    emit(state.copyWith(
      householdMembers: containers,
      loading: false,
    ));
  }

  FutureOr<void> _handleClear(
    SearchHouseholdsClearEvent event,
    SearchHouseholdsEmitter emit,
  ) async {
    emit(state.copyWith(
      searchQuery: null,
      householdMembers: [],
    ));
  }

// Fetch the HouseHold Members

  Future<List<HouseholdMemberModel>> fetchHouseholdMembers(
    String? householdClientReferenceId,
    String? individualClientReferenceId,
    bool? isHeadOfHousehold,
  ) async {
    return await householdMember.search(
      HouseholdMemberSearchModel(
        householdClientReferenceId: householdClientReferenceId,
        individualClientReferenceId: individualClientReferenceId,
        isHeadOfHousehold: isHeadOfHousehold,
      ),
    );
  }

  Future<List<HouseholdMemberModel>> fetchHouseholdMembersBulk(
    List<String>? individualClientReferenceIds,
    List<String>? householdClientReferenceIds,
  ) async {
    return await householdMember.search(
      HouseholdMemberSearchModel(
        individualClientReferenceIds: individualClientReferenceIds,
        householdClientReferenceIds: householdClientReferenceIds,
      ),
    );
  }

// Fetch the task
  Future<List<TaskModel>> fetchTaskbyProjectBeneficiary(
    List<ProjectBeneficiaryModel> projectBeneficiaries,
  ) async {
    return await taskDataRepository.search(TaskSearchModel(
      projectBeneficiaryClientReferenceId:
          projectBeneficiaries.map((e) => e.clientReferenceId).toList(),
    ));
  }

  // Fetch the project Beneficiary

  Future<List<ProjectBeneficiaryModel>> fetchProjectBeneficiary(
    List<String> projectBeneficiariesIds,
  ) async {
    return await projectBeneficiary.search(
      ProjectBeneficiarySearchModel(
        projectId: projectId,
        beneficiaryClientReferenceId: projectBeneficiariesIds,
      ),
    );
  }

  Future<List<IndividualModel>> fetchIndividuals(
    List<String> individualIds,
    String? name,
  ) async {
    return await individual.search(
      IndividualSearchModel(
        clientReferenceId: individualIds,
        name: name != null ? NameSearchModel(givenName: name.trim()) : null,
      ),
    );
  }
}

@freezed
class SearchHouseholdsEvent with _$SearchHouseholdsEvent {
  const factory SearchHouseholdsEvent.initialize() =
      SearchHouseholdsInitializedEvent;

  const factory SearchHouseholdsEvent.searchByHousehold({
    required String projectId,
    double? latitude,
    double? longitude,
    double? maxRadius,
    required final bool isProximityEnabled,
    required HouseholdModel householdModel,
  }) = SearchHouseholdsByHouseholdsEvent;

  const factory SearchHouseholdsEvent.searchByHouseholdHead({
    required String searchText,
    required String projectId,
    required final bool isProximityEnabled,
    double? latitude,
    double? longitude,
    double? maxRadius,
  }) = SearchHouseholdsSearchByHouseholdHeadEvent;

  const factory SearchHouseholdsEvent.searchByProximity({
    required double latitude,
    required double longititude,
    required String projectId,
    required double maxRadius,
    required int offset,
    required int limit,
  }) = SearchHouseholdsByProximityEvent;

  const factory SearchHouseholdsEvent.searchByTag({
    required String tag,
    required String projectId,
  }) = SearchHouseholdsByTagEvent;

  const factory SearchHouseholdsEvent.clear() = SearchHouseholdsClearEvent;
}

@freezed
class SearchHouseholdsState with _$SearchHouseholdsState {
  const SearchHouseholdsState._();

  const factory SearchHouseholdsState({
    @Default(false) bool loading,
    String? searchQuery,
    String? tag,
    @Default([]) List<HouseholdMemberWrapper> householdMembers,
  }) = _SearchHouseholdsState;

  bool get resultsNotFound {
    if (loading) return false;

    if (searchQuery?.isEmpty ?? true && tag == null) return false;

    return householdMembers.isEmpty;
  }
}

@freezed
class HouseholdMemberWrapper with _$HouseholdMemberWrapper {
  const factory HouseholdMemberWrapper({
    required HouseholdModel household,
    required IndividualModel headOfHousehold,
    required List<IndividualModel> members,
    required List<ProjectBeneficiaryModel> projectBeneficiaries,
    double? distance,
    List<TaskModel>? tasks,
    List<SideEffectModel>? sideEffects,
    List<ReferralModel>? referrals,
  }) = _HouseholdMemberWrapper;
}
