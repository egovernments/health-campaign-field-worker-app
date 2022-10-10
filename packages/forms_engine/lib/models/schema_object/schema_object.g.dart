// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SchemaObject _$$_SchemaObjectFromJson(Map<String, dynamic> json) =>
    _$_SchemaObject(
      name: json['name'] as String,
      version: json['version'] as int,
      schema: PropertySchema.fromJson(json['schema'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SchemaObjectToJson(_$_SchemaObject instance) =>
    <String, dynamic>{
      'name': instance.name,
      'version': instance.version,
      'schema': instance.schema.toJson(),
    };
