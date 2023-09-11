import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_type_model.freezed.dart';
part 'project_type_model.g.dart';

@freezed
class ProjectType with _$ProjectType {
  const factory ProjectType({
    @JsonKey(name: 'mandatoryWaitSinceLastCycleInDays')
    String? mandatoryWaitSinceLastCycleInDays,
    @JsonKey(name: 'deliveries') List<DeliveryModel>? deliveries,
  }) = _ProjectType;

  factory ProjectType.fromJson(Map<String, dynamic> json) =>
      _$ProjectTypeFromJson(json);
}

@freezed
class DeliveryModel with _$DeliveryModel {
  const factory DeliveryModel({
    @JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
    String? mandatoryWaitSinceLastDeliveryInDays,
    @JsonKey(name: 'ProductVariants') Map<String, String>? productVariants,
    @JsonKey(name: 'deliveryStrategy') String? deliveryStrategy,
  }) = _DeliveryModel;

  factory DeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryModelFromJson(json);
}
