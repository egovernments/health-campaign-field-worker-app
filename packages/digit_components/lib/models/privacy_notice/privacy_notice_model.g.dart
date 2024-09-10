// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrivacyNoticeModelImpl _$$PrivacyNoticeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PrivacyNoticeModelImpl(
      header: json['header'] as String,
      module: json['module'] as String,
      active: json['active'] as bool?,
      contents: (json['contents'] as List<dynamic>?)
          ?.map((e) => ContentNoticeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PrivacyNoticeModelImplToJson(
        _$PrivacyNoticeModelImpl instance) =>
    <String, dynamic>{
      'header': instance.header,
      'module': instance.module,
      'active': instance.active,
      'contents': instance.contents,
    };

_$ContentNoticeModelImpl _$$ContentNoticeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentNoticeModelImpl(
      header: json['header'] as String?,
      descriptions: (json['descriptions'] as List<dynamic>?)
          ?.map(
              (e) => DescriptionNoticeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ContentNoticeModelImplToJson(
        _$ContentNoticeModelImpl instance) =>
    <String, dynamic>{
      'header': instance.header,
      'descriptions': instance.descriptions,
    };

_$DescriptionNoticeModelImpl _$$DescriptionNoticeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DescriptionNoticeModelImpl(
      text: json['text'] as String?,
      type: json['type'] as String?,
      isBold: json['isBold'] as bool?,
      subDescriptions: (json['subDescriptions'] as List<dynamic>?)
          ?.map((e) =>
              SubDescriptionNoticeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DescriptionNoticeModelImplToJson(
        _$DescriptionNoticeModelImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': instance.type,
      'isBold': instance.isBold,
      'subDescriptions': instance.subDescriptions,
    };

_$SubDescriptionNoticeModelImpl _$$SubDescriptionNoticeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubDescriptionNoticeModelImpl(
      text: json['text'] as String?,
      type: json['type'] as String?,
      isBold: json['isBold'] as bool?,
      isSpaceRequired: json['isSpaceRequired'] as bool?,
    );

Map<String, dynamic> _$$SubDescriptionNoticeModelImplToJson(
        _$SubDescriptionNoticeModelImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': instance.type,
      'isBold': instance.isBold,
      'isSpaceRequired': instance.isSpaceRequired,
    };
