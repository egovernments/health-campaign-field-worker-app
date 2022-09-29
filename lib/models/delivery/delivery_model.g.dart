// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeliveryModel _$$_DeliveryModelFromJson(Map<String, dynamic> json) =>
    _$_DeliveryModel(
      additionalFields: json['additionalFields'] as String?,
      campaignId: json['campaignId'] as String,
      clientReferenceId: json['clientReferenceId'] as String,
      deliveryDate: json['deliveryDate'] as int,
      deliveredBy: json['deliveredBy'] as String,
      mode: $enumDecodeNullable(_$ApiModeEnumMap, json['mode']),
      registrationId: json['registrationId'] as String,
      resources: (json['resources'] as List<dynamic>)
          .map((e) => DeliveryResourceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: $enumDecode(_$DeliveryStatusEnumMap, json['status']),
      tenantId: json['tenantId'] as String,
      type: $enumDecode(_$SyncObjectModelTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_DeliveryModelToJson(_$_DeliveryModel instance) =>
    <String, dynamic>{
      'additionalFields': instance.additionalFields,
      'campaignId': instance.campaignId,
      'clientReferenceId': instance.clientReferenceId,
      'deliveryDate': instance.deliveryDate,
      'deliveredBy': instance.deliveredBy,
      'mode': _$ApiModeEnumMap[instance.mode],
      'registrationId': instance.registrationId,
      'resources': instance.resources.map((e) => e.toJson()).toList(),
      'status': _$DeliveryStatusEnumMap[instance.status]!,
      'tenantId': instance.tenantId,
      'type': _$SyncObjectModelTypeEnumMap[instance.type]!,
    };

const _$ApiModeEnumMap = {
  ApiMode.create: 'CREATE',
  ApiMode.update: 'UPDATE',
  ApiMode.delete: 'DELETE',
};

const _$DeliveryStatusEnumMap = {
  DeliveryStatus.delivered: 'DELIVERED',
  DeliveryStatus.partial: 'PARTIAL',
  DeliveryStatus.undelivered: 'UNDELIVERED',
};

const _$SyncObjectModelTypeEnumMap = {
  SyncObjectModelType.registration: 'REGISTRATION',
  SyncObjectModelType.delivery: 'DELIVERY',
};

_$_DeliveryResourceModel _$$_DeliveryResourceModelFromJson(
        Map<String, dynamic> json) =>
    _$_DeliveryResourceModel(
      resourceId: json['resourceId'] as String,
      quantityToBeDelivered: json['quantityToBeDelivered'] as int,
      quantityDelivered: json['quantityDelivered'] as int,
      reasonIfNotDelivered: json['reasonIfNotDelivered'] as String?,
      isDelivered: json['isDelivered'] as bool? ?? false,
    );

Map<String, dynamic> _$$_DeliveryResourceModelToJson(
        _$_DeliveryResourceModel instance) =>
    <String, dynamic>{
      'resourceId': instance.resourceId,
      'quantityToBeDelivered': instance.quantityToBeDelivered,
      'quantityDelivered': instance.quantityDelivered,
      'reasonIfNotDelivered': instance.reasonIfNotDelivered,
      'isDelivered': instance.isDelivered,
    };
