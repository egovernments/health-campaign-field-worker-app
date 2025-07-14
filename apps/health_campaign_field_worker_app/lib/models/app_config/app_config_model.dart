import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../manual_attendance_reasons/manual_attendance_reasons_model.dart';
import '../privacy_notice/privacy_notice_model.dart';
import '../referral_reasons/referral_reasons_model.dart';
import '../symptoms_types/symptoms_types_model.dart';

part 'app_config_model.freezed.dart';

part 'app_config_model.g.dart';

@freezed
class MdmsRequestModel with _$MdmsRequestModel {
  const factory MdmsRequestModel({
    @JsonKey(name: 'MdmsCriteria') required MdmsCriteriaModel mdmsCriteria,
  }) = _MdmsRequestModel;

  factory MdmsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$MdmsRequestModelFromJson(json);
}

@freezed
class MdmsCriteriaModel with _$MdmsCriteriaModel {
  const factory MdmsCriteriaModel({
    required String tenantId,
    required List<MdmsModuleDetailModel> moduleDetails,
  }) = _MdmsCriteriaModel;

  factory MdmsCriteriaModel.fromJson(Map<String, dynamic> json) =>
      _$MdmsCriteriaModelFromJson(json);
}

@freezed
class MdmsModuleDetailModel with _$MdmsModuleDetailModel {
  const factory MdmsModuleDetailModel({
    required String moduleName,
    required List<MdmsMasterDetailModel> masterDetails,
  }) = _MdmsModuleDetailModel;

  factory MdmsModuleDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MdmsModuleDetailModelFromJson(json);
}

@freezed
class MdmsMasterDetailModel with _$MdmsMasterDetailModel {
  const factory MdmsMasterDetailModel(String name) = _MdmsMasterDetailModel;

  factory MdmsMasterDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MdmsMasterDetailModelFromJson(json);
}

@freezed
class AppConfigPrimaryWrapperModel with _$AppConfigPrimaryWrapperModel {
  const factory AppConfigPrimaryWrapperModel({
    @JsonKey(name: 'HCM') HCMWrapperModel? hcmWrapperModel,
    @JsonKey(name: 'common-masters') CommonMastersWrapperModel? commonMasters,
    @JsonKey(name: 'module-version') final RowVersionWrapperModel? rowVersions,
  }) = _AppConfigPrimaryWrapperModel;

  factory AppConfigPrimaryWrapperModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AppConfigPrimaryWrapperModelFromJson(json);
}

@freezed
class HCMWrapperModel with _$HCMWrapperModel {
  const factory HCMWrapperModel({
    @JsonKey(name: 'APP_CONFIG') required List<AppConfig> appConfig,
    @JsonKey(name: 'BANDWIDTH_BATCH_SIZE')
    required List<BandWidthBatchSize> bandWidthBatchSize,
    @JsonKey(name: 'BENEFICIARY_ID_CONFIG')
    required List<BeneficiaryIdConfig> beneficiaryIdConfig,
    @JsonKey(name: 'DOWNSYNC-BANDWIDTH_BATCH_SIZE')
    required List<BandWidthBatchSize> downSyncBandWidthBatchSize,
    @JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS')
    required List<DeletionReasonOptions> householdDeletionReasonOptions,
    @JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS')
    required List<DeletionReasonOptions> householdMemberDeletionReasonOptions,
    @JsonKey(name: 'BACKGROUND_SERVICE_CONFIG')
    List<BackgroundServiceConfig>? backgroundServiceConfig,
    @JsonKey(name: 'CHECKLIST_TYPES')
    required List<CheckListTypes> checklistTypes,
    @JsonKey(name: 'ID_TYPE_OPTIONS_POPULATOR')
    required List<IdTypeOptions> idTypeOptions,
    @JsonKey(name: 'HOUSEHOLD_MEMBER_RELATIONSHIP_TYPES')
    required List<RelationShipTypeOptions> relationShipTypeOptions,
    @JsonKey(name: 'DELIVERY_COMMENT_OPTIONS_POPULATOR')
    required List<DeliveryCommentOptions> deliveryCommentOptions,
    @JsonKey(name: 'BACKEND_INTERFACE')
    required List<BackendInterface> backendInterface,
    @JsonKey(name: 'CALL_SUPPORT')
    required List<CallSupportList>? callSupportOptions,
    @JsonKey(name: 'TRANSPORT_TYPES')
    required List<TransportTypes> transportTypes,
    @JsonKey(name: 'SYMPTOM_TYPES') List<SymptomsType>? symptomsTypeList,
    @JsonKey(name: 'SEARCH_HOUSEHOLD_FILTERS')
    List<SearchHouseHoldFilters>? searchHouseHoldFilters,
    @JsonKey(name: 'SEARCH_CLF_FILTERS')
    List<SearchCLFFilters>? searchCLFFilters,
    @JsonKey(name: 'REFERRAL_REASONS')
    List<ReferralReasonType>? referralReasonList,
    @JsonKey(name:'MANUAL_ATTENDANCE_REASONS')
    List<ManualAttendanceReasonType>? manualAttendanceReasonList,
    @JsonKey(name: 'HOUSE_STRUCTURE_TYPES')
    List<CommonMasterModel>? houseStructureTypes,
    @JsonKey(name: 'REFUSAL_REASONS') List<CommonMasterModel>? refusalReasons,
    @JsonKey(name: 'FIREBASE_CONFIG')
    required List<FirebaseConfig>? firebaseConfig,
    @JsonKey(name: 'TRANSIT_POST_TYPE') List<TransitPostType>? transitPostType,
  }) = _HCMWrapperModel;

