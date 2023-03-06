// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import '../../data/repositories/oplog/oplog.dart';
import '../../utils/environment_config.dart';
import '../../data/repositories/local/service_definition.dart';
import '../../data/local_store/sql_store/sql_store.dart';
import '../../data/repositories/remote/service_definition.dart';
import '../../models/entities/service_definition.dart';

part 'service_definition_remote.freezed.dart';

typedef ServiceDefinitionRemoteEmitter = Emitter<ServiceDefinitionRemoteState>;

class ServiceDefinitionRemoteBloc
    extends Bloc<ServiceDefinitionRemoteEvent, ServiceDefinitionRemoteState> {
  final ServiceDefinitionRemoteRepository serviceDefinitionremoteRepository;
  final Isar isar;
  final LocalSqlDataStore sql;

  ServiceDefinitionRemoteBloc(
    super.initialState, {
    required this.serviceDefinitionremoteRepository,
    required this.sql,
    required this.isar,
  }) {
    on(_handleInit);
  }

  FutureOr<void> _handleInit(
    ServiceDefinitionInitEvent event,
    ServiceDefinitionRemoteEmitter emit,
  ) async {
    final serviceDefinition = await serviceDefinitionremoteRepository
        .search(ServiceDefinitionSearchModel(
      id: "1faa1d3f-c7e4-4334-9ec9-1c5f4259a8c8",
      tenantId: envConfig.variables.tenantId,
    ));

    await ServiceDefinitionLocalRepository(
      sql,
      ServiceDefinitionOpLogManager(isar),
    ).create(serviceDefinition.first);

    // final serviceDefinitionData = await serviceDefinitionDataRepository
    //     .search(ServiceDefinitionSearchModel(
    //   id: "1faa1d3f-c7e4-4334-9ec9-1c5f4259a8c8",
    //   tenantId: envConfig.variables.tenantId,
    // ));

    // handle logic for init here
  }
}

@freezed
class ServiceDefinitionRemoteEvent with _$ServiceDefinitionRemoteEvent {
  const factory ServiceDefinitionRemoteEvent.init() =
      ServiceDefinitionInitEvent;
  const factory ServiceDefinitionRemoteEvent.selectServiceDefinition({
    required ServiceDefinitionModel serviceDefinition,
  }) = ServiceDefinitionSelectionEvent;
}

@freezed
class ServiceDefinitionRemoteState with _$ServiceDefinitionRemoteState {
  const factory ServiceDefinitionRemoteState.empty() =
      ServiceDefinitionEmptyState;
  const factory ServiceDefinitionRemoteState.isloading() =
      ServiceDefinitionIsloadingState;
  const factory ServiceDefinitionRemoteState.serviceDefinitionInit({
    required List<ServiceDefinitionModel> serviceDefinitionList,
  }) = ServiceDefinitionServiceInitState;

  const factory ServiceDefinitionRemoteState.serviceDefinitionSelected({
    required ServiceDefinitionModel serviceDefinition,
  }) = ServiceDefinitionServiceSelectedState;
}
