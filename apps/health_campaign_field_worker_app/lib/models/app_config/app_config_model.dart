// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config_model.freezed.dart';
part 'app_config_model.g.dart';

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
    @JsonKey(name: 'BACKEND_INTERFACE')
        required BackendInterface backendInterface,
  }) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
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
