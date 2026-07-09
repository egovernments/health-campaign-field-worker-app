// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MdmsRequestModel _$MdmsRequestModelFromJson(Map<String, dynamic> json) =>
    _MdmsRequestModel(
      mdmsCriteria: MdmsCriteriaModel.fromJson(
        json['MdmsCriteria'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$MdmsRequestModelToJson(_MdmsRequestModel instance) =>
    <String, dynamic>{'MdmsCriteria': instance.mdmsCriteria};

_MdmsCriteriaModel _$MdmsCriteriaModelFromJson(Map<String, dynamic> json) =>
    _MdmsCriteriaModel(
      tenantId: json['tenantId'] as String,
      schemaCode: json['schemaCode'] as String,
      filters: json['filters'] as Map<String, dynamic>?,
      limit: (json['limit'] as num?)?.toInt(),
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$MdmsCriteriaModelToJson(_MdmsCriteriaModel instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'schemaCode': instance.schemaCode,
      'filters': instance.filters,
      'limit': instance.limit,
      'isActive': instance.isActive,
    };

_AppConfigPrimaryWrapperModel _$AppConfigPrimaryWrapperModelFromJson(
  Map<String, dynamic> json,
) => _AppConfigPrimaryWrapperModel(
  hcmWrapperModel: json['HCM'] == null
      ? null
      : HCMWrapperModel.fromJson(json['HCM'] as Map<String, dynamic>),
  commonMasters: json['common-masters'] == null
      ? null
      : CommonMastersWrapperModel.fromJson(
          json['common-masters'] as Map<String, dynamic>,
        ),
  rowVersions: json['module-version'] == null
      ? null
      : RowVersionWrapperModel.fromJson(
          json['module-version'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$AppConfigPrimaryWrapperModelToJson(
  _AppConfigPrimaryWrapperModel instance,
) => <String, dynamic>{
  'HCM': instance.hcmWrapperModel,
  'common-masters': instance.commonMasters,
  'module-version': instance.rowVersions,
};

_HCMWrapperModel _$HCMWrapperModelFromJson(
  Map<String, dynamic> json,
) => _HCMWrapperModel(
  appConfig: (json['APP_CONFIG'] as List<dynamic>)
      .map((e) => AppConfig.fromJson(e as Map<String, dynamic>))
      .toList(),
  bandWidthBatchSize: (json['BANDWIDTH_BATCH_SIZE'] as List<dynamic>)
      .map((e) => BandWidthBatchSize.fromJson(e as Map<String, dynamic>))
      .toList(),
  beneficiaryIdConfig: (json['BENEFICIARY_ID_CONFIG'] as List<dynamic>)
      .map((e) => BeneficiaryIdConfig.fromJson(e as Map<String, dynamic>))
      .toList(),
  downSyncBandWidthBatchSize:
      (json['DOWNSYNC-BANDWIDTH_BATCH_SIZE'] as List<dynamic>)
          .map((e) => BandWidthBatchSize.fromJson(e as Map<String, dynamic>))
          .toList(),
  householdDeletionReasonOptions:
      (json['HOUSEHOLD_DELETION_REASON_OPTIONS'] as List<dynamic>)
          .map((e) => DeletionReasonOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
  householdMemberDeletionReasonOptions:
      (json['HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS'] as List<dynamic>)
          .map((e) => DeletionReasonOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
  backgroundServiceConfig: (json['BACKGROUND_SERVICE_CONFIG'] as List<dynamic>?)
      ?.map((e) => BackgroundServiceConfig.fromJson(e as Map<String, dynamic>))
      .toList(),
  checklistTypes: (json['CHECKLIST_TYPES'] as List<dynamic>)
      .map((e) => CheckListTypes.fromJson(e as Map<String, dynamic>))
      .toList(),
  deviceChangeReasons: (json['DEVICE_CHANGE_REASONS'] as List<dynamic>)
      .map((e) => DeviceChangeReasons.fromJson(e as Map<String, dynamic>))
      .toList(),
  singleUserLogin: (json['SINGLE_USER_LOGIN'] as List<dynamic>)
      .map((e) => SingleUserLogin.fromJson(e as Map<String, dynamic>))
      .toList(),
  idTypeOptions: (json['ID_TYPE_OPTIONS_POPULATOR'] as List<dynamic>)
      .map((e) => IdTypeOptions.fromJson(e as Map<String, dynamic>))
      .toList(),
  relationShipTypeOptions:
      (json['HOUSEHOLD_MEMBER_RELATIONSHIP_TYPES'] as List<dynamic>)
          .map(
            (e) => RelationShipTypeOptions.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  deliveryCommentOptions:
      (json['DELIVERY_COMMENT_OPTIONS_POPULATOR'] as List<dynamic>)
          .map(
            (e) => DeliveryCommentOptions.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  backendInterface: (json['BACKEND_INTERFACE'] as List<dynamic>)
      .map((e) => BackendInterface.fromJson(e as Map<String, dynamic>))
      .toList(),
  callSupportOptions: (json['CALL_SUPPORT'] as List<dynamic>?)
      ?.map((e) => CallSupportList.fromJson(e as Map<String, dynamic>))
      .toList(),
  transportTypes: (json['TRANSPORT_TYPES'] as List<dynamic>)
      .map((e) => TransportTypes.fromJson(e as Map<String, dynamic>))
      .toList(),
  symptomsTypeList: (json['SYMPTOM_TYPES'] as List<dynamic>?)
      ?.map((e) => SymptomsType.fromJson(e as Map<String, dynamic>))
      .toList(),
  searchHouseHoldFilters: (json['SEARCH_HOUSEHOLD_FILTERS'] as List<dynamic>?)
      ?.map((e) => SearchHouseHoldFilters.fromJson(e as Map<String, dynamic>))
      .toList(),
  searchCLFFilters: (json['SEARCH_CLF_FILTERS'] as List<dynamic>?)
      ?.map((e) => SearchCLFFilters.fromJson(e as Map<String, dynamic>))
      .toList(),
  referralReasonList: (json['REFERRAL_REASONS'] as List<dynamic>?)
      ?.map((e) => ReferralReasonType.fromJson(e as Map<String, dynamic>))
      .toList(),
  manualAttendanceReasonList:
      (json['MANUAL_ATTENDANCE_REASONS'] as List<dynamic>?)
          ?.map(
            (e) =>
                ManualAttendanceReasonType.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  houseStructureTypes: (json['HOUSE_STRUCTURE_TYPES'] as List<dynamic>?)
      ?.map((e) => CommonMasterModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  refusalReasons: (json['REFUSAL_REASONS'] as List<dynamic>?)
      ?.map((e) => CommonMasterModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  firebaseConfig: (json['FIREBASE_CONFIG'] as List<dynamic>?)
      ?.map((e) => FirebaseConfig.fromJson(e as Map<String, dynamic>))
      .toList(),
  transitPostType: (json['TRANSIT_POST_TYPE'] as List<dynamic>?)
      ?.map((e) => TransitPostType.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HCMWrapperModelToJson(
  _HCMWrapperModel instance,
) => <String, dynamic>{
  'APP_CONFIG': instance.appConfig,
  'BANDWIDTH_BATCH_SIZE': instance.bandWidthBatchSize,
  'BENEFICIARY_ID_CONFIG': instance.beneficiaryIdConfig,
  'DOWNSYNC-BANDWIDTH_BATCH_SIZE': instance.downSyncBandWidthBatchSize,
  'HOUSEHOLD_DELETION_REASON_OPTIONS': instance.householdDeletionReasonOptions,
  'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS':
      instance.householdMemberDeletionReasonOptions,
  'BACKGROUND_SERVICE_CONFIG': instance.backgroundServiceConfig,
  'CHECKLIST_TYPES': instance.checklistTypes,
  'DEVICE_CHANGE_REASONS': instance.deviceChangeReasons,
  'SINGLE_USER_LOGIN': instance.singleUserLogin,
  'ID_TYPE_OPTIONS_POPULATOR': instance.idTypeOptions,
  'HOUSEHOLD_MEMBER_RELATIONSHIP_TYPES': instance.relationShipTypeOptions,
  'DELIVERY_COMMENT_OPTIONS_POPULATOR': instance.deliveryCommentOptions,
  'BACKEND_INTERFACE': instance.backendInterface,
  'CALL_SUPPORT': instance.callSupportOptions,
  'TRANSPORT_TYPES': instance.transportTypes,
  'SYMPTOM_TYPES': instance.symptomsTypeList,
  'SEARCH_HOUSEHOLD_FILTERS': instance.searchHouseHoldFilters,
  'SEARCH_CLF_FILTERS': instance.searchCLFFilters,
  'REFERRAL_REASONS': instance.referralReasonList,
  'MANUAL_ATTENDANCE_REASONS': instance.manualAttendanceReasonList,
  'HOUSE_STRUCTURE_TYPES': instance.houseStructureTypes,
  'REFUSAL_REASONS': instance.refusalReasons,
  'FIREBASE_CONFIG': instance.firebaseConfig,
  'TRANSIT_POST_TYPE': instance.transitPostType,
};

_AppConfigSecondaryWrapperModel _$AppConfigSecondaryWrapperModelFromJson(
  Map<String, dynamic> json,
) => _AppConfigSecondaryWrapperModel(
  appConfiglist: (json['appConfig'] as List<dynamic>?)
      ?.map((e) => AppConfig.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AppConfigSecondaryWrapperModelToJson(
  _AppConfigSecondaryWrapperModel instance,
) => <String, dynamic>{'appConfig': instance.appConfiglist};

_CommonMastersWrapperModel _$CommonMastersWrapperModelFromJson(
  Map<String, dynamic> json,
) => _CommonMastersWrapperModel(
  genderType: (json['GenderType'] as List<dynamic>)
      .map((e) => CommonMasterModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  stateInfo: (json['StateInfo'] as List<dynamic>)
      .map((e) => StateInfoModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  privacyPolicyConfig: (json['PrivacyPolicy'] as List<dynamic>?)
      ?.map((e) => PrivacyPolicyModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CommonMastersWrapperModelToJson(
  _CommonMastersWrapperModel instance,
) => <String, dynamic>{
  'GenderType': instance.genderType,
  'StateInfo': instance.stateInfo,
  'PrivacyPolicy': instance.privacyPolicyConfig,
};

_CommonMasterModel _$CommonMasterModelFromJson(Map<String, dynamic> json) =>
    _CommonMasterModel(
      code: json['code'] as String,
      name: json['name'] as String?,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$CommonMasterModelToJson(_CommonMasterModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'active': instance.active,
    };

_StateInfoModel _$StateInfoModelFromJson(Map<String, dynamic> json) =>
    _StateInfoModel(
      code: json['code'] as String,
      languages: (json['languages'] as List<dynamic>)
          .map((e) => Languages.fromJson(e as Map<String, dynamic>))
          .toList(),
      localizationModules: (json['localizationModules'] as List<dynamic>?)
          ?.map((e) => Languages.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StateInfoModelToJson(_StateInfoModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'languages': instance.languages,
      'localizationModules': instance.localizationModules,
    };

_RowVersionWrapperModel _$RowVersionWrapperModelFromJson(
  Map<String, dynamic> json,
) => _RowVersionWrapperModel(
  rowVersionslist: (json['ROW_VERSIONS'] as List<dynamic>?)
      ?.map((e) => RowVersions.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RowVersionWrapperModelToJson(
  _RowVersionWrapperModel instance,
) => <String, dynamic>{'ROW_VERSIONS': instance.rowVersionslist};

_AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => _AppConfig(
  networkDetection: json['NETWORK_DETECTION'] as String,
  persistenceMode: json['PERSISTENCE_MODE'] as String,
  syncMethod: json['SYNC_METHOD'] as String,
  syncTrigger: json['SYNC_TRIGGER'] as String,
  tenantId: json['TENANT_ID'] as String?,
  maxRadius: (json['PROXIMITY_SEARCH_RANGE'] as num?)?.toDouble(),
  boundaryLastLevelMaxSelection:
      (json['BOUNDARY_LAST_LEVEL_MAX_SELECTION'] as num?)?.toInt(),
);

Map<String, dynamic> _$AppConfigToJson(
  _AppConfig instance,
) => <String, dynamic>{
  'NETWORK_DETECTION': instance.networkDetection,
  'PERSISTENCE_MODE': instance.persistenceMode,
  'SYNC_METHOD': instance.syncMethod,
  'SYNC_TRIGGER': instance.syncTrigger,
  'TENANT_ID': instance.tenantId,
  'PROXIMITY_SEARCH_RANGE': instance.maxRadius,
  'BOUNDARY_LAST_LEVEL_MAX_SELECTION': instance.boundaryLastLevelMaxSelection,
};

_IdTypeOptions _$IdTypeOptionsFromJson(Map<String, dynamic> json) =>
    _IdTypeOptions(name: json['name'] as String, code: json['code'] as String);

Map<String, dynamic> _$IdTypeOptionsToJson(_IdTypeOptions instance) =>
    <String, dynamic>{'name': instance.name, 'code': instance.code};

_RelationShipTypeOptions _$RelationShipTypeOptionsFromJson(
  Map<String, dynamic> json,
) => _RelationShipTypeOptions(
  name: json['name'] as String,
  code: json['code'] as String,
  active: json['active'] as bool,
);

Map<String, dynamic> _$RelationShipTypeOptionsToJson(
  _RelationShipTypeOptions instance,
) => <String, dynamic>{
  'name': instance.name,
  'code': instance.code,
  'active': instance.active,
};

_BandWidthBatchSize _$BandWidthBatchSizeFromJson(Map<String, dynamic> json) =>
    _BandWidthBatchSize(
      minRange: (json['MIN_RANGE'] as num).toDouble(),
      maxRange: (json['MAX_RANGE'] as num).toDouble(),
      batchSize: (json['BATCH_SIZE'] as num).toInt(),
    );

Map<String, dynamic> _$BandWidthBatchSizeToJson(_BandWidthBatchSize instance) =>
    <String, dynamic>{
      'MIN_RANGE': instance.minRange,
      'MAX_RANGE': instance.maxRange,
      'BATCH_SIZE': instance.batchSize,
    };

_BeneficiaryIdConfig _$BeneficiaryIdConfigFromJson(Map<String, dynamic> json) =>
    _BeneficiaryIdConfig(
      minCount: (json['MIN_COUNT'] as num).toDouble(),
      batchSize: (json['BATCH_SIZE'] as num).toInt(),
    );

Map<String, dynamic> _$BeneficiaryIdConfigToJson(
  _BeneficiaryIdConfig instance,
) => <String, dynamic>{
  'MIN_COUNT': instance.minCount,
  'BATCH_SIZE': instance.batchSize,
};

_DeliveryCommentOptions _$DeliveryCommentOptionsFromJson(
  Map<String, dynamic> json,
) => _DeliveryCommentOptions(
  name: json['name'] as String,
  code: json['code'] as String,
);

Map<String, dynamic> _$DeliveryCommentOptionsToJson(
  _DeliveryCommentOptions instance,
) => <String, dynamic>{'name': instance.name, 'code': instance.code};

_DeletionReasonOptions _$DeletionReasonOptionsFromJson(
  Map<String, dynamic> json,
) => _DeletionReasonOptions(
  value: json['value'] as String,
  code: json['code'] as String,
);

Map<String, dynamic> _$DeletionReasonOptionsToJson(
  _DeletionReasonOptions instance,
) => <String, dynamic>{'value': instance.value, 'code': instance.code};

_GenderOptions _$GenderOptionsFromJson(Map<String, dynamic> json) =>
    _GenderOptions(name: json['name'] as String, code: json['code'] as String);

Map<String, dynamic> _$GenderOptionsToJson(_GenderOptions instance) =>
    <String, dynamic>{'name': instance.name, 'code': instance.code};

_BackgroundServiceConfig _$BackgroundServiceConfigFromJson(
  Map<String, dynamic> json,
) => _BackgroundServiceConfig(
  batteryPercentCutOff: (json['BATTERY_PERCENT_CUT_OFF'] as num).toInt(),
  serviceInterval: (json['SERVICE_INTERVAL'] as num).toInt(),
  apiConcurrency: (json['API_CONCURRENCY'] as num).toInt(),
);

Map<String, dynamic> _$BackgroundServiceConfigToJson(
  _BackgroundServiceConfig instance,
) => <String, dynamic>{
  'BATTERY_PERCENT_CUT_OFF': instance.batteryPercentCutOff,
  'SERVICE_INTERVAL': instance.serviceInterval,
  'API_CONCURRENCY': instance.apiConcurrency,
};

_BackendInterface _$BackendInterfaceFromJson(Map<String, dynamic> json) =>
    _BackendInterface(
      interface: (json['interfaces'] as List<dynamic>)
          .map((e) => Interfaces.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BackendInterfaceToJson(_BackendInterface instance) =>
    <String, dynamic>{'interfaces': instance.interface};

_InterfacesWrapper _$InterfacesWrapperFromJson(Map<String, dynamic> json) =>
    _InterfacesWrapper(
      interface: (json['interface'] as List<dynamic>)
          .map((e) => Interfaces.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InterfacesWrapperToJson(_InterfacesWrapper instance) =>
    <String, dynamic>{'interface': instance.interface};

_Interfaces _$InterfacesFromJson(Map<String, dynamic> json) => _Interfaces(
  type: json['type'] as String,
  name: json['name'] as String,
  config: Config.fromJson(json['config'] as Map<String, dynamic>),
);

Map<String, dynamic> _$InterfacesToJson(_Interfaces instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'config': instance.config,
    };

_Config _$ConfigFromJson(Map<String, dynamic> json) =>
    _Config(localStoreTTL: (json['localStoreTTL'] as num).toInt());

Map<String, dynamic> _$ConfigToJson(_Config instance) => <String, dynamic>{
  'localStoreTTL': instance.localStoreTTL,
};

_Languages _$LanguagesFromJson(Map<String, dynamic> json) => _Languages(
  label: json['label'] as String,
  value: json['value'] as String,
  isSelected: json['isSelected'] as bool? ?? false,
);

Map<String, dynamic> _$LanguagesToJson(_Languages instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'isSelected': instance.isSelected,
    };

_CheckListTypes _$CheckListTypesFromJson(Map<String, dynamic> json) =>
    _CheckListTypes(name: json['name'] as String, code: json['code'] as String);

Map<String, dynamic> _$CheckListTypesToJson(_CheckListTypes instance) =>
    <String, dynamic>{'name': instance.name, 'code': instance.code};

_CallSupportList _$CallSupportListFromJson(Map<String, dynamic> json) =>
    _CallSupportList(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$CallSupportListToJson(_CallSupportList instance) =>
    <String, dynamic>{'name': instance.name, 'code': instance.code};

_SearchHouseHoldFilters _$SearchHouseHoldFiltersFromJson(
  Map<String, dynamic> json,
) => _SearchHouseHoldFilters(
  name: json['name'] as String,
  code: json['code'] as String,
  active: json['active'] as bool,
);

Map<String, dynamic> _$SearchHouseHoldFiltersToJson(
  _SearchHouseHoldFilters instance,
) => <String, dynamic>{
  'name': instance.name,
  'code': instance.code,
  'active': instance.active,
};

_SearchCLFFilters _$SearchCLFFiltersFromJson(Map<String, dynamic> json) =>
    _SearchCLFFilters(
      name: json['name'] as String,
      code: json['code'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$SearchCLFFiltersToJson(_SearchCLFFilters instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'active': instance.active,
    };

_TransitPostType _$TransitPostTypeFromJson(Map<String, dynamic> json) =>
    _TransitPostType(
      name: json['name'] as String,
      code: json['code'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$TransitPostTypeToJson(_TransitPostType instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'active': instance.active,
    };

_DeviceChangeReasons _$DeviceChangeReasonsFromJson(Map<String, dynamic> json) =>
    _DeviceChangeReasons(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$DeviceChangeReasonsToJson(
  _DeviceChangeReasons instance,
) => <String, dynamic>{'name': instance.name, 'code': instance.code};

_SingleUserLogin _$SingleUserLoginFromJson(Map<String, dynamic> json) =>
    _SingleUserLogin(
      enabled: json['enabled'] as bool,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$SingleUserLoginToJson(_SingleUserLogin instance) =>
    <String, dynamic>{'enabled': instance.enabled, 'id': instance.id};

_TransportTypes _$TransportTypesFromJson(Map<String, dynamic> json) =>
    _TransportTypes(name: json['name'] as String, code: json['code'] as String);

Map<String, dynamic> _$TransportTypesToJson(_TransportTypes instance) =>
    <String, dynamic>{'name': instance.name, 'code': instance.code};

_RowVersions _$RowVersionsFromJson(Map<String, dynamic> json) => _RowVersions(
  module: json['module'] as String,
  version: json['version'] as String,
);

Map<String, dynamic> _$RowVersionsToJson(_RowVersions instance) =>
    <String, dynamic>{'module': instance.module, 'version': instance.version};

_FirebaseConfig _$FirebaseConfigFromJson(Map<String, dynamic> json) =>
    _FirebaseConfig(
      enableCrashlytics: json['enableCrashlytics'] as bool,
      enableAnalytics: json['enableAnalytics'] as bool,
    );

Map<String, dynamic> _$FirebaseConfigToJson(_FirebaseConfig instance) =>
    <String, dynamic>{
      'enableCrashlytics': instance.enableCrashlytics,
      'enableAnalytics': instance.enableAnalytics,
    };
