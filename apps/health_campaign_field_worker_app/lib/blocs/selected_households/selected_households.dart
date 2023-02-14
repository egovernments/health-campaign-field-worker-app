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
  final DataRepository<IndividualModel, IndividualSearchModel>
      individualMembers;

  SelectedHouseHoldsBloc(
    super.initialState,
    this.householdMember,
    this.individualMembers,
  ) {
    on(_onHouseHoldsSelection);
  }
  final DataRepository<HouseholdMemberModel, HouseholdMemberSearchModel>
      householdMember;

  FutureOr<void> _onHouseHoldsSelection(
    OnHouseHoldsSelectionEvent event,
    SelectedHouseHoldsEmitter emit,
  ) async {
    final members = await householdMember.search(HouseholdMemberSearchModel(
      householdClientReferenceId: event.household.clientReferenceId,
      isHeadOfHousehold: false,
    ));

    List<IndividualModel> memberList = [];
    for (final element in members) {
      List<IndividualModel> r =
          await individualMembers.search(IndividualSearchModel(
        clientReferenceId: element.individualClientReferenceId,
      ));
      memberList.add(r.first);
    }

    emit(state.copyWith(
      household: event.household,
      individual: event.individual,
      householdMembers: memberList,
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
    List<IndividualModel>? householdMembers,
  }) = _SelectedHouseHoldsState;
}
