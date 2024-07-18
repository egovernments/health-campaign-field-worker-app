import 'dart:async';

import 'package:closed_household/models/entities/user_action.dart';
import 'package:digit_data_model/data/data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../pages/closed_household_details.dart';

part 'closed_household.freezed.dart';

typedef ClosedHouseholdEmitter = Emitter<ClosedHouseholdState>;

class ClosedHouseholdBloc extends Bloc<ClosedHouseholdEvent, ClosedHouseholdState> {
  final DataRepository<UserActionModel, UserActionSearchModel>
  closedHouseholdRepository;

  ClosedHouseholdBloc(
      super.initialState, {
        required this.closedHouseholdRepository,
      }) {
    on(_handleSubmit);
    on(_handleSummary);
  }

  FutureOr<void> _handleSubmit(
      ClosedHouseholdSubmitEvent event,
      ClosedHouseholdEmitter emit,
      ) async {
    emit(state.copyWith(loading: true));
    try {
      if (event.isEditing) {
        await closedHouseholdRepository.update(event.userAction);
      } else {
        await closedHouseholdRepository.create(event.userAction);
      }
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  FutureOr<void> _handleSummary(
      ClosedHouseholdSummaryEvent event,
      ClosedHouseholdEmitter emit,
      ) async {
    emit(state.copyWith(summary: event.summary));
  }

}

@freezed
class ClosedHouseholdEvent with _$ClosedHouseholdEvent {
  const factory ClosedHouseholdEvent.handleSubmit(
      UserActionModel userAction,
      bool isEditing,
      ) = ClosedHouseholdSubmitEvent;

  const factory ClosedHouseholdEvent.handleSummary(
      UserActionModel summary,
      ) = ClosedHouseholdSummaryEvent;
}

@freezed
class ClosedHouseholdState with _$ClosedHouseholdState {
  const factory ClosedHouseholdState({
    @Default(false) bool loading,
    @Default(false) bool isEditing,
    List<UserActionModel>? userActions,
    UserActionModel? summary,
  }) = _ClosedHouseholdState;
}
