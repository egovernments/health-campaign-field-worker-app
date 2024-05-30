import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'household_location.freezed.dart';

typedef HouseholdLocationEmitter = Emitter<HouseholdLocationState>;

class HouseholdLocationBloc
    extends Bloc<HouseholdLocationEvent, HouseholdLocationState> {
  HouseholdLocationBloc(super.initialState) {
    on<HouseholdLocationSubmitEvent>(_onSubmit);
  }

  FutureOr<void> _onSubmit(
    HouseholdLocationSubmitEvent event,
    HouseholdLocationEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(loading: false));
  }
}

@freezed
class HouseholdLocationEvent with _$HouseholdLocationEvent {
  const factory HouseholdLocationEvent.onSubmit({
    required AddressModel adressmodel,
  }) = HouseholdLocationSubmitEvent;
}

@freezed
class HouseholdLocationState with _$HouseholdLocationState {
  const HouseholdLocationState._();

  const factory HouseholdLocationState({
    @Default(false) bool loading,
    @Default(true) bool isEditModeEnabled,
    AddressModel? addressModel,
    AddressSearchModel? addressRequestModel,
  }) = _HouseholdLocationState;
}
