// ignore_for_file: invalid_annotation_target

import 'package:forms_engine/models/property_schema/property_schema.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schema_object.freezed.dart';
part 'schema_object.g.dart';

@freezed
class SchemaObject with _$SchemaObject {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory SchemaObject({
    required String name,
    required int version,
    @Default(false)bool summary,
    @Default({}) Map<String, PropertySchema> pages,
    List<ActionSchema>? actionSchema,
  }) = _SchemaObject;

  factory SchemaObject.fromJson(Map<String, dynamic> json) =>
      _$SchemaObjectFromJson(json);
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
