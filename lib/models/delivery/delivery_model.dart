// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_campaigns_flutter/models/dynamic_forms/additional_fields/additional_fields_model.dart';

part 'delivery_model.freezed.dart';
part 'delivery_model.g.dart';

@freezed
class DeliveryModel with _$DeliveryModel {
  @JsonSerializable(explicitToJson: true)
  const factory DeliveryModel({
    required String campaignId,
    required String registrationId,
    required List<DeliveryResourceModel> resources,

    /// [deliveryDate] in millisecondsSinceEpoch
    required int deliveryDate,
    required String deliveredBy,
    required DeliveryStatus status,
    required String clientReferenceId,
    required String tenantId,
    AdditionalFieldsModel? additionalFields,
  }) = _DeliveryModel;

  factory DeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryModelFromJson(json);
}

@freezed
class DeliveryResourceModel with _$DeliveryResourceModel {
  const factory DeliveryResourceModel({
    required String resourceId,
    required int quantityToBeDelivered,
    required int quantityDelivered,
    String? reasonIfNotDelivered,
    @Default(false) bool isDelivered,
  }) = _DeliveryResourceModel;

  factory DeliveryResourceModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryResourceModelFromJson(json);
}

enum DeliveryStatus {
  @JsonValue('DELIVERED')
  delivered,
  @JsonValue('PARTIAL')
  partial,
  @JsonValue('UNDELIVERED')
  undelivered,
}
