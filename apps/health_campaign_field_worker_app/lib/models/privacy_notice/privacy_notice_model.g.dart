// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrivacyPolicyModel _$PrivacyPolicyModelFromJson(Map<String, dynamic> json) =>
    _PrivacyPolicyModel(
      header: json['header'] as String,
      module: json['module'] as String,
      active: json['active'] as bool?,
      contents: (json['contents'] as List<dynamic>?)
          ?.map((e) => ContentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PrivacyPolicyModelToJson(_PrivacyPolicyModel instance) =>
    <String, dynamic>{
      'header': instance.header,
      'module': instance.module,
      'active': instance.active,
      'contents': instance.contents,
    };

_ContentModel _$ContentModelFromJson(Map<String, dynamic> json) =>
    _ContentModel(
      header: json['header'] as String?,
      descriptions: (json['descriptions'] as List<dynamic>?)
          ?.map((e) => DescriptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContentModelToJson(_ContentModel instance) =>
    <String, dynamic>{
      'header': instance.header,
      'descriptions': instance.descriptions,
    };

_DescriptionModel _$DescriptionModelFromJson(Map<String, dynamic> json) =>
    _DescriptionModel(
      text: json['text'] as String?,
      type: json['type'] as String?,
      isBold: json['isBold'] as bool?,
      subDescriptions: (json['subDescriptions'] as List<dynamic>?)
          ?.map((e) => SubDescriptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DescriptionModelToJson(_DescriptionModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': instance.type,
      'isBold': instance.isBold,
      'subDescriptions': instance.subDescriptions,
    };

_SubDescriptionModel _$SubDescriptionModelFromJson(Map<String, dynamic> json) =>
    _SubDescriptionModel(
      text: json['text'] as String?,
      type: json['type'] as String?,
      isBold: json['isBold'] as bool?,
      isSpaceRequired: json['isSpaceRequired'] as bool?,
    );

Map<String, dynamic> _$SubDescriptionModelToJson(
  _SubDescriptionModel instance,
) => <String, dynamic>{
  'text': instance.text,
  'type': instance.type,
  'isBold': instance.isBold,
  'isSpaceRequired': instance.isSpaceRequired,
};
