import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:digit_data_model/models/project_type/project_type_model.dart';
import 'package:digit_ui_components/utils/app_logger.dart';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';

import '../../../models/app_config/app_config_model.dart' as app_configuration;
import '../../../services/face_auth_config.dart';
import '../../../models/entities/mdms_master_enums.dart';
import '../../../models/entities/mdms_module_enums.dart';
import '../../../models/mdms/service_registry/pgr_service_defenitions.dart';
import '../../../models/mdms/service_registry/service_registry_model.dart';
import '../../../models/role_actions/role_actions_model.dart';
import '../../local_store/no_sql/schema/app_configuration.dart';
import '../../local_store/no_sql/schema/project_types.dart';
import '../../local_store/no_sql/schema/row_versions.dart';
import '../../local_store/no_sql/schema/service_registry.dart';

class MdmsRepository {
  final Dio _client;

  const MdmsRepository(this._client);

  /// Core v2 search method. Makes a single POST call to the MDMS v2
  /// `_search` endpoint and returns the list of `data` objects from the
  /// response `mdms` array (only active records).
  Future<List<dynamic>> _searchV2(
    String apiEndPoint, {
    required String tenantId,
    required String schemaCode,
    Map<String, dynamic>? filters,
    int limit = 5000,
  }) async {
    final response = await _client.post(apiEndPoint, data: {
      'MdmsCriteria': {
        'tenantId': tenantId,
        'schemaCode': schemaCode,
        if (filters != null) 'filters': filters,
        'limit': limit,
        'isActive': true,
      },
    });

    final responseData = response.data is String
        ? json.decode(response.data as String)
        : response.data;
    final mdmsList = responseData is List
        ? responseData
        : (responseData?['mdms'] as List? ?? []);

    return mdmsList
        .where((e) => e is Map && e['isActive'] != false)
        .map((e) => e['data'])
        .toList();
  }

