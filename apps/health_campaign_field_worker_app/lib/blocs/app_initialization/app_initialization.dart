import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:recase/recase.dart';

import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../data/local_store/no_sql/schema/service_registry.dart';
import '../../data/repositories/remote/mdms.dart';
import '../../models/data_model.dart';
import '../../utils/environment_config.dart';
import '../../widgets/network_manager_provider_wrapper.dart';

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
          "tenantId": "mz",
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
          "tenantId": "mz",
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
  const AppInitializationState._();

  const factory AppInitializationState.uninitialized() = AppUninitialized;

  const factory AppInitializationState.loading() = AppInitializing;

  const factory AppInitializationState.initialized({
    required AppConfiguration appConfiguration,
    @Default([]) List<ServiceRegistry> serviceRegistryList,
  }) = AppInitialized;

  Map<DataModelType, Map<ApiOperation, String>> get entityActionMapping {
    return when(
      uninitialized: () => {},
      loading: () => {},
      initialized: (appConfiguration, serviceRegistryList) =>
          serviceRegistryList
              .map((e) => e.actions.map((e) {
                    ApiOperation? operation;
                    DataModelType? type;

                    operation = ApiOperation.values.firstWhereOrNull((element) {
                      return e.action.camelCase == element.name;
                    });

                    type = DataModelType.values.firstWhereOrNull((element) {
                      return e.entityName.camelCase == element.name;
                    });

                    if (operation == null || type == null) return null;

                    return ActionPathModel(
                      operation: operation,
                      type: type,
                      path: e.path,
                    );
                  }))
              .expand((element) => element)
              .whereNotNull()
              .fold(<DataModelType, Map<ApiOperation, String>>{}, (o, element) {
        if (o.containsKey(element.type)) {
          o[element.type]?.addEntries(
            [MapEntry(element.operation, element.path)],
          );
        } else {
          o[element.type] = Map.fromEntries([
            MapEntry(element.operation, element.path),
          ]);
        }

        return o;
      }),
    );
  }

  @override
  String toString() {
    return when<String>(
      uninitialized: () => 'Uninitialized',
      loading: () => 'Loading',
      initialized: (appConfiguration, serviceRegistryList) =>
          'tenantId: ${appConfiguration.tenantId}\n'
          'serviceCount: ${serviceRegistryList.length}',
    );
  }
}
