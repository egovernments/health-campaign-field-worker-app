// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'individual_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IndividualModel _$$_IndividualModelFromJson(Map<String, dynamic> json) =>
    _$_IndividualModel(
      additionalFields: json['additionalFields'] as String?,
      addressId: json['addressId'] as String?,
      auditDetails: json['auditDetails'] == null
          ? null
          : AuditDetailsModel.fromJson(
              json['auditDetails'] as Map<String, dynamic>),
      dateOfBirth: json['dateOfBirth'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      identifiers: (json['identifiers'] as List<dynamic>)
          .map((e) =>
              IndividualIdentifierModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      individualId: json['individualId'] as String?,
      isHead: json['isHead'] as bool? ?? false,
      givenName: json['givenName'] as String,
      familyName: json['familyName'] as String?,
      additionalName: json['additionalName'] as String?,
    );

Map<String, dynamic> _$$_IndividualModelToJson(_$_IndividualModel instance) =>
    <String, dynamic>{
      'additionalFields': instance.additionalFields,
      'addressId': instance.addressId,
      'auditDetails': instance.auditDetails?.toJson(),
      'dateOfBirth': instance.dateOfBirth,
      'gender': _$GenderEnumMap[instance.gender]!,
      'identifiers': instance.identifiers.map((e) => e.toJson()).toList(),
      'individualId': instance.individualId,
      'isHead': instance.isHead,
      'givenName': instance.givenName,
      'familyName': instance.familyName,
      'additionalName': instance.additionalName,
    };

const _$GenderEnumMap = {
  Gender.male: 'MALE',
  Gender.female: 'FEMALE',
  Gender.other: 'OTHER',
};

_$_IndividualIdentifierModel _$$_IndividualIdentifierModelFromJson(
        Map<String, dynamic> json) =>
    _$_IndividualIdentifierModel(
      type: $enumDecode(_$IndividualIdentifierTypeEnumMap, json['type']),
      identifierId: json['identifierId'] as String,
    );

Map<String, dynamic> _$$_IndividualIdentifierModelToJson(
        _$_IndividualIdentifierModel instance) =>
    <String, dynamic>{
      'type': _$IndividualIdentifierTypeEnumMap[instance.type]!,
      'identifierId': instance.identifierId,
    };

const _$IndividualIdentifierTypeEnumMap = {
  IndividualIdentifierType.nationalId: 'NATIONAL_ID',
  IndividualIdentifierType.taxId: 'TAX_ID',
  IndividualIdentifierType.systemGenerated: 'SYSTEM_GENERATED',
};
