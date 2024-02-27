import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'tag_by_search.dart';
import 'proximity_search.dart';
import 'search_households.dart';
import 'search_by_head.dart';

class SearchBlocWrapper implements StateStreamableSource<Object?> {
  final SearchHouseholdsBloc searchHouseholdsBloc;
  final SearchByHeadBloc searchByHeadBloc;
  final ProximitySearchBloc proximitySearchBloc;
  final TagSearchBloc tagSearchBloc;

  SearchBlocWrapper({
    required this.searchHouseholdsBloc,
    required this.searchByHeadBloc,
    required this.proximitySearchBloc,
    required this.tagSearchBloc,
  });

  Stream<SearchHouseholdsState> get stateChanges =>
      StreamGroup.merge<SearchHouseholdsState>([
        searchHouseholdsBloc.stream,
        searchByHeadBloc.stream,
        proximitySearchBloc.stream,
        tagSearchBloc.stream,
      ]);

  void dispatch(SearchHouseholdsEvent event) {
    if (event is SearchHouseholdsByProximityEvent) {
      proximitySearchBloc.add(event);
    } else if (event is SearchHouseholdsByHouseholdsEvent) {
      searchByHeadBloc.add(event);
    } else if (event is SearchHouseholdsByTagEvent) {
      tagSearchBloc.add(event);
    } else {
      searchHouseholdsBloc.add(event);
    }
  }

  void clearEvent() {
    proximitySearchBloc.add(const SearchHouseholdsEvent.clear());
    searchByHeadBloc.add(const SearchHouseholdsEvent.clear());
    tagSearchBloc.add(const SearchHouseholdsEvent.clear());
    searchHouseholdsBloc.add(const SearchHouseholdsEvent.clear());
  }

  @override
  SearchHouseholdsState get state => searchHouseholdsBloc.state;

  @override
  Stream<SearchHouseholdsState> get stream => stateChanges;

  @override
  FutureOr<void> close() {
    searchHouseholdsBloc.close();
    searchByHeadBloc.close();
    proximitySearchBloc.close();
    tagSearchBloc.close();
  }

  @override
  bool get isClosed =>
      searchHouseholdsBloc.isClosed &&
      searchByHeadBloc.isClosed &&
      proximitySearchBloc.isClosed &&
      tagSearchBloc.isClosed;
}
