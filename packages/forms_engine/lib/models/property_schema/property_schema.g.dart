// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PropertySchema _$$_PropertySchemaFromJson(Map<String, dynamic> json) =>
    _$_PropertySchema(
      type: $enumDecode(_$PropertySchemaTypeEnumMap, json['type']),
      readonly: json['readonly'] as bool?,
      displayOnly: json['displayOnly'] as bool?,
      properties: (json['properties'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, PropertySchema.fromJson(e as Map<String, dynamic>)),
      ),
      required: (json['required'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      enums:
          (json['enums'] as List<dynamic>?)?.map((e) => e as String).toList(),
      format:
          $enumDecodeNullable(_$PropertySchemaFormatEnumMap, json['format']),
      firstDate: json['firstDate'] == null
          ? null
          : DateFormatValue.fromJson(json['firstDate'] as Map<String, dynamic>),
      lastDate: json['lastDate'] == null
          ? null
          : DateFormatValue.fromJson(json['lastDate'] as Map<String, dynamic>),
      minLength: json['minLength'] as int?,
      maxLength: json['maxLength'] as int?,
      maximum: json['maximum'] as num?,
      minimum: json['minimum'] as num?,
      hint: json['hint'] as String?,
      label: json['label'] as String?,
      value: json['value'],
      displayBehavior: json['displayBehavior'] == null
          ? null
          : DisplayBehavior.fromJson(
              json['displayBehavior'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PropertySchemaToJson(_$_PropertySchema instance) {
  final val = <String, dynamic>{
    'type': _$PropertySchemaTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('readonly', instance.readonly);
  writeNotNull('displayOnly', instance.displayOnly);
  writeNotNull('properties',
      instance.properties?.map((k, e) => MapEntry(k, e.toJson())));
  writeNotNull('required', instance.required);
  writeNotNull('enums', instance.enums);
  writeNotNull('format', _$PropertySchemaFormatEnumMap[instance.format]);
  writeNotNull('firstDate', instance.firstDate?.toJson());
  writeNotNull('lastDate', instance.lastDate?.toJson());
  writeNotNull('minLength', instance.minLength);
  writeNotNull('maxLength', instance.maxLength);
  writeNotNull('maximum', instance.maximum);
  writeNotNull('minimum', instance.minimum);
  writeNotNull('hint', instance.hint);
  writeNotNull('label', instance.label);
  writeNotNull('value', instance.value);
  writeNotNull('displayBehavior', instance.displayBehavior?.toJson());
  return val;
}

const _$PropertySchemaTypeEnumMap = {
  PropertySchemaType.object: 'object',
  PropertySchemaType.string: 'string',
  PropertySchemaType.integer: 'integer',
  PropertySchemaType.boolean: 'boolean',
  PropertySchemaType.numeric: 'numeric',
};

const _$PropertySchemaFormatEnumMap = {
  PropertySchemaFormat.date: 'date',
  PropertySchemaFormat.dateTime: 'dateTime',
  PropertySchemaFormat.latLng: 'latLng',
  PropertySchemaFormat.incrementer: 'incrementer',
};

_$_DateFormatValue _$$_DateFormatValueFromJson(Map<String, dynamic> json) =>
    _$_DateFormatValue(
      value: json['value'] as String,
      format: json['format'] as String? ?? 'yyyy-MM-dd',
    );

Map<String, dynamic> _$$_DateFormatValueToJson(_$_DateFormatValue instance) =>
    <String, dynamic>{
      'value': instance.value,
      'format': instance.format,
    };

_$_DisplayBehavior _$$_DisplayBehaviorFromJson(Map<String, dynamic> json) =>
    _$_DisplayBehavior(
      behavior: $enumDecode(_$FormulaBehaviorEnumMap, json['behavior']),
      oneOf:
          (json['oneOf'] as List<dynamic>?)?.map((e) => e as String).toList(),
      allOf:
          (json['allOf'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_DisplayBehaviorToJson(_$_DisplayBehavior instance) =>
    <String, dynamic>{
      'behavior': _$FormulaBehaviorEnumMap[instance.behavior]!,
      'oneOf': instance.oneOf,
      'allOf': instance.allOf,
    };

const _$FormulaBehaviorEnumMap = {
  FormulaBehavior.show: 'show',
  FormulaBehavior.hide: 'hide',
};
