// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_fields_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdditionalFieldsModel _$$_AdditionalFieldsModelFromJson(
        Map<String, dynamic> json) =>
    _$_AdditionalFieldsModel(
      schema: json['schema'] as String,
      version: json['version'] as int,
      fields: (json['fields'] as List<dynamic>)
          .map((e) =>
              AdditionalFieldsObjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AdditionalFieldsModelToJson(
        _$_AdditionalFieldsModel instance) =>
    <String, dynamic>{
      'schema': instance.schema,
      'version': instance.version,
      'fields': instance.fields.map((e) => e.toJson()).toList(),
    };

_$_AdditionalFieldsObjectModel _$$_AdditionalFieldsObjectModelFromJson(
        Map<String, dynamic> json) =>
    _$_AdditionalFieldsObjectModel(
      key: json['key'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$_AdditionalFieldsObjectModelToJson(
        _$_AdditionalFieldsObjectModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };
