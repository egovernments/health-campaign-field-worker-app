import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/entities/service.dart';
import '../../utils/typedefs.dart';
import '../../utils/utils.dart';

part 'service.freezed.dart';

typedef ServiceEmitter = Emitter<ServiceState>;

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final ServiceDataRepository serviceDataRepository;
  ServiceBloc(
    super.initialState, {
    required this.serviceDataRepository,
  }) {
    on(_handleCreate);
    on(_multichecklistChanged);
  }

  FutureOr<void> _multichecklistChanged(
    ServiceChecklistEvent event,
    ServiceEmitter emit,
  ) async {
    emit(ServiceState.multichecklistChanged(value: event.value));
  }

  FutureOr<void> _handleCreate(
    ServiceCreateEvent event,
    ServiceEmitter emit,
  ) async {
    await serviceDataRepository.create(event.serviceModel);
  }
}

@freezed
class ServiceEvent with _$ServiceEvent {
  const factory ServiceEvent.create({required ServiceModel serviceModel}) =
      ServiceCreateEvent;

  const factory ServiceEvent.multichecklistChanged({required String value}) =
      ServiceChecklistEvent;
}

@freezed
class ServiceState with _$ServiceState {
  const factory ServiceState.empty() = ServiceEmptyState;
  const factory ServiceState.isloading() = ServiceIsloadingState;
  const factory ServiceState.multichecklistChanged({
    @Default('') String value,
  }) = ServiceMultichecklistChangedState;
  const factory ServiceState.serviceCreate({
    required ServiceModel serviceList,
    ServiceModel? selectedService,
    @Default(false) bool loading,
    @Default(false) bool isEditing,
  }) = ServiceCreateState;
}
