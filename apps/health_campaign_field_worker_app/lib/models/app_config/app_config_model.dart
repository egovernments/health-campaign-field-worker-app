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
    @JsonKey(name: 'LOCALIZATION_MODULES')
        required List<LocalizationModules>? localizationModules,
  }) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
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
class LocalizationModules with _$LocalizationModules {
  factory LocalizationModules({required String label, required String value}) =
      _LocalizationModules;

  factory LocalizationModules.fromJson(Map<String, dynamic> json) =>
      _$LocalizationModulesFromJson(json);
}
