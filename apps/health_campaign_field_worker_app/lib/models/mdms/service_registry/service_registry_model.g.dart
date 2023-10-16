// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_registry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceRegistryPrimaryWrapperModel
    _$$_ServiceRegistryPrimaryWrapperModelFromJson(Map<String, dynamic> json) =>
        _$_ServiceRegistryPrimaryWrapperModel(
          serviceRegistry: json['HCM-SERVICE-REGISTRY'] == null
              ? null
              : ServiceRegistrySecondaryWrapperModel.fromJson(
                  json['HCM-SERVICE-REGISTRY'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_ServiceRegistryPrimaryWrapperModelToJson(
        _$_ServiceRegistryPrimaryWrapperModel instance) =>
    <String, dynamic>{
      'HCM-SERVICE-REGISTRY': instance.serviceRegistry,
    };

_$_ServiceRegistrySecondaryWrapperModel
    _$$_ServiceRegistrySecondaryWrapperModelFromJson(
            Map<String, dynamic> json) =>
        _$_ServiceRegistrySecondaryWrapperModel(
          serviceRegistryList: (json['serviceRegistry'] as List<dynamic>?)
                  ?.map((e) =>
                      ServiceRegistryModel.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
        );

Map<String, dynamic> _$$_ServiceRegistrySecondaryWrapperModelToJson(
        _$_ServiceRegistrySecondaryWrapperModel instance) =>
    <String, dynamic>{
      'serviceRegistry': instance.serviceRegistryList,
    };

_$_ServiceRegistryModel _$$_ServiceRegistryModelFromJson(
        Map<String, dynamic> json) =>
    _$_ServiceRegistryModel(
      service: json['service'] as String,
      actions: (json['actions'] as List<dynamic>?)
              ?.map((e) => ActionsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ServiceRegistryModelToJson(
        _$_ServiceRegistryModel instance) =>
    <String, dynamic>{
      'service': instance.service,
      'actions': instance.actions,
    };

_$_ActionsModel _$$_ActionsModelFromJson(Map<String, dynamic> json) =>
    _$_ActionsModel(
      action: json['action'] as String,
      entityName: json['entityName'] as String,
      path: json['path'] as String,
    );

Map<String, dynamic> _$$_ActionsModelToJson(_$_ActionsModel instance) =>
    <String, dynamic>{
      'action': instance.action,
      'entityName': instance.entityName,
      'path': instance.path,
    };
