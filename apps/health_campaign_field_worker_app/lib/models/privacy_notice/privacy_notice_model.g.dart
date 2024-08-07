// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrivacyPolicyImpl _$$PrivacyPolicyImplFromJson(Map<String, dynamic> json) =>
    _$PrivacyPolicyImpl(
      header: json['header'] as String,
      module: json['module'] as String,
      contents: (json['contents'] as List<dynamic>)
          .map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PrivacyPolicyImplToJson(_$PrivacyPolicyImpl instance) =>
    <String, dynamic>{
      'header': instance.header,
      'module': instance.module,
      'contents': instance.contents,
    };

_$ContentImpl _$$ContentImplFromJson(Map<String, dynamic> json) =>
    _$ContentImpl(
      header: json['header'] as String,
      descriptions: (json['descriptions'] as List<dynamic>)
          .map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ContentImplToJson(_$ContentImpl instance) =>
    <String, dynamic>{
      'header': instance.header,
      'descriptions': instance.descriptions,
    };

_$DescriptionImpl _$$DescriptionImplFromJson(Map<String, dynamic> json) =>
    _$DescriptionImpl(
      text: json['text'] as String,
      type: json['type'] as String?,
      isBold: json['isBold'] as bool,
      subDescriptions: (json['subDescriptions'] as List<dynamic>?)
          ?.map((e) => SubDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DescriptionImplToJson(_$DescriptionImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': instance.type,
      'isBold': instance.isBold,
      'subDescriptions': instance.subDescriptions,
    };

_$SubDescriptionImpl _$$SubDescriptionImplFromJson(Map<String, dynamic> json) =>
    _$SubDescriptionImpl(
      text: json['text'] as String,
      type: json['type'] as String?,
      isBold: json['isBold'] as bool,
      isSpaceRequired: json['isSpaceRequired'] as bool,
    );

Map<String, dynamic> _$$SubDescriptionImplToJson(
        _$SubDescriptionImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': instance.type,
      'isBold': instance.isBold,
      'isSpaceRequired': instance.isSpaceRequired,
    };
