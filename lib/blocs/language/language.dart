import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_campaigns_flutter/models/state_info/state_info_model.dart';

part 'language.freezed.dart';

typedef LanguageSelectorEmitter = Emitter<LanguageSelectorState>;

class LanguageSelectorBloc
    extends Bloc<LanguageSelectorEvent, LanguageSelectorState> {
  LanguageSelectorBloc(super.initialState) {
    on<LanguageSelectorOnLoadEvent>(_onLoad);
    on<LanguageSelectorOnUpdateEvent>(_onupdate);
  }

  FutureOr<void> _onLoad(
    LanguageSelectorOnLoadEvent event,
    LanguageSelectorEmitter emit,
  ) async {
    emit(state.copyWith());
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith());
    // emit(state.copyWith(accessToken: '', loading: false));
  }

  FutureOr<void> _onupdate(
    LanguageSelectorOnUpdateEvent event,
    LanguageSelectorEmitter emit,
  ) async {
    List<LanguagesModel> list = state.languageSelectors;
    print("Language Selector");

    print(event.languageSelectors);
    print(list);
    print(list.indexOf(event.languageSelectors));
    // if (event.languageSelectors.isSelected) return;

    // list[list.indexOf(event.languageSelectors)] = state.languageSelectors[
    //         state.languageSelectors.indexOf(event.languageSelectors)]
    //     .copyWith(isSelected: true);

    // emit(state.copyWith(languageSelectors: list));
  }
}

@freezed
class LanguageSelectorEvent with _$LanguageSelectorEvent {
  const factory LanguageSelectorEvent.onLoad({
    required List<LanguagesModel> languageSelectors,
  }) = LanguageSelectorOnLoadEvent;

  const factory LanguageSelectorEvent.onupdate({
    required LanguagesModel languageSelectors,
  }) = LanguageSelectorOnUpdateEvent;
}

@freezed
class LanguageSelectorState with _$LanguageSelectorState {
  const LanguageSelectorState._();

  const factory LanguageSelectorState({
    @Default([]) List<LanguagesModel> languageSelectors,
  }) = _LanguageSelectorState;
}
