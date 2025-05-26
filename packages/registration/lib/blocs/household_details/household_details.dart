import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registration/models/entities/household.dart';

part 'household_details.freezed.dart';

typedef HouseholdEmitter = Emitter<HouseholdDetailsState>;

class HouseholdDetailsBloc
    extends Bloc<HouseholdDetailsEvent, HouseholdDetailsState> {
  HouseholdDetailsBloc(super.initialState) {
    on<HouseholdDetailsSubmitEvent>(_onSubmit);
  }

  FutureOr<void> _onSubmit(
    HouseholdDetailsSubmitEvent event,
    HouseholdEmitter emit,
  ) async {
    emit(state.copyWith(loading: true));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(loading: false));
  }
}

@freezed
class HouseholdDetailsEvent with _$HouseholdDetailsEvent {
  const factory HouseholdDetailsEvent.onSubmit({
    required HouseholdModel householdModel,
  }) = HouseholdDetailsSubmitEvent;
}

@freezed
class HouseholdDetailsState with _$HouseholdDetailsState {
  const HouseholdDetailsState._();

  const factory HouseholdDetailsState({
    @Default(false) bool loading,
    @Default(true) bool isEditModeEnabled,
    HouseholdModel? householdModel,
  }) = _HouseholdDetailsState;
}
