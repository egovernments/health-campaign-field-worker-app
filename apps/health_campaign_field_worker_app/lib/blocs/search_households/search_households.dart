// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_households.freezed.dart';

typedef SearchHouseholdsEmitter = Emitter<SearchHouseholdsState>;

class SearchHouseholdsBloc extends Bloc<SearchHouseholdsEvent, SearchHouseholdsState> {
  SearchHouseholdsBloc(super.initialState) {
    on(_handleSearchByHouseholdHead);
    on(_handleClear);
    
  }
  
  FutureOr<void> _handleSearchByHouseholdHead(
    SearchHouseholdsSearchByHouseholdHeadEvent event,
    SearchHouseholdsEmitter emit,
  ) async {
    // handle logic for searchByHouseholdHead here
  }
  
  FutureOr<void> _handleClear(
    SearchHouseholdsClearEvent event,
    SearchHouseholdsEmitter emit,
  ) async {
    // handle logic for clear here
  }
  
}

@freezed
class SearchHouseholdsEvent with _$SearchHouseholdsEvent {
  
  const factory SearchHouseholdsEvent.searchByHouseholdHead() = SearchHouseholdsSearchByHouseholdHeadEvent;
  const factory SearchHouseholdsEvent.clear() = SearchHouseholdsClearEvent;
  
}

@freezed
class SearchHouseholdsState with _$SearchHouseholdsState {
  
  const factory SearchHouseholdsState.loading() = SearchHouseholdsLoadingState;
  const factory SearchHouseholdsState.error() = SearchHouseholdsErrorState;
  const factory SearchHouseholdsState.results() = SearchHouseholdsResultsState;
  
}