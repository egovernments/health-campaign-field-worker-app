// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SchemaObject _$$_SchemaObjectFromJson(Map<String, dynamic> json) =>
    _$_SchemaObject(
      name: json['name'] as String,
      version: json['version'] as int,
      pages: (json['pages'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, PropertySchema.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      actionSchema: (json['actionSchema'] as List<dynamic>?)
          ?.map((e) => ActionSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SchemaObjectToJson(_$_SchemaObject instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'version': instance.version,
    'pages': instance.pages.map((k, e) => MapEntry(k, e.toJson())),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'actionSchema', instance.actionSchema?.map((e) => e.toJson()).toList());
  return val;
}

_$_ActionSchema _$$_ActionSchemaFromJson(Map<String, dynamic> json) =>
    _$_ActionSchema(
      name: json['name'] as String,
      buttonName: json['buttonName'] as String,
      buttonType:
          $enumDecodeNullable(_$ButtonTypeEnumMap, json['buttonType']) ??
              ButtonType.elevated,
      actionItems: (json['actionItems'] as List<dynamic>)
          .map((e) => ActionItemSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ActionSchemaToJson(_$_ActionSchema instance) =>
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

_$_ActionItemSchema _$$_ActionItemSchemaFromJson(Map<String, dynamic> json) =>
    _$_ActionItemSchema(
      type: $enumDecode(_$ActionTypeEnumMap, json['type']),
      urlSchema: json['urlSchema'] == null
          ? null
          : UrlSchema.fromJson(json['urlSchema'] as Map<String, dynamic>),
      routingSchema: json['routingSchema'] == null
          ? null
          : RoutingSchema.fromJson(
              json['routingSchema'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ActionItemSchemaToJson(_$_ActionItemSchema instance) {
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

_$_UrlSchema _$$_UrlSchemaFromJson(Map<String, dynamic> json) => _$_UrlSchema(
      method: json['method'] as String,
      urlSchema: json['urlSchema'] as String,
    );

Map<String, dynamic> _$$_UrlSchemaToJson(_$_UrlSchema instance) =>
    <String, dynamic>{
      'method': instance.method,
      'urlSchema': instance.urlSchema,
    };

_$_RoutingSchema _$$_RoutingSchemaFromJson(Map<String, dynamic> json) =>
    _$_RoutingSchema(
      destination: json['destination'] as String,
      propertySchema: json['propertySchema'] == null
          ? null
          : PropertySchema.fromJson(
              json['propertySchema'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RoutingSchemaToJson(_$_RoutingSchema instance) =>
    <String, dynamic>{
      'destination': instance.destination,
      'propertySchema': instance.propertySchema?.toJson(),
    };
