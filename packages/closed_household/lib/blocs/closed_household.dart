import 'dart:async';

import 'package:closed_household/models/entities/user_action.dart';
import 'package:digit_data_model/data/data_repository.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/entities/status.dart';
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
    on(_handleUpdate);
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

  FutureOr<void> _handleUpdate(
      ClosedHouseholdUpdateEvent event,
      ClosedHouseholdEmitter emit,
      ) async {
    emit(state.copyWith(loading: true));

    try {
      List<UserActionModel> userActions = [];

      userActions = await closedHouseholdRepository.search(
        UserActionSearchModel(clientReferenceId: [event.selectedClientReferenceId]),
      );
    
      if (userActions.isNotEmpty) {
        final userAction = userActions.first;
        final updatedUserAction = userAction.copyWith(
          status: Status.resolved.toValue(),
          additionalFields: UserActionAdditionalFields(
            version: 1,
            fields: [
              AdditionalField(
                'HouseholdId',
                 event.selectedHouseholdId,
              ),
            ],
          ),
        );

        await closedHouseholdRepository.update(updatedUserAction);

        emit(state.copyWith(
          loading: false,
          userActions: [updatedUserAction],
        ));
      } else {
        emit(state.copyWith(
          loading: false,
          userActions: [],
        ));
      }
    } catch (error) {
      emit(state.copyWith(
        loading: false,
        userActions: [],
      ));
    }
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

  const factory ClosedHouseholdEvent.handleUpdate(
      String selectedClientReferenceId,
      String selectedHouseholdId,
      ) = ClosedHouseholdUpdateEvent;

}

@freezed
class ClosedHouseholdState with _$ClosedHouseholdState {
  const factory ClosedHouseholdState({
    @Default(false) bool loading,
    @Default(false) bool isEditing,
    List<UserActionModel>? userActions,
    UserActionModel? summary,
    String? selectedClientReferenceId,
    String? selectedHouseholdId,
  }) = _ClosedHouseholdState;
}
