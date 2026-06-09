// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_registry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceRegistryPrimaryWrapperModel
_$ServiceRegistryPrimaryWrapperModelFromJson(Map<String, dynamic> json) =>
    _ServiceRegistryPrimaryWrapperModel(
      serviceRegistry: json['HCM-SERVICE-REGISTRY'] == null
          ? null
          : ServiceRegistrySecondaryWrapperModel.fromJson(
              json['HCM-SERVICE-REGISTRY'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ServiceRegistryPrimaryWrapperModelToJson(
  _ServiceRegistryPrimaryWrapperModel instance,
) => <String, dynamic>{'HCM-SERVICE-REGISTRY': instance.serviceRegistry};

_ServiceRegistrySecondaryWrapperModel
_$ServiceRegistrySecondaryWrapperModelFromJson(Map<String, dynamic> json) =>
    _ServiceRegistrySecondaryWrapperModel(
      serviceRegistryList:
          (json['serviceRegistry'] as List<dynamic>?)
              ?.map(
                (e) => ServiceRegistryModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ServiceRegistrySecondaryWrapperModelToJson(
  _ServiceRegistrySecondaryWrapperModel instance,
) => <String, dynamic>{'serviceRegistry': instance.serviceRegistryList};

_ServiceRegistryModel _$ServiceRegistryModelFromJson(
  Map<String, dynamic> json,
) => _ServiceRegistryModel(
  service: json['service'] as String,
  actions:
      (json['actions'] as List<dynamic>?)
          ?.map((e) => ActionsModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ServiceRegistryModelToJson(
  _ServiceRegistryModel instance,
) => <String, dynamic>{
  'service': instance.service,
  'actions': instance.actions,
};

_ActionsModel _$ActionsModelFromJson(Map<String, dynamic> json) =>
    _ActionsModel(
      action: json['action'] as String,
      entityName: json['entityName'] as String,
      path: json['path'] as String,
    );

Map<String, dynamic> _$ActionsModelToJson(_ActionsModel instance) =>
    <String, dynamic>{
      'action': instance.action,
      'entityName': instance.entityName,
      'path': instance.path,
    };
