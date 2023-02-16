// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../data/data_repository.dart';
import '../../models/data_model.dart';
import '../../utils/environment_config.dart';

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

  final DataRepository<HouseholdModel, HouseholdSearchModel> household;

  SearchHouseholdsBloc({
    required this.individual,
    required this.householdMember,
    required this.household,
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
        name: NameSearchModel(
          givenName: event.searchText,
        ),
      ),
    );

    final householdMembers = <HouseholdMemberModel>[];
    for (final element in results) {
      final members = await householdMember.search(HouseholdMemberSearchModel(
        individualClientReferenceId: element.clientReferenceId,
        isHeadOfHousehold: true,
      ));
      if (members.isEmpty) continue;
      householdMembers.add(members.first);
    }

    final containers = <HouseholdMemberWrapper>[];
    for (var e in householdMembers) {
      final individualModel = await individual.search(
        IndividualSearchModel(clientReferenceId: e.individualClientReferenceId),
      );
      final householdModel = await household.search(
        HouseholdSearchModel(clientReferenceId: e.householdClientReferenceId),
      );

      if (householdModel.isEmpty || individualModel.isEmpty) continue;

      containers.add(
        HouseholdMemberWrapper(
          household: householdModel.first,
          individual: individualModel.first,
        ),
      );
    }

    if (containers.isEmpty) {
      emit(const SearchHouseholdsNotFoundState());
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

  const factory SearchHouseholdsState.notFound() =
      SearchHouseholdsNotFoundState;

  const factory SearchHouseholdsState.empty() = SearchHouseholdsEmptyState;

  const factory SearchHouseholdsState.results({
    @Default([]) List<HouseholdMemberWrapper> householdMembers,
  }) = SearchHouseholdsResultsState;
}

@freezed
class HouseholdMemberWrapper with _$HouseholdMemberWrapper {
  const factory HouseholdMemberWrapper({
    required HouseholdModel household,
    required IndividualModel individual,
  }) = _HouseholdMemberWrapper;
}
