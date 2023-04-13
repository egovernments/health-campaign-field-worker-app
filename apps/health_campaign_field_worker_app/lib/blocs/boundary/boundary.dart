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
    on(_handleToggleVisibility);
  }

  FutureOr<void> _handleSearch(
    BoundarySearchEvent event,
    BoundaryEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    List<BoundaryModel> boundaryList = await boundaryRepository.search(
      BoundarySearchModel(code: event.code),
    );

    final codesList =
        boundaryList.where((e) => e.materializedPath != null).reduce(
      (a, b) {
        return a.materializedPath!.length > b.materializedPath!.length ? a : b;
      },
    ).materializedPath;

    final List<String> mapperArray = [];

    codesList?.split('.').forEach((e) {
      if (e.isNotEmpty) {
        boundaryList.forEach((element) {
          if (element.code == e) {
            mapperArray.add(element.label.toString());
          }
        });
      }
    });

    emit(
      state.copyWith(
        loading: false,
        boundaryList: boundaryList,
        boundaryMapperList: mapperArray.toSet().toList(),
      ),
    );
    // handle logic for search here
  }

  FutureOr<void> _handleSelect(
    BoundarySelectEvent event,
    BoundaryEmitter emit,
  ) async {
    emit(state.copyWith(selectedBoundary: event.selectedBoundary));
  }

  FutureOr<void> _handleToggleVisibility(
    BoundaryToggleVisibilityEvent event,
    BoundaryEmitter emit,
  ) async {
    emit(state.copyWith(isPickerVisible: !state.isPickerVisible));
  }
}

@freezed
class BoundaryEvent with _$BoundaryEvent {
  const factory BoundaryEvent.search({required String code}) =
      BoundarySearchEvent;

  const factory BoundaryEvent.select({
    required BoundaryModel selectedBoundary,
  }) = BoundarySelectEvent;

  const factory BoundaryEvent.toggleVisibility() =
      BoundaryToggleVisibilityEvent;
}

@freezed
class BoundaryState with _$BoundaryState {
  const factory BoundaryState({
    @Default([]) List<BoundaryModel> boundaryList,
    @Default([]) List<String> boundaryMapperList,
    @Default(false) bool isPickerVisible,
    @Default(false) bool loading,
    BoundaryModel? selectedBoundary,
  }) = _BoundaryState;
}
