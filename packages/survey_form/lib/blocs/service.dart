import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:survey_form/survey_form.dart';

import '../../utils/typedefs.dart';

part 'service.freezed.dart';

typedef ServiceEmitter = Emitter<ServiceState>;

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final ServiceDataRepository serviceDataRepository;

  ServiceBloc(
      super.initialState, {
        required this.serviceDataRepository,
      }) {
    on(_handleCreate);
    on(_multiSurveyFormChanged);
    on(_handleSearch);
    on(_handlereset);
    on(_handleSelect);
    on(_handleUpdate);
    on(_handleDraftService);
    on(_handleClearDrafts);
  }

  FutureOr<void> _multiSurveyFormChanged(
      ServiceSurveyFormEvent event,
      ServiceEmitter emit,
      ) async {
    emit(ServiceState.multiSurveyFormChanged(
      value: event.value,
      submitTriggered: event.submitTriggered,
      drafts: state.drafts,
    ));
  }

  FutureOr<void> _handleCreate(
      ServiceCreateEvent event,
      ServiceEmitter emit,
      ) async {
    await serviceDataRepository.create(event.serviceModel);
  }

  FutureOr<void> _handleUpdate(
      ServiceUpdateEvent event,
      ServiceEmitter emit,
      ) async {
    await serviceDataRepository.update(event.serviceModel);
  }

  FutureOr<void> _handlereset(
      ServiceResetEvent event,
      ServiceEmitter emit,
      ) async {
    emit(ServiceSearchState(
      selectedService: null,
      serviceList: event.serviceList,
      drafts: []
    ));
  }

  //Handles the service search calls from local DB
  FutureOr<void> _handleSearch(
      ServiceSearchEvent event,
      ServiceEmitter emit,
      ) async {
    final results =
    await serviceDataRepository.search(event.serviceSearchModel);
    emit(ServiceSearchState(serviceList: results, drafts: state.drafts));
  }

  //
  FutureOr<void> _handleSelect(
      ServiceSelectionEvent event,
      ServiceEmitter emit,
      ) async {
    state.mapOrNull(
      serviceSearch: (value) => emit(value.copyWith(
        selectedService: event.service,
        drafts: state.drafts
      )),
    );
  }

  FutureOr<void> _handleDraftService(
      ServiceDraftEvent event,
      ServiceEmitter emit,
      ) async {
    final currentDrafts = state.maybeWhen(
      serviceDraft: (drafts) => drafts,
      orElse: () => [],
    );

    // Check if this draft (based on clientId) already exists
    final index = currentDrafts.indexWhere((d) => d.clientId == event.draftService.clientId);

    List<ServiceModel> updatedDrafts = List.from(currentDrafts);

    if (index >= 0) {
      // Update existing draft
      updatedDrafts[index] = event.draftService;
    } else {
      // Add new draft
      updatedDrafts.add(event.draftService);
    }

    emit(ServiceState.serviceDraft(drafts: updatedDrafts));
  }

  FutureOr<void> _handleClearDrafts(
      ServiceClearDraftsEvent event,
      ServiceEmitter emit,
      ) async {
    emit(const ServiceState.serviceDraft(drafts: []));
  }

}

@freezed
class ServiceEvent with _$ServiceEvent {
  const factory ServiceEvent.create({required ServiceModel serviceModel}) =
  ServiceCreateEvent;

  const factory ServiceEvent.update({required ServiceModel serviceModel}) =
  ServiceUpdateEvent;

  const factory ServiceEvent.search({
    required ServiceSearchModel serviceSearchModel,
  }) = ServiceSearchEvent;

  const factory ServiceEvent.multiSurveyFormChanged({
    required String value,
    required bool submitTriggered,
  }) = ServiceSurveyFormEvent;
  const factory ServiceEvent.selectService({
    required ServiceModel service,
  }) = ServiceSelectionEvent;

  const factory ServiceEvent.resetSelected({
    required List<ServiceModel> serviceList,
  }) = ServiceResetEvent;

  const factory ServiceEvent.draftService({
    required ServiceModel draftService,
  }) = ServiceDraftEvent;

  const factory ServiceEvent.clearDrafts() = ServiceClearDraftsEvent;
}

@freezed
class ServiceState with _$ServiceState {
  const factory ServiceState.empty({
    @Default([]) List<ServiceModel> drafts,
  }) = ServiceEmptyState;

  const factory ServiceState.isloading({
    @Default([]) List<ServiceModel> drafts,
  }) = ServiceIsloadingState;

  const factory ServiceState.multiSurveyFormChanged({
    @Default('') String value,
    @Default(false) bool submitTriggered,
    @Default([]) List<ServiceModel> drafts,
  }) = ServiceMultiSurveyFormChangedState;

  const factory ServiceState.serviceCreate({
    required ServiceModel serviceList,
    ServiceModel? selectedService,
    @Default(false) bool loading,
    @Default(false) bool isEditing,
    @Default([]) List<ServiceModel> drafts,
  }) = ServiceCreateState;

  const factory ServiceState.serviceSearch({
    required List<ServiceModel> serviceList,
    ServiceModel? selectedService,
    @Default(false) bool loading,
    @Default([]) List<ServiceModel> drafts,
  }) = ServiceSearchState;

  const factory ServiceState.serviceDraft({
    required List<ServiceModel> drafts,
  }) = ServiceDraftState;

}
