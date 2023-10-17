// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectTypePrimaryWrapper _$$_ProjectTypePrimaryWrapperFromJson(
        Map<String, dynamic> json) =>
    _$_ProjectTypePrimaryWrapper(
      projectTypeWrapper: json['HCM-PROJECT-TYPES'] == null
          ? null
          : ProjectTypesSecondaryModel.fromJson(
              json['HCM-PROJECT-TYPES'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProjectTypePrimaryWrapperToJson(
        _$_ProjectTypePrimaryWrapper instance) =>
    <String, dynamic>{
      'HCM-PROJECT-TYPES': instance.projectTypeWrapper,
    };

_$_ProjectTypesSecondaryModel _$$_ProjectTypesSecondaryModelFromJson(
        Map<String, dynamic> json) =>
    _$_ProjectTypesSecondaryModel(
      projectTypes: (json['projectTypes'] as List<dynamic>?)
              ?.map((e) => ProjectType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ProjectTypesSecondaryModelToJson(
        _$_ProjectTypesSecondaryModel instance) =>
    <String, dynamic>{
      'projectTypes': instance.projectTypes,
    };

_$_ProjectType _$$_ProjectTypeFromJson(Map<String, dynamic> json) =>
    _$_ProjectType(
      id: json['id'] as String,
      code: json['code'] as String,
      name: json['name'] as String,
      group: json['group'] as String,
      beneficiaryType: json['beneficiaryType'] as String,
      observationStrategy: json['observationStrategy'] as String?,
      cycles: (json['cycles'] as List<dynamic>?)
          ?.map((e) => Cycle.fromJson(e as Map<String, dynamic>))
          .toList(),
      resources: (json['resources'] as List<dynamic>?)
          ?.map((e) => ProductVariantsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      validMinAge: json['validMinAge'] as int?,
      validMaxAge: json['validMaxAge'] as int?,
    );

Map<String, dynamic> _$$_ProjectTypeToJson(_$_ProjectType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'group': instance.group,
      'beneficiaryType': instance.beneficiaryType,
      'observationStrategy': instance.observationStrategy,
      'cycles': instance.cycles,
      'resources': instance.resources,
      'validMinAge': instance.validMinAge,
      'validMaxAge': instance.validMaxAge,
    };

_$_Cycle _$$_CycleFromJson(Map<String, dynamic> json) => _$_Cycle(
      mandatoryWaitSinceLastCycleInDays:
          json['mandatoryWaitSinceLastCycleInDays'] as String?,
      startDate: json['startDate'] as int?,
      endDate: json['endDate'] as int?,
      id: json['id'] as int? ?? 0,
      deliveries: (json['deliveries'] as List<dynamic>?)
          ?.map((e) => DeliveryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CycleToJson(_$_Cycle instance) => <String, dynamic>{
      'mandatoryWaitSinceLastCycleInDays':
          instance.mandatoryWaitSinceLastCycleInDays,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'id': instance.id,
      'deliveries': instance.deliveries,
    };

_$_DeliveryModel _$$_DeliveryModelFromJson(Map<String, dynamic> json) =>
    _$_DeliveryModel(
      doseCriteria: (json['doseCriteria'] as List<dynamic>?)
          ?.map((e) => DoseCriteriaModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      mandatoryWaitSinceLastDeliveryInDays:
          json['mandatoryWaitSinceLastDeliveryInDays'] as String?,
      deliveryStrategy: json['deliveryStrategy'] as String?,
      id: json['id'] as int? ?? 0,
    );

Map<String, dynamic> _$$_DeliveryModelToJson(_$_DeliveryModel instance) =>
    <String, dynamic>{
      'doseCriteria': instance.doseCriteria,
      'mandatoryWaitSinceLastDeliveryInDays':
          instance.mandatoryWaitSinceLastDeliveryInDays,
      'deliveryStrategy': instance.deliveryStrategy,
      'id': instance.id,
    };

_$_DoseCriteriaModel _$$_DoseCriteriaModelFromJson(Map<String, dynamic> json) =>
    _$_DoseCriteriaModel(
      condition: json['condition'] as String?,
      productVariants: (json['ProductVariants'] as List<dynamic>?)
          ?.map((e) => ProductVariantsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DoseCriteriaModelToJson(
        _$_DoseCriteriaModel instance) =>
    <String, dynamic>{
      'condition': instance.condition,
      'ProductVariants': instance.productVariants,
    };

_$_ProductVariantsModel _$$_ProductVariantsModelFromJson(
        Map<String, dynamic> json) =>
    _$_ProductVariantsModel(
      productVariantId: json['productVariantId'] as String?,
      quantity: json['quantity'] as int?,
    );

Map<String, dynamic> _$$_ProductVariantsModelToJson(
        _$_ProductVariantsModel instance) =>
    <String, dynamic>{
      'productVariantId': instance.productVariantId,
      'quantity': instance.quantity,
    };
