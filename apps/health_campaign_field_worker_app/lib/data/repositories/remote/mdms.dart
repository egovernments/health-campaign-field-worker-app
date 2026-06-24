import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:digit_data_model/models/project_type/project_type_model.dart';
import 'package:digit_ui_components/utils/app_logger.dart';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';

import '../../../models/app_config/app_config_model.dart' as app_configuration;
import '../../../models/mdms/service_registry/pgr_service_defenitions.dart';
import '../../../models/mdms/service_registry/service_registry_model.dart';
import '../../../models/role_actions/role_actions_model.dart';
import '../../local_store/no_sql/schema/app_configuration.dart';
import '../../local_store/no_sql/schema/project_types.dart';
import '../../local_store/no_sql/schema/row_versions.dart';
import '../../local_store/no_sql/schema/service_registry.dart';

class MdmsRepository {
  final Dio _client;

  static const int _v2SearchLimit = 2000;

  const MdmsRepository(this._client);

  /// Translates a v1-style MDMS request body (`MdmsCriteria.moduleDetails`)
  /// into MDMS v2 `_search` calls — one per `module.master` schemaCode —
  /// and reassembles the flat v2 `mdms` list back into the nested
  /// `MdmsRes` shape (`{module: {master: [data]}}`) that all existing
  /// consumers of this repository parse.
  Future<Map<String, dynamic>> _searchMdmsResV2(
    String apiEndPoint,
    Map<String, dynamic> body,
  ) async {
    // Normalize: freezed `toJson` may keep nested models as objects.
    final Map<String, dynamic> normalizedBody =
        json.decode(json.encode(body)) as Map<String, dynamic>;
    final criteria =
        normalizedBody['MdmsCriteria'] as Map<String, dynamic>? ?? {};
    final tenantId = criteria['tenantId'];
    final moduleDetails = criteria['moduleDetails'] as List? ?? [];

    final Map<String, dynamic> mdmsRes = {};

    for (final module in moduleDetails) {
      final moduleName = module['moduleName'] as String;
      final masterDetails = module['masterDetails'] as List? ?? [];

      for (final master in masterDetails) {
        final masterName = master['name'] as String;

        final response = await _client.post(apiEndPoint, data: {
          'MdmsCriteria': {
            'tenantId': tenantId,
            'schemaCode': '$moduleName.$masterName',
            'limit': _v2SearchLimit,
          },
        });

        final responseData = response.data is String
            ? json.decode(response.data as String)
            : response.data;
        final mdmsList = responseData is List
            ? responseData
            : (responseData?['mdms'] as List? ?? []);

        List<dynamic> dataList = mdmsList
            .where((e) => e is Map && e['isActive'] != false)
            .map((e) => e['data'])
            .toList();

        final filter = master['filter'] as String?;
        if (filter != null && filter.trim().isNotEmpty) {
          dataList = _applyV1Filter(dataList, filter);
        }

        if (dataList.isEmpty) {
          // No records for this schemaCode on the v2 server — usually a
          // master that is not registered or whose name/casing differs.
          // Surfaced here so the missing schemaCode is obvious in the logs.
          AppLogger.instance.error(
            title: 'MDMS v2',
            message: 'Empty result for schemaCode "$moduleName.$masterName"',
          );
        }

        final moduleMap = mdmsRes.putIfAbsent(
          moduleName,
          () => <String, dynamic>{},
        ) as Map<String, dynamic>;
        moduleMap[masterName] = dataList;
      }
    }

    return mdmsRes;
  }

  /// Applies a v1 JSONPath-style filter like
  /// `[?(@.project=='X' && @.isSelected==true)]` client-side, since
  /// MDMS v2 does not accept JSONPath filters in the search criteria.
  /// Supports `&&`-combined equality conditions only.
  List<dynamic> _applyV1Filter(List<dynamic> data, String filter) {
    final conditions =
        RegExp(r"@\.(\w+)\s*==\s*(?:'([^']*)'|(true|false)|([\d.]+))")
            .allMatches(filter)
            .toList();
    if (conditions.isEmpty) return data;

    return data.where((item) {
      if (item is! Map) return false;
      for (final m in conditions) {
        final key = m.group(1);
        final expected = m.group(2) ?? m.group(3) ?? m.group(4);
        if (item[key]?.toString() != expected) return false;
      }
      return true;
    }).toList();
  }

  Future<ServiceRegistryPrimaryWrapperModel> searchServiceRegistry(
    String apiEndPoint,
    Map<String, dynamic> body,
  ) async {
    try {
      final mdmsRes = await _searchMdmsResV2(apiEndPoint, body);

      return ServiceRegistryPrimaryWrapperModel.fromJson(mdmsRes);
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
      final mdmsRes = await _searchMdmsResV2(
        apiEndPoint,
        Map<String, dynamic>.from(body),
      );

      final appCon =
          app_configuration.AppConfigPrimaryWrapperModel.fromJson(mdmsRes);

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
      final mdmsRes = await _searchMdmsResV2(apiEndPoint, body);

      return PGRServiceDefinitions.fromJson(mdmsRes);
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
    Map<String, dynamic> body,
  ) async {
    try {
      final mdmsRes = await _searchMdmsResV2(apiEndPoint, body);

      return ProjectTypePrimaryWrapper.fromJson(mdmsRes);
    } catch (_) {
      rethrow;
    }
  }

  Future<dynamic> searchMDMS(
    String apiEndPoint,
    Map<String, dynamic> body,
  ) async {
    try {
      return await _searchMdmsResV2(apiEndPoint, body);
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

    appConfiguration.boundaryRelationship =
        result.hcmWrapperModel?.boundaryRelationship?.map((e) {
      final boundaryRelConfig = BoundaryRelationshipConfig()
        ..boundaryType = e.boundaryType
        ..order = e.order
        ..parentBoundaryType = e.parent?.boundaryType ?? ''
        ..childBoundaryTypes =
            e.children?.map((c) => c.boundaryType).toList() ?? [];

      return boundaryRelConfig;
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
