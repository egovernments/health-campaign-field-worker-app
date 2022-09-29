// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HouseholdRegistrationModel _$$_HouseholdRegistrationModelFromJson(
        Map<String, dynamic> json) =>
    _$_HouseholdRegistrationModel(
      additionalFields: json['additionalFields'] as String?,
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      administrativeUnit: json['administrativeUnit'] as String,
      apiMode: $enumDecodeNullable(_$ApiModeEnumMap, json['apiMode']),
      auditDetails: json['auditDetails'] == null
          ? null
          : AuditDetailsModel.fromJson(
              json['auditDetails'] as Map<String, dynamic>),
      campaignId: json['campaignId'] as String,
      clientReferenceId: json['clientReferenceId'] as String,
      dateOfRegistration: json['dateOfRegistration'] as int,
      householdId: json['householdId'] as String?,
      individuals: (json['individuals'] as List<dynamic>)
          .map((e) => IndividualModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      location: json['location'] == null
          ? null
          : LatLngModel.fromJson(json['location'] as Map<String, dynamic>),
      numberOfIndividuals: json['numberOfIndividuals'] as int,
      tenantId: json['tenantId'] as String,
      type: $enumDecode(_$SyncObjectModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_HouseholdRegistrationModelToJson(
        _$_HouseholdRegistrationModel instance) =>
    <String, dynamic>{
      'additionalFields': instance.additionalFields,
      'address': instance.address.toJson(),
      'administrativeUnit': instance.administrativeUnit,
      'apiMode': _$ApiModeEnumMap[instance.apiMode],
      'auditDetails': instance.auditDetails?.toJson(),
      'campaignId': instance.campaignId,
      'clientReferenceId': instance.clientReferenceId,
      'dateOfRegistration': instance.dateOfRegistration,
      'householdId': instance.householdId,
      'individuals': instance.individuals.map((e) => e.toJson()).toList(),
      'location': instance.location?.toJson(),
      'numberOfIndividuals': instance.numberOfIndividuals,
      'tenantId': instance.tenantId,
      'type': _$SyncObjectModelTypeEnumMap[instance.type]!,
    };

const _$ApiModeEnumMap = {
  ApiMode.create: 'CREATE',
  ApiMode.update: 'UPDATE',
  ApiMode.delete: 'DELETE',
};

const _$SyncObjectModelTypeEnumMap = {
  SyncObjectModelType.registration: 'REGISTRATION',
  SyncObjectModelType.delivery: 'DELIVERY',
};
