import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/entities/referral_recon_service.dart';

part 'referral_recon_service.freezed.dart';

typedef ReferralReconServiceEmitter = Emitter<ReferralReconServiceState>;

class ReferralReconServiceBloc
    extends Bloc<ReferralReconServiceEvent, ReferralReconServiceState> {
  ReferralReconServiceBloc(
    super.initialState,
  ) {
    on(_handleCreate);
    on(_multichecklistChanged);
    on(_handleSearch);
    on(_handlereset);
    on(_handleSelect);
  }

  FutureOr<void> _multichecklistChanged(
    ReferralReconServiceChecklistEvent event,
    ReferralReconServiceEmitter emit,
  ) async {
    emit(ReferralReconServiceState.multiCheckListChanged(
      value: event.value,
      submitTriggered: event.submitTriggered,
    ));
  }

  FutureOr<void> _handleCreate(
    ReferralReconServiceCreateEvent event,
    ReferralReconServiceEmitter emit,
  ) async {
    // await serviceDataRepository.create(event.serviceModel);
  }

  FutureOr<void> _handlereset(
    ReferralReconServiceResetEvent event,
    ReferralReconServiceEmitter emit,
  ) async {
    emit(ReferralReconServiceSearchState(
      selectedService: null,
      serviceList: event.serviceList,
    ));
  }

  FutureOr<void> _handleSearch(
    ReferralReconServiceSearchEvent event,
    ReferralReconServiceEmitter emit,
  ) async {
    final results =
        // await serviceDataRepository.search(event.serviceSearchModel);
        emit(ReferralReconServiceSearchState(serviceList: []));
  }

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
