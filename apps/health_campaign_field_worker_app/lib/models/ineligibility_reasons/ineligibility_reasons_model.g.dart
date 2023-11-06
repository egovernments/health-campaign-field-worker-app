// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ineligibility_reasons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IneligibilityReasonsWrapperModel
    _$$_IneligibilityReasonsWrapperModelFromJson(Map<String, dynamic> json) =>
        _$_IneligibilityReasonsWrapperModel(
          ineligibilityReasonsList: (json['ineligibilityReasons']
                  as List<dynamic>?)
              ?.map((e) =>
                  IneligibilityReasonType.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$_IneligibilityReasonsWrapperModelToJson(
        _$_IneligibilityReasonsWrapperModel instance) =>
    <String, dynamic>{
      'ineligibilityReasons': instance.ineligibilityReasonsList,
    };

_$_IneligibilityReasonType _$$_IneligibilityReasonTypeFromJson(
        Map<String, dynamic> json) =>
    _$_IneligibilityReasonType(
      code: json['code'] as String,
      name: json['name'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$_IneligibilityReasonTypeToJson(
        _$_IneligibilityReasonType instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'active': instance.active,
    };
