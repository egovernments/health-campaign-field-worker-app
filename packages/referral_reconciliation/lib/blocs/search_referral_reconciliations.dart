// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_transform/stream_transform.dart';

import '../models/entities/hf_referral.dart';
import '../utils/typedefs.dart';
import '../utils/utils.dart';

part 'search_referral_reconciliations.freezed.dart';

// Define a typedef for the emitter function used to emit state changes.
typedef SearchReferralsEmitter = Emitter<SearchReferralsState>;

// Define a function to debounce events.
EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

// Define the Bloc responsible for managing SearchReferrals events and states.
class SearchReferralsBloc
    extends Bloc<SearchReferralsEvent, SearchReferralsState> {
  HFReferralDataRepository referralReconDataRepository;
  // Constructor initializes the Bloc with an initial state and sets up event handlers.
  SearchReferralsBloc(
    super.initialState, {
    required this.referralReconDataRepository,
  }) {
    on(_handleSearchByName);
    on(_handleClear);
    on(_handleSearchByTag);
  }

  // Event handler for searching referrals by tag.
  FutureOr<void> _handleSearchByTag(
    SearchReferralsByTagEvent event,
    SearchReferralsEmitter emit,
  ) async {
    // Update state to indicate loading.
    emit(state.copyWith(
      loading: true,
    ));
    // Fetch referrals based on the tag.
    List<HFReferralModel>? beneficiaries =
        await referralReconDataRepository.search(
      HFReferralSearchModel(
        projectId: [ReferralReconSingleton().projectId],
        beneficiaryId: [event.tag],
      ),
    );
    // Update state with fetched referrals.
    emit(state.copyWith(
      referrals: beneficiaries,
      loading: false,
      tag: event.tag,
    ));
    if (kDebugMode) {
      print(state);
    }
  }

  // Event handler for searching referrals by name.
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

    // Fetch referrals based on the name.
    List<HFReferralModel>? beneficiaries =
        await referralReconDataRepository.search(
      HFReferralSearchModel(
        projectId: [ReferralReconSingleton().projectId],
        name: event.searchText,
      ),
    );
    // Update state with fetched referrals.
    emit(state.copyWith(
      referrals: beneficiaries,
      loading: false,
    ));
  }

  // Event handler for clearing search results.
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

// Define freezed classes for the SearchReferrals events.
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

// Define freezed classes for the SearchReferrals states.
@freezed
class SearchReferralsState with _$SearchReferralsState {
  const SearchReferralsState._();

  const factory SearchReferralsState({
    @Default(false) bool loading,
    String? searchQuery,
    String? tag,
    @Default([]) List<HFReferralModel> referrals,
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
