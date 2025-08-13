import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_config.freezed.dart';
part 'template_config.g.dart';

@freezed
class TemplateConfig with _$TemplateConfig {
  const factory TemplateConfig({
    required String type,
    required String label,
    String? description,
    required int order,
    Map<String, TemplateProperty>? properties,
    Map<String, bool>? features,
    @JsonKey(fromJson: _navigateToConfigOrNull) NavigateToConfig? navigateTo,
  }) = _TemplateConfig;

  factory TemplateConfig.fromJson(Map<String, dynamic> json) =>
      _$TemplateConfigFromJson(json);
}

@freezed
class TemplateProperty with _$TemplateProperty {
  const factory TemplateProperty({
    required String type,
    required String format,
    required String label,
    dynamic value,
    bool? hidden,
    int? order,
    bool? readOnly,
    bool? autoEnable,
    List<dynamic>? validations,
    List<Map<String, dynamic>>? enums,
  }) = _TemplateProperty;

  factory TemplateProperty.fromJson(Map<String, dynamic> json) =>
      _$TemplatePropertyFromJson(json);
}

NavigateToConfig? _navigateToConfigOrNull(dynamic value) {
  if (value is Map && value.isEmpty) {
    return null; // Treat {} as null
  }
  if (value is Map<String, dynamic>) {
    return NavigateToConfig.fromJson(value);
  }
  return null;
}

@freezed
class NavigateToConfig with _$NavigateToConfig {
  const factory NavigateToConfig({
    required String type, // "template" or "form"
    required String name, // route name or form name
  }) = _NavigateToConfig;

  factory NavigateToConfig.fromJson(Map<String, dynamic> json) =>
      _$NavigateToConfigFromJson(json);
}
