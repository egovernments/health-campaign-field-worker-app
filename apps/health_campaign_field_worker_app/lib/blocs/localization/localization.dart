import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import '../../data/local_store/no_sql/schema/localization.dart';
import '../../data/repositories/remote/localization.dart';
import '../../models/localization/localization_model.dart';
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
    final List<LocalizationWrapper> localizationList = await isar
        .localizationWrappers
        .filter()
        .localeEqualTo(event.locale)
        .findAll();

    if (localizationList.isEmpty) {
      emit(state.copyWith(loading: true));
      LocalizationModel result = await localizationRepository.search(
        url: event.path,
        queryParameters: {
          "module": event.module,
          "locale": event.locale,
          "tenantId": event.tenantId,
        },
      );

      final LocalizationWrapper localizationWrapper = LocalizationWrapper();
      final List<Localization> newLocalizationList = [];

      result.messages.every((element) {
        final newLocalization = Localization();
        newLocalization.message = element.message;
        newLocalization.code = element.code;
        newLocalization.locale = element.locale;
        newLocalization.module = element.module;
        newLocalizationList.add(newLocalization);

        return true;
      });
      localizationWrapper.locale = event.locale;
      localizationWrapper.localization = newLocalizationList;

      await isar.writeTxn(() async {
        await isar.localizationWrappers.put(localizationWrapper);
        // insert & update
      });
      final List codes = event.locale.split('_');
      loadLocal(codes);
    } else if (localizationList.isNotEmpty) {
      emit(state.copyWith(
        locaization: localizationList.first.localization!,
        loading: false,
      ));
      final List codes = event.locale.split('_');
      loadLocal(codes);
    }
  }

  FutureOr<void> _onUpdateLocalizationIndex(
    OnUpdateLocalizationIndexEvent event,
    LocalizationEmitter emit,
  ) async {
    emit(state.copyWith(index: event.index));
    final List codes = event.code.split('_');
    loadLocal(codes);
  }

  FutureOr<void> loadLocal(List codes) async {
    await AppLocalizations(
      Locale(codes.first, codes.last),
      isar,
    ).load();
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
    @Default([]) List<Localization> locaization,
    @Default(false) bool loading,
    @Default(0) int index,
    @Default(false) bool isLocalizationLoadCompleted,
  }) = _LocalizationState;
}
