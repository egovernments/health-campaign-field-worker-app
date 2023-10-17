// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptoms_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SymptomsTypesPrimaryWrapperModel
    _$$_SymptomsTypesPrimaryWrapperModelFromJson(Map<String, dynamic> json) =>
        _$_SymptomsTypesPrimaryWrapperModel(
          symptomsTypes: json['HCM-SYMPTOMS-TYPES'] == null
              ? null
              : SymptomsTypesSecondaryWrapperModel.fromJson(
                  json['HCM-SYMPTOMS-TYPES'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_SymptomsTypesPrimaryWrapperModelToJson(
        _$_SymptomsTypesPrimaryWrapperModel instance) =>
    <String, dynamic>{
      'HCM-SYMPTOMS-TYPES': instance.symptomsTypes,
    };

_$_SymptomsTypesSecondaryWrapperModel
    _$$_SymptomsTypesSecondaryWrapperModelFromJson(Map<String, dynamic> json) =>
        _$_SymptomsTypesSecondaryWrapperModel(
          symptomsTypeList: (json['symptomsTypes'] as List<dynamic>?)
              ?.map((e) => SymptomsType.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$_SymptomsTypesSecondaryWrapperModelToJson(
        _$_SymptomsTypesSecondaryWrapperModel instance) =>
    <String, dynamic>{
      'symptomsTypes': instance.symptomsTypeList,
    };

_$_SymptomsType _$$_SymptomsTypeFromJson(Map<String, dynamic> json) =>
    _$_SymptomsType(
      code: json['code'] as String,
      name: json['name'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$_SymptomsTypeToJson(_$_SymptomsType instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'active': instance.active,
    };
