// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MdmsRequestModel _$$_MdmsRequestModelFromJson(Map<String, dynamic> json) =>
    _$_MdmsRequestModel(
      mdmsCriteria: MdmsCriteriaModel.fromJson(
          json['MdmsCriteria'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MdmsRequestModelToJson(_$_MdmsRequestModel instance) =>
    <String, dynamic>{
      'MdmsCriteria': instance.mdmsCriteria,
    };

_$_MdmsCriteriaModel _$$_MdmsCriteriaModelFromJson(Map<String, dynamic> json) =>
    _$_MdmsCriteriaModel(
      tenantId: json['tenantId'] as String,
      moduleDetails: (json['moduleDetails'] as List<dynamic>)
          .map((e) => MdmsModuleDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MdmsCriteriaModelToJson(
        _$_MdmsCriteriaModel instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'moduleDetails': instance.moduleDetails,
    };

_$_MdmsModuleDetailModel _$$_MdmsModuleDetailModelFromJson(
        Map<String, dynamic> json) =>
    _$_MdmsModuleDetailModel(
      moduleName: json['moduleName'] as String,
      masterDetails: (json['masterDetails'] as List<dynamic>)
          .map((e) => MdmsMasterDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MdmsModuleDetailModelToJson(
        _$_MdmsModuleDetailModel instance) =>
    <String, dynamic>{
      'moduleName': instance.moduleName,
      'masterDetails': instance.masterDetails,
    };

_$_MdmsMasterDetailModel _$$_MdmsMasterDetailModelFromJson(
        Map<String, dynamic> json) =>
    _$_MdmsMasterDetailModel(
      json['name'] as String,
    );

Map<String, dynamic> _$$_MdmsMasterDetailModelToJson(
        _$_MdmsMasterDetailModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$_AppConfigPrimaryWrapperModel _$$_AppConfigPrimaryWrapperModelFromJson(
        Map<String, dynamic> json) =>
    _$_AppConfigPrimaryWrapperModel(
      appConfig: json['HCM-FIELD-APP-CONFIG'] == null
          ? null
          : AppConfigSecondaryWrapperModel.fromJson(
              json['HCM-FIELD-APP-CONFIG'] as Map<String, dynamic>),
      rowVersions: json['module-version'] == null
          ? null
          : RowVersionWrapperModel.fromJson(
              json['module-version'] as Map<String, dynamic>),
      symptomsTypes: json['HCM-SYMPTOMS-TYPES'] == null
          ? null
          : SymptomsTypesSecondaryWrapperModel.fromJson(
              json['HCM-SYMPTOMS-TYPES'] as Map<String, dynamic>),
      referralReasons: json['HCM-REFERRAL-REASONS'] == null
          ? null
          : ReferralReasonsWrapperModel.fromJson(
              json['HCM-REFERRAL-REASONS'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AppConfigPrimaryWrapperModelToJson(
        _$_AppConfigPrimaryWrapperModel instance) =>
    <String, dynamic>{
      'HCM-FIELD-APP-CONFIG': instance.appConfig,
      'module-version': instance.rowVersions,
      'HCM-SYMPTOMS-TYPES': instance.symptomsTypes,
      'HCM-REFERRAL-REASONS': instance.referralReasons,
    };

_$_AppConfigSecondaryWrapperModel _$$_AppConfigSecondaryWrapperModelFromJson(
        Map<String, dynamic> json) =>
    _$_AppConfigSecondaryWrapperModel(
      appConfiglist: (json['appConfig'] as List<dynamic>?)
          ?.map((e) => AppConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AppConfigSecondaryWrapperModelToJson(
        _$_AppConfigSecondaryWrapperModel instance) =>
    <String, dynamic>{
      'appConfig': instance.appConfiglist,
    };

_$_RowVersionWrapperModel _$$_RowVersionWrapperModelFromJson(
        Map<String, dynamic> json) =>
    _$_RowVersionWrapperModel(
      rowVersionslist: (json['ROW_VERSIONS'] as List<dynamic>?)
          ?.map((e) => RowVersions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RowVersionWrapperModelToJson(
        _$_RowVersionWrapperModel instance) =>
    <String, dynamic>{
      'ROW_VERSIONS': instance.rowVersionslist,
    };

_$_AppConfig _$$_AppConfigFromJson(Map<String, dynamic> json) => _$_AppConfig(
      networkDetection: json['NETWORK_DETECTION'] as String,
      persistenceMode: json['PERSISTENCE_MODE'] as String,
      syncMethod: json['SYNC_METHOD'] as String,
      syncTrigger: json['SYNC_TRIGGER'] as String,
      languages: (json['LANGUAGES'] as List<dynamic>)
          .map((e) => Languages.fromJson(e as Map<String, dynamic>))
          .toList(),
      tenantId: json['TENANT_ID'] as String?,
      maxRadius: (json['PROXIMITY_SEARCH_RANGE'] as num?)?.toDouble(),
      householdDeletionReasonOptions: (json['HOUSEHOLD_DELETION_REASON_OPTIONS']
              as List<dynamic>)
          .map((e) => DeletionReasonOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
      bandWidthBatchSize: (json['BANDWIDTH_BATCH_SIZE'] as List<dynamic>)
          .map((e) => BandWidthBatchSize.fromJson(e as Map<String, dynamic>))
          .toList(),
      backgroundServiceConfig: json['BACKGROUND_SERVICE_CONFIG'] == null
          ? null
          : BackgroundServiceConfig.fromJson(
              json['BACKGROUND_SERVICE_CONFIG'] as Map<String, dynamic>),
      householdMemberDeletionReasonOptions: (json[
              'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS'] as List<dynamic>)
          .map((e) => DeletionReasonOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
      genderOptions: (json['GENDER_OPTIONS_POPULATOR'] as List<dynamic>)
          .map((e) => GenderOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
      checklistTypes: (json['CHECKLIST_TYPES'] as List<dynamic>)
          .map((e) => CheckListTypes.fromJson(e as Map<String, dynamic>))
          .toList(),
      idTypeOptions: (json['ID_TYPE_OPTIONS_POPULATOR'] as List<dynamic>)
          .map((e) => IdTypeOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
      deliveryCommentOptions: (json['DELIVERY_COMMENT_OPTIONS_POPULATOR']
              as List<dynamic>)
          .map(
              (e) => DeliveryCommentOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
      backendInterface: BackendInterface.fromJson(
          json['BACKEND_INTERFACE'] as Map<String, dynamic>),
      callSupportOptions: (json['CALL_SUPPORT'] as List<dynamic>?)
          ?.map((e) => CallSupportList.fromJson(e as Map<String, dynamic>))
          .toList(),
      transportTypes: (json['TRANSPORT_TYPES'] as List<dynamic>)
          .map((e) => TransportTypes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AppConfigToJson(_$_AppConfig instance) =>
    <String, dynamic>{
      'NETWORK_DETECTION': instance.networkDetection,
      'PERSISTENCE_MODE': instance.persistenceMode,
      'SYNC_METHOD': instance.syncMethod,
      'SYNC_TRIGGER': instance.syncTrigger,
      'LANGUAGES': instance.languages,
      'TENANT_ID': instance.tenantId,
      'PROXIMITY_SEARCH_RANGE': instance.maxRadius,
      'HOUSEHOLD_DELETION_REASON_OPTIONS':
          instance.householdDeletionReasonOptions,
      'BANDWIDTH_BATCH_SIZE': instance.bandWidthBatchSize,
      'BACKGROUND_SERVICE_CONFIG': instance.backgroundServiceConfig,
      'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS':
          instance.householdMemberDeletionReasonOptions,
      'GENDER_OPTIONS_POPULATOR': instance.genderOptions,
      'CHECKLIST_TYPES': instance.checklistTypes,
      'ID_TYPE_OPTIONS_POPULATOR': instance.idTypeOptions,
      'DELIVERY_COMMENT_OPTIONS_POPULATOR': instance.deliveryCommentOptions,
      'BACKEND_INTERFACE': instance.backendInterface,
      'CALL_SUPPORT': instance.callSupportOptions,
      'TRANSPORT_TYPES': instance.transportTypes,
    };

_$_IdTypeOptions _$$_IdTypeOptionsFromJson(Map<String, dynamic> json) =>
    _$_IdTypeOptions(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$_IdTypeOptionsToJson(_$_IdTypeOptions instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

_$_BandWidthBatchSize _$$_BandWidthBatchSizeFromJson(
        Map<String, dynamic> json) =>
    _$_BandWidthBatchSize(
      minRange: (json['MIN_RANGE'] as num).toDouble(),
      maxRange: (json['MAX_RANGE'] as num).toDouble(),
      batchSize: json['BATCH_SIZE'] as int,
    );

Map<String, dynamic> _$$_BandWidthBatchSizeToJson(
        _$_BandWidthBatchSize instance) =>
    <String, dynamic>{
      'MIN_RANGE': instance.minRange,
      'MAX_RANGE': instance.maxRange,
      'BATCH_SIZE': instance.batchSize,
    };

_$_DeliveryCommentOptions _$$_DeliveryCommentOptionsFromJson(
        Map<String, dynamic> json) =>
    _$_DeliveryCommentOptions(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$_DeliveryCommentOptionsToJson(
        _$_DeliveryCommentOptions instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

_$_DeletionReasonOptions _$$_DeletionReasonOptionsFromJson(
        Map<String, dynamic> json) =>
    _$_DeletionReasonOptions(
      value: json['value'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$_DeletionReasonOptionsToJson(
        _$_DeletionReasonOptions instance) =>
    <String, dynamic>{
      'value': instance.value,
      'code': instance.code,
    };

_$_GenderOptions _$$_GenderOptionsFromJson(Map<String, dynamic> json) =>
    _$_GenderOptions(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$_GenderOptionsToJson(_$_GenderOptions instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

_$_BackgroundServiceConfig _$$_BackgroundServiceConfigFromJson(
        Map<String, dynamic> json) =>
    _$_BackgroundServiceConfig(
      batteryPercentCutOff: json['BATTERY_PERCENT_CUT_OFF'] as int,
      serviceInterval: json['SERVICE_INTERVAL'] as int,
      apiConcurrency: json['API_CONCURRENCY'] as int,
    );

Map<String, dynamic> _$$_BackgroundServiceConfigToJson(
        _$_BackgroundServiceConfig instance) =>
    <String, dynamic>{
      'BATTERY_PERCENT_CUT_OFF': instance.batteryPercentCutOff,
      'SERVICE_INTERVAL': instance.serviceInterval,
      'API_CONCURRENCY': instance.apiConcurrency,
    };

_$_BackendInterface _$$_BackendInterfaceFromJson(Map<String, dynamic> json) =>
    _$_BackendInterface(
      interface: (json['interfaces'] as List<dynamic>)
          .map((e) => Interfaces.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BackendInterfaceToJson(_$_BackendInterface instance) =>
    <String, dynamic>{
      'interfaces': instance.interface,
    };

_$_InterfacesWrapper _$$_InterfacesWrapperFromJson(Map<String, dynamic> json) =>
    _$_InterfacesWrapper(
      interface: (json['interface'] as List<dynamic>)
          .map((e) => Interfaces.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_InterfacesWrapperToJson(
        _$_InterfacesWrapper instance) =>
    <String, dynamic>{
      'interface': instance.interface,
    };

_$_Interfaces _$$_InterfacesFromJson(Map<String, dynamic> json) =>
    _$_Interfaces(
      type: json['type'] as String,
      name: json['name'] as String,
      config: Config.fromJson(json['config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_InterfacesToJson(_$_Interfaces instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'config': instance.config,
    };

_$_Config _$$_ConfigFromJson(Map<String, dynamic> json) => _$_Config(
      localStoreTTL: json['localStoreTTL'] as int,
    );

Map<String, dynamic> _$$_ConfigToJson(_$_Config instance) => <String, dynamic>{
      'localStoreTTL': instance.localStoreTTL,
    };

_$_Languages _$$_LanguagesFromJson(Map<String, dynamic> json) => _$_Languages(
      label: json['label'] as String,
      value: json['value'] as String,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$_LanguagesToJson(_$_Languages instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'isSelected': instance.isSelected,
    };

_$_CheckListTypes _$$_CheckListTypesFromJson(Map<String, dynamic> json) =>
    _$_CheckListTypes(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$_CheckListTypesToJson(_$_CheckListTypes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

_$_CallSupportList _$$_CallSupportListFromJson(Map<String, dynamic> json) =>
    _$_CallSupportList(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$_CallSupportListToJson(_$_CallSupportList instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

_$_TransportTypes _$$_TransportTypesFromJson(Map<String, dynamic> json) =>
    _$_TransportTypes(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$_TransportTypesToJson(_$_TransportTypes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

_$_RowVersions _$$_RowVersionsFromJson(Map<String, dynamic> json) =>
    _$_RowVersions(
      module: json['module'] as String,
      version: json['version'] as String,
    );

Map<String, dynamic> _$$_RowVersionsToJson(_$_RowVersions instance) =>
    <String, dynamic>{
      'module': instance.module,
      'version': instance.version,
    };
