import 'dart:async';
import 'dart:convert';

import 'package:digit_components/digit_components.dart';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';

import '../../../models/app_config/app_config_model.dart' as app_configuration;
import '../../../models/mdms/service_registry/pgr_service_defenitions.dart';
import '../../../models/mdms/service_registry/service_registry_model.dart';
import '../../local_store/no_sql/schema/app_configuration.dart';
import '../../local_store/no_sql/schema/row_versions.dart';
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
    final data = result.serviceRegistry?.serviceRegistryList;
    if (data != null && data.isNotEmpty) {
      await isar.writeTxn(() async => await isar.serviceRegistrys.clear());
    }
    for (final element in data ?? <ServiceRegistryModel>[]) {
      final newServiceRegistry = ServiceRegistry();
      newServiceRegistry.service = element.service;
      final actions = element.actions.map((item) {
        final newServiceRegistryAction = Actions()
          ..entityName = item.entityName
          ..path = item.path
          ..action = item.action;

        return newServiceRegistryAction;
      }).toList();
      actions.add(Actions()
        ..entityName = 'Boundary'
        ..action = 'search'
        ..path = '/egov-location/location/v11/boundarys/_search');

      newServiceRegistry.actions = actions;
      newServiceRegistryList.add(newServiceRegistry);
    }

    return await isar.writeTxn(() async {
      await isar.serviceRegistrys.putAll(newServiceRegistryList);
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
    } on DioError catch (e) {
      AppLogger.instance.error(
        title: 'MDMS Repository',
        message: '$e',
        stackTrace: e.stackTrace,
      );
      rethrow;
    }
  }

  Future<PGRServiceDefinitions> searchPGRServiceDefinitions(
    String apiEndPoint,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await _client.post(apiEndPoint, data: body);

      return PGRServiceDefinitions.fromJson(
        json.decode(response.toString())['MdmsRes'],
      );
    } on DioError catch (e) {
      AppLogger.instance.error(
        title: 'MDMS Repository',
        message: '$e',
        stackTrace: e.stackTrace,
      );
      rethrow;
    }
  }

  FutureOr<void> writeToAppConfigDB(
    app_configuration.AppConfigPrimaryWrapperModel result,
    PGRServiceDefinitions pgrServiceDefinitions,
    Isar isar,
  ) async {
    final appConfiguration = AppConfiguration();

    final data = result.rowVersions?.rowVersionslist;

    final List<RowVersionList> rowVersionList = [];

    for (final element in data ?? <app_configuration.RowVersions>[]) {
      final rowVersion = RowVersionList();
      rowVersion.module = element.module;
      rowVersion.version = element.version;
      rowVersionList.add(rowVersion);
    }

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

      final List<CallSupportList> callSupportList =
          element.callSupportOptions!.map((element) {
        final callNumber = CallSupportList()
          ..name = element.name
          ..code = element.code;

        return callNumber;
      }).toList();

      final List<HouseholdDeletionReasonOptions>
          householdDeletionReasonOptions =
          element.householdDeletionReasonOptions.map((element) {
        final deletionReasonOption = HouseholdDeletionReasonOptions()
          ..name = element.value
          ..code = element.code;

        return deletionReasonOption;
      }).toList();

      final List<HouseholdMemberDeletionReasonOptions>
          householdMemberDeletionReasonOptions =
          element.householdMemberDeletionReasonOptions.map((element) {
        final deletionReasonOption = HouseholdMemberDeletionReasonOptions()
          ..name = element.value
          ..code = element.code;

        return deletionReasonOption;
      }).toList();

      final List<GenderOptions> genderOptions =
          element.genderOptions.map((element) {
        final genderOption = GenderOptions()
          ..name = element.name
          ..code = element.code;

        return genderOption;
      }).toList();

      final List<IdTypeOptions> idTypeOptions =
          element.idTypeOptions.map((element) {
        final idOption = IdTypeOptions()
          ..name = element.name
          ..code = element.code;

        return idOption;
      }).toList();

      final List<ChecklistTypes> checklistTypes =
          element.checklistTypes.map((e) {
        final checklist = ChecklistTypes()
          ..name = e.name
          ..code = e.code;

        return checklist;
      }).toList();

      final List<TransportTypes> transportTypes =
          element.transportTypes.map((e) {
        final transportTypes = TransportTypes()
          ..name = e.name
          ..code = e.code;

        return transportTypes;
      }).toList();

      final List<DeliveryCommentOptions> deliveryCommentOptions =
          element.deliveryCommentOptions.map((element) {
        final deliveryCommentOption = DeliveryCommentOptions()
          ..name = element.name
          ..code = element.code;

        return deliveryCommentOption;
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

      final List<ComplaintTypes>? complaintTypesList =
          pgrServiceDefinitions.serviceDefinitionWrapper?.definition.map((e) {
        final types = ComplaintTypes()
          ..name = e.name
          ..code = e.serviceCode;

        return types;
      }).toList();

      final backendInterface = BackendInterface()..interfaces = interfaceList;
      appConfiguration.genderOptions = genderOptions;
      appConfiguration.idTypeOptions = idTypeOptions;
      appConfiguration.deliveryCommentOptions = deliveryCommentOptions;
      appConfiguration.householdDeletionReasonOptions =
          householdDeletionReasonOptions;
      appConfiguration.householdMemberDeletionReasonOptions =
          householdMemberDeletionReasonOptions;
      appConfiguration.checklistTypes = checklistTypes;
      appConfiguration.transportTypes = transportTypes;
      appConfiguration.backendInterface = backendInterface;
      appConfiguration.callSupportOptions = callSupportList;
      appConfiguration.languages = languageList;
      appConfiguration.complaintTypes = complaintTypesList;
    });

    await isar.writeTxn(() async {
      await isar.appConfigurations.put(appConfiguration);
      await isar.rowVersionLists.putAll(rowVersionList);
    });
  }
}
