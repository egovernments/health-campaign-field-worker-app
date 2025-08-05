// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'property_schema.freezed.dart';
part 'property_schema.g.dart';

@freezed
class PropertySchema with _$PropertySchema {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
  )
  const factory PropertySchema({
    @JsonKey(
      name: 'type',
      unknownEnumValue: PropertySchemaType.string,
    )
    required PropertySchemaType type,
    bool? readOnly,
    bool? displayOnly,
    bool? hidden,
    Map<String, PropertySchema>? properties,
    List<Option>? enums,
    String? schemaCode,
    bool? systemDate,
    bool? charCount,
    @JsonKey(
      name: 'format',
      unknownEnumValue: PropertySchemaFormat.text,
    )
    PropertySchemaFormat? format,
    @JsonKey(fromJson: _stringOrNull) final String? startDate,
    @JsonKey(fromJson: _stringOrNull) final String? endDate,
    int? minValue,
    int? maxValue,
    int? minLength,
    int? maxLength,
    String? helpText,
    String? tooltip,
    String? prefixText,
    String? suffixText,
    String? innerLabel,
    String? label,
    bool? isMultiSelect,
    dynamic value,
    DisplayBehavior? displayBehavior,
    Map<String, dynamic>? conditions,
    int? order,
    String? actionLabel,
    String? description,
    List<ValidationRule>? validations,
    bool? includeInForm,
    bool? includeInSummary,
    NavigateToConfig? navigateTo,
    VisibilityCondition? visibilityCondition,
    List<ConditionalNavigateTo>? conditionalNavigateTo,
  }) = _PropertySchema;

  factory PropertySchema.fromJson(Map<String, dynamic> json) =>
      _$PropertySchemaFromJson(json);
}

@freezed
class ValidationRule with _$ValidationRule {
  const factory ValidationRule({
    required String type,
    dynamic value,
    String? message,
  }) = _ValidationRule;

  factory ValidationRule.fromJson(Map<String, dynamic> json) =>
      _$ValidationRuleFromJson(json);
}

@freezed
class Option with _$Option {
  const factory Option({
    required String code,
    required String name,
  }) = _Option;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}

@freezed
class DisplayBehavior with _$DisplayBehavior {
  const factory DisplayBehavior({
    required FormulaBehavior behavior,
    List<String>? oneOf,
    List<String>? allOf,
  }) = _DisplayBehavior;

  factory DisplayBehavior.fromJson(Map<String, dynamic> json) =>
      _$DisplayBehaviorFromJson(json);
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

@freezed
class VisibilityCondition with _$VisibilityCondition {
  const factory VisibilityCondition({
    required String expression,
  }) = _VisibilityCondition;

  factory VisibilityCondition.fromJson(Map<String, dynamic> json) =>
      _$VisibilityConditionFromJson(json);
}

@freezed
class ConditionalNavigateTo with _$ConditionalNavigateTo {
  const factory ConditionalNavigateTo({
    required String condition,
    required NavigateToConfig navigateTo,
  }) = _ConditionalNavigateTo;

  factory ConditionalNavigateTo.fromJson(Map<String, dynamic> json) =>
      _$ConditionalNavigateToFromJson(json);
}

String? _stringOrNull(dynamic value) {
  return value is String ? value : null;
}

enum FormulaBehavior { show, hide }

enum PropertySchemaFormat {
  date,
  latLng,
  custom,
  locality,
  select,
  numeric,
  dropdown,
  checkbox,
  radio,
  dob,
  scanner,
  idPopulator,
  mobileNumber,
  textArea,
  text;
}

enum PropertySchemaType { object, string, integer, boolean, dynamic }
