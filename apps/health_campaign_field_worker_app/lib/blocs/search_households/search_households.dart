// GENERATED using mason_cli
import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../data/repositories/local/project_beneficiary.dart';
import '../../data/repositories/local/task.dart';
import '../../models/data_model.dart';
import '../../utils/typedefs.dart';

part 'search_households.freezed.dart';

typedef SearchHouseholdsEmitter = Emitter<SearchHouseholdsState>;

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class SearchHouseholdsBloc
    extends Bloc<SearchHouseholdsEvent, SearchHouseholdsState> {
  final String projectId;
  final IndividualDataRepository individual;
  final HouseholdDataRepository household;
  final HouseholdMemberDataRepository householdMember;
  final ProjectBeneficiaryDataRepository projectBeneficiary;
  final TaskDataRepository taskDataRepository;

  SearchHouseholdsBloc({
    required this.projectId,
    required this.individual,
    required this.householdMember,
    required this.household,
    required this.projectBeneficiary,
    required this.taskDataRepository,
  }) : super(const SearchHouseholdsState()) {
    on(
      _handleSearchByHouseholdHead,
      transformer: debounce<SearchHouseholdsSearchByHouseholdHeadEvent>(
        const Duration(milliseconds: 500),
      ),
    );
    on(_handleClear);
    on(_handleInitialize);

    if (projectBeneficiary is ProjectBeneficiaryLocalRepository) {
      (projectBeneficiary as ProjectBeneficiaryLocalRepository).listenToChanges(
        query: ProjectBeneficiarySearchModel(
          projectId: projectId,
        ),
        listener: (data) {
          add(const SearchHouseholdsInitializedEvent());
        },
      );
    }

    if (taskDataRepository is TaskLocalRepository) {
      (taskDataRepository as TaskLocalRepository).listenToChanges(
        query: TaskSearchModel(
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

    final interventionDelivered = tasks
        .map(
          (task) {
            return task.resources?.map(
              (taskResource) {
                return int.tryParse(taskResource.quantity ?? '0');
              },
            ).whereNotNull();
          },
        )
        .whereNotNull()
        .expand((element) => [...element])
        .fold(0, (previousValue, element) => previousValue + element);

    emit(state.copyWith(
      registeredHouseholds: beneficiaries.length,
      deliveredInterventions: interventionDelivered,
    ));
  }

  FutureOr<void> _handleSearchByHouseholdHead(
    SearchHouseholdsSearchByHouseholdHeadEvent event,
    SearchHouseholdsEmitter emit,
  ) async {
    if (event.searchText.trim().isEmpty) {
      emit(state.copyWith(
        householdMembers: [],
        searchQuery: null,
        loading: false,
      ));

      return;
    }
    emit(state.copyWith(
      loading: true,
      searchQuery: event.searchText,
    ));

    final results = await individual.search(
      IndividualSearchModel(
        name: NameSearchModel(givenName: event.searchText.trim()),
      ),
    );

    final householdMembers = <HouseholdMemberModel>[];
    for (final element in results) {
      final members = await householdMember.search(
        HouseholdMemberSearchModel(
          individualClientReferenceId: element.clientReferenceId,
          isHeadOfHousehold: true,
        ),
      );

      for (final member in members) {
        final allHouseholdMembers = await householdMember.search(
          HouseholdMemberSearchModel(
            householdClientReferenceId: member.householdClientReferenceId,
          ),
        );

        householdMembers.addAll(allHouseholdMembers);
      }
    }

    final containers = <HouseholdMemberWrapper>[];
    final groupedHouseholds = householdMembers
        .groupListsBy((element) => element.householdClientReferenceId);

    for (final entry in groupedHouseholds.entries) {
      final householdId = entry.key;
      final individualIds = entry.value
          .map((element) => element.individualClientReferenceId)
          .whereNotNull()
          .toList();

      if (householdId == null) continue;

      final households = await household.search(
        HouseholdSearchModel(clientReferenceId: [householdId]),
      );

      if (households.isEmpty) continue;

      final resultHousehold = households.first;

      final individuals = await individual.search(
        IndividualSearchModel(clientReferenceId: individualIds),
      );

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

      final projectBeneficiaries = await projectBeneficiary.search(
        ProjectBeneficiarySearchModel(
          beneficiaryClientReferenceId: resultHousehold.clientReferenceId,
          projectId: event.projectId,
        ),
      );

      if (projectBeneficiaries.isEmpty) continue;
      final tasks = await taskDataRepository.search(TaskSearchModel(
        projectBeneficiaryClientReferenceId:
            projectBeneficiaries.first.clientReferenceId,
      ));

      containers.add(
        HouseholdMemberWrapper(
          household: resultHousehold,
          headOfHousehold: head,
          members: individuals,
          projectBeneficiary: projectBeneficiaries.first,
          task: tasks.isEmpty ? null : tasks.first,
        ),
      );
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
    emit(const SearchHouseholdsState(
      searchQuery: null,
      householdMembers: [],
    ));
  }
}

@freezed
class SearchHouseholdsEvent with _$SearchHouseholdsEvent {
  const factory SearchHouseholdsEvent.initialize() =
      SearchHouseholdsInitializedEvent;

  const factory SearchHouseholdsEvent.searchByHouseholdHead({
    required String searchText,
    required String projectId,
  }) = SearchHouseholdsSearchByHouseholdHeadEvent;

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
    required ProjectBeneficiaryModel projectBeneficiary,
    TaskModel? task,
  }) = _HouseholdMemberWrapper;
}
