// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MdmsRequestModelImpl _$$MdmsRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MdmsRequestModelImpl(
      mdmsCriteria: MdmsCriteriaModel.fromJson(
          json['MdmsCriteria'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MdmsRequestModelImplToJson(
        _$MdmsRequestModelImpl instance) =>
    <String, dynamic>{
      'MdmsCriteria': instance.mdmsCriteria,
    };

_$MdmsCriteriaModelImpl _$$MdmsCriteriaModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MdmsCriteriaModelImpl(
      tenantId: json['tenantId'] as String,
      moduleDetails: (json['moduleDetails'] as List<dynamic>)
          .map((e) => MdmsModuleDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MdmsCriteriaModelImplToJson(
        _$MdmsCriteriaModelImpl instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'moduleDetails': instance.moduleDetails,
    };

_$MdmsModuleDetailModelImpl _$$MdmsModuleDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MdmsModuleDetailModelImpl(
      moduleName: json['moduleName'] as String,
      masterDetails: (json['masterDetails'] as List<dynamic>)
          .map((e) => MdmsMasterDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MdmsModuleDetailModelImplToJson(
        _$MdmsModuleDetailModelImpl instance) =>
    <String, dynamic>{
      'moduleName': instance.moduleName,
      'masterDetails': instance.masterDetails,
    };

_$MdmsMasterDetailModelImpl _$$MdmsMasterDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MdmsMasterDetailModelImpl(
      json['name'] as String,
    );

Map<String, dynamic> _$$MdmsMasterDetailModelImplToJson(
        _$MdmsMasterDetailModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$AppConfigPrimaryWrapperModelImpl _$$AppConfigPrimaryWrapperModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AppConfigPrimaryWrapperModelImpl(
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
      ineligibilityReasons: json['HCM-INELIGIBILITY-REASONS'] == null
          ? null
          : IneligibilityReasonsWrapperModel.fromJson(
              json['HCM-INELIGIBILITY-REASONS'] as Map<String, dynamic>),
      disabilityTypes: json['HCM-DISABILITY-TYPES'] == null
          ? null
          : DisabilityTypesWrapperModel.fromJson(
              json['HCM-DISABILITY-TYPES'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppConfigPrimaryWrapperModelImplToJson(
        _$AppConfigPrimaryWrapperModelImpl instance) =>
    <String, dynamic>{
      'HCM-FIELD-APP-CONFIG': instance.appConfig,
      'module-version': instance.rowVersions,
      'HCM-SYMPTOMS-TYPES': instance.symptomsTypes,
      'HCM-REFERRAL-REASONS': instance.referralReasons,
      'HCM-INELIGIBILITY-REASONS': instance.ineligibilityReasons,
      'HCM-DISABILITY-TYPES': instance.disabilityTypes,
    };

_$AppConfigSecondaryWrapperModelImpl
    _$$AppConfigSecondaryWrapperModelImplFromJson(Map<String, dynamic> json) =>
        _$AppConfigSecondaryWrapperModelImpl(
          appConfiglist: (json['appConfig'] as List<dynamic>?)
              ?.map((e) => AppConfig.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$AppConfigSecondaryWrapperModelImplToJson(
        _$AppConfigSecondaryWrapperModelImpl instance) =>
    <String, dynamic>{
      'appConfig': instance.appConfiglist,
    };

_$RowVersionWrapperModelImpl _$$RowVersionWrapperModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RowVersionWrapperModelImpl(
      rowVersionslist: (json['ROW_VERSIONS'] as List<dynamic>?)
          ?.map((e) => RowVersions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RowVersionWrapperModelImplToJson(
        _$RowVersionWrapperModelImpl instance) =>
    <String, dynamic>{
      'ROW_VERSIONS': instance.rowVersionslist,
    };

_$AppConfigImpl _$$AppConfigImplFromJson(Map<String, dynamic> json) =>
    _$AppConfigImpl(
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
      firebaseConfig: FirebaseConfig.fromJson(
          json['FIREBASE_CONFIG'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppConfigImplToJson(_$AppConfigImpl instance) =>
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
      'FIREBASE_CONFIG': instance.firebaseConfig,
    };

_$IdTypeOptionsImpl _$$IdTypeOptionsImplFromJson(Map<String, dynamic> json) =>
    _$IdTypeOptionsImpl(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$IdTypeOptionsImplToJson(_$IdTypeOptionsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

_$BandWidthBatchSizeImpl _$$BandWidthBatchSizeImplFromJson(
        Map<String, dynamic> json) =>
    _$BandWidthBatchSizeImpl(
      minRange: (json['MIN_RANGE'] as num).toDouble(),
      maxRange: (json['MAX_RANGE'] as num).toDouble(),
      batchSize: json['BATCH_SIZE'] as int,
    );

Map<String, dynamic> _$$BandWidthBatchSizeImplToJson(
        _$BandWidthBatchSizeImpl instance) =>
    <String, dynamic>{
      'MIN_RANGE': instance.minRange,
      'MAX_RANGE': instance.maxRange,
      'BATCH_SIZE': instance.batchSize,
    };

_$DeliveryCommentOptionsImpl _$$DeliveryCommentOptionsImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryCommentOptionsImpl(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$DeliveryCommentOptionsImplToJson(
        _$DeliveryCommentOptionsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

_$DeletionReasonOptionsImpl _$$DeletionReasonOptionsImplFromJson(
        Map<String, dynamic> json) =>
    _$DeletionReasonOptionsImpl(
      value: json['value'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$DeletionReasonOptionsImplToJson(
        _$DeletionReasonOptionsImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'code': instance.code,
    };

_$GenderOptionsImpl _$$GenderOptionsImplFromJson(Map<String, dynamic> json) =>
    _$GenderOptionsImpl(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$GenderOptionsImplToJson(_$GenderOptionsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

_$BackgroundServiceConfigImpl _$$BackgroundServiceConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$BackgroundServiceConfigImpl(
      batteryPercentCutOff: json['BATTERY_PERCENT_CUT_OFF'] as int,
      serviceInterval: json['SERVICE_INTERVAL'] as int,
      apiConcurrency: json['API_CONCURRENCY'] as int,
    );

Map<String, dynamic> _$$BackgroundServiceConfigImplToJson(
        _$BackgroundServiceConfigImpl instance) =>
    <String, dynamic>{
      'BATTERY_PERCENT_CUT_OFF': instance.batteryPercentCutOff,
      'SERVICE_INTERVAL': instance.serviceInterval,
      'API_CONCURRENCY': instance.apiConcurrency,
    };

_$BackendInterfaceImpl _$$BackendInterfaceImplFromJson(
        Map<String, dynamic> json) =>
    _$BackendInterfaceImpl(
      interface: (json['interfaces'] as List<dynamic>)
          .map((e) => Interfaces.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BackendInterfaceImplToJson(
        _$BackendInterfaceImpl instance) =>
    <String, dynamic>{
      'interfaces': instance.interface,
    };

_$InterfacesWrapperImpl _$$InterfacesWrapperImplFromJson(
        Map<String, dynamic> json) =>
    _$InterfacesWrapperImpl(
      interface: (json['interface'] as List<dynamic>)
          .map((e) => Interfaces.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$InterfacesWrapperImplToJson(
        _$InterfacesWrapperImpl instance) =>
    <String, dynamic>{
      'interface': instance.interface,
    };

_$InterfacesImpl _$$InterfacesImplFromJson(Map<String, dynamic> json) =>
    _$InterfacesImpl(
      type: json['type'] as String,
      name: json['name'] as String,
      config: Config.fromJson(json['config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$InterfacesImplToJson(_$InterfacesImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'config': instance.config,
    };

_$ConfigImpl _$$ConfigImplFromJson(Map<String, dynamic> json) => _$ConfigImpl(
      localStoreTTL: json['localStoreTTL'] as int,
    );

Map<String, dynamic> _$$ConfigImplToJson(_$ConfigImpl instance) =>
    <String, dynamic>{
      'localStoreTTL': instance.localStoreTTL,
    };

_$LanguagesImpl _$$LanguagesImplFromJson(Map<String, dynamic> json) =>
    _$LanguagesImpl(
      label: json['label'] as String,
      value: json['value'] as String,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$LanguagesImplToJson(_$LanguagesImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'isSelected': instance.isSelected,
    };

_$CheckListTypesImpl _$$CheckListTypesImplFromJson(Map<String, dynamic> json) =>
    _$CheckListTypesImpl(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$CheckListTypesImplToJson(
        _$CheckListTypesImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

_$CallSupportListImpl _$$CallSupportListImplFromJson(
        Map<String, dynamic> json) =>
    _$CallSupportListImpl(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$CallSupportListImplToJson(
        _$CallSupportListImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

_$TransportTypesImpl _$$TransportTypesImplFromJson(Map<String, dynamic> json) =>
    _$TransportTypesImpl(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$TransportTypesImplToJson(
        _$TransportTypesImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

_$RowVersionsImpl _$$RowVersionsImplFromJson(Map<String, dynamic> json) =>
    _$RowVersionsImpl(
      module: json['module'] as String,
      version: json['version'] as String,
    );

Map<String, dynamic> _$$RowVersionsImplToJson(_$RowVersionsImpl instance) =>
    <String, dynamic>{
      'module': instance.module,
      'version': instance.version,
    };

_$FirebaseConfigImpl _$$FirebaseConfigImplFromJson(Map<String, dynamic> json) =>
    _$FirebaseConfigImpl(
      enableCrashlytics: json['enableCrashlytics'] as bool,
      enableAnalytics: json['enableAnalytics'] as bool,
    );

Map<String, dynamic> _$$FirebaseConfigImplToJson(
        _$FirebaseConfigImpl instance) =>
    <String, dynamic>{
      'enableCrashlytics': instance.enableCrashlytics,
      'enableAnalytics': instance.enableAnalytics,
    };
