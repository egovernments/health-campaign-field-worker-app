import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:referral_reconciliation/utils/typedefs.dart';
import 'package:survey_form/survey_form.dart';

import '../utils/utils.dart';

part 'referral_recon_service_definition.freezed.dart';

// Define a typedef for the emitter function used to emit state changes.
typedef ReferralReconServiceDefinitionEmitter
    = Emitter<ReferralReconServiceDefinitionState>;

// Define the Bloc responsible for managing ReferralReconServiceDefinition events and states.
class ReferralReconServiceDefinitionBloc extends Bloc<
    ReferralReconServiceDefinitionEvent, ReferralReconServiceDefinitionState> {
  final ServiceDefinitionDataRepository serviceDefinitionDataRepository;
  // Constructor initializes the Bloc with an initial state and sets up event handlers.
  ReferralReconServiceDefinitionBloc(
    super.initialState, {
    required this.serviceDefinitionDataRepository,
  }) {
    on(_handleFetch);
    on(_handleSelect);
  }
  // Event handler for fetching service definitions.
  FutureOr<void> _handleFetch(
    ReferralReconServiceDefinitionFetchEvent event,
    ReferralReconServiceDefinitionEmitter emit,
  ) async {
    List<String> codes = [];
    ReferralReconSingleton().checklistTypes.map((e) => e).forEach((element) {
      codes.add(
          '${ReferralReconSingleton().projectName}.$element.${ReferralReconSingleton().roleCode}');
    });
    final allServiceDefinitions = await serviceDefinitionDataRepository.search(
        ServiceDefinitionSearchModel(
            tenantId: ReferralReconSingleton().tenantId, code: codes));
    // Logic for fetching all service definitions and updating state with the results.

    emit(ReferralReconServiceDefinitionServiceFetchedState(
      serviceDefinitionList: allServiceDefinitions,
    ));
  }

  // Event handler for selecting a service definition.
  FutureOr<void> _handleSelect(
    ReferralReconServiceDefinitionSelectionEvent event,
    ReferralReconServiceDefinitionEmitter emit,
  ) async {
    // Logic for selecting a service definition and updating state accordingly.

    // List<ServiceDefinitionModel>? results = await ReferralReconSingleton()
    //     .getServiceDefinitions(event.serviceDefinitionCode);
    state.mapOrNull(
      serviceDefinitionFetch: (value) => emit(value.copyWith(
        selectedServiceDefinition: value.serviceDefinitionList
            .where((d) => d.code!.contains(event.serviceDefinitionCode))
            .firstOrNull,
      )),
    );
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
    required List<ServiceDefinitionModel> serviceDefinitionList,
    ServiceDefinitionModel? selectedServiceDefinition,
  }) = ReferralReconServiceDefinitionServiceFetchedState;
}
