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
  }

  FutureOr<void> _multiSurveyFormChanged(
      ServiceSurveyFormEvent event,
      ServiceEmitter emit,
      ) async {
    emit(ServiceState.multiSurveyFormChanged(
      value: event.value,
      submitTriggered: event.submitTriggered,
    ));
  }

  FutureOr<void> _handleCreate(
      ServiceCreateEvent event,
      ServiceEmitter emit,
      ) async {
    await serviceDataRepository.create(event.serviceModel);
  }

  FutureOr<void> _handlereset(
      ServiceResetEvent event,
      ServiceEmitter emit,
      ) async {
    emit(ServiceSearchState(
      selectedService: null,
      serviceList: event.serviceList,
    ));
  }

  //Handles the service search calls from local DB
  FutureOr<void> _handleSearch(
      ServiceSearchEvent event,
      ServiceEmitter emit,
      ) async {
    final results =
    await serviceDataRepository.search(event.serviceSearchModel);
    emit(ServiceSearchState(serviceList: results));
  }

  //
  FutureOr<void> _handleSelect(
      ServiceSelectionEvent event,
      ServiceEmitter emit,
      ) async {
    state.mapOrNull(
      serviceSearch: (value) => emit(value.copyWith(
        selectedService: event.service,
      )),
    );
  }
}

@freezed
class ServiceEvent with _$ServiceEvent {
  const factory ServiceEvent.create({required ServiceModel serviceModel}) =
  ServiceCreateEvent;

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
}

@freezed
class ServiceState with _$ServiceState {
  const factory ServiceState.empty() = ServiceEmptyState;

  const factory ServiceState.isloading() = ServiceIsloadingState;

  const factory ServiceState.multiSurveyFormChanged({
    @Default('') String value,
    @Default(false) bool submitTriggered,
  }) = ServiceMultiSurveyFormChangedState;

  const factory ServiceState.serviceCreate({
    required ServiceModel serviceList,
    ServiceModel? selectedService,
    @Default(false) bool loading,
    @Default(false) bool isEditing,
  }) = ServiceCreateState;

  const factory ServiceState.serviceSearch({
    required List<ServiceModel> serviceList,
    ServiceModel? selectedService,
    @Default(false) bool loading,
  }) = ServiceSearchState;
}
