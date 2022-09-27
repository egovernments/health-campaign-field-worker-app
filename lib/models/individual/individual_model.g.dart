// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'individual_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IndividualModel _$$_IndividualModelFromJson(Map<String, dynamic> json) =>
    _$_IndividualModel(
      name: json['name'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      isHead: json['isHead'] as bool? ?? false,
      identifiers: (json['identifiers'] as List<dynamic>)
          .map((e) =>
              IndividualIdentifierModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      additionalFields: json['additionalFields'] == null
          ? null
          : AdditionalFieldsModel.fromJson(
              json['additionalFields'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_IndividualModelToJson(_$_IndividualModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dateOfBirth': instance.dateOfBirth,
      'gender': _$GenderEnumMap[instance.gender]!,
      'isHead': instance.isHead,
      'identifiers': instance.identifiers.map((e) => e.toJson()).toList(),
      'additionalFields': instance.additionalFields?.toJson(),
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
