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
    @JsonKey(fromJson: _navigateToConfigOrNull) NavigateToConfig? navigateTo,
    @JsonKey(fromJson: _visibilityConditionOrNull)
    VisibilityCondition? visibilityCondition,
    @JsonKey(fromJson: _conditionalNavigateListOrNull)
    List<ConditionalNavigateTo>? conditionalNavigateTo,
    // New: AutoFillCondition list
    @JsonKey(fromJson: _autoFillConditionListOrNull)
    List<AutoFillCondition>? autoFillCondition,
    @JsonKey(fromJson: _showAlertOrNull) ShowAlertPopUp? showAlertPopUp,
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

@freezed
class AutoFillCondition with _$AutoFillCondition {
  const factory AutoFillCondition({
    required String expression,
    required dynamic value, // could be a string, number, template, etc.
  }) = _AutoFillCondition;

  factory AutoFillCondition.fromJson(Map<String, dynamic> json) =>
      _$AutoFillConditionFromJson(json);
}

@freezed
class ShowAlertPopUp with _$ShowAlertPopUp {
  const factory ShowAlertPopUp({
    required String title,
    String? description, // optional
    required String primaryActionLabel,
    required String secondaryActionLabel,
    List<AlertCondition>? conditions, // optional
  }) = _ShowAlertPopUp;

  factory ShowAlertPopUp.fromJson(Map<String, dynamic> json) =>
      _$ShowAlertPopUpFromJson(json);
}

@freezed
class AlertCondition with _$AlertCondition {
  const factory AlertCondition({
    required String expression, // e.g., condition or "DEFAULT"
    required String value, // e.g., "To Administer"
  }) = _AlertCondition;

  factory AlertCondition.fromJson(Map<String, dynamic> json) =>
      _$AlertConditionFromJson(json);
}

String? _stringOrNull(dynamic value) {
  return value is String ? value : null;
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

VisibilityCondition? _visibilityConditionOrNull(dynamic value) {
  if (value is Map && value.isEmpty) {
    return null;
  }
  if (value is Map<String, dynamic>) {
    return VisibilityCondition.fromJson(value);
  }
  return null;
}

List<ConditionalNavigateTo>? _conditionalNavigateListOrNull(dynamic value) {
  if (value is List) {
    if (value.isEmpty) return null;
    return value
        .whereType<Map<String, dynamic>>() // ignore nulls / wrong types
        .map((map) => ConditionalNavigateTo.fromJson(map))
        .toList();
  }
  return null;
}

// New: AutoFillCondition parser
List<AutoFillCondition>? _autoFillConditionListOrNull(dynamic value) {
  if (value is List) {
    if (value.isEmpty) return null;
    return value
        .whereType<Map<String, dynamic>>()
        .map((map) => AutoFillCondition.fromJson(map))
        .toList();
  }
  return null;
}

ShowAlertPopUp? _showAlertOrNull(dynamic value) {
  if (value is Map && value.isNotEmpty) {
    return ShowAlertPopUp.fromJson(Map<String, dynamic>.from(value));
  }
  return null;
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
