import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/fake_app_config.dart';
import '../../models/app_config/app_config_model.dart';

part 'app_config.freezed.dart';

typedef ApplicationConfigEmitter = Emitter<ApplicationConfigState>;

class ApplicationConfigBloc
    extends Bloc<ApplicationConfigEvent, ApplicationConfigState> {
  ApplicationConfigBloc(super.initialState) {
    on(_onFetchConfig);
  }

  FutureOr<void> _onFetchConfig(
    UpdateActionEvent event,
    ApplicationConfigEmitter emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    emit(state.copyWith(
      appConfigDetail: AppConfigModel.fromJson(json.decode(mockAppConfigData)),
      isLoading: false,
    ));
  }
}

@freezed
class ApplicationConfigEvent with _$ApplicationConfigEvent {
  const factory ApplicationConfigEvent.onFetchConfig() = UpdateActionEvent;
}

@freezed
class ApplicationConfigState with _$ApplicationConfigState {
  const ApplicationConfigState._();
  const factory ApplicationConfigState({
    @Default(false) bool isLoading,
    AppConfigModel? appConfigDetail,
  }) = _ApplicationConfigState;
}
