// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectType _$$_ProjectTypeFromJson(Map<String, dynamic> json) =>
    _$_ProjectType(
      mandatoryWaitSinceLastCycleInDays:
          json['mandatoryWaitSinceLastCycleInDays'] as String?,
      deliveries: (json['deliveries'] as List<dynamic>?)
          ?.map((e) => DeliveryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProjectTypeToJson(_$_ProjectType instance) =>
    <String, dynamic>{
      'mandatoryWaitSinceLastCycleInDays':
          instance.mandatoryWaitSinceLastCycleInDays,
      'deliveries': instance.deliveries,
    };

_$_DeliveryModel _$$_DeliveryModelFromJson(Map<String, dynamic> json) =>
    _$_DeliveryModel(
      mandatoryWaitSinceLastDeliveryInDays:
          json['mandatoryWaitSinceLastDeliveryInDays'] as String?,
      productVariants: (json['ProductVariants'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      deliveryStrategy: json['deliveryStrategy'] as String?,
    );

Map<String, dynamic> _$$_DeliveryModelToJson(_$_DeliveryModel instance) =>
    <String, dynamic>{
      'mandatoryWaitSinceLastDeliveryInDays':
          instance.mandatoryWaitSinceLastDeliveryInDays,
      'ProductVariants': instance.productVariants,
      'deliveryStrategy': instance.deliveryStrategy,
    };
