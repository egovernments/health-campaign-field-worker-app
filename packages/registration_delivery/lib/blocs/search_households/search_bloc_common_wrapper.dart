import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/blocs/search_households/individual_global_search.dart';
import 'tag_by_search.dart';
import 'proximity_search.dart';
import 'search_households.dart';
import 'search_by_head.dart';

class SearchBlocWrapper implements StateStreamableSource<Object?> {
  final SearchHouseholdsBloc searchHouseholdsBloc;
  final TagSearchBloc tagSearchBloc;
  final IndividualGlobalSearchBloc individualGlobalSearchBloc;

  SearchBlocWrapper({
    required this.searchHouseholdsBloc,
    required this.tagSearchBloc,
    required this.individualGlobalSearchBloc,
  });

  Stream<SearchHouseholdsState> get stateChanges =>
      StreamGroup.merge<SearchHouseholdsState>([
        searchHouseholdsBloc.stream,
        individualGlobalSearchBloc.stream,
      ]);

  void dispatch(SearchHouseholdsEvent event) {
    if (event is SearchHouseholdsByStatusEvent) {
      individualGlobalSearchBloc.add(event);
    } else {
      searchHouseholdsBloc.add(event);
    }
  }

  void clearEvent() {
    individualGlobalSearchBloc.add(const SearchHouseholdsEvent.clear());
    searchHouseholdsBloc.add(const SearchHouseholdsEvent.clear());
  }

  @override
  SearchHouseholdsState get state => searchHouseholdsBloc.state;

  @override
  Stream<SearchHouseholdsState> get stream => stateChanges;

  @override
  FutureOr<void> close() {
    searchHouseholdsBloc.close();
    individualGlobalSearchBloc.close();
  }

  @override
  bool get isClosed =>
      searchHouseholdsBloc.isClosed && individualGlobalSearchBloc.isClosed;
}
