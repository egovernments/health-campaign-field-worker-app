// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrivacyPolicyModelImpl _$$PrivacyPolicyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PrivacyPolicyModelImpl(
      header: json['header'] as String,
      module: json['module'] as String,
      active: json['active'] as bool?,
      contents: (json['contents'] as List<dynamic>?)
          ?.map((e) => ContentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PrivacyPolicyModelImplToJson(
        _$PrivacyPolicyModelImpl instance) =>
    <String, dynamic>{
      'header': instance.header,
      'module': instance.module,
      'active': instance.active,
      'contents': instance.contents,
    };

_$ContentModelImpl _$$ContentModelImplFromJson(Map<String, dynamic> json) =>
    _$ContentModelImpl(
      header: json['header'] as String?,
      descriptions: (json['descriptions'] as List<dynamic>?)
          ?.map((e) => DescriptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ContentModelImplToJson(_$ContentModelImpl instance) =>
    <String, dynamic>{
      'header': instance.header,
      'descriptions': instance.descriptions,
    };

_$DescriptionModelImpl _$$DescriptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DescriptionModelImpl(
      text: json['text'] as String?,
      type: json['type'] as String?,
      isBold: json['isBold'] as bool?,
      subDescriptions: (json['subDescriptions'] as List<dynamic>?)
          ?.map((e) => SubDescriptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DescriptionModelImplToJson(
        _$DescriptionModelImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': instance.type,
      'isBold': instance.isBold,
      'subDescriptions': instance.subDescriptions,
    };

_$SubDescriptionModelImpl _$$SubDescriptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubDescriptionModelImpl(
      text: json['text'] as String?,
      type: json['type'] as String?,
      isBold: json['isBold'] as bool?,
      isSpaceRequired: json['isSpaceRequired'] as bool?,
    );

Map<String, dynamic> _$$SubDescriptionModelImplToJson(
        _$SubDescriptionModelImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': instance.type,
      'isBold': instance.isBold,
      'isSpaceRequired': instance.isSpaceRequired,
    };
