// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptoms_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SymptomsTypesPrimaryWrapperModelImpl
    _$$SymptomsTypesPrimaryWrapperModelImplFromJson(
            Map<String, dynamic> json) =>
        _$SymptomsTypesPrimaryWrapperModelImpl(
          symptomsTypes: json['HCM-SYMPTOMS-TYPES'] == null
              ? null
              : SymptomsTypesSecondaryWrapperModel.fromJson(
                  json['HCM-SYMPTOMS-TYPES'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$SymptomsTypesPrimaryWrapperModelImplToJson(
        _$SymptomsTypesPrimaryWrapperModelImpl instance) =>
    <String, dynamic>{
      'HCM-SYMPTOMS-TYPES': instance.symptomsTypes,
    };

_$SymptomsTypesSecondaryWrapperModelImpl
    _$$SymptomsTypesSecondaryWrapperModelImplFromJson(
            Map<String, dynamic> json) =>
        _$SymptomsTypesSecondaryWrapperModelImpl(
          symptomsTypeList: (json['symptomsTypes'] as List<dynamic>?)
              ?.map((e) => SymptomsType.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$SymptomsTypesSecondaryWrapperModelImplToJson(
        _$SymptomsTypesSecondaryWrapperModelImpl instance) =>
    <String, dynamic>{
      'symptomsTypes': instance.symptomsTypeList,
    };

_$SymptomsTypeImpl _$$SymptomsTypeImplFromJson(Map<String, dynamic> json) =>
    _$SymptomsTypeImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$SymptomsTypeImplToJson(_$SymptomsTypeImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'active': instance.active,
    };
