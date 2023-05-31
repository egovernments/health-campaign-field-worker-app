// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pgr_service_defenitions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PGRServiceDefinitions _$$_PGRServiceDefinitionsFromJson(
        Map<String, dynamic> json) =>
    _$_PGRServiceDefinitions(
      serviceDefinitionWrapper: json['RAINMAKER-PGR'] == null
          ? null
          : ServiceDefinitionWrapper.fromJson(
              json['RAINMAKER-PGR'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PGRServiceDefinitionsToJson(
        _$_PGRServiceDefinitions instance) =>
    <String, dynamic>{
      'RAINMAKER-PGR': instance.serviceDefinitionWrapper,
    };

_$_ServiceDefinitionWrapper _$$_ServiceDefinitionWrapperFromJson(
        Map<String, dynamic> json) =>
    _$_ServiceDefinitionWrapper(
      definition: (json['ServiceDefs'] as List<dynamic>?)
              ?.map((e) => Definition.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ServiceDefinitionWrapperToJson(
        _$_ServiceDefinitionWrapper instance) =>
    <String, dynamic>{
      'ServiceDefs': instance.definition,
    };

_$_Definition _$$_DefinitionFromJson(Map<String, dynamic> json) =>
    _$_Definition(
      serviceCode: json['serviceCode'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_DefinitionToJson(_$_Definition instance) =>
    <String, dynamic>{
      'serviceCode': instance.serviceCode,
      'name': instance.name,
    };
