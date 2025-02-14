import 'dart:async';
import 'dart:convert';

import 'package:digit_components/digit_components.dart';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';

import '../../../models/app_config/app_config_model.dart' as app_configuration;
import '../../../models/mdms/service_registry/pgr_service_defenitions.dart';
import '../../../models/mdms/service_registry/service_registry_model.dart';
import '../../../models/role_actions/role_actions_model.dart';
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
        ..path = '/boundary-service/boundary-relationships/_search');

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

      final appCon = app_configuration.AppConfigPrimaryWrapperModel.fromJson(
        json.decode(response.toString())['MdmsRes'],
      );

      return appCon;
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

    final element = result.hcmWrapperModel;
    final appConfig = result.hcmWrapperModel?.appConfig.first;
    final commonMasters = result.commonMasters;
    final backgroundServiceConfig = BackgroundServiceConfig()
      ..apiConcurrency = element?.backgroundServiceConfig?.first.apiConcurrency
      ..batteryPercentCutOff =
          element?.backgroundServiceConfig?.first.batteryPercentCutOff
      ..serviceInterval =
          element?.backgroundServiceConfig?.first.serviceInterval;

    appConfiguration
      ..networkDetection = appConfig?.networkDetection
      ..persistenceMode = appConfig?.persistenceMode
      ..syncMethod = appConfig?.syncMethod
      ..syncTrigger = appConfig?.syncTrigger
      ..tenantId = appConfig?.tenantId
      ..maxRadius = appConfig?.maxRadius
      ..backgroundServiceConfig = backgroundServiceConfig;

    final List<Languages>? languageList =
        commonMasters?.stateInfo.first.languages.map((element) {
      final languages = Languages()
        ..label = element.label
        ..value = element.value;

      return languages;
    }).toList();

    final List<BandwidthBatchSize>? bandwidthBatchSize =
        element?.bandWidthBatchSize.map((e) {
      final bandwidthBatchSizeElement = BandwidthBatchSize()
        ..batchSize = e.batchSize
        ..maxRange = e.maxRange
        ..minRange = e.minRange;

      return bandwidthBatchSizeElement;
    }).toList();

    final List<BandwidthBatchSize>? downSyncBandWidthBatchSize =
        element?.downSyncBandWidthBatchSize.map((e) {
      final bandwidthBatchSizeElement = BandwidthBatchSize()
        ..batchSize = e.batchSize
        ..maxRange = e.maxRange
        ..minRange = e.minRange;

      return bandwidthBatchSizeElement;
    }).toList();
    final List<CallSupportList>? callSupportList =
        element?.callSupportOptions!.map((element) {
      final callNumber = CallSupportList()
        ..name = element.name
        ..code = element.code;

      return callNumber;
    }).toList();

    final List<HouseholdDeletionReasonOptions>? householdDeletionReasonOptions =
        element?.householdDeletionReasonOptions.map((element) {
      final deletionReasonOption = HouseholdDeletionReasonOptions()
        ..name = element.value
        ..code = element.code;

      return deletionReasonOption;
    }).toList();

    final List<HouseholdMemberDeletionReasonOptions>?
        householdMemberDeletionReasonOptions =
        element?.householdMemberDeletionReasonOptions.map((element) {
      final deletionReasonOption = HouseholdMemberDeletionReasonOptions()
        ..name = element.value
        ..code = element.code;

      return deletionReasonOption;
    }).toList();

    final List<GenderOptions>? genderOptions =
        commonMasters?.genderType.map((element) {
      final genderOption = GenderOptions()
        ..name = element.name ?? ''
        ..code = element.code;

      return genderOption;
    }).toList();

    final privacyPolicyConfig = commonMasters?.privacyPolicyConfig;

    final privacyPolicy = PrivacyPolicy()
      ..header = privacyPolicyConfig?.first.header ?? ''
      ..module = privacyPolicyConfig?.first.module ?? ''
      ..active = privacyPolicyConfig?.first.active
      ..contents = (privacyPolicyConfig?.first.contents ?? []).map((cont) {
        final content = Content()
          ..header = cont.header
          ..descriptions = (cont.descriptions ?? []).map((d) {
            final description = Description()
              ..text = d.text
              ..type = d.type
              ..isBold = d.isBold
              ..subDescriptions = (d.subDescriptions ?? []).map((sd) {
                final subDescription = SubDescription()
                  ..text = sd.text
                  ..type = sd.type
                  ..isBold = sd.isBold
                  ..isSpaceRequired = sd.isSpaceRequired;
                return subDescription;
              }).toList();
            return description;
          }).toList();
        return content;
      }).toList();

    final List<IdTypeOptions>? idTypeOptions =
        element?.idTypeOptions.map((element) {
      final idOption = IdTypeOptions()
        ..name = element.name
        ..code = element.code;

      return idOption;
    }).toList();

    final List<ChecklistTypes>? checklistTypes =
        element?.checklistTypes.map((e) {
      final surveyForm = ChecklistTypes()
        ..name = e.name
        ..code = e.code;

      return surveyForm;
    }).toList();

    final List<TransportTypes>? transportTypes =
        element?.transportTypes.map((e) {
      final transportTypes = TransportTypes()
        ..name = e.name
        ..code = e.code;

      return transportTypes;
    }).toList();

    final List<DeliveryCommentOptions>? deliveryCommentOptions =
        element?.deliveryCommentOptions.map((element) {
      final deliveryCommentOption = DeliveryCommentOptions()
        ..name = element.name
        ..code = element.code;

      return deliveryCommentOption;
    }).toList();

    final List<RefugeeCampOptions>? refugeeCampOptions =
        element?.refugeeCampOptions.map((element) {
      final refugeeCampOption = RefugeeCampOptions()
        ..name = element.name
        ..code = element.code;

      return refugeeCampOption;
    }).toList();

    final List<Interfaces>? interfaceList =
        element?.backendInterface.first.interface.map((e) {
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

    final backendInterface = BackendInterface()
      ..interfaces = interfaceList ?? [];
    appConfiguration.genderOptions = genderOptions;
    appConfiguration.idTypeOptions = idTypeOptions;
    appConfiguration.privacyPolicyConfig = privacyPolicy;
    appConfiguration.deliveryCommentOptions = deliveryCommentOptions;
    appConfiguration.refugeeCampOptions = refugeeCampOptions;
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
    appConfiguration.bandwidthBatchSize = bandwidthBatchSize;
    appConfiguration.downSyncBandwidthBatchSize = downSyncBandWidthBatchSize;
    appConfiguration.symptomsTypes =
        result.hcmWrapperModel?.symptomsTypeList?.map((e) {
      final symptomTypes = SymptomsTypes()
        ..name = e.name
        ..code = e.code
        ..active = e.active;

      return symptomTypes;
    }).toList();

    appConfiguration.searchCLFFilters =
        result.hcmWrapperModel?.searchCLFFilters?.map((e) {
      final searchFilters = SearchCLFFilters()
        ..name = e.name
        ..code = e.code
        ..active = e.active;
      return searchFilters;
    }).toList();

    appConfiguration.referralReasons =
        result.hcmWrapperModel?.referralReasonList?.map((e) {
      final reasonTypes = ReferralReasons()
        ..name = e.name
        ..code = e.code
        ..active = e.active;

      return reasonTypes;
    }).toList();

    await isar.writeTxn(() async {
      await isar.appConfigurations.put(appConfiguration);
      await isar.rowVersionLists.putAll(rowVersionList);
    });
  }

  Future<RoleActionsWrapperModel> searchRoleActions(
    String apiEndPoint,
    Map<String, dynamic> body,
  ) async {
    try {
      final Response response = await _client.post(apiEndPoint, data: body);

      return RoleActionsWrapperModel.fromJson(json.decode(response.toString()));
    } catch (_) {
      rethrow;
    }
  }
}