  factory HCMWrapperModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$HCMWrapperModelFromJson(json);
}

@freezed
class AppConfigSecondaryWrapperModel with _$AppConfigSecondaryWrapperModel {
  const factory AppConfigSecondaryWrapperModel({
    @JsonKey(name: 'appConfig') List<AppConfig>? appConfiglist,
  }) = _AppConfigSecondaryWrapperModel;

  factory AppConfigSecondaryWrapperModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AppConfigSecondaryWrapperModelFromJson(json);
}

@freezed
class CommonMastersWrapperModel with _$CommonMastersWrapperModel {
  const factory CommonMastersWrapperModel({
    @JsonKey(name: 'GenderType') required List<CommonMasterModel> genderType,
    @JsonKey(name: 'StateInfo') required List<StateInfoModel> stateInfo,
    @JsonKey(name: 'PrivacyPolicy')
    List<PrivacyPolicyModel>? privacyPolicyConfig,
  }) = _CommonMastersWrapperModel;

  factory CommonMastersWrapperModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CommonMastersWrapperModelFromJson(json);
}

@freezed
class CommonMasterModel with _$CommonMasterModel {
  const factory CommonMasterModel({
    @JsonKey(name: 'code') required String code,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'active') required bool active,
  }) = _CommonMasterModel;

  factory CommonMasterModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CommonMasterModelFromJson(json);
}

@freezed
class StateInfoModel with _$StateInfoModel {
  const factory StateInfoModel({
    @JsonKey(name: 'code') required String code,
    @JsonKey(name: 'languages') required List<Languages> languages,
    @JsonKey(name: 'localizationModules') List<Languages>? localizationModules,
  }) = _StateInfoModel;

  factory StateInfoModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$StateInfoModelFromJson(json);
}

@freezed
class RowVersionWrapperModel with _$RowVersionWrapperModel {
  const factory RowVersionWrapperModel({
    @JsonKey(name: 'ROW_VERSIONS') List<RowVersions>? rowVersionslist,
  }) = _RowVersionWrapperModel;

  factory RowVersionWrapperModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RowVersionWrapperModelFromJson(json);
}

@freezed
class AppConfig with _$AppConfig {
  factory AppConfig({
    @JsonKey(name: 'NETWORK_DETECTION') required String networkDetection,
    @JsonKey(name: 'PERSISTENCE_MODE') required String persistenceMode,
    @JsonKey(name: 'SYNC_METHOD') required String syncMethod,
    @JsonKey(name: 'SYNC_TRIGGER') required String syncTrigger,
    @JsonKey(name: 'TENANT_ID') final String? tenantId,
    @JsonKey(name: 'PROXIMITY_SEARCH_RANGE') final double? maxRadius,
  }) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
}

@freezed
class IdTypeOptions with _$IdTypeOptions {
  factory IdTypeOptions({
    required String name,
    required String code,
  }) = _IdTypeOptions;

  factory IdTypeOptions.fromJson(Map<String, dynamic> json) =>
      _$IdTypeOptionsFromJson(json);
}

@freezed
class RelationShipTypeOptions with _$RelationShipTypeOptions {
  factory RelationShipTypeOptions({
    required String name,
    required String code,
    required bool active,
  }) = _RelationShipTypeOptions;

  factory RelationShipTypeOptions.fromJson(Map<String, dynamic> json) =>
      _$RelationShipTypeOptionsFromJson(json);
}

@freezed
class BandWidthBatchSize with _$BandWidthBatchSize {
  factory BandWidthBatchSize({
    @JsonKey(name: 'MIN_RANGE') required double minRange,
    @JsonKey(name: 'MAX_RANGE') required double maxRange,
    @JsonKey(name: 'BATCH_SIZE') required int batchSize,
  }) = _BandWidthBatchSize;

  factory BandWidthBatchSize.fromJson(Map<String, dynamic> json) =>
      _$BandWidthBatchSizeFromJson(json);
}

@freezed
class BeneficiaryIdConfig with _$BeneficiaryIdConfig {
  factory BeneficiaryIdConfig({
    @JsonKey(name: 'MIN_COUNT') required double minCount,
    @JsonKey(name: 'BATCH_SIZE') required int batchSize,
  }) = _BeneficiaryIdConfig;

  factory BeneficiaryIdConfig.fromJson(Map<String, dynamic> json) =>
      _$BeneficiaryIdConfigFromJson(json);
}

@freezed
class DeliveryCommentOptions with _$DeliveryCommentOptions {
  factory DeliveryCommentOptions({
    required String name,
    required String code,
  }) = _DeliveryCommentOptions;

