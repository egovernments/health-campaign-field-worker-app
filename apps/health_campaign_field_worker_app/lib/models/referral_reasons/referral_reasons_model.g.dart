// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_reasons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReferralReasonsWrapperModel _$$_ReferralReasonsWrapperModelFromJson(
        Map<String, dynamic> json) =>
    _$_ReferralReasonsWrapperModel(
      referralReasonList: (json['referralReasons'] as List<dynamic>?)
          ?.map((e) => ReferralReasonType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ReferralReasonsWrapperModelToJson(
        _$_ReferralReasonsWrapperModel instance) =>
    <String, dynamic>{
      'referralReasons': instance.referralReasonList,
    };

_$_ReferralReasonType _$$_ReferralReasonTypeFromJson(
        Map<String, dynamic> json) =>
    _$_ReferralReasonType(
      code: json['code'] as String,
      name: json['name'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$_ReferralReasonTypeToJson(
        _$_ReferralReasonType instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'active': instance.active,
    };
