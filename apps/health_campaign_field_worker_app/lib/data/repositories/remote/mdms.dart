// ignore_for_file: avoid_dynamic_calls

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
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
    } on DioError catch (ex) {
      rethrow;
    }
  }

  FutureOr<void> writeToRegistryDB(
    ServiceRegistryPrimaryWrapperModel result,
    Isar isar,
  ) async {
    final List<ServiceRegistry> newServiceRegistryList = [];
    result.serviceRegistry?.serviceRegistryList?.forEach((element) {
      final newServiceRegistry = ServiceRegistry();
      newServiceRegistry.service = element.service;
      final List<Actions>? actions = element.actions?.map((item) {
        final newServiceRegistryAction = Actions()
          ..entityName = item.entityName
          ..path = item.path
          ..name = item.action;

        return newServiceRegistryAction;
      }).toList();

      newServiceRegistry.actions = actions!;
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
    } on DioError catch (ex) {
      // Assuming there will be an errorMessage property in the JSON object
      throw Exception(ex);
    }
  }

  FutureOr<void> writeToAppConfigDB(
    app_configuration.AppConfigPrimaryWrapperModel result,
    Isar isar,
  ) async {
    final appConfiguration = AppConiguration();
    result.appConfig?.appConfiglist?.forEach((element) {
      appConfiguration
        ..networkDetection = element.networkDetection
        ..persistenceMode = element.persistenceMode
        ..syncMethod = element.syncMethod
        ..syncTrigger = element.syncTrigger;

      final List<Languages> languageList = element.languages.map((element) {
        final languages = Languages()
          ..label = element.label
          ..value = element.value;

        return languages;
      }).toList();

      final List<LocalizationModules>? localizationModules =
          element.localizationModules?.map((element) {
        final localization = LocalizationModules()
          ..label = element.label
          ..value = element.value;

        return localization;
      }).toList();

      appConfiguration.localizationModules = localizationModules;
      appConfiguration.languages = languageList;
    });

    await isar.writeTxn(() async {
      await isar.appConigurations.put(appConfiguration);
    });
  }
}
