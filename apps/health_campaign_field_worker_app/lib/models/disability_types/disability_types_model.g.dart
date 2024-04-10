// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disability_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DisabilityTypesWrapperModelImpl _$$DisabilityTypesWrapperModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DisabilityTypesWrapperModelImpl(
      disabilityTypesList: (json['disabilityTypes'] as List<dynamic>?)
          ?.map((e) => DisabilityTypes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DisabilityTypesWrapperModelImplToJson(
        _$DisabilityTypesWrapperModelImpl instance) =>
    <String, dynamic>{
      'disabilityTypes': instance.disabilityTypesList,
    };

_$DisabilityTypesImpl _$$DisabilityTypesImplFromJson(
        Map<String, dynamic> json) =>
    _$DisabilityTypesImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$DisabilityTypesImplToJson(
        _$DisabilityTypesImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'active': instance.active,
    };
