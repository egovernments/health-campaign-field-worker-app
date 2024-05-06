import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:referral_reconciliation/blocs/referral_reconciliation_listeners.dart';

import '../models/entities/referral_recon_service.dart';

part 'referral_recon_service.freezed.dart';

// Define a typedef for the emitter function used to emit state changes.
typedef ReferralReconServiceEmitter = Emitter<ReferralReconServiceState>;

// Define the Bloc responsible for managing ReferralReconService events and states.
class ReferralReconServiceBloc
    extends Bloc<ReferralReconServiceEvent, ReferralReconServiceState> {
  final ReferralReconSingleton referralReconSingleton;
  // Constructor initializes the Bloc with an initial state and sets up event handlers.
  ReferralReconServiceBloc(
    super.initialState, {
    required this.referralReconSingleton,
  }) {
    on(_handleCreate);
    on(_multichecklistChanged);
    on(_handleSearch);
    on(_handlereset);
    on(_handleSelect);
  }

  // Event handler for when the multichecklist changes.
  FutureOr<void> _multichecklistChanged(
    ReferralReconServiceChecklistEvent event,
    ReferralReconServiceEmitter emit,
  ) async {
    emit(ReferralReconServiceState.multiCheckListChanged(
      value: event.value,
      submitTriggered: event.submitTriggered,
    ));
  }

  // Event handler for creating a new service.
  FutureOr<void> _handleCreate(
    ReferralReconServiceCreateEvent event,
    ReferralReconServiceEmitter emit,
  ) async {
    bool? isServiceRequestSaved = false;
    isServiceRequestSaved = await referralReconSingleton
        .saveServiceRequestDetails(SaveServiceRequest(
      serviceModel: event.serviceModel,
      additionalData: null,
    ));
  }

  // Event handler for resetting selected services.
  FutureOr<void> _handlereset(
    ReferralReconServiceResetEvent event,
    ReferralReconServiceEmitter emit,
  ) async {
    emit(ReferralReconServiceSearchState(
      selectedService: null,
      serviceList: event.serviceList,
    ));
  }

  // Event handler for searching services.
  FutureOr<void> _handleSearch(
    ReferralReconServiceSearchEvent event,
    ReferralReconServiceEmitter emit,
  ) async {
    final results = await referralReconSingleton
        .getSavedChecklist(event.serviceSearchModel);
    emit(ReferralReconServiceSearchState(
        serviceList: results != null ? [results] : []));
  }

  // Event handler for selecting a service.
  FutureOr<void> _handleSelect(
    ReferralReconServiceSelectionEvent event,
    ReferralReconServiceEmitter emit,
  ) async {
    state.mapOrNull(
      serviceSearch: (value) => emit(value.copyWith(
        selectedService: event.service,
      )),
    );
  }
}

// Define freezed classes for the ReferralReconService events.
@freezed
class ReferralReconServiceEvent with _$ReferralReconServiceEvent {
  const factory ReferralReconServiceEvent.create(
          {required ReferralReconServiceModel serviceModel}) =
      ReferralReconServiceCreateEvent;

  const factory ReferralReconServiceEvent.search({
    required ReferralReconServiceSearchModel serviceSearchModel,
  }) = ReferralReconServiceSearchEvent;

  const factory ReferralReconServiceEvent.multichecklistChanged({
    required String value,
    required bool submitTriggered,
  }) = ReferralReconServiceChecklistEvent;
  const factory ReferralReconServiceEvent.selectService({
    required ReferralReconServiceModel service,
  }) = ReferralReconServiceSelectionEvent;

  const factory ReferralReconServiceEvent.resetSelected({
    required List<ReferralReconServiceModel> serviceList,
  }) = ReferralReconServiceResetEvent;
}

// Define freezed classes for the ReferralReconService states.
@freezed
class ReferralReconServiceState with _$ReferralReconServiceState {
  const factory ReferralReconServiceState.empty() =
      ReferralReconServiceEmptyState;

  const factory ReferralReconServiceState.isLoading() =
      ReferralReconServiceIsloadingState;

  const factory ReferralReconServiceState.multiCheckListChanged({
    @Default('') String value,
    @Default(false) bool submitTriggered,
  }) = ReferralReconServiceMultichecklistChangedState;

  const factory ReferralReconServiceState.serviceCreate({
    required ReferralReconServiceModel serviceList,
    ReferralReconServiceModel? selectedService,
    @Default(false) bool loading,
    @Default(false) bool isEditing,
  }) = ReferralReconServiceCreateState;

  const factory ReferralReconServiceState.serviceSearch({
    required List<ReferralReconServiceModel> serviceList,
    ReferralReconServiceModel? selectedService,
    @Default(false) bool loading,
  }) = ReferralReconServiceSearchState;
}
