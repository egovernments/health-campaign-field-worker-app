// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:referral_reconciliation/blocs/referral_reconciliation_listeners.dart';
import 'package:stream_transform/stream_transform.dart';

import '../models/entities/h_f_referral.dart';

part 'search_referral_reconciliations.freezed.dart';

typedef SearchReferralsEmitter = Emitter<SearchReferralsState>;

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class SearchReferralsBloc
    extends Bloc<SearchReferralsEvent, SearchReferralsState> {
  SearchReferralsBloc() : super(const SearchReferralsState()) {
    on(_handleSearchByName);
    on(_handleClear);
    on(_handleSearchByTag);
  }

  FutureOr<void> _handleSearchByTag(
    SearchReferralsByTagEvent event,
    SearchReferralsEmitter emit,
  ) async {
    emit(state.copyWith(
      loading: true,
    ));
    List<ReferralReconciliation>? beneficiaries = await ReferralReconSingleton()
        .getReferralReconciliations(
            SearchReferralReconciliationClass(tag: event.tag));
    emit(state.copyWith(
      referrals: beneficiaries ?? [],
      loading: false,
      tag: event.tag,
    ));
  }

  FutureOr<void> _handleSearchByName(
    SearchReferralsByNameEvent event,
    SearchReferralsEmitter emit,
  ) async {
    // Check if the search text is empty; if so, clear the results and return.
    if (event.searchText.trim().isEmpty) {
      emit(state.copyWith(
        referrals: [],
        searchQuery: null,
        loading: false,
      ));
    }

    // Update the state to indicate that the search is in progress.
    emit(state.copyWith(
      loading: true,
      searchQuery: event.searchText,
    ));

    List<ReferralReconciliation>? hfReferrals = await ReferralReconSingleton()
        .getReferralReconciliations(SearchReferralReconciliationClass(
      name: event.searchText,
    ));

    emit(state.copyWith(
      referrals: hfReferrals ?? [],
      loading: false,
    ));
  }

  FutureOr<void> _handleClear(
    SearchReferralsClearEvent event,
    SearchReferralsEmitter emit,
  ) async {
    emit(state.copyWith(
      searchQuery: null,
      referrals: [],
      tag: null,
    ));
  }
}

@freezed
class SearchReferralsEvent with _$SearchReferralsEvent {
  const factory SearchReferralsEvent.initialize() =
      SearchReferralsInitializedEvent;

  const factory SearchReferralsEvent.searchByName({
    required String searchText,
  }) = SearchReferralsByNameEvent;

  const factory SearchReferralsEvent.searchByTag({
    required String tag,
  }) = SearchReferralsByTagEvent;

  const factory SearchReferralsEvent.clear() = SearchReferralsClearEvent;
}

@freezed
class SearchReferralsState with _$SearchReferralsState {
  const SearchReferralsState._();

  const factory SearchReferralsState({
    @Default(false) bool loading,
    String? searchQuery,
    String? tag,
    @Default([]) List<ReferralReconciliation> referrals,
  }) = _SearchReferralsState;

  bool get resultsNotFound {
    if (loading) return false;

    if (searchQuery?.isEmpty ?? true && tag == null) return false;

    return referrals.isEmpty;
  }

  bool get screenLoading {
    return loading;
  }
}
