import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:referral_reconciliation/blocs/referral_reconciliation_listeners.dart';

import '../models/entities/referral_recon_service_definition.dart';

part 'referral_recon_service_definition.freezed.dart';

// Define a typedef for the emitter function used to emit state changes.
typedef ReferralReconServiceDefinitionEmitter
    = Emitter<ReferralReconServiceDefinitionState>;

// Define the Bloc responsible for managing ReferralReconServiceDefinition events and states.
class ReferralReconServiceDefinitionBloc extends Bloc<
    ReferralReconServiceDefinitionEvent, ReferralReconServiceDefinitionState> {
  final ReferralReconSingleton referralReconSingleton;
  // Constructor initializes the Bloc with an initial state and sets up event handlers.
  ReferralReconServiceDefinitionBloc(
    super.initialState, {
    required this.referralReconSingleton,
  }) {
    on(_handleFetch);
    on(_handleSelect);
  }
  // Event handler for fetching service definitions.
  FutureOr<void> _handleFetch(
    ReferralReconServiceDefinitionFetchEvent event,
    ReferralReconServiceDefinitionEmitter emit,
  ) async {
    // Logic for fetching all service definitions and updating state with the results.
    List<ReferralReconServiceDefinitionModel>? results =
        await referralReconSingleton.getServiceDefinitionsList();

    emit(ReferralReconServiceDefinitionServiceFetchedState(
      serviceDefinitionList: results ?? [],
    ));
  }

  // Event handler for selecting a service definition.
  FutureOr<void> _handleSelect(
    ReferralReconServiceDefinitionSelectionEvent event,
    ReferralReconServiceDefinitionEmitter emit,
  ) async {
    // Logic for selecting a service definition and updating state accordingly.

    List<ReferralReconServiceDefinitionModel>? results =
        await referralReconSingleton
            .getServiceDefinitions(event.serviceDefinitionCode);
    emit(ReferralReconServiceDefinitionServiceFetchedState(
        serviceDefinitionList: results ?? [],
        selectedServiceDefinition:
            (results ?? []).isNotEmpty ? results?.first : null));
  }
}

// Define freezed classes for the ReferralReconServiceDefinition events.

@freezed
class ReferralReconServiceDefinitionEvent
    with _$ReferralReconServiceDefinitionEvent {
  const factory ReferralReconServiceDefinitionEvent.fetch() =
      ReferralReconServiceDefinitionFetchEvent;
  const factory ReferralReconServiceDefinitionEvent.selectServiceDefinition({
    required String serviceDefinitionCode,
  }) = ReferralReconServiceDefinitionSelectionEvent;
}

// Define freezed classes for the ReferralReconServiceDefinition states.

@freezed
class ReferralReconServiceDefinitionState
    with _$ReferralReconServiceDefinitionState {
  const factory ReferralReconServiceDefinitionState.empty() =
      ReferralReconServiceDefinitionEmptyState;
  const factory ReferralReconServiceDefinitionState.isloading() =
      ReferralReconServiceDefinitionIsloadingState;
  const factory ReferralReconServiceDefinitionState.serviceDefinitionFetch({
    required List<ReferralReconServiceDefinitionModel> serviceDefinitionList,
    ReferralReconServiceDefinitionModel? selectedServiceDefinition,
  }) = ReferralReconServiceDefinitionServiceFetchedState;
}
