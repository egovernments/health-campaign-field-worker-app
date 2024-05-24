// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_reasons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReferralReasonsWrapperModelImpl _$$ReferralReasonsWrapperModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReferralReasonsWrapperModelImpl(
      referralReasonList: (json['referralReasons'] as List<dynamic>?)
          ?.map((e) => ReferralReasonType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReferralReasonsWrapperModelImplToJson(
        _$ReferralReasonsWrapperModelImpl instance) =>
    <String, dynamic>{
      'referralReasons': instance.referralReasonList,
    };

_$ReferralReasonTypeImpl _$$ReferralReasonTypeImplFromJson(
        Map<String, dynamic> json) =>
    _$ReferralReasonTypeImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$ReferralReasonTypeImplToJson(
        _$ReferralReasonTypeImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'active': instance.active,
    };
