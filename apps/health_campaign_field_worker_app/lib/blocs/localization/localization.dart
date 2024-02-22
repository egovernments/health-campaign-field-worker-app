import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import '../../data/local_store/app_shared_preferences.dart';
import '../../data/repositories/remote/localization.dart';
import 'app_localization.dart';

part 'localization.freezed.dart';

typedef LocalizationEmitter = Emitter<LocalizationState>;

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final LocalizationRepository localizationRepository;
  final Isar isar;

  LocalizationBloc(
    super.initialState,
    this.localizationRepository,
    this.isar,
  ) {
    on(_onLoadLocalization);
    on(_onUpdateLocalizationIndex);
  }

  FutureOr<void> _onLoadLocalization(
    OnLoadLocalizationEvent event,
    LocalizationEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      await localizationRepository.loadLocalization(
        path: event.path,
        locale: event.locale,
        module: event.module,
        tenantId: event.tenantId,
      );

      final List codes = event.locale.split('_');
      await _loadLocale(codes);
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  FutureOr<void> _onUpdateLocalizationIndex(
    OnUpdateLocalizationIndexEvent event,
    LocalizationEmitter emit,
  ) async {
    emit(state.copyWith(index: event.index));
    final List codes = event.code.split('_');
    AppSharedPreferences().setSelectedLocale(codes.join("_"));
    _loadLocale(codes);
  }

  FutureOr<void> _loadLocale(List codes) async {
    await AppLocalizations(Locale(codes.first, codes.last), isar).load();
  }
}

@freezed
class LocalizationEvent with _$LocalizationEvent {
  const factory LocalizationEvent.onLoadLocalization({
    required String module,
    required String tenantId,
    required String locale,
    required String path,
  }) = OnLoadLocalizationEvent;

  const factory LocalizationEvent.onUpdateLocalizationIndex({
    required int index,
    required String code,
  }) = OnUpdateLocalizationIndexEvent;
}

@freezed
class LocalizationState with _$LocalizationState {
  const factory LocalizationState({
    @Default(false) bool loading,
    @Default(0) int index,
    @Default(false) bool isLocalizationLoadCompleted,
  }) = _LocalizationState;
}
