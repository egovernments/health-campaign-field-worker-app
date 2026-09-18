import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:survey_form/survey_form.dart';

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

  // This function is called to fetch all the service definitions from the table for the selected project
  FutureOr<void> _handleFetch(
      ServiceDefinitionFetchEvent event,
      ServiceDefinitionEmitter emit,
      ) async {
    final projectName = SurveyFormSingleton().projectName;
    final roles = SurveyFormSingleton().roles as List;
    final checklistTypes = SurveyFormSingleton().checklistTypes;

    // Construct exact codes: {projectName}.{checklistType}.{ROLE}
    final List<String> codes = [];
    for (final role in roles) {
      for (final checklistType in checklistTypes) {
        codes.add('$projectName.$checklistType.$role');
      }
    }

    final results = await serviceDefinitionDataRepository.search(
      ServiceDefinitionSearchModel(
        tenantId: SurveyFormSingleton().tenantId,
        code: codes.isNotEmpty ? codes : null,
      ),
    );
    emit(ServiceDefinitionServiceFetchedState(
      serviceDefinitionList: results,
    ));
  }

  // Called when we select a service definition from the displayed list of service definition
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




