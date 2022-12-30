import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import '../../data/local_store/no_sql/schema/app_configuration.dart';

import '../../data/local_store/no_sql/schema/service_registry.dart';
import '../../data/repositories/remote/mdmd.dart';
import '../../models/app_config/app_config_model.dart' as app_configuration;
import '../../data/repositories/remote/mdms.dart';
import '../../models/mdms/service_registry/service_registry_model.dart';
import '../../utils/constants.dart';

part 'app_initilization.freezed.dart';

typedef AppInitilizationEmitter = Emitter<AppInitilizationState>;

class AppInitilizationBloc
    extends Bloc<AppInitilizationEvent, AppInitilizationState> {
  final MdmsRepository mdmsRepository;
  final Isar isar;
  AppInitilizationBloc(super.initialState, this.mdmsRepository, this.isar) {
    on<AppInitilizationSetupEvent>(_onAppInitilizeSetup);
    on<FindAppConfigurationEvent>(_onAppConfigurationSetup);
  }

  FutureOr<void> _onAppInitilizeSetup(
    AppInitilizationSetupEvent event,
    AppInitilizationEmitter emit,
  ) async {
    ServiceRegistryPrimaryWrapperModel result =
        await mdmsRepository.searchServiceRegistry(
      Constants.mdmsApiEndPoint,
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

    final List<ServiceRegistry> newServiceRegistryList = [];

    result.serviceRegitry?.serviceRegistrylist?.every((element) {
      final newServiceRegistry = ServiceRegistry();
      newServiceRegistry.service = element.service;
      final List<Actions> actions = [];
      element.actions?.every((element) {
        final newServiceRegistryAction = Actions();
        newServiceRegistryAction.create = element.create;
        newServiceRegistryAction.update = element.update;
        newServiceRegistryAction.login = element.login;
        newServiceRegistryAction.search = element.search;
        actions.add(newServiceRegistryAction);

        return true;
      });

      newServiceRegistry.actions = actions;
      newServiceRegistryList.add(newServiceRegistry);

      return true;
    });

    await isar.writeTxn(() async {
      await isar.serviceRegistrys
          .putAll(newServiceRegistryList); // insert & update
    });
    List<ServiceRegistry> localizationList =
        await isar.serviceRegistrys.where().findAll();
    emit(state.copyWith(localizationList: localizationList));
  }

  FutureOr<void> _onAppConfigurationSetup(
    FindAppConfigurationEvent event,
    AppInitilizationEmitter emit,
  ) async {
    app_configuration.AppConfigPrimaryWrapperModel result =
        await mdmsRepository.searchAppConfig(
      Constants.mdmsApiEndPoint,
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

    AppConiguration appConfiguration = AppConiguration();

    result.appConfig?.appConfiglist?.every((element) {
      appConfiguration.networkDetection = element.networkDetection;
      appConfiguration.persistenceMode = element.persistenceMode;
      appConfiguration.syncMethod = element.syncMethod;
      appConfiguration.syncTrigger = element.syncTrigger;
      final List<Languages> languageList = [];
      final List<LocalizationModules> localizationModules = [];
      element.languages.every((element) {
        final languages = Languages();
        languages.label = element.label;
        languages.value = element.value;
        languageList.add(languages);

        return true;
      });

      element.localizationModules?.every((element) {
        final localization = LocalizationModules();
        localization.label = element.label;
        localization.value = element.value;
        localizationModules.add(localization);

        return true;
      });
      appConfiguration.localizationModules = localizationModules;
      appConfiguration.languages = languageList;

      return true;
    });

    await isar.writeTxn(() async {
      await isar.appConigurations.putAll([appConfiguration]);
    });
  }
}

@freezed
class AppInitilizationEvent with _$AppInitilizationEvent {
  const factory AppInitilizationEvent.onApplicationInitilizeSetup() =
      AppInitilizationSetupEvent;

  const factory AppInitilizationEvent.onApplicationConfigurationSetup({
    String? service,
    required String actionType,
  }) = FindAppConfigurationEvent;
}

@freezed
class AppInitilizationState with _$AppInitilizationState {
  const AppInitilizationState._();

  const factory AppInitilizationState({
    @Default(false) bool isInitilizationCompleted,
    @Default([]) List<ServiceRegistry> localizationList,
  }) = _AppInitilizationState;
}
