// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../data/data_repository.dart';
import '../../models/data_model.dart';
import '../../utils/environment_config.dart';

part 'beneficiary_registration.freezed.dart';

typedef BeneficiaryRegistrationEmitter = Emitter<BeneficiaryRegistrationState>;

class BeneficiaryRegistrationBloc
    extends Bloc<BeneficiaryRegistrationEvent, BeneficiaryRegistrationState> {
  final DataRepository<IndividualModel, IndividualSearchModel>
      individualRepository;

  final DataRepository<HouseholdModel, HouseholdSearchModel>
      householdRepository;

  final DataRepository<HouseholdMemberModel, HouseholdMemberSearchModel>
      householdMemberSearchRepository;

  BeneficiaryRegistrationBloc(
    super.initialState, {
    required this.individualRepository,
    required this.householdRepository,
    required this.householdMemberSearchRepository,
  }) {
    on(_handleSaveAddress);
    on(_handleSaveHouseholdDetails);
    on(_handleSaveIndividualDetails);
    on(_handleSubmit);
  }

  FutureOr<void> _handleSaveAddress(
    BeneficiaryRegistrationSaveAddressEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    emit(state.copyWith(addressModel: event.model));
  }

  FutureOr<void> _handleSaveHouseholdDetails(
    BeneficiaryRegistrationSaveHouseholdDetailsEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    emit(state.copyWith(householdModel: event.model));
  }

  FutureOr<void> _handleSaveIndividualDetails(
    BeneficiaryRegistrationSaveIndividualDetailsEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    emit(state.copyWith(individualModel: event.model));
  }

  FutureOr<void> _handleSubmit(
    BeneficiaryRegistrationSubmitEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    final individual = state.individualModel;
    final household = state.householdModel;
    final address = state.addressModel;

    if (individual == null) throw Exception('Individual cannot be null');
    if (household == null) throw Exception('Household cannot be null');
    if (address == null) throw Exception('Address cannot be null');

    emit(state.copyWith(loading: true));
    try {
      await individualRepository.create(individual);
      await householdRepository.create(household);
      await householdMemberSearchRepository.create(
        HouseholdMemberModel(
          householdClientReferenceId: household.clientReferenceId,
          individualClientReferenceId: individual.clientReferenceId,
          isHeadOfHousehold: state.isHeadOfHousehold,
          tenantId: envConfig.variables.tenantId,
          rowVersion: 1,
          clientReferenceId: const Uuid().v1(),
        ),
      );
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}

@freezed
class BeneficiaryRegistrationEvent with _$BeneficiaryRegistrationEvent {
  const factory BeneficiaryRegistrationEvent.saveAddress(
    AddressModel model,
  ) = BeneficiaryRegistrationSaveAddressEvent;

  const factory BeneficiaryRegistrationEvent.saveHouseholdDetails(
    HouseholdModel model,
  ) = BeneficiaryRegistrationSaveHouseholdDetailsEvent;

  const factory BeneficiaryRegistrationEvent.saveIndividualDetails(
    IndividualModel model,
  ) = BeneficiaryRegistrationSaveIndividualDetailsEvent;

  const factory BeneficiaryRegistrationEvent.submit() =
      BeneficiaryRegistrationSubmitEvent;
}

@freezed
class BeneficiaryRegistrationState with _$BeneficiaryRegistrationState {
  const factory BeneficiaryRegistrationState({
    AddressModel? addressModel,
    IndividualModel? individualModel,
    HouseholdModel? householdModel,
    @Default(false) bool isHeadOfHousehold,
    @Default(false) bool loading,
  }) = _BeneficiaryRegistrationState;
}
