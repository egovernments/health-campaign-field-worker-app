// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SchemaObject _$SchemaObjectFromJson(Map<String, dynamic> json) =>
    _SchemaObject(
      name: json['name'] as String,
      version: (json['version'] as num).toInt(),
      summary: json['summary'] as bool? ?? false,
      summaryDetails: json['summaryDetails'] == null
          ? null
          : SummaryItem.fromJson(
              json['summaryDetails'] as Map<String, dynamic>),
      pages: (json['pages'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, PropertySchema.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      showAlertPopUp: _showAlertOrNull(json['showAlertPopUp']),
      actionSchema: (json['actionSchema'] as List<dynamic>?)
          ?.map((e) => ActionSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SchemaObjectToJson(_SchemaObject instance) =>
    <String, dynamic>{
      'name': instance.name,
      'version': instance.version,
      'summary': instance.summary,
      if (instance.summaryDetails?.toJson() case final value?)
        'summaryDetails': value,
      'pages': instance.pages.map((k, e) => MapEntry(k, e.toJson())),
      if (instance.showAlertPopUp?.toJson() case final value?)
        'showAlertPopUp': value,
      if (instance.actionSchema?.map((e) => e.toJson()).toList()
          case final value?)
        'actionSchema': value,
    };

_SummaryItem _$SummaryItemFromJson(Map<String, dynamic> json) => _SummaryItem(
      heading: json['heading'] as String,
      description: json['description'] as String?,
      show: json['show'] as bool? ?? false,
    );

Map<String, dynamic> _$SummaryItemToJson(_SummaryItem instance) =>
    <String, dynamic>{
      'heading': instance.heading,
      'description': instance.description,
      'show': instance.show,
    };

_ActionSchema _$ActionSchemaFromJson(Map<String, dynamic> json) =>
    _ActionSchema(
      name: json['name'] as String,
      buttonName: json['buttonName'] as String,
      buttonType:
          $enumDecodeNullable(_$ButtonTypeEnumMap, json['buttonType']) ??
              ButtonType.elevated,
      actionItems: (json['actionItems'] as List<dynamic>)
          .map((e) => ActionItemSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActionSchemaToJson(_ActionSchema instance) =>
    <String, dynamic>{
      'name': instance.name,
      'buttonName': instance.buttonName,
      'buttonType': _$ButtonTypeEnumMap[instance.buttonType]!,
      'actionItems': instance.actionItems.map((e) => e.toJson()).toList(),
    };

const _$ButtonTypeEnumMap = {
  ButtonType.outlined: 'outlined',
  ButtonType.text: 'text',
  ButtonType.elevated: 'elevated',
};

_ActionItemSchema _$ActionItemSchemaFromJson(Map<String, dynamic> json) =>
    _ActionItemSchema(
      type: $enumDecode(_$ActionTypeEnumMap, json['type']),
      urlSchema: json['urlSchema'] == null
          ? null
          : UrlSchema.fromJson(json['urlSchema'] as Map<String, dynamic>),
      routingSchema: json['routingSchema'] == null
          ? null
          : RoutingSchema.fromJson(
              json['routingSchema'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ActionItemSchemaToJson(_ActionItemSchema instance) =>
    <String, dynamic>{
      'type': _$ActionTypeEnumMap[instance.type]!,
      if (instance.urlSchema?.toJson() case final value?) 'urlSchema': value,
      if (instance.routingSchema?.toJson() case final value?)
        'routingSchema': value,
    };

const _$ActionTypeEnumMap = {
  ActionType.api: 'api',
  ActionType.reset: 'reset',
  ActionType.navigate: 'navigate',
};

_UrlSchema _$UrlSchemaFromJson(Map<String, dynamic> json) => _UrlSchema(
      method: json['method'] as String,
      urlSchema: json['urlSchema'] as String,
    );

Map<String, dynamic> _$UrlSchemaToJson(_UrlSchema instance) =>
    <String, dynamic>{
      'method': instance.method,
      'urlSchema': instance.urlSchema,
    };

_RoutingSchema _$RoutingSchemaFromJson(Map<String, dynamic> json) =>
    _RoutingSchema(
      destination: json['destination'] as String,
      propertySchema: json['propertySchema'] == null
          ? null
          : PropertySchema.fromJson(
              json['propertySchema'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RoutingSchemaToJson(_RoutingSchema instance) =>
    <String, dynamic>{
      'destination': instance.destination,
      'propertySchema': instance.propertySchema?.toJson(),
    };
