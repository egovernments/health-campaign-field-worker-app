// ignore_for_file: invalid_annotation_target

import 'package:forms_engine/models/property_schema/property_schema.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schema_object.freezed.dart';
part 'schema_object.g.dart';

@freezed
class SchemaObject with _$SchemaObject {
  @JsonSerializable(explicitToJson: true)
  const factory SchemaObject({
    required String name,
    required int version,
    required PropertySchema schema,
  }) = _SchemaObject;

  factory SchemaObject.fromJson(Map<String, dynamic> json) =>
      _$SchemaObjectFromJson(json);
}
