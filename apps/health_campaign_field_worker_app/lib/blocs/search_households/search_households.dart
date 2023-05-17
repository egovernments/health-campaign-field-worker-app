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
  final BeneficiaryType beneficiaryType;
  final String projectId;
  final String userUid;
  final IndividualDataRepository individual;
  final HouseholdDataRepository household;
  final HouseholdMemberDataRepository householdMember;
  final ProjectBeneficiaryDataRepository projectBeneficiary;
  final TaskDataRepository taskDataRepository;

  SearchHouseholdsBloc({
    required this.userUid,
    required this.projectId,
    required this.individual,
    required this.householdMember,
    required this.household,
    required this.projectBeneficiary,
    required this.taskDataRepository,
    required this.beneficiaryType,
  }) : super(const SearchHouseholdsState()) {
    on(
      _handleSearchByHouseholdHead,
      transformer: debounce<SearchHouseholdsSearchByHouseholdHeadEvent>(
        const Duration(milliseconds: 100),
      ),
    );
    on(_handleClear);
    on(_handleSearchByHousehold);
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

    emit(state.copyWith(
      registeredHouseholds: beneficiaries.where((element) {
        return element.auditDetails?.createdBy == userUid;
      }).length,
      deliveredInterventions: interventionDelivered,
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

          //[TODO] Need to check for beneficiaryId
        ),
      );

      final projectBeneficiaryModel = projectBeneficiaries;
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
          projectBeneficiaries: projectBeneficiaryModel,
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

      final projectBeneficiaries = beneficiaryType != BeneficiaryType.individual
          ? await projectBeneficiary.search(
              ProjectBeneficiarySearchModel(
                beneficiaryClientReferenceId: [
                  resultHousehold.clientReferenceId,
                ],
                //[TODO] Need to check for beneficiaryId
                projectId: event.projectId,
              ),
            )
          : await projectBeneficiary.search(
              ProjectBeneficiarySearchModel(
                beneficiaryClientReferenceId: individualIds,
                //[TODO] Need to check for beneficiaryId
                projectId: event.projectId,
              ),
            );

      if (projectBeneficiaries.isEmpty) continue;
      final tasks = await taskDataRepository.search(TaskSearchModel(
        projectBeneficiaryClientReferenceId:
            projectBeneficiaries.map((e) => e.clientReferenceId).toList(),
      ));

      containers.add(
        HouseholdMemberWrapper(
          household: resultHousehold,
          headOfHousehold: head,
          members: individuals,
          projectBeneficiaries: projectBeneficiaries,
          tasks: tasks.isEmpty ? null : tasks,
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
    required HouseholdModel householdModel,
  }) = SearchHouseholdsByHouseholdsEvent;

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
    required List<ProjectBeneficiaryModel> projectBeneficiaries,
    List<TaskModel>? tasks,
  }) = _HouseholdMemberWrapper;
}
