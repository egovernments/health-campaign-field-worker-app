// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeliveryModel _$$_DeliveryModelFromJson(Map<String, dynamic> json) =>
    _$_DeliveryModel(
      campaignId: json['campaignId'] as String,
      registrationId: json['registrationId'] as String,
      mode: $enumDecodeNullable(_$SyncOperationModeEnumMap, json['mode']),
      clientReferenceId: json['clientReferenceId'] as String,
      resources: (json['resources'] as List<dynamic>)
          .map((e) => DeliveryResourceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      deliveryDate: json['deliveryDate'] as int,
      deliveredBy: json['deliveredBy'] as String,
      status: $enumDecode(_$DeliveryStatusEnumMap, json['status']),
      tenantId: json['tenantId'] as String,
      additionalFields: json['additionalFields'] == null
          ? null
          : AdditionalFieldsModel.fromJson(
              json['additionalFields'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DeliveryModelToJson(_$_DeliveryModel instance) =>
    <String, dynamic>{
      'campaignId': instance.campaignId,
      'registrationId': instance.registrationId,
      'mode': _$SyncOperationModeEnumMap[instance.mode],
      'clientReferenceId': instance.clientReferenceId,
      'resources': instance.resources.map((e) => e.toJson()).toList(),
      'deliveryDate': instance.deliveryDate,
      'deliveredBy': instance.deliveredBy,
      'status': _$DeliveryStatusEnumMap[instance.status]!,
      'tenantId': instance.tenantId,
      'additionalFields': instance.additionalFields?.toJson(),
    };

const _$SyncOperationModeEnumMap = {
  SyncOperationMode.create: 'CREATE',
  SyncOperationMode.update: 'UPDATE',
  SyncOperationMode.delete: 'DELETE',
};

const _$DeliveryStatusEnumMap = {
  DeliveryStatus.delivered: 'DELIVERED',
  DeliveryStatus.partial: 'PARTIAL',
  DeliveryStatus.undelivered: 'UNDELIVERED',
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
