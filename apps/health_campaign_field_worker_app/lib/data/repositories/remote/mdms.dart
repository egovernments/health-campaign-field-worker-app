import 'dart:async';
import 'dart:convert';

import 'package:digit_components/digit_components.dart';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';

import '../../../models/app_config/app_config_model.dart' as app_configuration;
import '../../../models/mdms/service_registry/pgr_service_defenitions.dart';
import '../../../models/mdms/service_registry/service_registry_model.dart';
import '../../../models/project_type/project_type_model.dart';
import '../../../models/role_actions/role_actions_model.dart';
import '../../local_store/no_sql/schema/app_configuration.dart';
import '../../local_store/no_sql/schema/project_types.dart';
import '../../local_store/no_sql/schema/row_versions.dart';
import '../../local_store/no_sql/schema/service_registry.dart';
import '../../local_store/secure_store/secure_store.dart';

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
      final backgroundServiceConfig = BackgroundServiceConfig()
        ..apiConcurrency = element.backgroundServiceConfig?.apiConcurrency
        ..batteryPercentCutOff =
            element.backgroundServiceConfig?.batteryPercentCutOff
        ..serviceInterval = element.backgroundServiceConfig?.serviceInterval;

      final firebaseConfig = FirebaseConfig()
        ..enableCrashlytics = element.firebaseConfig.enableCrashlytics
        ..enableAnalytics = element.firebaseConfig.enableAnalytics;

      appConfiguration
        ..networkDetection = element.networkDetection
        ..persistenceMode = element.persistenceMode
        ..syncMethod = element.syncMethod
        ..syncTrigger = element.syncTrigger
        ..tenantId = element.tenantId
        ..maxRadius = element.maxRadius
        ..backgroundServiceConfig = backgroundServiceConfig
        ..firebaseConfig = firebaseConfig;

      final List<Languages> languageList = element.languages.map((element) {
        final languages = Languages()
          ..label = element.label
          ..value = element.value;

        return languages;
      }).toList();

      final List<BandwidthBatchSize> bandwidthBatchSize =
          element.bandWidthBatchSize.map((e) {
        final bandwithBatchSizeElement = BandwidthBatchSize()
          ..batchSize = e.batchSize
          ..maxRange = e.maxRange
          ..minRange = e.minRange;

        return bandwithBatchSizeElement;
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

      final List<DeliveryCommentOptions> deliveryCommentOptionsSmc =
          element.deliveryCommentOptionsSmc.map((element) {
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
      appConfiguration.deliveryCommentOptionsSmc = deliveryCommentOptionsSmc;
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
    });
    appConfiguration.symptomsTypes =
        result.symptomsTypes?.symptomsTypeList?.map((e) {
      final symptomTypes = SymptomsTypes()
        ..name = e.name
        ..code = e.code
        ..active = e.active;

      return symptomTypes;
    }).toList();

    appConfiguration.referralReasons =
        result.referralReasons?.referralReasonList?.map((e) {
      final reasonTypes = ReferralReasons()
        ..name = e.name
        ..code = e.code
        ..active = e.active;

      return reasonTypes;
    }).toList();

    appConfiguration.ineligibilityReasons =
        result.ineligibilityReasons?.ineligibilityReasonsList?.map((e) {
      final reasonTypes = IneligibilityReasons()
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

  Future<ProjectTypePrimaryWrapper> searchProjectType(
    String apiEndPoint,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await _client.post(apiEndPoint, data: body);

      return ProjectTypePrimaryWrapper.fromJson(
        json.decode(response.toString())['MdmsRes'],
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<RoleActionsWrapperModel> searchRoleActions(
    String apiEndPoint,
    LocalSecureStore localSecureStore,
    Map<String, dynamic> body,
  ) async {
    try {
      final Response response = await _client.post(apiEndPoint, data: body);
      await localSecureStore.setRoleActions(response.toString());

      return RoleActionsWrapperModel.fromJson(json.decode(response.toString()));
    } catch (_) {
      rethrow;
    }
  }

  FutureOr<void> writeToProjectTypeDB(
    ProjectTypePrimaryWrapper result,
    Isar isar,
  ) async {
    final List<ProjectTypeListCycle> newProjectTypeList = [];
    final data = result.projectTypeWrapper?.projectTypes;
    if (data != null && data.isNotEmpty) {
      await isar.writeTxn(() async => await isar.projectTypeListCycles.clear());
    }
    for (final element in data ?? <ProjectType>[]) {
      final newprojectType = ProjectTypeListCycle();

      newprojectType.projectTypeId = element.id;
      newprojectType.code = element.code;
      newprojectType.group = element.group;
      newprojectType.name = element.name;
      newprojectType.beneficiaryType = element.beneficiaryType;
      newprojectType.observationStrategy = element.observationStrategy;
      newprojectType.resources = element.resources?.map((e) {
        final productVariants = ProductVariants()
          ..productVariantId = e.productVariantId
          ..quantity = e.quantity.toString();

        return productVariants;
      }).toList();
      newprojectType.cycles = element.cycles?.map((e) {
        final newcycle = Cycles()
          ..id = e.id
          ..startDate = e.startDate
          ..endDate = e.endDate
          ..mandatoryWaitSinceLastCycleInDays =
              e.mandatoryWaitSinceLastCycleInDays
          ..deliveries = e.deliveries?.map((ele) {
            final newDeliveries = Deliveries();
            newDeliveries.deliveryStrategy = ele.deliveryStrategy;
            newDeliveries.mandatoryWaitSinceLastDeliveryInDays =
                ele.mandatoryWaitSinceLastDeliveryInDays;
            newDeliveries.doseCriteriaModel = ele.doseCriteria?.map((e) {
              final doseCriterias = DoseCriteria()
                ..condition = e.condition
                ..productVariants = e.productVariants?.map((p) {
                  final productVariants = ProductVariants()
                    ..quantity = p.quantity.toString()
                    ..productVariantId = p.productVariantId.toString();

                  return productVariants;
                }).toList();

              return doseCriterias;
            }).toList();

            return newDeliveries;
          }).toList();

        return newcycle;
      }).toList();
      newProjectTypeList.add(newprojectType);
    }

    await isar.writeTxn(() async {
      await isar.projectTypeListCycles.putAll(newProjectTypeList);
    });
  }
}
