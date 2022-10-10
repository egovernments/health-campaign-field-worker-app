// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PropertySchema _$$_PropertySchemaFromJson(Map<String, dynamic> json) =>
    _$_PropertySchema(
      type: $enumDecode(_$PropertySchemaTypeEnumMap, json['type']),
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
      hint: json['hint'] as String?,
      label: json['label'] as String?,
      value: json['value'],
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

  writeNotNull('properties',
      instance.properties?.map((k, e) => MapEntry(k, e.toJson())));
  writeNotNull('required', instance.required);
  writeNotNull('enums', instance.enums);
  writeNotNull('format', _$PropertySchemaFormatEnumMap[instance.format]);
  writeNotNull('firstDate', instance.firstDate?.toJson());
  writeNotNull('lastDate', instance.lastDate?.toJson());
  writeNotNull('minLength', instance.minLength);
  writeNotNull('maxLength', instance.maxLength);
  writeNotNull('hint', instance.hint);
  writeNotNull('label', instance.label);
  writeNotNull('value', instance.value);
  return val;
}

const _$PropertySchemaTypeEnumMap = {
  PropertySchemaType.object: 'object',
  PropertySchemaType.string: 'string',
};

const _$PropertySchemaFormatEnumMap = {
  PropertySchemaFormat.date: 'date',
  PropertySchemaFormat.dateTime: 'dateTime',
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
