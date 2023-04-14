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
    List<BoundaryModel> boundaryList = await boundaryRepository.search(
      BoundarySearchModel(code: event.code),
    );

    boundaryList.sort((a, b) {
      if (a.boundaryNum == null || b.boundaryNum == null) {
        return 0;
      }

      // Extract the numeric part of each string using a regular expression
      // RegExp regex = RegExp(r'\d+');
      // int aNum = int.tryParse(regex.stringMatch(a.code!.toString()) ?? '') ?? 0;
      // int bNum = int.tryParse(regex.stringMatch(b.code!.toString()) ?? '') ?? 0;

      // Compare the numeric parts
      return b.boundaryNum!.compareTo(a.boundaryNum!);
    });

    final List<String> mapperArray = [];
    for (var element in boundaryList) {
      if (mapperArray.contains(element.label)) continue;
      mapperArray.add(element.label.toString());
    }

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
    state.maybeMap(
      orElse: () {},
      fetched: (value) {
        emit(value.copyWith(
          selectedBoundary: event.selectedBoundary,
        ));
      },
      empty: (value) {},
    );

    // handle logic for select here
  }
}

@freezed
class BoundaryEvent with _$BoundaryEvent {
  const factory BoundaryEvent.search({required String code}) =
      BoundarySearchEvent;

  const factory BoundaryEvent.select({
    required List<String> selectedBoundary,
  }) = BoundarySelectEvent;
}

@freezed
class BoundaryState with _$BoundaryState {
  const factory BoundaryState.loading() = BoundaryLoadingState;

  const factory BoundaryState.fetched({
    @Default([]) List<BoundaryModel> boundaryList,
    @Default([]) List<String> boundaryMapperList,
    @Default([]) List<String> selectedBoundary,
  }) = BoundaryFetchedState;

  const factory BoundaryState.empty() = BoundaryEmptyState;
}
