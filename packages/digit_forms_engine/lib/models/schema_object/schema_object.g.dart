// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SchemaObjectImpl _$$SchemaObjectImplFromJson(Map<String, dynamic> json) =>
    _$SchemaObjectImpl(
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

Map<String, dynamic> _$$SchemaObjectImplToJson(_$SchemaObjectImpl instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'version': instance.version,
    'summary': instance.summary,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('summaryDetails', instance.summaryDetails?.toJson());
  val['pages'] = instance.pages.map((k, e) => MapEntry(k, e.toJson()));
  writeNotNull('showAlertPopUp', instance.showAlertPopUp?.toJson());
  writeNotNull(
      'actionSchema', instance.actionSchema?.map((e) => e.toJson()).toList());
  return val;
}

_$SummaryItemImpl _$$SummaryItemImplFromJson(Map<String, dynamic> json) =>
    _$SummaryItemImpl(
      heading: json['heading'] as String,
      description: json['description'] as String?,
      show: json['show'] as bool? ?? false,
    );

Map<String, dynamic> _$$SummaryItemImplToJson(_$SummaryItemImpl instance) =>
    <String, dynamic>{
      'heading': instance.heading,
      'description': instance.description,
      'show': instance.show,
    };

_$ActionSchemaImpl _$$ActionSchemaImplFromJson(Map<String, dynamic> json) =>
    _$ActionSchemaImpl(
      name: json['name'] as String,
      buttonName: json['buttonName'] as String,
      buttonType:
          $enumDecodeNullable(_$ButtonTypeEnumMap, json['buttonType']) ??
              ButtonType.elevated,
      actionItems: (json['actionItems'] as List<dynamic>)
          .map((e) => ActionItemSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ActionSchemaImplToJson(_$ActionSchemaImpl instance) =>
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

_$ShowAlertPopUpImpl _$$ShowAlertPopUpImplFromJson(Map<String, dynamic> json) =>
    _$ShowAlertPopUpImpl(
      title: json['title'] as String,
      description: json['description'] as String?,
      primaryActionLabel: json['primaryActionLabel'] as String,
      secondaryActionLabel: json['secondaryActionLabel'] as String,
    );

Map<String, dynamic> _$$ShowAlertPopUpImplToJson(
        _$ShowAlertPopUpImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'primaryActionLabel': instance.primaryActionLabel,
      'secondaryActionLabel': instance.secondaryActionLabel,
    };

_$ActionItemSchemaImpl _$$ActionItemSchemaImplFromJson(
        Map<String, dynamic> json) =>
    _$ActionItemSchemaImpl(
      type: $enumDecode(_$ActionTypeEnumMap, json['type']),
      urlSchema: json['urlSchema'] == null
          ? null
          : UrlSchema.fromJson(json['urlSchema'] as Map<String, dynamic>),
      routingSchema: json['routingSchema'] == null
          ? null
          : RoutingSchema.fromJson(
              json['routingSchema'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ActionItemSchemaImplToJson(
    _$ActionItemSchemaImpl instance) {
  final val = <String, dynamic>{
    'type': _$ActionTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('urlSchema', instance.urlSchema?.toJson());
  writeNotNull('routingSchema', instance.routingSchema?.toJson());
  return val;
}

const _$ActionTypeEnumMap = {
  ActionType.api: 'api',
  ActionType.reset: 'reset',
  ActionType.navigate: 'navigate',
};

_$UrlSchemaImpl _$$UrlSchemaImplFromJson(Map<String, dynamic> json) =>
    _$UrlSchemaImpl(
      method: json['method'] as String,
      urlSchema: json['urlSchema'] as String,
    );

Map<String, dynamic> _$$UrlSchemaImplToJson(_$UrlSchemaImpl instance) =>
    <String, dynamic>{
      'method': instance.method,
      'urlSchema': instance.urlSchema,
    };

_$RoutingSchemaImpl _$$RoutingSchemaImplFromJson(Map<String, dynamic> json) =>
    _$RoutingSchemaImpl(
      destination: json['destination'] as String,
      propertySchema: json['propertySchema'] == null
          ? null
          : PropertySchema.fromJson(
              json['propertySchema'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RoutingSchemaImplToJson(_$RoutingSchemaImpl instance) =>
    <String, dynamic>{
      'destination': instance.destination,
      'propertySchema': instance.propertySchema?.toJson(),
    };
