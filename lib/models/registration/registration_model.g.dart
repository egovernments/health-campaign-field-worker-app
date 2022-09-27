// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegistrationModel _$$_RegistrationModelFromJson(Map<String, dynamic> json) =>
    _$_RegistrationModel(
      campaignId: json['campaignId'] as String,
      tenantId: json['tenantId'] as String,
      clientReferenceId: json['clientReferenceId'] as String,
      noOfIndividuals: json['noOfIndividuals'] as int,
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      dateOfRegistration: json['dateOfRegistration'] as String,
      location: json['location'] == null
          ? null
          : LatLngModel.fromJson(json['location'] as Map<String, dynamic>),
      administrativeUnit: json['administrativeUnit'] as String,
      individuals: (json['individuals'] as List<dynamic>)
          .map((e) => IndividualModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      additionalFields: json['additionalFields'] == null
          ? null
          : AdditionalFieldsModel.fromJson(
              json['additionalFields'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RegistrationModelToJson(
        _$_RegistrationModel instance) =>
    <String, dynamic>{
      'campaignId': instance.campaignId,
      'tenantId': instance.tenantId,
      'clientReferenceId': instance.clientReferenceId,
      'noOfIndividuals': instance.noOfIndividuals,
      'address': instance.address.toJson(),
      'dateOfRegistration': instance.dateOfRegistration,
      'location': instance.location?.toJson(),
      'administrativeUnit': instance.administrativeUnit,
      'individuals': instance.individuals.map((e) => e.toJson()).toList(),
      'additionalFields': instance.additionalFields?.toJson(),
    };
