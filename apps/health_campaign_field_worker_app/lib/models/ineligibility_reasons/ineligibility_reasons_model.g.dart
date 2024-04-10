// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ineligibility_reasons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IneligibilityReasonsWrapperModelImpl
    _$$IneligibilityReasonsWrapperModelImplFromJson(
            Map<String, dynamic> json) =>
        _$IneligibilityReasonsWrapperModelImpl(
          ineligibilityReasonsList: (json['ineligibilityReasons']
                  as List<dynamic>?)
              ?.map((e) =>
                  IneligibilityReasonType.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$IneligibilityReasonsWrapperModelImplToJson(
        _$IneligibilityReasonsWrapperModelImpl instance) =>
    <String, dynamic>{
      'ineligibilityReasons': instance.ineligibilityReasonsList,
    };

_$IneligibilityReasonTypeImpl _$$IneligibilityReasonTypeImplFromJson(
        Map<String, dynamic> json) =>
    _$IneligibilityReasonTypeImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$IneligibilityReasonTypeImplToJson(
        _$IneligibilityReasonTypeImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'active': instance.active,
    };
