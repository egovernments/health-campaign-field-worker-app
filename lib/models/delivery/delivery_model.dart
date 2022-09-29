// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../sync/sync_model.dart';

part 'delivery_model.freezed.dart';
part 'delivery_model.g.dart';

@freezed
class DeliveryModel with _$DeliveryModel {
  @JsonSerializable(explicitToJson: true)
  const factory DeliveryModel({
    String? additionalFields,
    required String campaignId,
    required String clientReferenceId,

    /// [deliveryDate] in millisecondsSinceEpoch
    required int deliveryDate,
    required String deliveredBy,
    ApiMode? mode,
    required String registrationId,
    required List<DeliveryResourceModel> resources,
    required DeliveryStatus status,
    required String tenantId,
    required SyncObjectModelType type,
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
