import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_dss/digit_dss.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar_community/isar.dart';
import 'package:recase/recase.dart';

import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../data/local_store/no_sql/schema/service_registry.dart';
import '../../data/repositories/remote/mdms.dart';
import '../../models/entities/mdms_master_enums.dart';
import '../../models/entities/mdms_module_enums.dart';
import '../../utils/environment_config.dart';
import '../../widgets/network_manager_provider_wrapper.dart';

part 'app_initialization.freezed.dart';

typedef AppInitializationEmitter = Emitter<AppInitializationState>;

class AppInitializationBloc
    extends Bloc<AppInitializationEvent, AppInitializationState> {
  final MdmsRepository mdmsRepository;
  final DashboardRemoteRepository dashboardRemoteRepository;
  final Isar isar;

  AppInitializationBloc({
    required this.mdmsRepository,
    required this.dashboardRemoteRepository,
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
        appConfiguration: config.appConfigs.firstOrNull!,
        serviceRegistryList: config.serviceRegistryList,
        dashboardConfigSchema: config.dashboardConfigSchema,
      ));
    } on AppInitializationException catch (_) {
      emit(const AppUninitialized());
      rethrow;
    } catch (error) {
      try {
        final result = await mdmsRepository.searchServiceRegistry(
          envConfig.variables.mdmsApiPath,
          envConfig.variables.tenantId,
        );
        await mdmsRepository.writeToRegistryDB(result, isar);

        final configResult = await mdmsRepository.searchAppConfig(
          envConfig.variables.mdmsApiPath,
          envConfig.variables.tenantId,
        );

        final pgrServiceDefinitions =
            await mdmsRepository.searchPGRServiceDefinitions(
          envConfig.variables.mdmsApiPath,
          envConfig.variables.tenantId,
        );

        await mdmsRepository.writeToAppConfigDB(
          configResult,
          pgrServiceDefinitions,
          isar,
        );
        try {
          final dashboardDataList = await mdmsRepository.searchMDMS(
            envConfig.variables.mdmsApiPath,
            tenantId: envConfig.variables.tenantId,
            schemaCode: '${ModuleEnums.hcm.toValue()}.${MasterEnums.dashboardConfig.toValue()}',
          );
          if (dashboardDataList.isNotEmpty) {
            final String dashboardKey = MasterEnums.dashboardConfig.toValue() as String;
            final dashboardConfigs = DashboardConfigPrimaryWrapper.fromJson(
              {dashboardKey: dashboardDataList},
            ).dashboardConfigWrapper;

            if (dashboardConfigs.isNotEmpty) {
              await dashboardRemoteRepository.writeToDashboardConfigDB(
                dashboardConfigs,
                isar,
              );
            }
          }
        } catch (e) {
          debugPrint(e.toString());
        }

        add(
          AppInitializationSetupEvent(
            retriesLeft: event.retriesLeft - 1,
          ),
        );
        emit(const AppUninitialized());
      } catch (e) {
        debugPrint('AppInitializationBloc: $e');
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
    final dashboardConfigs = await isar.dashboardConfigSchemaLists
        .where()
        .filter()
        .dashboardConfigsIsNotNull()
        .dashboardConfigsIsNotEmpty()
        .findAll();

    if (serviceRegistryList.isEmpty) {
      throw Exception('`serviceRegistryList` cannot be empty');
    }
    if (configs.isEmpty) {
      throw Exception('`configs` cannot be empty');
    }

    return MdmsConfig(
      appConfigs: configs,
      serviceRegistryList: serviceRegistryList,
      dashboardConfigSchema: dashboardConfigs.firstOrNull?.dashboardConfigs,
    );
  }
}

@freezed
abstract class AppInitializationEvent with _$AppInitializationEvent {
  const factory AppInitializationEvent.onSetup({
    @Default(3) int retriesLeft,
  }) = AppInitializationSetupEvent;
}

@freezed
abstract class AppInitializationState with _$AppInitializationState {
  const AppInitializationState._();

  const factory AppInitializationState.uninitialized() = AppUninitialized;

  const factory AppInitializationState.loading() = AppInitializing;

  const factory AppInitializationState.failed() = AppInitializationFailed;

  const factory AppInitializationState.initialized({
    required AppConfiguration appConfiguration,
    @Default([]) List<ServiceRegistry> serviceRegistryList,
    List<DashboardConfigSchema?>? dashboardConfigSchema,
  }) = AppInitialized;

  Map<DataModelType, Map<ApiOperation, String>> get entityActionMapping {
    return when(
      uninitialized: () => {},
      loading: () => {},
      failed: () => {},
      initialized: (appConfiguration, serviceRegistryList, _) =>
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
      initialized: (appConfiguration, serviceRegistryList, _) =>
          'tenantId: ${appConfiguration.tenantId}\n'
          'serviceCount: ${serviceRegistryList.length}',
    );
  }
}

class MdmsConfig {
  final List<AppConfiguration> appConfigs;
  final List<ServiceRegistry> serviceRegistryList;
  final List<DashboardConfigSchema?>? dashboardConfigSchema;

  const MdmsConfig(
      {required this.appConfigs,
      required this.serviceRegistryList,
      this.dashboardConfigSchema});
}

class AppInitializationException implements Exception {
  final String? message;

  const AppInitializationException([this.message]);
}
