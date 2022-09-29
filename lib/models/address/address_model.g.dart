// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddressModel _$$_AddressModelFromJson(Map<String, dynamic> json) =>
    _$_AddressModel(
      addressId: json['addressId'] as String?,
      addressText: json['addressText'] as String,
    );

Map<String, dynamic> _$$_AddressModelToJson(_$_AddressModel instance) =>
    <String, dynamic>{
      'addressId': instance.addressId,
      'addressText': instance.addressText,
    };

_$_LatLngModel _$$_LatLngModelFromJson(Map<String, dynamic> json) =>
    _$_LatLngModel(
      latitude: json['latitude'] as num,
      longitude: json['longitude'] as num,
      accuracy: json['accuracy'] as num? ?? 0,
    );

Map<String, dynamic> _$$_LatLngModelToJson(_$_LatLngModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'accuracy': instance.accuracy,
    };
