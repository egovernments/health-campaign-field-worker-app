// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pgr_service_defenitions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PGRServiceDefinitions _$PGRServiceDefinitionsFromJson(
  Map<String, dynamic> json,
) => _PGRServiceDefinitions(
  serviceDefinitionWrapper: json['RAINMAKER-PGR'] == null
      ? null
      : ServiceDefinitionWrapper.fromJson(
          json['RAINMAKER-PGR'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$PGRServiceDefinitionsToJson(
  _PGRServiceDefinitions instance,
) => <String, dynamic>{'RAINMAKER-PGR': instance.serviceDefinitionWrapper};

_ServiceDefinitionWrapper _$ServiceDefinitionWrapperFromJson(
  Map<String, dynamic> json,
) => _ServiceDefinitionWrapper(
  definition:
      (json['ServiceDefs'] as List<dynamic>?)
          ?.map((e) => Definition.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ServiceDefinitionWrapperToJson(
  _ServiceDefinitionWrapper instance,
) => <String, dynamic>{'ServiceDefs': instance.definition};

_Definition _$DefinitionFromJson(Map<String, dynamic> json) => _Definition(
  serviceCode: json['serviceCode'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$DefinitionToJson(_Definition instance) =>
    <String, dynamic>{
      'serviceCode': instance.serviceCode,
      'name': instance.name,
    };
