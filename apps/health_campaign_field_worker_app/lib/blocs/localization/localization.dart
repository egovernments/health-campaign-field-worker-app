import 'dart:async';

import 'package:digit_data_model/data/local_store/sql_store/sql_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/local_store/app_shared_preferences.dart';
import '../../data/repositories/local/localization.dart';
import '../../data/repositories/remote/localization.dart';
import '../../utils/utils.dart';
import 'app_localization.dart';

part 'localization.freezed.dart';

typedef LocalizationEmitter = Emitter<LocalizationState>;

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final LocalizationRepository localizationRepository;
  final LocalSqlDataStore sql;

  LocalizationBloc(
    super.initialState,
    this.localizationRepository,
    this.sql,
  ) {
    on(_onLoadLocalization);
    on(_onUpdateLocalizationIndex);
    on(_onRemoteLoadLocalization);
  }

  FutureOr<void> _onLoadLocalization(
    OnLoadLocalizationEvent event,
    LocalizationEmitter emit,
  ) async {
    final allModules = event.module
        .split(',')
        .map((m) => m.trim())
        .where((m) => m.isNotEmpty)
        .toList();

    // Detect missing modules PER MODULE rather than as a batch. The previous
    // implementation did `fetchLocalization(module: allModules.join(','))`
    // and treated any non-empty result as "cached" — so once any module
    // in the bundle (typically `hcm-common`) was cached, every subsequent
    // module added by a card (e.g. `hcm-dashboard`, `hcm-transit-post`)
    // was silently skipped and rendered as raw codes. Now we ask the DB
    // for the distinct modules that actually have rows for this locale
    // and fetch only what's missing.
    final cachedRows = await LocalizationLocalRepository().fetchLocalization(
      sql: sql,
      locale: event.locale,
      module: allModules.join(','),
    );
    final cachedModules = cachedRows.map((l) => l.module).toSet();
    final missingModules =
        allModules.where((m) => !cachedModules.contains(m)).toList();

    // Fast path: if every requested module is already loaded into
    // AppLocalizations._localizedStrings for the current locale and nothing
    // is missing from the DB cache, this dispatch is a no-op. Bail before
    // touching `state.loading` and before re-running `_loadLocale` — which
    // otherwise clears + rehydrates the static string list and flickers any
    // widget listening for the loading transition on every card tap.
    final params = LocalizationParams();
    final activeLocaleTag = params.locale != null
        ? '${params.locale!.languageCode}_${params.locale!.countryCode ?? ''}'
        : null;
    final activeModuleSet = (params.module ?? '')
        .split(',')
        .map((m) => m.trim())
        .where((m) => m.isNotEmpty)
        .toSet();
    final allRequestedActive =
        allModules.isNotEmpty && allModules.every(activeModuleSet.contains);
    final localeMatches = activeLocaleTag == event.locale;
    if (missingModules.isEmpty && allRequestedActive && localeMatches) {
      return;
    }

    emit(state.copyWith(loading: true));

    try {
      if (missingModules.isNotEmpty) {
        final ok = await _fetchAndStoreModules(
          modules: missingModules,
          locale: event.locale,
          tenantId: event.tenantId,
          path: event.path,
        );
        if (!ok) {
          emit(state.copyWith(
              loading: false, retryModule: missingModules.join(',')));
        }
      }
    } catch (error) {
      rethrow;
    } finally {
      LocalizationParams().setModule(event.module, false);
      final List codes = event.locale.split('_');
      await _loadLocale(codes);
      emit(state.copyWith(loading: false, retryModule: null));
    }
  }

  /// Attempts to fetch a bundle of localization modules and persist them
  /// locally. Retries up to [attempts] times on transient failures
  /// (network hiccups, truncated payloads, 5xx). Returns true on the first
  /// successful attempt, false if every attempt failed.
  Future<bool> _fetchAndStoreModules({
    required List<String> modules,
    required String locale,
    required String tenantId,
    required String path,
    int attempts = 3,
  }) async {
    final joined = modules.join(',');
    for (var i = 0; i < attempts; i++) {
      try {
        final results = await localizationRepository.loadLocalization(
          path: path,
          locale: locale,
          module: joined,
          tenantId: tenantId,
        );
        await LocalizationLocalRepository().create(results, sql);
        return true;
      } catch (error) {
        debugPrint('localization fetch failed for "$joined" '
            '(attempt ${i + 1}/$attempts): $error');
      }
    }
    return false;
  }

  FutureOr<void> _onRemoteLoadLocalization(
    OnRemoteLoadLocalizationEvent event,
    LocalizationEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      final allModules = event.module.split(',');

      final ok = await _fetchAndStoreModules(
        modules: allModules,
        locale: event.locale,
        tenantId: event.tenantId,
        path: event.path,
      );
      if (!ok) {
        emit(state.copyWith(loading: false, retryModule: allModules.join(',')));
      }

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
    final List codes = event.code.split('_');
    AppSharedPreferences().setSelectedLocale(codes.join("_"));
    await _loadLocale(codes);
    // Emit AFTER _loadLocale completes so that listeners see the state change
    // only when the locale strings are fully loaded from DB.
    emit(state.copyWith(index: event.index));
  }

  FutureOr<void> _loadLocale(List codes) async {
    LocalizationParams().setLocale(Locale(codes.first, codes.last));
    await AppLocalizations(Locale(codes.first, codes.last), sql).load();
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

  const factory LocalizationEvent.onRemoteLoadLocalization({
    required String module,
    required String tenantId,
    required String locale,
    required String path,
  }) = OnRemoteLoadLocalizationEvent;

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
    String? retryModule,
  }) = _LocalizationState;
}
