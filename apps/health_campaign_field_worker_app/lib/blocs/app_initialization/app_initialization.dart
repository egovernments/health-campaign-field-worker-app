import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../data/local_store/no_sql/schema/service_registry.dart';
import '../../data/repositories/remote/mdms.dart';
import '../../models/app_config/app_config_model.dart' as app_configuration;
import '../../models/mdms/service_registry/service_registry_model.dart';
import '../../utils/constants.dart';

part 'app_initialization.freezed.dart';

typedef AppInitializationEmitter = Emitter<AppInitializationState>;

class AppInitializationBloc
    extends Bloc<AppInitializationEvent, AppInitializationState> {
  final MdmsRepository mdmsRepository;
  final Isar isar;
  AppInitializationBloc(
    AppInitializationState appInitializationState, {
    required this.mdmsRepository,
    required this.isar,
  }) : super(const AppInitializationState()) {
    on<AppInitializationSetupEvent>(_onAppInitilizeSetup);
    on<FindAppConfigurationEvent>(_onAppConfigurationSetup);
  }

  FutureOr<void> _onAppInitilizeSetup(
    AppInitializationSetupEvent event,
    AppInitializationEmitter emit,
  ) async {
    ServiceRegistryPrimaryWrapperModel result =
        await mdmsRepository.searchServiceRegistry(
      Constants.mdmsApiPath,
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
    List<ServiceRegistry> serviceRegistryList =
        await isar.serviceRegistrys.where().findAll();
    emit(state.copyWith(serviceRegistryList: serviceRegistryList));
  }

  FutureOr<void> _onAppConfigurationSetup(
    FindAppConfigurationEvent event,
    AppInitializationEmitter emit,
  ) async {
    app_configuration.AppConfigPrimaryWrapperModel result =
        await mdmsRepository.searchAppConfig(
      Constants.mdmsApiPath,
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

    mdmsRepository.writeToAppConfigDB(result, isar);
    List<AppConiguration> appConfiguration =
        await isar.appConigurations.where().findAll();
    emit(state.copyWith(appConiguration: appConfiguration.first));
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

  const factory AppInitializationState({
    @Default(false) bool isInitializationCompleted,
    AppConiguration? appConiguration,
    @Default([]) List<ServiceRegistry> serviceRegistryList,
  }) = _AppInitializationState;
}
