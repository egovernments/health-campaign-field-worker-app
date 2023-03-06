import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/entities/service_definition.dart';
import '../../utils/environment_config.dart';
import '../../utils/typedefs.dart';

part 'service_definition.freezed.dart';

typedef ServiceDefinitionEmitter = Emitter<ServiceDefinitionState>;

class ServiceDefinitionBloc
    extends Bloc<ServiceDefinitionEvent, ServiceDefinitionState> {
  final ServiceDefinitionDataRepository serviceDefinitionDataRepository;
  ServiceDefinitionBloc(
    super.initialState, {
    required this.serviceDefinitionDataRepository,
  }) {
    on(_handleFetch);
    on(_handleSelect);
  }

  FutureOr<void> _handleFetch(
    ServiceDefinitionFetchEvent event,
    ServiceDefinitionEmitter emit,
  ) async {
    final results = await serviceDefinitionDataRepository.search(
      ServiceDefinitionSearchModel(
        id: "1faa1d3f-c7e4-4334-9ec9-1c5f4259a8c8",
        tenantId: envConfig.variables.tenantId,
      ),
    );

    emit(ServiceDefinitionServiceFetchedState(
      serviceDefinitionList: results,
    ));
  }

  FutureOr<void> _handleSelect(
    ServiceDefinitionSelectionEvent event,
    ServiceDefinitionEmitter emit,
  ) async {
    state.mapOrNull(
      serviceDefinitionFetch: (value) => emit(value.copyWith(
        selectedServiceDefinition: event.serviceDefinition,
      )),
    );
  }
}

@freezed
class ServiceDefinitionEvent with _$ServiceDefinitionEvent {
  const factory ServiceDefinitionEvent.fetch() = ServiceDefinitionFetchEvent;
  const factory ServiceDefinitionEvent.selectServiceDefinition({
    required ServiceDefinitionModel serviceDefinition,
  }) = ServiceDefinitionSelectionEvent;
}

@freezed
class ServiceDefinitionState with _$ServiceDefinitionState {
  const factory ServiceDefinitionState.empty() = ServiceDefinitionEmptyState;
  const factory ServiceDefinitionState.isloading() =
      ServiceDefinitionIsloadingState;
  const factory ServiceDefinitionState.serviceDefinitionFetch({
    required List<ServiceDefinitionModel> serviceDefinitionList,
    ServiceDefinitionModel? selectedServiceDefinition,
  }) = ServiceDefinitionServiceFetchedState;
}
