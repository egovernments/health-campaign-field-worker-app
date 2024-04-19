import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:referral_reconciliation/blocs/referral_reconciliation_listeners.dart';

import '../models/entities/referral_recon_service_definition.dart';

part 'referral_recon_service_definition.freezed.dart';

typedef ReferralReconServiceDefinitionEmitter
    = Emitter<ReferralReconServiceDefinitionState>;

class ReferralReconServiceDefinitionBloc extends Bloc<
    ReferralReconServiceDefinitionEvent, ReferralReconServiceDefinitionState> {
  ReferralReconServiceDefinitionBloc(
    super.initialState,
  ) {
    on(_handleFetch);
    on(_handleSelect);
  }

  FutureOr<void> _handleFetch(
    ReferralReconServiceDefinitionFetchEvent event,
    ReferralReconServiceDefinitionEmitter emit,
  ) async {
    List<ReferralReconServiceDefinitionModel>? results =
        await ReferralReconSingleton().getServiceDefinitions('');

    emit(ReferralReconServiceDefinitionServiceFetchedState(
      serviceDefinitionList: results ?? [],
    ));
  }

  FutureOr<void> _handleSelect(
    ReferralReconServiceDefinitionSelectionEvent event,
    ReferralReconServiceDefinitionEmitter emit,
  ) async {
    List<ReferralReconServiceDefinitionModel>? results =
        await ReferralReconSingleton()
            .getServiceDefinitions(event.serviceDefinitionCode);
    emit(ReferralReconServiceDefinitionServiceFetchedState(
        serviceDefinitionList: results ?? [],
        selectedServiceDefinition:
            (results ?? []).isNotEmpty ? results?.first : null));
  }
}

@freezed
class ReferralReconServiceDefinitionEvent
    with _$ReferralReconServiceDefinitionEvent {
  const factory ReferralReconServiceDefinitionEvent.fetch() =
      ReferralReconServiceDefinitionFetchEvent;
  const factory ReferralReconServiceDefinitionEvent.selectServiceDefinition({
    required String serviceDefinitionCode,
  }) = ReferralReconServiceDefinitionSelectionEvent;
}

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
