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
    on(_handleEdit);
    on(_handleSearch);
    on(_handleSelect);
    on(_handleSubmit);
  }

  Future<void> _handleEdit(
    BoundaryEditEvent event,
    BoundaryEmitter emit,
  ) async {
    emit(state.copyWith(
      hasSubmitted: false,
    ));
  }

  FutureOr<void> _handleSearch(
    BoundarySearchEvent event,
    BoundaryEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    List<BoundaryModel> boundaryList = await boundaryRepository.search(
      BoundarySearchModel(code: event.code),
    );

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
  const factory BoundaryEvent.edit() = BoundaryEditEvent;

  const factory BoundaryEvent.search({required String code}) =
      BoundarySearchEvent;

  const factory BoundaryEvent.select({
    required String label,
    required BoundaryModel selectedBoundary,
  }) = BoundarySelectEvent;

  const factory BoundaryEvent.submit() = BoundarySubmitEvent;
}

@freezed
class BoundaryState with _$BoundaryState {
  const BoundaryState._();

  const factory BoundaryState({
    @Default(false) bool loading,
    @Default([]) List<BoundaryModel> boundaryList,
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
