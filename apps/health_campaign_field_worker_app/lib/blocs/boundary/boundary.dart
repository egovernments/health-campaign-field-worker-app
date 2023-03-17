// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/data_repository.dart';
import '../../models/data_model.dart';

part 'boundary.freezed.dart';

typedef BoundaryEmitter = Emitter<BoundaryState>;

class BoundaryBloc extends Bloc<BoundaryEvent, BoundaryState> {
  final DataRepository<BoundaryModel, BoundarySearchModel> boundaryRepository;
  BoundaryBloc(
    super.initialState, {
    required this.boundaryRepository,
  }) {
    on(_handleSearch);
    on(_handleSelect);
  }

  FutureOr<void> _handleSearch(
    BoundarySearchEvent event,
    BoundaryEmitter emit,
  ) async {
    print("Event Triggered");
    List<BoundaryModel> boundaryList =
        await boundaryRepository.search(BoundarySearchModel(code: 'LC00004'));
    final codesList = boundaryList
        .reduce((a, b) =>
            a.materializedPath!.length > b.materializedPath!.length ? a : b)
        .materializedPath;
    print(codesList);

    // boundaryList.forEach((element) {});
    // final List boundaryMapperList = [];
    final List<String> mapperArray = [];

    codesList?.split('.').forEach((e) {
      if (e.isNotEmpty) {
        // boundaryMapperList
        //     .add();
        boundaryList.forEach((element) {
          if (element.code == e) {
            mapperArray.add(element.label.toString());
          }
        });
      }
    });

    // print(boundaryMapperList);
    print(mapperArray.toSet().toList());
    emit(BoundaryFetchedState(
      boundaryList: boundaryList,
      boundaryMapperList: mapperArray.toSet().toList(),
    ));
    // handle logic for search here
  }

  FutureOr<void> _handleSelect(
    BoundarySelectEvent event,
    BoundaryEmitter emit,
  ) async {
    print(event.selectedBoundary);
    emit(BoundaryFetchedState(selectedBoundary: event.selectedBoundary));
    // handle logic for select here
  }
}

@freezed
class BoundaryEvent with _$BoundaryEvent {
  const factory BoundaryEvent.search() = BoundarySearchEvent;
  const factory BoundaryEvent.select({
    required String selectedBoundary,
  }) = BoundarySelectEvent;
}

@freezed
class BoundaryState with _$BoundaryState {
  const factory BoundaryState.loading() = BoundaryLoadingState;
  const factory BoundaryState.fetched({
    @Default([]) List<BoundaryModel> boundaryList,
    @Default([]) List<String> boundaryMapperList,
    String? selectedBoundary,
  }) = BoundaryFetchedState;
  const factory BoundaryState.empty() = BoundaryEmptyState;
}
