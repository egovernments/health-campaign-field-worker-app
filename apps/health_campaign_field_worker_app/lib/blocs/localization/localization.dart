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

  LocalizationBloc(
    super.initialState,
    this.localizationRepository,
  ) {
    on(_onLoadLocalization);
  }

  FutureOr<void> _onLoadLocalization(
    OnLoadLocalizationEvent event,
    LocalizationEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    LocalizationModel result = await localizationRepository.search(
      url: 'localization/messages/v1/_search',
      queryParameters: {
        "module": event.module,
        "locale": event.locale,
        "tenantId": event.tenantId,
      },
    );

    final isar = await Isar.open([LocalizationSchema]);
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

    await isar.writeTxn(() async {
      await isar.localizations.putAll(newLocalizationList); // insert & update
    });

// Need to add onemore method and pass the filers
    final List<Localization> localizationList =
        await isar.localizations.where().findAll();
    if (localizationList.isNotEmpty) {
      emit(state.copyWith(locaization: localizationList, loading: false));
    }

    await AppLocalizations(
      const Locale('en', 'IN'),
    ).load();
  }
}

@freezed
class LocalizationEvent with _$LocalizationEvent {
  const factory LocalizationEvent.onLoadLocalization({
    required String module,
    required String tenantId,
    required String locale,
  }) = OnLoadLocalizationEvent;
}

@freezed
class LocalizationState with _$LocalizationState {
  const factory LocalizationState({
    @Default([]) List<Localization> locaization,
    @Default(false) bool loading,
    @Default(false) bool isLocalizationLoadCompleted,
  }) = _LocalizationState;
}
