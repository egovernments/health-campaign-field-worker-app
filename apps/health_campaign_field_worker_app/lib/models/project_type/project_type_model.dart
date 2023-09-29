import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_type_model.freezed.dart';
part 'project_type_model.g.dart';

@freezed
class ProjectTypePrimaryWrapper with _$ProjectTypePrimaryWrapper {
  const factory ProjectTypePrimaryWrapper({
    @JsonKey(name: "HCM-PROJECT-TYPES")
        final ProjectTypesSecondaryModel? projectTypeWrapper,
  }) = _ProjectTypePrimaryWrapper;

  factory ProjectTypePrimaryWrapper.fromJson(Map<String, dynamic> json) =>
      _$ProjectTypePrimaryWrapperFromJson(json);
}

@freezed
class ProjectTypesSecondaryModel with _$ProjectTypesSecondaryModel {
  const factory ProjectTypesSecondaryModel({
    @JsonKey(name: 'projectTypes') @Default([]) List<ProjectType> projectTypes,
  }) = _ProjectTypesSecondaryModel;

  factory ProjectTypesSecondaryModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectTypesSecondaryModelFromJson(json);
}

@freezed
class ProjectType with _$ProjectType {
  const factory ProjectType({
    required String id,
    required String name,
    required String code,
    required String group,
    required String beneficiaryType,
    String? observationStrategy,
    List<Cycle>? cycles,
  }) = _ProjectType;

  factory ProjectType.fromJson(Map<String, dynamic> json) =>
      _$ProjectTypeFromJson(json);
}

@freezed
class Cycle with _$Cycle {
  const factory Cycle({
    String? mandatoryWaitSinceLastCycleInDays,
    int? startDate,
    int? endDate,
    @JsonKey(name: 'deliveries') List<DeliveryModel>? deliveries,
  }) = _Cycle;
  factory Cycle.fromJson(Map<String, dynamic> json) => _$CycleFromJson(json);
}

@freezed
class DeliveryModel with _$DeliveryModel {
  const factory DeliveryModel({
    @JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
        String? mandatoryWaitSinceLastDeliveryInDays,
    @JsonKey(name: 'ProductVariants')
        List<ProductVariantsModel>? productVariants,
    @JsonKey(name: 'deliveryStrategy')
        String? deliveryStrategy,
  }) = _DeliveryModel;

  factory DeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryModelFromJson(json);
}

@freezed
class ProductVariantsModel with _$ProductVariantsModel {
  const factory ProductVariantsModel({
    String? productVariantId,
    int? quantity,
  }) = _ProductVariantsModel;
  factory ProductVariantsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantsModelFromJson(json);
}
