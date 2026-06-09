// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptoms_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SymptomsTypesPrimaryWrapperModel _$SymptomsTypesPrimaryWrapperModelFromJson(
  Map<String, dynamic> json,
) => _SymptomsTypesPrimaryWrapperModel(
  symptomsTypes: json['HCM-SYMPTOMS-TYPES'] == null
      ? null
      : SymptomsTypesSecondaryWrapperModel.fromJson(
          json['HCM-SYMPTOMS-TYPES'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$SymptomsTypesPrimaryWrapperModelToJson(
  _SymptomsTypesPrimaryWrapperModel instance,
) => <String, dynamic>{'HCM-SYMPTOMS-TYPES': instance.symptomsTypes};

_SymptomsTypesSecondaryWrapperModel
_$SymptomsTypesSecondaryWrapperModelFromJson(Map<String, dynamic> json) =>
    _SymptomsTypesSecondaryWrapperModel(
      symptomsTypeList: (json['symptomsTypes'] as List<dynamic>?)
          ?.map((e) => SymptomsType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SymptomsTypesSecondaryWrapperModelToJson(
  _SymptomsTypesSecondaryWrapperModel instance,
) => <String, dynamic>{'symptomsTypes': instance.symptomsTypeList};

_SymptomsType _$SymptomsTypeFromJson(Map<String, dynamic> json) =>
    _SymptomsType(
      code: json['code'] as String,
      name: json['name'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$SymptomsTypeToJson(_SymptomsType instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'active': instance.active,
    };
