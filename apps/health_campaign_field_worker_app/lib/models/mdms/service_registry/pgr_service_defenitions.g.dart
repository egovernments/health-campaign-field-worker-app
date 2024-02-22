// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pgr_service_defenitions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PGRServiceDefinitionsImpl _$$PGRServiceDefinitionsImplFromJson(
        Map<String, dynamic> json) =>
    _$PGRServiceDefinitionsImpl(
      serviceDefinitionWrapper: json['RAINMAKER-PGR'] == null
          ? null
          : ServiceDefinitionWrapper.fromJson(
              json['RAINMAKER-PGR'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PGRServiceDefinitionsImplToJson(
        _$PGRServiceDefinitionsImpl instance) =>
    <String, dynamic>{
      'RAINMAKER-PGR': instance.serviceDefinitionWrapper,
    };

_$ServiceDefinitionWrapperImpl _$$ServiceDefinitionWrapperImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceDefinitionWrapperImpl(
      definition: (json['ServiceDefs'] as List<dynamic>?)
              ?.map((e) => Definition.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ServiceDefinitionWrapperImplToJson(
        _$ServiceDefinitionWrapperImpl instance) =>
    <String, dynamic>{
      'ServiceDefs': instance.definition,
    };

_$DefinitionImpl _$$DefinitionImplFromJson(Map<String, dynamic> json) =>
    _$DefinitionImpl(
      serviceCode: json['serviceCode'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$DefinitionImplToJson(_$DefinitionImpl instance) =>
    <String, dynamic>{
      'serviceCode': instance.serviceCode,
      'name': instance.name,
    };
