import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'tag_by_search.dart';
import 'proximity_search.dart';
import 'search_households.dart';
import 'search_member.dart';

class SearchBlocWrapper implements StateStreamableSource<Object?> {
  final SearchHouseholdsBloc searchHouseholdsBloc;
  final SearchMemberBloc searchMemberBloc;
  final ProximitySearchBloc proximitySearchBloc;
  final TagSearchBloc tagSearchBloc;

  SearchBlocWrapper({
    required this.searchHouseholdsBloc,
    required this.searchMemberBloc,
    required this.proximitySearchBloc,
    required this.tagSearchBloc,
  });

  Stream<SearchHouseholdsState> get stateChanges =>
      StreamGroup.merge<SearchHouseholdsState>([
        searchHouseholdsBloc.stream,
        searchMemberBloc.stream,
        proximitySearchBloc.stream,
        tagSearchBloc.stream,
      ]);

  void dispatch(SearchHouseholdsEvent event) {
    if (event is SearchHouseholdsByProximityEvent) {
      proximitySearchBloc.add(event);
    } else if (event is SearchHouseholdsByHouseholdsEvent) {
      searchMemberBloc.add(event);
    } else if (event is SearchHouseholdsByTagEvent) {
      tagSearchBloc.add(event);
    } else {
      searchHouseholdsBloc.add(event);
    }
  }

  @override
  SearchHouseholdsState get state => searchHouseholdsBloc.state;

  @override
  Stream<SearchHouseholdsState> get stream => stateChanges;

  @override
  FutureOr<void> close() {
    searchHouseholdsBloc.close();
    searchMemberBloc.close();
    proximitySearchBloc.close();
    tagSearchBloc.close();
  }

  @override
  bool get isClosed =>
      searchHouseholdsBloc.isClosed &&
      searchMemberBloc.isClosed &&
      proximitySearchBloc.isClosed &&
      tagSearchBloc.isClosed;
}
