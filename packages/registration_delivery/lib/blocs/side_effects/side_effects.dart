import 'dart:async';

import 'package:digit_data_model/data/data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/entities/side_effect.dart';

part 'side_effects.freezed.dart';

typedef SideEffectsEmitter = Emitter<SideEffectsState>;

class SideEffectsBloc extends Bloc<SideEffectsEvent, SideEffectsState> {
  final DataRepository<SideEffectModel, SideEffectSearchModel>
      sideEffectRepository;

  SideEffectsBloc(
    super.initialState, {
    required this.sideEffectRepository,
  }) {
    on(_handleSubmit);
    on(_handleSearch);
  }

  FutureOr<void> _handleSubmit(
    SideEffectsSubmitEvent event,
    SideEffectsEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      if (event.isEditing) {
        await sideEffectRepository.update(event.sideEffect);
      } else {
        await sideEffectRepository.create(event.sideEffect);
      }
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  FutureOr<void> _handleSearch(
    SideEffectsSearchEvent event,
    SideEffectsEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      final List<SideEffectModel> sideEffects =
          await sideEffectRepository.search(
        event.sideEffectSearch,
      );
      emit(state.copyWith(
        loading: false,
        sideEffects: sideEffects.isNotEmpty ? sideEffects : null,
      ));
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}

@freezed
class SideEffectsEvent with _$SideEffectsEvent {
  const factory SideEffectsEvent.handleSubmit(
    SideEffectModel sideEffect,
    bool isEditing,
  ) = SideEffectsSubmitEvent;

  const factory SideEffectsEvent.handleSearch(
    SideEffectSearchModel sideEffectSearch,
  ) = SideEffectsSearchEvent;
}

@freezed
class SideEffectsState with _$SideEffectsState {
  const factory SideEffectsState({
    @Default(false) bool loading,
    @Default(false) bool isEditing,
    List<SideEffectModel>? sideEffects,
  }) = _SideEffectsState;
}
