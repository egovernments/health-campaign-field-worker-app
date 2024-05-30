import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:referral_reconciliation/utils/typedefs.dart';

part 'referral_recon_service.freezed.dart';

// Define a typedef for the emitter function used to emit state changes.
typedef ReferralReconServiceEmitter = Emitter<ReferralReconServiceState>;

// Define the Bloc responsible for managing ReferralReconService events and states.
class ReferralReconServiceBloc
    extends Bloc<ReferralReconServiceEvent, ReferralReconServiceState> {
  final ServiceDataRepository serviceDataRepository;
  // Constructor initializes the Bloc with an initial state and sets up event handlers.
  ReferralReconServiceBloc(super.initialState,
      {required this.serviceDataRepository}) {
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
    try {
      await serviceDataRepository.create(event.serviceModel);
    } catch (e) {
      print(e);
    }
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
    final selectedChecklist =
        await serviceDataRepository.search(event.serviceSearchModel);
    emit(ReferralReconServiceSearchState(
        serviceList: selectedChecklist.isNotEmpty ? selectedChecklist : []));
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
      {required ServiceModel serviceModel}) = ReferralReconServiceCreateEvent;

  const factory ReferralReconServiceEvent.search({
    required ServiceSearchModel serviceSearchModel,
  }) = ReferralReconServiceSearchEvent;

  const factory ReferralReconServiceEvent.multichecklistChanged({
    required String value,
    required bool submitTriggered,
  }) = ReferralReconServiceChecklistEvent;
  const factory ReferralReconServiceEvent.selectService({
    required ServiceModel service,
  }) = ReferralReconServiceSelectionEvent;

  const factory ReferralReconServiceEvent.resetSelected({
    required List<ServiceModel> serviceList,
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
    required ServiceModel serviceList,
    ServiceModel? selectedService,
    @Default(false) bool loading,
    @Default(false) bool isEditing,
  }) = ReferralReconServiceCreateState;

  const factory ReferralReconServiceState.serviceSearch({
    required List<ServiceModel> serviceList,
    ServiceModel? selectedService,
    @Default(false) bool loading,
  }) = ReferralReconServiceSearchState;
}
