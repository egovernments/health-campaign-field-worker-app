// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/data_repository.dart';
import '../../models/data_model.dart';
import '../../utils/utils.dart';

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
    emit(state.copyWith(loading: true));
    List<BoundaryModel> boundaryList = await boundaryRepository.search(
      BoundarySearchModel(code: event.code),
    );

    boundaryList.sort((a, b) {
      if (a.code == null || b.code == null) {
        return 0;
      }

      // Extract the numeric part of each string using a regular expression
      RegExp regex = RegExp(r'\d+');
      int aNum = int.tryParse(regex.stringMatch(a.code!.toString()) ?? '') ?? 0;
      int bNum = int.tryParse(regex.stringMatch(b.code!.toString()) ?? '') ?? 0;

      // Compare the numeric parts
      return aNum.compareTo(bNum);
    });

    final List<String> boundaryLabelList = [];
    for (var element in boundaryList) {
      if (!boundaryList.contains(element)) {
        boundaryLabelList.add(element.label.toString());
      }
    }

    boundaryLabelList.removeDuplicates((element) => element);

    emit(
      state.copyWith(
        boundaryList: boundaryList,
        boundaryMapperList: boundaryLabelList,
        loading: false,
      ),
    );
  }

  FutureOr<void> _handleSelect(
    BoundarySelectEvent event,
    BoundaryEmitter emit,
  ) async {
    emit(state.copyWith(selectedBoundary: event.selectedBoundary));
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
  const factory BoundaryState({
    @Default(false) bool loading,
    @Default([]) List<BoundaryModel> boundaryList,
    @Default([]) List<String> boundaryMapperList,
    @Default([]) List<String> selectedBoundary,
  }) = _BoundaryState;
}
