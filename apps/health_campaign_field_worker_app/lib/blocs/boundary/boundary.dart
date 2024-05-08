// GENERATED using mason_cli
import 'dart:async';
import 'dart:convert';

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
    on(_handleReset);
    on(_handleSearch);
    on(_handleSelect);
    on(_handleSubmit);
    on(_handlefind);
  }

  Future<void> _handleReset(
    BoundaryResetEvent event,
    BoundaryEmitter emit,
  ) async {
    await boundaryRepository.delete(BoundaryModel());
    emit(const BoundaryState());
  }

  Future<void> _handlefind(
    BoundaryFindEvent event,
    BoundaryEmitter emit,
  ) async {
    List<BoundaryModel> boundaryList = await boundaryRepository.search(
      BoundarySearchModel(
        code: event.code,
        isSingle: false,
      ),
    );

    int?  boundaryNum = boundaryList.first.boundaryNum;


    final List<String> boundaryLabelList = [];
    for (var element in boundaryList) {
      if (!boundaryLabelList.contains(element.label.toString())) {
        boundaryLabelList.add(element.label.toString());
      }
    }
    emit(
      state.copyWith(
        boundaryList: boundaryList,
        selectedBoundaryMap: Map.fromEntries(
          boundaryLabelList.map(
            (e) => MapEntry(e, null),
          ),
        ),
        loading: false,
      ),
    );
  }

  FutureOr<void> _handleSearch(
    BoundarySearchEvent event,
    BoundaryEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    List<BoundaryModel> boundaryList = await boundaryRepository.search(
      BoundarySearchModel(
        code: event.code,
        boundaryNum: event.boundaryNum,
        isSingle: false,
      ),
    );

    final r = [...state.boundaryList, ...boundaryList];

    emit(
      state.copyWith(
        boundaryList: Set.of(r).toList(),
        selectedBoundaryMap: state.selectedBoundaryMap,
        loading: false,
      ),
    );
  }

  FutureOr<void> _handleSelect(
    BoundarySelectEvent event,
    BoundaryEmitter emit,
  ) async {
    bool hasChanged = false;
    final selectedBoundaryMap = Map.fromEntries(
      state.selectedBoundaryMap.entries.map(
        (e) {
          if (hasChanged) {
            return MapEntry(e.key, null);
          }
          if (e.key == event.label) {
            hasChanged = true;

            return MapEntry(e.key, event.selectedBoundary);
          }

          return e;
        },
      ),
    );

    final hasSelectedBoundaryChanged = const DeepCollectionEquality().equals(
      selectedBoundaryMap,
      state.selectedBoundaryMap,
    );

    if (hasSelectedBoundaryChanged) {
      return;
    }

    emit(state.copyWith(
      selectedBoundaryMap: selectedBoundaryMap,
      hasSubmitted: false,
    ));
  }

  FutureOr<void> _handleSubmit(
    BoundarySubmitEvent event,
    BoundaryEmitter emit,
  ) async {
    emit(state.copyWith(hasSubmitted: true));
  }
}

@freezed
class BoundaryEvent with _$BoundaryEvent {
  const factory BoundaryEvent.reset() = BoundaryResetEvent;

  const factory BoundaryEvent.search(
      {required String code, required int boundaryNum,}) = BoundarySearchEvent;

  const factory BoundaryEvent.select({
    required String label,
    required BoundaryModel selectedBoundary,
  }) = BoundarySelectEvent;

  const factory BoundaryEvent.findBoundary({required String code}) =
      BoundaryFindEvent;

  const factory BoundaryEvent.submit() = BoundarySubmitEvent;
}

@freezed
class BoundaryState with _$BoundaryState {
  const BoundaryState._();

  const factory BoundaryState({
    @Default(false) bool loading,
    @Default([]) List<BoundaryModel> boundaryList,
    @Default([]) List<BoundaryModel> projectBoundaryList,
    @Default({}) Map<String, BoundaryModel?> selectedBoundaryMap,
    @Default(false) bool hasSubmitted,
  }) = _BoundaryState;

  @override
  String toString() => const JsonEncoder.withIndent('  ').convert({
        'loading': loading,
        'selectedBoundaryMap': Map.fromEntries(
          selectedBoundaryMap.entries.map(
            (e) => MapEntry(
              e.key,
              e.value?.toMap(),
            ),
          ),
        ),
        'hasSubmitted': hasSubmitted,
        'boundaryList.length': boundaryList.length,
      });
}
