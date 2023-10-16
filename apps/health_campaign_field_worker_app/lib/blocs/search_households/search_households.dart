// GENERATED using mason_cli
import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../data/repositories/local/adverse_event.dart';
import '../../data/repositories/local/address.dart';
import '../../data/repositories/local/side_effect.dart';
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
    on(_handleInitialize);

    if (sideEffectDataRepository is SideEffectLocalRepository) {
      (sideEffectDataRepository as SideEffectLocalRepository).listenToChanges(
        query: SideEffectSearchModel(
          projectId: projectId,
        ),
        listener: (data) {
          add(const SearchHouseholdsInitializedEvent());
        },
      );
    }

    if (adverseEventDataRepository is AdverseEventLocalRepository) {
      (adverseEventDataRepository as AdverseEventLocalRepository)
          .listenToChanges(
        query: AdverseEventSearchModel(
          projectId: projectId,
        ),
        listener: (data) {
          add(const SearchHouseholdsInitializedEvent());
        },
      );
    }
  }

  void _handleInitialize(
    SearchHouseholdsInitializedEvent event,
    SearchHouseholdsEmitter emit,
  ) async {
    final beneficiaries = await projectBeneficiary.search(
      ProjectBeneficiarySearchModel(
        projectId: projectId,
      ),
    );

    final tasks = await taskDataRepository.search(
      TaskSearchModel(
        projectId: projectId,
      ),
    );

    final sideEffects = await sideEffectDataRepository.search(
      SideEffectSearchModel(projectId: projectId),
    );
    final interventionDelivered = tasks
        .where((element) => element.projectId == projectId)
        .whereNotNull()
        .map(
          (task) {
            return task.resources?.where((element) {
              return element.auditDetails?.createdBy == userUid;
            }).map(
              (taskResource) {
                return int.tryParse(taskResource.quantity ?? '0');
              },
            ).whereNotNull();
          },
        )
        .whereNotNull()
        .expand((element) => [...element])
        .fold(0, (previousValue, element) => previousValue + element);

    final observedSideEffects = sideEffects.length;

    emit(state.copyWith(
      registeredHouseholds: beneficiaries.where((element) {
        return element.auditDetails?.createdBy == userUid;
      }).length,
      deliveredInterventions: interventionDelivered,
      sideEffectsObserved: observedSideEffects,
    ));
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

      final individuals = await individual.search(
        IndividualSearchModel(
          clientReferenceId: householdMembers
              .map((e) => e.individualClientReferenceId)
              .whereNotNull()
              .toList(),
        ),
      );

      final projectBeneficiaries = await projectBeneficiary.search(
        ProjectBeneficiarySearchModel(
          projectId: event.projectId,
          beneficiaryClientReferenceId:
              beneficiaryType == BeneficiaryType.individual
                  ? individuals.map((e) => e.clientReferenceId).toList()
                  : [event.householdModel.clientReferenceId],
        ),
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
          ? await householdMember.search(
              HouseholdMemberSearchModel(
                householdClientReferenceId:
                    (element as HouseholdModel).clientReferenceId,
                isHeadOfHousehold: true,
              ),
            )
          : await householdMember.search(
              HouseholdMemberSearchModel(
                individualClientReferenceId:
                    (element as IndividualModel).clientReferenceId,
              ),
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
      final individuals = await individual.search(
        IndividualSearchModel(
          clientReferenceId: individualIds,
        ),
      );

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
      final projectBeneficiaries = beneficiaryType != BeneficiaryType.individual
          ? await projectBeneficiary.search(
              ProjectBeneficiarySearchModel(
                beneficiaryClientReferenceId: [
                  resultHousehold.clientReferenceId,
                ],
                projectId: event.projectId,
              ),
            )
          : await projectBeneficiary.search(
              ProjectBeneficiarySearchModel(
                beneficiaryClientReferenceId: individualIds,
                projectId: event.projectId,
              ),
            );

      if (projectBeneficiaries.isEmpty) continue;

      // Search for tasks and side effects based on project beneficiaries.
      final tasks = await taskDataRepository.search(TaskSearchModel(
        projectBeneficiaryClientReferenceId:
            projectBeneficiaries.map((e) => e.clientReferenceId).toList(),
      ));

      final sideEffects =
          await sideEffectDataRepository.search(SideEffectSearchModel(
        taskClientReferenceId: tasks.map((e) => e.clientReferenceId).toList(),
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
      final members = event.isProximityEnabled
          ? beneficiaryType != BeneficiaryType.individual
              ? await householdMember.search(
                  HouseholdMemberSearchModel(
                    householdClientReferenceId:
                        (element as HouseholdModel).clientReferenceId,
                    isHeadOfHousehold: true,
                  ),
                )
              : await householdMember.search(
                  HouseholdMemberSearchModel(
                    individualClientReferenceId:
                        (element as IndividualModel).clientReferenceId,
                  ),
                )
          : beneficiaryType != BeneficiaryType.individual
              ? await householdMember.search(
                  HouseholdMemberSearchModel(
                    individualClientReferenceId:
                        (element as IndividualModel).clientReferenceId,
                    isHeadOfHousehold: true,
                  ),
                )
              : await householdMember.search(
                  HouseholdMemberSearchModel(
                    individualClientReferenceId:
                        (element as IndividualModel).clientReferenceId,
                  ),
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
          ? await individual.search(
              IndividualSearchModel(
                clientReferenceId: individualIds,
                name: NameSearchModel(givenName: event.searchText.trim()),
              ),
            )
          : await individual.search(
              IndividualSearchModel(
                clientReferenceId: individualIds,
              ),
            );

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
      final projectBeneficiaries = beneficiaryType != BeneficiaryType.individual
          ? await projectBeneficiary.search(
              ProjectBeneficiarySearchModel(
                beneficiaryClientReferenceId: [
                  resultHousehold.clientReferenceId,
                ],
                projectId: event.projectId,
              ),
            )
          : await projectBeneficiary.search(
              ProjectBeneficiarySearchModel(
                beneficiaryClientReferenceId: individualIds,
                projectId: event.projectId,
              ),
            );

      if (projectBeneficiaries.isEmpty) continue;

      // Search for tasks and side effects based on project beneficiaries.
      final tasks = await taskDataRepository.search(TaskSearchModel(
        projectBeneficiaryClientReferenceId:
            projectBeneficiaries.map((e) => e.clientReferenceId).toList(),
      ));

      final sideEffects =
          await sideEffectDataRepository.search(SideEffectSearchModel(
        taskClientReferenceId: tasks.map((e) => e.clientReferenceId).toList(),
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

  const factory SearchHouseholdsEvent.clear() = SearchHouseholdsClearEvent;
}

@freezed
class SearchHouseholdsState with _$SearchHouseholdsState {
  const SearchHouseholdsState._();

  const factory SearchHouseholdsState({
    @Default(false) bool loading,
    String? searchQuery,
    @Default([]) List<HouseholdMemberWrapper> householdMembers,
    @Default(0) int registeredHouseholds,
    @Default(0) int deliveredInterventions,
    @Default(0) int sideEffectsObserved,
  }) = _SearchHouseholdsState;

  bool get resultsNotFound {
    if (loading) return false;
    if (searchQuery?.isEmpty ?? true) return false;

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
  }) = _HouseholdMemberWrapper;
}
