import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registration_delivery/blocs/beneficiary_registration/beneficiary_registration.dart';
import 'package:registration_delivery/models/entities/household.dart';

part 'custom_bloc.freezed.dart';

class CustomBeneficiaryRegistrationBloc
    extends Bloc<CustomEvent, CustomBeneficiaryRegistrationState> {
  final BeneficiaryRegistrationBloc beneficiaryRegistrationBloc;

  CustomBeneficiaryRegistrationBloc(
      super.initialState, this.beneficiaryRegistrationBloc) {
    on(_customEvent);
  }

  void _customEvent(
    CustomEvent event,
    Emitter<CustomBeneficiaryRegistrationState> emit,
  ) {
    beneficiaryRegistrationBloc.householdRepository.create(event.houseHoldModel);
  }
}

@freezed
class CustomEvent with _$CustomEvent {
  const factory CustomEvent.newEvent({
    required HouseholdModel houseHoldModel,
  }) = _NewEvent;

  const CustomEvent._(); // Private constructor
}

@freezed
class CustomBeneficiaryRegistrationState
    with _$CustomBeneficiaryRegistrationState {
  const factory CustomBeneficiaryRegistrationState.newState({
    required HouseholdModel houseHoldModel,
  }) = _NewState;

  const CustomBeneficiaryRegistrationState._();
}
