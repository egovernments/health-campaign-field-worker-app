import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
