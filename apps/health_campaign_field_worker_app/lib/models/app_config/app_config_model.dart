// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

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
    @JsonKey(name: 'HCM-FIELD-APP-CONFIG')
        final AppConfigSecondaryWrapperModel? appConfig,
  }) = _AppConfigPrimaryWrapperModel;

  factory AppConfigPrimaryWrapperModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AppConfigPrimaryWrapperModelFromJson(json);
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
class AppConfig with _$AppConfig {
  factory AppConfig({
    @JsonKey(name: 'NETWORK_DETECTION') required String networkDetection,
    @JsonKey(name: 'PERSISTENCE_MODE') required String persistenceMode,
    @JsonKey(name: 'SYNC_METHOD') required String syncMethod,
    @JsonKey(name: 'SYNC_TRIGGER') required String syncTrigger,
    @JsonKey(name: 'LANGUAGES') required List<Languages> languages,
    @JsonKey(name: 'TENANT_ID') final String? tenantId,
    @JsonKey(name: 'HOUSEHOLD_DELETION_REASON_OPTIONS')
        required List<DeletionReasonOptions> householdDeletionReasonOptions,
    @JsonKey(name: 'HOUSEHOLD_MEMBER_DELETION_REASON_OPTIONS')
        required List<DeletionReasonOptions>
            householdMemberDeletionReasonOptions,
    @JsonKey(name: 'GENDER_OPTIONS_POPULATOR')
        required List<GenderOptions> genderOptions,
    @JsonKey(name: 'CHECKLIST_TYPES')
        required List<CheckListTypes> checklistTypes,
    @JsonKey(name: 'ID_TYPE_OPTIONS_POPULATOR')
        required List<IdTypeOptions> idTypeOptions,
    @JsonKey(name: 'DELIVERY_COMMENT_OPTIONS_POPULATOR')
        required List<DeliveryCommentOptions> deliveryCommentOptions,
    @JsonKey(name: 'BACKEND_INTERFACE')
        required BackendInterface backendInterface,
    @JsonKey(name: 'TRANSPORT_TYPES')
        required List<TransportTypes> transportTypes,
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
class TransportTypes with _$TransportTypes {
  factory TransportTypes({
    required String name,
    required String code,
  }) = _TransportTypes;

  factory TransportTypes.fromJson(Map<String, dynamic> json) =>
      _$TransportTypesFromJson(json);
}
