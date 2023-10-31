import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:recase/recase.dart';

import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../data/local_store/no_sql/schema/service_registry.dart';
import '../../data/repositories/remote/mdms.dart';
import '../../models/app_config/app_config_model.dart';
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

  //App Initialization event to setup the app config and init data
  FutureOr<void> _onAppInitializeSetup(
    AppInitializationSetupEvent event,
    AppInitializationEmitter emit,
  ) async {
    emit(const AppInitializing());

    try {
      if (event.retriesLeft == 0) {
        throw const AppInitializationException('Unable to fetch MDMS Config');
      }

      final config = await _loadOfflineData(emit);
      emit(AppInitialized(
        appConfiguration: config.appConfigs.first,
        serviceRegistryList: config.serviceRegistryList,
      ));
    } on AppInitializationException catch (_) {
      emit(const AppUninitialized());
      rethrow;
    } catch (error) {
      try {
        final result = await mdmsRepository.searchServiceRegistry(
          envConfig.variables.mdmsApiPath,
          MdmsRequestModel(
            mdmsCriteria: MdmsCriteriaModel(
              tenantId: envConfig.variables.tenantId,
              moduleDetails: [
                const MdmsModuleDetailModel(
                  moduleName: 'HCM-SERVICE-REGISTRY',
                  masterDetails: [
                    MdmsMasterDetailModel('serviceRegistry'),
                  ],
                ),
              ],
            ),
          ).toJson(),
        );
        await mdmsRepository.writeToRegistryDB(result, isar);

        final configResult = await mdmsRepository.searchAppConfig(
          envConfig.variables.mdmsApiPath,
          MdmsRequestModel(
            mdmsCriteria: MdmsCriteriaModel(
              tenantId: envConfig.variables.tenantId,
              moduleDetails: [
                const MdmsModuleDetailModel(
                  moduleName: 'HCM-FIELD-APP-CONFIG',
                  masterDetails: [
                    MdmsMasterDetailModel('appConfig'),
                  ],
                ),
                const MdmsModuleDetailModel(
                  moduleName: 'module-version',
                  masterDetails: [
                    MdmsMasterDetailModel('ROW_VERSIONS'),
                  ],
                ),
                const MdmsModuleDetailModel(
                  moduleName: 'HCM-SYMPTOMS-TYPES',
                  masterDetails: [
                    MdmsMasterDetailModel('symptomsTypes'),
                  ],
                ),
                const MdmsModuleDetailModel(
                  moduleName: 'HCM-REFERRAL-REASONS',
                  masterDetails: [
                    MdmsMasterDetailModel('referralReasons'),
                  ],
                ),
              ],
            ),
          ).toJson(),
        );

        final pgrServiceDefinitions =
            await mdmsRepository.searchPGRServiceDefinitions(
          envConfig.variables.mdmsApiPath,
          MdmsRequestModel(
            mdmsCriteria: MdmsCriteriaModel(
              tenantId: envConfig.variables.tenantId,
              moduleDetails: [
                const MdmsModuleDetailModel(
                  moduleName: 'RAINMAKER-PGR',
                  masterDetails: [
                    MdmsMasterDetailModel('ServiceDefs'),
                  ],
                ),
              ],
            ),
          ).toJson(),
        );

        await mdmsRepository.writeToAppConfigDB(
          configResult,
          pgrServiceDefinitions,
          isar,
        );

        add(
          AppInitializationSetupEvent(
            retriesLeft: event.retriesLeft - 1,
          ),
        );
        emit(const AppUninitialized());
      } catch (e) {
        /*Checks for if app initialization failed due to no internet or no retries left */
        emit(const AppInitializationState.failed());
      }
    }
  }

  Future<MdmsConfig> _loadOfflineData(
    Emitter<AppInitializationState> emit,
  ) async {
    final serviceRegistryList = await isar.serviceRegistrys.where().findAll();
    final configs = await isar.appConfigurations.where().findAll();

    if (serviceRegistryList.isEmpty) {
      throw Exception('`serviceRegistryList` cannot be empty');
    }
    if (configs.isEmpty) {
      throw Exception('`configs` cannot be empty');
    }

    return MdmsConfig(
      appConfigs: configs,
      serviceRegistryList: serviceRegistryList,
    );
  }
}

@freezed
class AppInitializationEvent with _$AppInitializationEvent {
  const factory AppInitializationEvent.onSetup({
    @Default(3) int retriesLeft,
  }) = AppInitializationSetupEvent;
}

@freezed
class AppInitializationState with _$AppInitializationState {
  const AppInitializationState._();

  const factory AppInitializationState.uninitialized() = AppUninitialized;

  const factory AppInitializationState.loading() = AppInitializing;
  const factory AppInitializationState.failed() = AppInitializationFailed;

  const factory AppInitializationState.initialized({
    required AppConfiguration appConfiguration,
    @Default([]) List<ServiceRegistry> serviceRegistryList,
  }) = AppInitialized;

  Map<DataModelType, Map<ApiOperation, String>> get entityActionMapping {
    return when(
      uninitialized: () => {},
      loading: () => {},
      failed: () => {},
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
      failed: () => 'Failed',
      initialized: (appConfiguration, serviceRegistryList) =>
          'tenantId: ${appConfiguration.tenantId}\n'
          'serviceCount: ${serviceRegistryList.length}',
    );
  }
}

class MdmsConfig {
  final List<AppConfiguration> appConfigs;
  final List<ServiceRegistry> serviceRegistryList;

  const MdmsConfig({
    required this.appConfigs,
    required this.serviceRegistryList,
  });
}

class AppInitializationException implements Exception {
  final String? message;

  const AppInitializationException([this.message]);
}