  factory DeliveryCommentOptions.fromJson(Map<String, dynamic> json) =>
      _$DeliveryCommentOptionsFromJson(json);
}

@freezed
class DeletionReasonOptions with _$DeletionReasonOptions {
  factory DeletionReasonOptions({
    required String value,
    required String code,
  }) = _DeletionReasonOptions;

  factory DeletionReasonOptions.fromJson(Map<String, dynamic> json) =>
      _$DeletionReasonOptionsFromJson(json);
}

@freezed
class GenderOptions with _$GenderOptions {
  factory GenderOptions({
    required String name,
    required String code,
  }) = _GenderOptions;

  factory GenderOptions.fromJson(Map<String, dynamic> json) =>
      _$GenderOptionsFromJson(json);
}

@freezed
class BackgroundServiceConfig with _$BackgroundServiceConfig {
  factory BackgroundServiceConfig({
    @JsonKey(name: 'BATTERY_PERCENT_CUT_OFF') required int batteryPercentCutOff,
    @JsonKey(name: 'SERVICE_INTERVAL') required int serviceInterval,
    @JsonKey(name: 'API_CONCURRENCY') required int apiConcurrency,
  }) = _BackgroundServiceConfig;

  factory BackgroundServiceConfig.fromJson(Map<String, dynamic> json) =>
      _$BackgroundServiceConfigFromJson(json);
}

@freezed
class BackendInterface with _$BackendInterface {
  factory BackendInterface({
    @JsonKey(name: 'interfaces') required List<Interfaces> interface,
  }) = _BackendInterface;

  factory BackendInterface.fromJson(Map<String, dynamic> json) =>
      _$BackendInterfaceFromJson(json);
}

@freezed
class InterfacesWrapper with _$InterfacesWrapper {
  factory InterfacesWrapper({
    required List<Interfaces> interface,
  }) = _InterfacesWrapper;

  factory InterfacesWrapper.fromJson(Map<String, dynamic> json) =>
      _$InterfacesWrapperFromJson(json);
}

@freezed
class Interfaces with _$Interfaces {
  factory Interfaces({
    required String type,
    required String name,
    required Config config,
  }) = _Interfaces;

  factory Interfaces.fromJson(Map<String, dynamic> json) =>
      _$InterfacesFromJson(json);
}

@freezed
class Config with _$Config {
  factory Config({
    required int localStoreTTL,
  }) = _Config;

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
}

@freezed
class Languages with _$Languages {
  factory Languages({
    required String label,
    required String value,
    @Default(false) bool isSelected,
  }) = _Languages;

  factory Languages.fromJson(Map<String, dynamic> json) =>
      _$LanguagesFromJson(json);
}

@freezed
class CheckListTypes with _$CheckListTypes {
  factory CheckListTypes({
    required String name,
    required String code,
  }) = _CheckListTypes;

  factory CheckListTypes.fromJson(Map<String, dynamic> json) =>
      _$CheckListTypesFromJson(json);
}

@freezed
class CallSupportList with _$CallSupportList {
  factory CallSupportList({
    required String name,
    required String code,
  }) = _CallSupportList;

  factory CallSupportList.fromJson(Map<String, dynamic> json) =>
      _$CallSupportListFromJson(json);
}

@freezed
class SearchHouseHoldFilters with _$SearchHouseHoldFilters {
  factory SearchHouseHoldFilters({
    required String name,
    required String code,
    required bool active,
  }) = _SearchHouseHoldFilters;

  factory SearchHouseHoldFilters.fromJson(Map<String, dynamic> json) =>
      _$SearchHouseHoldFiltersFromJson(json);
}

@freezed
class SearchCLFFilters with _$SearchCLFFilters {
  factory SearchCLFFilters({
    required String name,
    required String code,
    required bool active,
  }) = _SearchCLFFilters;

  factory SearchCLFFilters.fromJson(Map<String, dynamic> json) =>
      _$SearchCLFFiltersFromJson(json);
}

@freezed
class TransitPostType with _$TransitPostType {
  factory TransitPostType({
    required String name,
    required String code,
    required bool active,
  }) = _TransitPostType;

  factory TransitPostType.fromJson(Map<String, dynamic> json) =>
      _$TransitPostTypeFromJson(json);
}

@freezed
class TransportTypes with _$TransportTypes {
  factory TransportTypes({
    required String name,
    required String code,
  }) = _TransportTypes;

  factory TransportTypes.fromJson(Map<String, dynamic> json) =>
      _$TransportTypesFromJson(json);
}

@freezed
class RowVersions with _$RowVersions {
  factory RowVersions({
    required String module,
    required String version,
  }) = _RowVersions;

  factory RowVersions.fromJson(Map<String, dynamic> json) =>
      _$RowVersionsFromJson(json);
}

@freezed
class FirebaseConfig with _$FirebaseConfig {
  factory FirebaseConfig({
    required bool enableCrashlytics,
    required bool enableAnalytics,
  }) = _FirebaseConfig;

  factory FirebaseConfig.fromJson(Map<String, dynamic> json) =>
      _$FirebaseConfigFromJson(json);
}
