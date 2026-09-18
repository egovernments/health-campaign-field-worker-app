// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemplateConfigImpl _$$TemplateConfigImplFromJson(Map<String, dynamic> json) =>
    _$TemplateConfigImpl(
      type: json['type'] as String,
      label: json['label'] as String,
      description: json['description'] as String?,
      order: (json['order'] as num).toInt(),
      properties: (json['properties'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, TemplateProperty.fromJson(e as Map<String, dynamic>)),
      ),
      features: (json['features'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ),
      navigateTo: _navigateToConfigOrNull(json['navigateTo']),
    );

Map<String, dynamic> _$$TemplateConfigImplToJson(
        _$TemplateConfigImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'label': instance.label,
      'description': instance.description,
      'order': instance.order,
      'properties': instance.properties,
      'features': instance.features,
      'navigateTo': instance.navigateTo,
    };

_$TemplatePropertyImpl _$$TemplatePropertyImplFromJson(
        Map<String, dynamic> json) =>
    _$TemplatePropertyImpl(
      type: json['type'] as String,
      format: json['format'] as String,
      label: json['label'] as String,
      value: json['value'],
      hidden: json['hidden'] as bool?,
      order: (json['order'] as num?)?.toInt(),
      readOnly: json['readOnly'] as bool?,
      autoEnable: json['autoEnable'] as bool?,
      validations: json['validations'] as List<dynamic>?,
      enums: (json['enums'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$TemplatePropertyImplToJson(
        _$TemplatePropertyImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'format': instance.format,
      'label': instance.label,
      'value': instance.value,
      'hidden': instance.hidden,
      'order': instance.order,
      'readOnly': instance.readOnly,
      'autoEnable': instance.autoEnable,
      'validations': instance.validations,
      'enums': instance.enums,
    };

_$NavigateToConfigImpl _$$NavigateToConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$NavigateToConfigImpl(
      type: json['type'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$NavigateToConfigImplToJson(
        _$NavigateToConfigImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
    };
