import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../data/local_store/no_sql/schema/service_registry.dart';
import '../../data/repositories/remote/mdms.dart';
import '../../utils/environment_config.dart';

part 'app_initialization.freezed.dart';

typedef AppInitializationEmitter = Emitter<AppInitializationState>;

class AppInitializationBloc
    extends Bloc<AppInitializationEvent, AppInitializationState> {
  final MdmsRepository mdmsRepository;
  final Isar isar;

  AppInitializationBloc({
    required this.mdmsRepository,
    required this.isar,
  }) : super(const AppUninitialized()) {
    on(_onAppInitializeSetup);
  }

  FutureOr<void> _onAppInitializeSetup(
    AppInitializationSetupEvent event,
    AppInitializationEmitter emit,
  ) async {
    emit(const AppInitializing());
    final result = await mdmsRepository.searchServiceRegistry(
      envConfig.variables.mdmsApiPath,
      {
        "MdmsCriteria": {
          "tenantId": "default",
          "moduleDetails": [
            {
              "moduleName": "HCM-SERVICE-REGISTRY",
              "masterDetails": [
                {
                  "name": "serviceRegistry",
                },
              ],
            },
          ],
        },
      },
    );

    await mdmsRepository.writeToRegistryDB(result, isar);
    final serviceRegistryList = await isar.serviceRegistrys.where().findAll();

    final configResult = await mdmsRepository.searchAppConfig(
      envConfig.variables.mdmsApiPath,
      {
        "MdmsCriteria": {
          "tenantId": "default",
          "moduleDetails": [
            {
              "moduleName": "HCM-FIELD-APP-CONFIG",
              "masterDetails": [
                {
                  "name": "appConfig",
                },
              ],
            },
          ],
        },
      },
    );

    await mdmsRepository.writeToAppConfigDB(configResult, isar);
    final configs = await isar.appConfigurations.where().findAll();

    if (configs.isEmpty) throw Exception('`configs` cannot be empty');

    emit(AppInitialized(
      appConfiguration: configs.first,
      serviceRegistryList: serviceRegistryList,
    ));
  }
}

@freezed
class AppInitializationEvent with _$AppInitializationEvent {
  const factory AppInitializationEvent.onSetup() = AppInitializationSetupEvent;

  const factory AppInitializationEvent.onApplicationConfigurationSetup({
    String? service,
    required String actionType,
  }) = FindAppConfigurationEvent;
}

@freezed
class AppInitializationState with _$AppInitializationState {
  const factory AppInitializationState.uninitialized() = AppUninitialized;

  const factory AppInitializationState.loading() = AppInitializing;

  const factory AppInitializationState.initialized({
    required AppConfiguration appConfiguration,
    @Default([]) List<ServiceRegistry> serviceRegistryList,
  }) = AppInitialized;
}