  Future<ServiceRegistryPrimaryWrapperModel> searchServiceRegistry(
    String apiEndPoint,
    String tenantId,
  ) async {
    try {
      final String module = ModuleEnums.serviceRegistry.toValue() as String;
      final String master = MasterEnums.serviceRegistryMaster.toValue() as String;

      final dataList = await _searchV2(
        apiEndPoint,
        tenantId: tenantId,
        schemaCode: '$module.$master',
      );

      return ServiceRegistryPrimaryWrapperModel.fromJson({
        module: {
          master: dataList,
        },
      });
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

  /// Fetches app configuration by making individual v2 calls per schemaCode
  /// and assembling the nested map that AppConfigPrimaryWrapperModel expects.
  Future<app_configuration.AppConfigPrimaryWrapperModel> searchAppConfig(
    String apiEndPoint,
    String tenantId,
  ) async {
    try {
      // Define all module.master pairs needed for app config using enums
      final schemaCodes = <String, List<String>>{
        ModuleEnums.hcm.toValue(): [
          MasterEnums.appConfig.toValue(),
          MasterEnums.symptomTypes.toValue(),
          MasterEnums.referralReasons.toValue(),
          MasterEnums.manualAttendanceReasons.toValue(),
          MasterEnums.houseStructureTypes.toValue(),
          MasterEnums.refusalReasons.toValue(),
          MasterEnums.bandWidthBatchSize.toValue(),
          MasterEnums.beneficiaryIdConfig.toValue(),
          MasterEnums.downSyncBandwidthBatchSize.toValue(),
          MasterEnums.hhDelReasons.toValue(),
          MasterEnums.hhMemberDelReasons.toValue(),
          MasterEnums.backgroundServiceConfig.toValue(),
          MasterEnums.checklistTypes.toValue(),
          MasterEnums.idTypes.toValue(),
          MasterEnums.relationShipTypeOptions.toValue(),
          MasterEnums.deliveryComments.toValue(),
          MasterEnums.backendInterface.toValue(),
          MasterEnums.callSupport.toValue(),
          MasterEnums.transportTypes.toValue(),
          MasterEnums.firebaseConfig.toValue(),
          MasterEnums.searchHouseHoldFilters.toValue(),
          MasterEnums.transitPostType.toValue(),
          MasterEnums.searchCLFFilters.toValue(),
          MasterEnums.deviceChangeReasons.toValue(),
          MasterEnums.singleUserLogin.toValue(),
        ],
        ModuleEnums.commonMasters.toValue(): [
          MasterEnums.stateInfo.toValue(),
          MasterEnums.genderType.toValue(),
          MasterEnums.privacyPolicy.toValue(),
        ],
        ModuleEnums.moduleVersion.toValue(): [
          MasterEnums.rowVersion.toValue(),
        ],
      };

      final Map<String, dynamic> mdmsRes = {};

      for (final entry in schemaCodes.entries) {
        final moduleName = entry.key;
        final moduleMap =
            mdmsRes.putIfAbsent(moduleName, () => <String, dynamic>{})
                as Map<String, dynamic>;

        for (final masterName in entry.value) {
          final dataList = await _searchV2(
            apiEndPoint,
            tenantId: tenantId,
            schemaCode: '$moduleName.$masterName',
          );
          moduleMap[masterName] = dataList;
        }
      }

      return app_configuration.AppConfigPrimaryWrapperModel.fromJson(mdmsRes);
    } on DioError catch (e) {
      AppLogger.instance.error(
        title: 'MDMS Repository',
        message: '$e',
        stackTrace: e.stackTrace,
      );
      rethrow;
    }
  }

  /// Independent MDMS call for the face-auth config (hcm.FACE_AUTH_CONFIG).
  /// Kept separate from [searchAppConfig] so the face gate / re-verification
  /// thresholds can be fetched on demand without bundling into app config.
  /// Returns null (callers fall back to compile-time defaults) on any error
  /// or when the master has no active record.
  Future<FaceAuthConfig?> searchFaceAuthConfig(
    String apiEndPoint,
    String tenantId,
  ) async {
    try {
      final dataList = await _searchV2(
        apiEndPoint,
        tenantId: tenantId,
        schemaCode: '${ModuleEnums.hcm.toValue()}.FACE_AUTH_CONFIG',
      );
      if (dataList.isEmpty) return null;
      final data = dataList.first;
      if (data is! Map<String, dynamic>) return null;
      return FaceAuthConfig.fromMdms(data);
    } catch (e) {
      AppLogger.instance.error(
        title: 'MDMS Repository',
        message: 'face-auth config fetch failed: $e',
      );
      return null;
    }
  }

  Future<PGRServiceDefinitions> searchPGRServiceDefinitions(
    String apiEndPoint,
    String tenantId,
  ) async {
    try {
      final String module = ModuleEnums.rainmakerPgr.toValue() as String;
      final String master = MasterEnums.serviceDefinitions.toValue() as String;

      final dataList = await _searchV2(
        apiEndPoint,
        tenantId: tenantId,
        schemaCode: '$module.$master',
      );

      return PGRServiceDefinitions.fromJson({
        module: {
          master: dataList,
        },
      });
    } on DioError catch (e) {
      AppLogger.instance.error(
        title: 'MDMS Repository',
        message: '$e',
        stackTrace: e.stackTrace,
      );
      rethrow;
    }
  }

  Future<ProjectTypePrimaryWrapper> searchProjectType(
    String apiEndPoint,
    String tenantId,
  ) async {
    try {
      final String module = ModuleEnums.hcmProjectTypes.toValue() as String;
      final String master = MasterEnums.projectTypes.toValue() as String;

      final dataList = await _searchV2(
        apiEndPoint,
        tenantId: tenantId,
        schemaCode: '$module.$master',
      );

      return ProjectTypePrimaryWrapper.fromJson({
        module: {
          master: dataList,
        },
      });
    } catch (_) {
      rethrow;
    }
  }

  /// Generic v2 search that returns `List<dynamic>` of data objects directly.
  /// Used for FormConfig, dashboard config, enum values, and other ad-hoc
  /// MDMS lookups.
  Future<List<dynamic>> searchMDMS(
    String apiEndPoint, {
    required String tenantId,
    required String schemaCode,
    Map<String, dynamic>? filters,
    int limit = 5000,
  }) async {
    try {
      return await _searchV2(
        apiEndPoint,
        tenantId: tenantId,
        schemaCode: schemaCode,
        filters: filters,
        limit: limit,
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

  /// Fetches row versions only (subset of app config).
  Future<app_configuration.AppConfigPrimaryWrapperModel> searchRowVersions(
    String apiEndPoint,
    String tenantId,
  ) async {
    try {
      final String module = ModuleEnums.moduleVersion.toValue() as String;
      final String master = MasterEnums.rowVersion.toValue() as String;

      final dataList = await _searchV2(
        apiEndPoint,
        tenantId: tenantId,
        schemaCode: '$module.$master',
      );

      return app_configuration.AppConfigPrimaryWrapperModel.fromJson({
        module: {
          master: dataList,
        },
      });
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
  ) {
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
    final appConfig = result.hcmWrapperModel?.appConfig.firstOrNull;
    final commonMasters = result.commonMasters;
    final backgroundServiceConfig = BackgroundServiceConfig()
      ..apiConcurrency =
          element?.backgroundServiceConfig?.firstOrNull?.apiConcurrency
      ..batteryPercentCutOff =
          element?.backgroundServiceConfig?.firstOrNull?.batteryPercentCutOff
      ..serviceInterval =
          element?.backgroundServiceConfig?.firstOrNull?.serviceInterval;

    final firebaseConfig = FirebaseConfig()
      ..enableAnalytics = element?.firebaseConfig?.firstOrNull?.enableAnalytics
      ..enableCrashlytics =
          element?.firebaseConfig?.firstOrNull?.enableCrashlytics;

    appConfiguration
      ..networkDetection = appConfig?.networkDetection
      ..persistenceMode = appConfig?.persistenceMode
      ..syncMethod = appConfig?.syncMethod
      ..syncTrigger = appConfig?.syncTrigger
      ..tenantId = appConfig?.tenantId
      ..maxRadius = appConfig?.maxRadius
      ..boundaryLastLevelMaxSelection =
           appConfig?.boundaryLastLevelMaxSelection
      // TODO: Populate stockThresholdConfig from MDMS when available
      ..stockThresholdConfig = (StockThresholdConfig()
        ..minThreshold = 0
        ..maxThreshold = 0)
      ..backgroundServiceConfig = backgroundServiceConfig
      ..firebaseConfig = firebaseConfig;

    final List<Languages>? languageList =
        commonMasters?.stateInfo.firstOrNull?.languages.map((element) {
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

    final List<BeneficiaryIdConfig>? beneficiaryIdConfig =
        element?.beneficiaryIdConfig.map((e) {
      final beneficiaryIdConfigElement = BeneficiaryIdConfig()
        ..batchSize = e.batchSize
        ..minCount = e.minCount;

      return beneficiaryIdConfigElement;
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
      ..header = privacyPolicyConfig?.firstOrNull?.header ?? ''
      ..module = privacyPolicyConfig?.firstOrNull?.module ?? ''
      ..active = privacyPolicyConfig?.firstOrNull?.active
      ..contents = (privacyPolicyConfig?.firstOrNull?.contents ?? []).map((cont) {
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

    final List<DeviceChangeReasons>? deviceChangeReasons =
        element?.deviceChangeReasons.map((element) {
      final deviceChangeReason = DeviceChangeReasons()
        ..name = element.name
        ..code = element.code;

      return deviceChangeReason;
    }).toList();

    final List<SingleUserLogin>? singleUserLogin =
        element?.singleUserLogin.map((element) {
      final singleUserLogin = SingleUserLogin()
        ..enabled = element.enabled
        ..id = element.id;

      return singleUserLogin;
    }).toList();


    final List<RelationShipTypeOptions>? relationShipTypes =
        element?.relationShipTypeOptions.map((element) {
      final relationShipOption = RelationShipTypeOptions()
        ..name = element.name
        ..code = element.code
        ..active = element.active;

      return relationShipOption;
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

    final List<Interfaces>? interfaceList =
        element?.backendInterface.firstOrNull?.interface.map((e) {
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
    appConfiguration.relationShipTypeOptions = relationShipTypes;
    appConfiguration.privacyPolicyConfig = privacyPolicy;
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
    appConfiguration.bandwidthBatchSize = bandwidthBatchSize;
    appConfiguration.deviceChangeReasons = deviceChangeReasons;
    appConfiguration.singleUserLogin = singleUserLogin;
    appConfiguration.beneficiaryIdConfig = beneficiaryIdConfig;
    appConfiguration.downSyncBandwidthBatchSize = downSyncBandWidthBatchSize;
    appConfiguration.searchHouseHoldFilters =
        result.hcmWrapperModel?.searchHouseHoldFilters?.map((e) {
      final searchFilters = SearchHouseHoldFilters()
        ..name = e.name
        ..code = e.code
        ..active = e.active;
      return searchFilters;
    }).toList();
    appConfiguration.searchCLFFilters =
        result.hcmWrapperModel?.searchCLFFilters?.map((e) {
      final searchFilters = SearchCLFFilters()
        ..name = e.name
        ..code = e.code
        ..active = e.active;
      return searchFilters;
    }).toList();

    appConfiguration.transitPostType =
        result.hcmWrapperModel?.transitPostType?.map((e) {
      final transitPostType = TransitPostType()
        ..name = e.name
        ..code = e.code
        ..active = e.active;
      return transitPostType;
    }).toList();

    appConfiguration.symptomsTypes =
        result.hcmWrapperModel?.symptomsTypeList?.map((e) {
      final symptomTypes = SymptomsTypes()
        ..name = e.name
        ..code = e.code
        ..active = e.active;

      return symptomTypes;
    }).toList();

    appConfiguration.referralReasons =
        result.hcmWrapperModel?.referralReasonList?.map((e) {
      final reasonTypes = ReferralReasons()
        ..name = e.name
        ..code = e.code
        ..active = e.active;

      return reasonTypes;
    }).toList();

    appConfiguration.manualAttendanceReasons =
        result.hcmWrapperModel?.manualAttendanceReasonList?.map((e) {
      final manualAttendanceTypes = ManualAttendanceReasons()
        ..name = e.name
        ..code = e.code
        ..active = e.active;

      return manualAttendanceTypes;
    }).toList();

    appConfiguration.houseStructureTypes =
        result.hcmWrapperModel?.houseStructureTypes?.map((e) {
      final structureTypes = HouseStructureTypes()
        ..name = e.name.toString()
        ..code = e.code
        ..active = e.active;

      return structureTypes;
    }).toList();

    appConfiguration.refusalReasons =
        result.hcmWrapperModel?.refusalReasons?.map((e) {
      final reasonTypes = RefusalReasons()
        ..name = e.name.toString()
        ..code = e.code
        ..active = e.active;

      return reasonTypes;
    }).toList();

    isar.writeTxnSync(() {
      isar.appConfigurations.putSync(appConfiguration);
      isar.rowVersionLists.putAllSync(rowVersionList);
    });
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
