import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/data_repository.dart';
import '../../models/entities/household.dart';
import '../../models/entities/household_member.dart';
import '../../models/entities/individual.dart';

part 'selected_households.freezed.dart';

typedef SelectedHouseHoldsEmitter = Emitter<SelectedHouseHoldsState>;

class SelectedHouseHoldsBloc
    extends Bloc<SelectedHouseHoldsEvent, SelectedHouseHoldsState> {
  SelectedHouseHoldsBloc(super.initialState, this.householdMember) {
    on(_onHouseHoldsSelection);
  }
  final DataRepository<HouseholdMemberModel, HouseholdMemberSearchModel>
      householdMember;

  FutureOr<void> _onHouseHoldsSelection(
    OnHouseHoldsSelectionEvent event,
    SelectedHouseHoldsEmitter emit,
  ) async {
    final members = await householdMember.search(HouseholdMemberSearchModel(
      individualClientReferenceId: event.household.clientReferenceId,
      isHeadOfHousehold: false,
    ));
    emit(state.copyWith(
      household: event.household,
      individual: event.individual,
      householdMembers: members,
    ));
  }
}

@freezed
class SelectedHouseHoldsEvent with _$SelectedHouseHoldsEvent {
  const factory SelectedHouseHoldsEvent.onHouseHoldsSelection({
    required HouseholdModel household,
    required IndividualModel individual,
  }) = OnHouseHoldsSelectionEvent;
}

@freezed
class SelectedHouseHoldsState with _$SelectedHouseHoldsState {
  const factory SelectedHouseHoldsState({
    HouseholdModel? household,
    IndividualModel? individual,
    List<HouseholdMemberModel>? householdMembers,
  }) = _SelectedHouseHoldsState;
}
