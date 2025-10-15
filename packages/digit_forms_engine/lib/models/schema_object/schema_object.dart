// ignore_for_file: invalid_annotation_target

import 'package:digit_forms_engine/models/property_schema/property_schema.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schema_object.freezed.dart';
part 'schema_object.g.dart';

@freezed
class SchemaObject with _$SchemaObject {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory SchemaObject({
    required String name,
    required int version,
    @Default(false) bool summary,
    SummaryItem? summaryDetails,
    @Default({}) Map<String, PropertySchema> pages,
    @JsonKey(fromJson: _showAlertOrNull) ShowAlertPopUp? showAlertPopUp,
    List<ActionSchema>? actionSchema,
  }) = _SchemaObject;

  factory SchemaObject.fromJson(Map<String, dynamic> json) =>
      _$SchemaObjectFromJson(json);
}

@freezed
class SummaryItem with _$SummaryItem {
  const factory SummaryItem({
    required String heading,
    String? description,
    @Default(false) bool show,
  }) = _SummaryItem;

  factory SummaryItem.fromJson(Map<String, dynamic> json) =>
      _$SummaryItemFromJson(json);
}

@freezed
class ActionSchema with _$ActionSchema {
  @JsonSerializable(explicitToJson: true)
  const factory ActionSchema({
    required String name,
    required String buttonName,
    @Default(ButtonType.elevated) ButtonType buttonType,
    required List<ActionItemSchema> actionItems,
  }) = _ActionSchema;

  factory ActionSchema.fromJson(Map<String, dynamic> json) =>
      _$ActionSchemaFromJson(json);
}

@freezed
class ShowAlertPopUp with _$ShowAlertPopUp {
  const factory ShowAlertPopUp({
    required String title,
    String? description, // optional
    required String primaryActionLabel,
    required String secondaryActionLabel,
    List<AlertCondition>? conditions,
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

@freezed
class ActionItemSchema with _$ActionItemSchema {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory ActionItemSchema({
    required ActionType type,
    UrlSchema? urlSchema,
    RoutingSchema? routingSchema,
  }) = _ActionItemSchema;

  factory ActionItemSchema.fromJson(Map<String, dynamic> json) =>
      _$ActionItemSchemaFromJson(json);
}

@freezed
class UrlSchema with _$UrlSchema {
  const factory UrlSchema({
    required String method,
    required String urlSchema,
  }) = _UrlSchema;

  factory UrlSchema.fromJson(Map<String, dynamic> json) =>
      _$UrlSchemaFromJson(json);
}

ShowAlertPopUp? _showAlertOrNull(dynamic value) {
  if (value is Map && value.isNotEmpty) {
    return ShowAlertPopUp.fromJson(Map<String, dynamic>.from(value));
  }
  return null;
}

@freezed
class RoutingSchema with _$RoutingSchema {
  @JsonSerializable(explicitToJson: true)
  const factory RoutingSchema({
    required String destination,
    PropertySchema? propertySchema,
  }) = _RoutingSchema;

  factory RoutingSchema.fromJson(Map<String, dynamic> json) =>
      _$RoutingSchemaFromJson(json);
}

enum ApiMethod { get, post, delete, patch, put }

enum ButtonType { outlined, text, elevated }

enum ActionType { api, reset, navigate }
