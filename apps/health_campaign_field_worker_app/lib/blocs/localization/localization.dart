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
  }

  FutureOr<void> _onLoadLocalization(
    OnLoadLocalizationEvent event,
    LocalizationEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      final boundaryModuleCheck =
          event.module.contains(Constants.boundaryLocalizationPath);
      final allModules = event.module.split(',');
      var boundaryModule;

      if (boundaryModuleCheck) {
        final boundaryModuleIndex =
            allModules.indexOf(Constants.boundaryLocalizationPath);
        boundaryModule = allModules[boundaryModuleIndex];
        allModules.removeAt(boundaryModuleIndex);
      }

      try {
        var localizationList;

        var localResults = await LocalizationLocalRepository()
            .fetchLocalization(
                sql: sql, locale: event.locale, module: allModules.join(','));
        if (localResults.isEmpty) {
          var results = await localizationRepository.loadLocalization(
            path: event.path,
            locale: event.locale,
            module: allModules.join(','),
            tenantId: event.tenantId,
          );
          localizationList = LocalizationLocalRepository().create(results, sql);
          if (boundaryModule != null) {
            try {
              var localizationList;
              var localResults = await LocalizationLocalRepository()
                  .fetchLocalization(
                      sql: sql, locale: event.locale, module: boundaryModule);
              if (localResults.isEmpty) {
                var results = await localizationRepository.loadLocalization(
                  path: event.path,
                  locale: event.locale,
                  module: boundaryModule,
                  tenantId: event.tenantId,
                );

                localizationList =
                    LocalizationLocalRepository().create(results, sql);
              } else {
                localizationList = localResults;
              }
            } catch (error) {
              debugPrint('error in boundary module localization $error');
              emit(state.copyWith(loading: false, retryModule: boundaryModule));
            }
          }
        } else {
          localizationList = localResults;
        }
      } catch (error) {
        debugPrint('error in other modules localization $error');
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
    emit(state.copyWith(index: event.index));
    final List codes = event.code.split('_');
    AppSharedPreferences().setSelectedLocale(codes.join("_"));
    _loadLocale(codes);
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
