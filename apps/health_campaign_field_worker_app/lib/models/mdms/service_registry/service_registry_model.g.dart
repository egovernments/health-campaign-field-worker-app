// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_registry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceRegistryPrimaryWrapperModelImpl
    _$$ServiceRegistryPrimaryWrapperModelImplFromJson(
            Map<String, dynamic> json) =>
        _$ServiceRegistryPrimaryWrapperModelImpl(
          serviceRegistry: json['HCM-SERVICE-REGISTRY'] == null
              ? null
              : ServiceRegistrySecondaryWrapperModel.fromJson(
                  json['HCM-SERVICE-REGISTRY'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ServiceRegistryPrimaryWrapperModelImplToJson(
        _$ServiceRegistryPrimaryWrapperModelImpl instance) =>
    <String, dynamic>{
      'HCM-SERVICE-REGISTRY': instance.serviceRegistry,
    };

_$ServiceRegistrySecondaryWrapperModelImpl
    _$$ServiceRegistrySecondaryWrapperModelImplFromJson(
            Map<String, dynamic> json) =>
        _$ServiceRegistrySecondaryWrapperModelImpl(
          serviceRegistryList: (json['serviceRegistry'] as List<dynamic>?)
                  ?.map((e) =>
                      ServiceRegistryModel.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
        );

Map<String, dynamic> _$$ServiceRegistrySecondaryWrapperModelImplToJson(
        _$ServiceRegistrySecondaryWrapperModelImpl instance) =>
    <String, dynamic>{
      'serviceRegistry': instance.serviceRegistryList,
    };

_$ServiceRegistryModelImpl _$$ServiceRegistryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceRegistryModelImpl(
      service: json['service'] as String,
      actions: (json['actions'] as List<dynamic>?)
              ?.map((e) => ActionsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ServiceRegistryModelImplToJson(
        _$ServiceRegistryModelImpl instance) =>
    <String, dynamic>{
      'service': instance.service,
      'actions': instance.actions,
    };

_$ActionsModelImpl _$$ActionsModelImplFromJson(Map<String, dynamic> json) =>
    _$ActionsModelImpl(
      action: json['action'] as String,
      entityName: json['entityName'] as String,
      path: json['path'] as String,
    );

Map<String, dynamic> _$$ActionsModelImplToJson(_$ActionsModelImpl instance) =>
    <String, dynamic>{
      'action': instance.action,
      'entityName': instance.entityName,
      'path': instance.path,
    };
