// GENERATED using mason_cli
import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../data/data_repository.dart';
import '../../models/data_model.dart';

part 'search_households.freezed.dart';

typedef SearchHouseholdsEmitter = Emitter<SearchHouseholdsState>;

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class SearchHouseholdsBloc
    extends Bloc<SearchHouseholdsEvent, SearchHouseholdsState> {
  final DataRepository<IndividualModel, IndividualSearchModel> individual;

  final DataRepository<HouseholdMemberModel, HouseholdMemberSearchModel>
      householdMember;

  final DataRepository<ProjectBeneficiaryModel, ProjectBeneficiarySearchModel>
      projectBeneficiaryMember;

  final DataRepository<HouseholdModel, HouseholdSearchModel> household;

  SearchHouseholdsBloc({
    required this.individual,
    required this.householdMember,
    required this.household,
    required this.projectBeneficiaryMember,
  }) : super(const SearchHouseholdsEmptyState()) {
    on(
      _handleSearchByHouseholdHead,
      transformer: debounce<SearchHouseholdsSearchByHouseholdHeadEvent>(
        const Duration(milliseconds: 500),
      ),
    );
    on(_handleClear);
  }

  FutureOr<void> _handleSearchByHouseholdHead(
    SearchHouseholdsSearchByHouseholdHeadEvent event,
    SearchHouseholdsEmitter emit,
  ) async {
    if (event.searchText.trim().isEmpty) {
      emit(const SearchHouseholdsEmptyState());

      return;
    }
    emit(const SearchHouseholdsLoadingState());

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
                  (element) => element.isHeadOfHousehold == true,
                )
                ?.individualClientReferenceId,
      );

      if (head == null) continue;

      final projectBeneficiaries = await projectBeneficiaryMember.search(
        ProjectBeneficiarySearchModel(
          beneficiaryClientReferenceId: resultHousehold.clientReferenceId,
          projectId: '13',
        ),
      );

      if (projectBeneficiaries.isEmpty) continue;

      containers.add(
        HouseholdMemberWrapper(
          household: resultHousehold,
          headOfHousehold: head,
          members: individuals,
          projectBeneficiary: projectBeneficiaries.first,
        ),
      );
    }

    if (containers.isEmpty) {
      emit(SearchHouseholdsNotFoundState(searchQuery: event.searchText));
    } else {
      emit(SearchHouseholdsResultsState(householdMembers: containers));
    }
  }

  FutureOr<void> _handleClear(
    SearchHouseholdsClearEvent event,
    SearchHouseholdsEmitter emit,
  ) async {
    emit(const SearchHouseholdsEmptyState());
  }
}

@freezed
class SearchHouseholdsEvent with _$SearchHouseholdsEvent {
  const factory SearchHouseholdsEvent.searchByHouseholdHead({
    required String searchText,
  }) = SearchHouseholdsSearchByHouseholdHeadEvent;

  const factory SearchHouseholdsEvent.clear() = SearchHouseholdsClearEvent;
}

@freezed
class SearchHouseholdsState with _$SearchHouseholdsState {
  const factory SearchHouseholdsState.loading() = SearchHouseholdsLoadingState;

  const factory SearchHouseholdsState.notFound({
    String? searchQuery,
  }) = SearchHouseholdsNotFoundState;

  const factory SearchHouseholdsState.empty() = SearchHouseholdsEmptyState;

  const factory SearchHouseholdsState.results({
    String? searchQuery,
    @Default([]) List<HouseholdMemberWrapper> householdMembers,
  }) = SearchHouseholdsResultsState;
}

@freezed
class HouseholdMemberWrapper with _$HouseholdMemberWrapper {
  const factory HouseholdMemberWrapper({
    required HouseholdModel household,
    required IndividualModel headOfHousehold,
    required List<IndividualModel> members,
    required ProjectBeneficiaryModel projectBeneficiary,
  }) = _HouseholdMemberWrapper;
}
