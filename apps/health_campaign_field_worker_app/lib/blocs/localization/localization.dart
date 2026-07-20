import 'dart:async';

import 'package:digit_data_model/data/local_store/sql_store/sql_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:digit_flow_builder/blocs/app_localization.dart' as flow_builder;
import 'package:digit_forms_engine/blocs/app_localization.dart' as forms_engine;

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

    String? retryModule;
    try {
      if (missingModules.isNotEmpty) {
        final fetched = await _fetchAndStoreModules(
          modules: missingModules,
          locale: event.locale,
          tenantId: event.tenantId,
          path: event.path,
        );
        if (!fetched) {
          retryModule = missingModules.join(',');
        }
      }
    } catch (error) {
      rethrow;
    } finally {
      LocalizationParams().setModule(event.module, false);
      final localeParts = event.locale.split('_');
      await _loadLocale(localeParts);
      // Preserve retryModule when the fetch failed so consumers can retry
      // the missing modules; the unconditional `retryModule: null` here
      // otherwise clobbered the marker set on the !fetched branch and
      // presented a false "success" terminal state.
      emit(state.copyWith(loading: false, retryModule: retryModule));
    }
  }

  /// Attempts to fetch a bundle of localization modules and persist them
  /// locally. Retries up to [attempts] times on transient remote failures
  /// (network hiccups, truncated payloads, 5xx). Returns true on success,
  /// false if either every fetch attempt or the persistence step failed.
  ///
  /// Split into two phases so a SQL/persistence failure does NOT re-drive
  /// the remote fetch — earlier a single `try` wrapped both the network
  /// call and `create()`, so a failing `insertAll` (e.g. lock timeout,
  /// disk-full) triggered three back-to-back network downloads for the
  /// same payload.
  Future<bool> _fetchAndStoreModules({
    required List<String> modules,
    required String locale,
    required String tenantId,
    required String path,
    int attempts = 3,
  }) async {
    final moduleCsv = modules.join(',');
    dynamic results;
    for (var attempt = 1; attempt <= attempts; attempt++) {
      try {
        results = await localizationRepository.loadLocalization(
          path: path,
          locale: locale,
          module: moduleCsv,
          tenantId: tenantId,
        );
        break;
      } catch (error) {
        debugPrint('localization fetch failed for "$moduleCsv" '
            '(attempt $attempt/$attempts): $error');
        if (attempt == attempts) return false;
      }
    }
    if (results == null) return false;
    try {
      await LocalizationLocalRepository().create(results, sql);
      return true;
    } catch (error) {
      debugPrint(
          'localization persist failed for "$moduleCsv" (no retry): $error');
      return false;
    }
  }

  FutureOr<void> _onRemoteLoadLocalization(
    OnRemoteLoadLocalizationEvent event,
    LocalizationEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      final allModules = event.module.split(',');

      final fetched = await _fetchAndStoreModules(
        modules: allModules,
        locale: event.locale,
        tenantId: event.tenantId,
        path: event.path,
      );
      if (!fetched) {
        emit(state.copyWith(loading: false, retryModule: allModules.join(',')));
      }

      final localeParts = event.locale.split('_');
      await _loadLocale(localeParts);
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

  /// Refreshes the flow-builder + forms-engine caches from the current SQL
  /// snapshot without any MaterialApp rebuild. Awaitable so callers can
  /// guarantee on-demand codes (e.g. boundary "Administrative Area") are
  /// localized before a JSON-driven flow renders.
  Future<void> refreshFlowBuilderLocalization(String locale) async {
    await _loadLocale(locale.split('_'));
  }

  FutureOr<void> _loadLocale(List codes) async {
    final loc = Locale(codes.first, codes.last);
    LocalizationParams().setLocale(loc);
    await AppLocalizations(loc, sql).load();

    // Keep the flow-builder (JSON-driven flows) and forms-engine (field
    // labels + helptexts) static localization snapshots in sync. Both are
    // captured once when the MaterialApp delegates first build (at login)
    // and only refresh on a full MaterialApp rebuild — which is
    // intentionally gated to language changes to avoid login flicker. So
    // on-demand localizations loaded later (e.g. hcm-boundary-admin for the
    // stock flow) never reach these caches and render as raw codes. Rehydrate
    // both here from the same fresh SQL source AppLocalizations just used,
    // so they stay consistent without any MaterialApp rebuild.
    try {
      final fbRows = await LocalizationLocalRepository().fetchAllForLocale(
        sql: sql,
        locale: '${codes.first}_${codes.last}',
      );
      await flow_builder.FlowBuilderLocalization(
        loc,
        Future.value(fbRows),
        const [],
      ).load();
      await forms_engine.FormLocalization(
        loc,
        Future.value(fbRows),
        const [],
      ).load();
    } catch (e) {
      debugPrint('flow/forms localization refresh skipped: $e');
    }
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
