import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';

import '../../../models/app_config/app_config_model.dart' as app_configuration;
import '../../../models/mdms/service_registry/service_registry_model.dart';
import '../../local_store/no_sql/schema/app_configuration.dart';
import '../../local_store/no_sql/schema/service_registry.dart';

class MdmsRepository {
  final Dio _client;

  const MdmsRepository(this._client);

  Future<ServiceRegistryPrimaryWrapperModel> searchServiceRegistry(
    String apiEndPoint,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await _client.post(apiEndPoint, data: body);

      return ServiceRegistryPrimaryWrapperModel.fromJson(
        json.decode(response.toString())['MdmsRes'],
      );
    } catch (_) {
      rethrow;
    }
  }

  FutureOr<void> writeToRegistryDB(
    ServiceRegistryPrimaryWrapperModel result,
    Isar isar,
  ) async {
    final List<ServiceRegistry> newServiceRegistryList = [];
    result.serviceRegistry?.serviceRegistryList.forEach((element) {
      final newServiceRegistry = ServiceRegistry();
      newServiceRegistry.service = element.service;
      final actions = element.actions.map((item) {
        final newServiceRegistryAction = Actions()
          ..entityName = item.entityName
          ..path = item.path
          ..action = item.action;

        return newServiceRegistryAction;
      }).toList();

      newServiceRegistry.actions = actions;
      newServiceRegistryList.add(newServiceRegistry);
    });

    return await isar.writeTxn(() async {
      await isar.serviceRegistrys
          .putAll(newServiceRegistryList); // insert & update
    });
  }

  Future<app_configuration.AppConfigPrimaryWrapperModel> searchAppConfig(
    String apiEndPoint,
    Map body,
  ) async {
    try {
      final response = await _client.post(apiEndPoint, data: body);

      return app_configuration.AppConfigPrimaryWrapperModel.fromJson(
        json.decode(response.toString())['MdmsRes'],
      );
    } catch (e) {
      debugPrint('MDMS.dart: $e');
      rethrow;
    }
  }

  FutureOr<void> writeToAppConfigDB(
    app_configuration.AppConfigPrimaryWrapperModel result,
    Isar isar,
  ) async {
    final appConfiguration = AppConfiguration();
    result.appConfig?.appConfiglist?.forEach((element) {
      appConfiguration
        ..networkDetection = element.networkDetection
        ..persistenceMode = element.persistenceMode
        ..syncMethod = element.syncMethod
        ..syncTrigger = element.syncTrigger
        ..tenantId = element.tenantId;

      final List<Languages> languageList = element.languages.map((element) {
        final languages = Languages()
          ..label = element.label
          ..value = element.value;

        return languages;
      }).toList();

      final List<GenderOptions> genderOptions =
          element.genderOptions.map((element) {
        final genderOption = GenderOptions()
          ..name = element.name
          ..code = element.code;

        return genderOption;
      }).toList();

      final List<Interfaces> interfaceList =
          element.backendInterface.interface.map((e) {
        final config = Config()..localStoreTTL = e.config.localStoreTTL;

        final interfaces = Interfaces()
          ..name = e.name
          ..type = e.type
          ..confg = config;

        return interfaces;
      }).toList();

      final backendInterface = BackendInterface()..interfaces = interfaceList;
      appConfiguration.genderOptions = genderOptions;
      appConfiguration.backendInterface = backendInterface;

      appConfiguration.languages = languageList;
    });

    await isar.writeTxn(() async {
      await isar.appConfigurations.put(appConfiguration);
    });
  }
}
