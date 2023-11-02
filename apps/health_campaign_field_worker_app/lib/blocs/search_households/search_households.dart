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

    final List<IndividualModel> individuals = await individual.search(
      IndividualSearchModel(
        clientReferenceId:
            beneficiaries.map((e) => e.beneficiaryClientReferenceId!).toList(),
      ),
    );

    // Initialize a list to store household member wrappers.
    final containers = <HouseholdMemberWrapper>[];
    if (individuals.isNotEmpty) {
      final member = await householdMember.search(
        HouseholdMemberSearchModel(
          individualClientReferenceId:
              individuals.map((e) => e.clientReferenceId).toList().first,
        ),
      );

      final members = await householdMember.search(
        HouseholdMemberSearchModel(
          householdClientReferenceId: member.first.householdClientReferenceId,
          isHeadOfHousehold: true,
        ),
      );

      final householdList = await household.search(HouseholdSearchModel(
        clientReferenceId: [members.first.householdClientReferenceId!],
      ));

      // Search for tasks and side effects based on project beneficiaries.
      final tasks = await fetchTaskbyProjectBeneficiary(beneficiaries);

      final sideEffects =
          await sideEffectDataRepository.search(SideEffectSearchModel(
        taskClientReferenceId: tasks.map((e) => e.clientReferenceId).toList(),
      ));

      // Group household members by household client reference ID.

      containers.add(
        HouseholdMemberWrapper(
          household: householdList.first,
          headOfHousehold: individuals.first,
          members: individuals,
          projectBeneficiaries: beneficiaries,
          tasks: tasks.isEmpty ? null : tasks,
          sideEffects: sideEffects.isEmpty ? null : sideEffects,
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
    // Perform a series of asynchronous data retrieval operations based on the search criteria.

    // Fetch household results based on proximity and other criteria.
    final List<HouseholdModel> proximityBasedResults =
        await addressRepository.searchHouseHoldbyAddress(AddressSearchModel(
      latitude: event.latitude,
      longitude: event.longititude,
      maxRadius: event.maxRadius,
    ));

    // Fetch individual results based on proximity and other criteria.
    final List<IndividualModel> proximityBasedIndividualResults =
        await addressRepository.searchHouseHoldByIndividual(AddressSearchModel(
      latitude: event.latitude,
      longitude: event.longititude,
      maxRadius: event.maxRadius,
    ));

    // Extract individual IDs from proximity-based individual results.
    final indIds = proximityBasedIndividualResults
        .map((e) => e.clientReferenceId)
        .toList();

    // Search for individual results using the extracted IDs and search text.
    final List<IndividualModel> indResults = await individual.search(
      IndividualSearchModel(
        clientReferenceId: indIds,
      ),
    );

    // Search for individual results based on the search text only.

    // Initialize a list to store household members.
    final householdMembers = <HouseholdMemberModel>[];

    // Determine the source of results based on proximity and beneficiary type.
    final r = beneficiaryType != BeneficiaryType.individual
        ? proximityBasedResults
        : indResults;

    // Iterate through the results and retrieve household members.
    for (final element in r) {
      // Determine the type of household members based on proximity and beneficiary type.
      final members = beneficiaryType != BeneficiaryType.individual
          ? await fetchHouseholdMembers(
              (element as HouseholdModel).clientReferenceId,
              null,
              true,
            )
          : await fetchHouseholdMembers(
              null,
              (element as IndividualModel).clientReferenceId,
              true,
            );

      // Retrieve all household members associated with each member.
      for (final member in members) {
        final allHouseholdMembers = await householdMember.search(
          HouseholdMemberSearchModel(
            householdClientReferenceId: member.householdClientReferenceId,
          ),
        );

        householdMembers.addAll(allHouseholdMembers);
      }
    }

    // Initialize a list to store household member wrappers.
    final containers = <HouseholdMemberWrapper>[];

    // Group household members by household client reference ID.
    final groupedHouseholds = householdMembers
        .groupListsBy((element) => element.householdClientReferenceId);

    // Iterate through grouped households and retrieve additional data.
    for (final entry in groupedHouseholds.entries) {
      final householdId = entry.key;

      // Extract individual IDs from household members.
      final individualIds = entry.value
          .map((element) => element.individualClientReferenceId)
          .whereNotNull()
          .toList();

      if (householdId == null) continue;

      // Search for households based on client reference ID and proximity.
      final households = await household.search(
        HouseholdSearchModel(
          clientReferenceId: [householdId],
          latitude: event.latitude,
          longitude: event.longititude,
          maxRadius: event.maxRadius,
        ),
      );

      if (households.isEmpty) continue;

      // Retrieve the first household result.
      final resultHousehold = households.first;

      // Search for individuals based on proximity, beneficiary type, and search text.
      final individuals = await fetchIndividuals(individualIds, null);
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

      // Search for project beneficiaries based on client reference ID and project.
      final projectBeneficiaries = await fetchProjectBeneficiary(
        beneficiaryType != BeneficiaryType.individual
            ? [resultHousehold.clientReferenceId]
            : individualIds,
      );

      if (projectBeneficiaries.isEmpty) continue;

      // Search for tasks and side effects based on project beneficiaries.
      final tasks = await fetchTaskbyProjectBeneficiary(projectBeneficiaries);

      final sideEffects =
          await sideEffectDataRepository.search(SideEffectSearchModel(
        taskClientReferenceId: tasks.map((e) => e.clientReferenceId).toList(),
      ));

      final referrals = await referralDataRepository.search(ReferralSearchModel(
        projectBeneficiaryClientReferenceId:
            projectBeneficiaries.map((e) => e.clientReferenceId).toList(),
      ));

      // Create a container for household members and associated data.
      containers.add(
        HouseholdMemberWrapper(
          household: resultHousehold,
          headOfHousehold: head,
          members: individuals,
          projectBeneficiaries: projectBeneficiaries,
          tasks: tasks.isEmpty ? null : tasks,
          sideEffects: sideEffects.isEmpty ? null : sideEffects,
          referrals: referrals.isEmpty ? null : referrals,
        ),
      );
    }

    // Update the state with the results and mark the search as completed.
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
    final List<HouseholdModel> proximityBasedResults =
        await addressRepository.searchHouseHoldbyAddress(AddressSearchModel(
      latitude: event.latitude,
      longitude: event.longitude,
      maxRadius: event.maxRadius,
    ));

    // Fetch individual results based on proximity and other criteria.
    final List<IndividualModel> proximityBasedIndividualResults =
        await addressRepository.searchHouseHoldByIndividual(AddressSearchModel(
      latitude: event.latitude,
      longitude: event.longitude,
      maxRadius: event.maxRadius,
    ));

    // Extract individual IDs from proximity-based individual results.
    final indIds = proximityBasedIndividualResults
        .map((e) => e.clientReferenceId)
        .toList();

    // Search for individual results using the extracted IDs and search text.
    final List<IndividualModel> indResults = await individual.search(
      IndividualSearchModel(
        clientReferenceId: indIds,
        name: NameSearchModel(givenName: event.searchText.trim()),
      ),
    );

    // Search for individual results based on the search text only.
    final List<IndividualModel> results = await individual.search(
      IndividualSearchModel(
        name: NameSearchModel(givenName: event.searchText.trim()),
      ),
    );

    // Initialize a list to store household members.
    final householdMembers = <HouseholdMemberModel>[];

    // Determine the source of results based on proximity and beneficiary type.
    final r = event.isProximityEnabled
        ? beneficiaryType != BeneficiaryType.individual
            ? proximityBasedResults
            : indResults
        : results;

    // Iterate through the results and retrieve household members.
    for (final element in r) {
      // Determine the type of household members based on proximity and beneficiary type.

      final isProximityEnabled = event.isProximityEnabled;
      final isNotIndividual = beneficiaryType != BeneficiaryType.individual;
      final clientReferenceId = (element as IndividualModel).clientReferenceId;

      String? param1, param2;
      bool? param3;

      if (isProximityEnabled) {
        if (isNotIndividual) {
          param1 = clientReferenceId;
          param2 = null;
          param3 = true;
        } else {
          param1 = null;
          param2 = clientReferenceId;
          param3 = null;
        }
      } else {
        param1 = null;
        param2 = clientReferenceId;
        param3 = isNotIndividual ? true : null;
      }

      final members = await fetchHouseholdMembers(param1, param2, param3);

      // Retrieve all household members associated with each member.
      for (final member in members) {
        final allHouseholdMembers = await fetchHouseholdMembers(
          member.householdClientReferenceId,
          null,
          null,
        );

        householdMembers.addAll(allHouseholdMembers);
      }
    }

    // Initialize a list to store household member wrappers.
    final containers = <HouseholdMemberWrapper>[];

    // Group household members by household client reference ID.
    final groupedHouseholds = householdMembers
        .groupListsBy((element) => element.householdClientReferenceId);

    // Iterate through grouped households and retrieve additional data.
    for (final entry in groupedHouseholds.entries) {
      final householdId = entry.key;

      // Extract individual IDs from household members.
      final individualIds = entry.value
          .map((element) => element.individualClientReferenceId)
          .whereNotNull()
          .toList();

      if (householdId == null) continue;

      // Search for households based on client reference ID and proximity.
      final households = await household.search(
        HouseholdSearchModel(
          clientReferenceId: [householdId],
          latitude: event.latitude,
          longitude: event.longitude,
          maxRadius: event.maxRadius,
        ),
      );

      if (households.isEmpty) continue;

      // Retrieve the first household result.
      final resultHousehold = households.first;

      // Search for individuals based on proximity, beneficiary type, and search text.
      final individuals = event.isProximityEnabled &&
              beneficiaryType != BeneficiaryType.individual
          ? await fetchIndividuals(individualIds, event.searchText.trim())
          : await fetchIndividuals(individualIds, null);

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

      // Search for project beneficiaries based on client reference ID and project.
      final projectBeneficiaries = await fetchProjectBeneficiary(
        beneficiaryType != BeneficiaryType.individual
            ? [
                resultHousehold.clientReferenceId,
              ]
            : individualIds,
      );
      if (projectBeneficiaries.isEmpty) continue;

      // Search for tasks and side effects based on project beneficiaries.
      final tasks = await fetchTaskbyProjectBeneficiary(projectBeneficiaries);

      final sideEffects =
          await sideEffectDataRepository.search(SideEffectSearchModel(
        taskClientReferenceId: tasks.map((e) => e.clientReferenceId).toList(),
      ));
      final referrals = await referralDataRepository.search(ReferralSearchModel(
        projectBeneficiaryClientReferenceId:
            projectBeneficiaries.map((e) => e.clientReferenceId).toList(),
      ));

      // Create a container for household members and associated data.
      containers.add(
        HouseholdMemberWrapper(
          household: resultHousehold,
          headOfHousehold: head,
          members: individuals,
          projectBeneficiaries: projectBeneficiaries,
          tasks: tasks.isEmpty ? null : tasks,
          sideEffects: sideEffects.isEmpty ? null : sideEffects,
          referrals: referrals.isEmpty ? null : referrals,
        ),
      );
    }

    // Update the state with the results and mark the search as completed.
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
