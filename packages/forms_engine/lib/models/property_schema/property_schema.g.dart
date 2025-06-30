// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PropertySchemaImpl _$$PropertySchemaImplFromJson(Map<String, dynamic> json) =>
    _$PropertySchemaImpl(
      type: $enumDecode(_$PropertySchemaTypeEnumMap, json['type'],
          unknownValue: PropertySchemaType.string),
      readOnly: json['readOnly'] as bool?,
      displayOnly: json['displayOnly'] as bool?,
      hidden: json['hidden'] as bool?,
      properties: (json['properties'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, PropertySchema.fromJson(e as Map<String, dynamic>)),
      ),
      enums: (json['enums'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      schemaCode: json['schemaCode'] as String?,
      systemDate: json['systemDate'] as bool?,
      charCount: json['charCount'] as bool?,
      format: $enumDecodeNullable(_$PropertySchemaFormatEnumMap, json['format'],
          unknownValue: PropertySchemaFormat.text),
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      minValue: json['minValue'] as int?,
      maxValue: json['maxValue'] as int?,
      minLength: json['minLength'] as int?,
      maxLength: json['maxLength'] as int?,
      helpText: json['helpText'] as String?,
      tooltip: json['tooltip'] as String?,
      innerLabel: json['innerLabel'] as String?,
      label: json['label'] as String?,
      isMultiSelect: json['isMultiSelect'] as bool?,
      value: json['value'],
      displayBehavior: json['displayBehavior'] == null
          ? null
          : DisplayBehavior.fromJson(
              json['displayBehavior'] as Map<String, dynamic>),
      conditions: json['conditions'] as Map<String, dynamic>?,
      order: json['order'] as int?,
      actionLabel: json['actionLabel'] as String?,
      description: json['description'] as String?,
      validations: (json['validations'] as List<dynamic>?)
          ?.map((e) => ValidationRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      includeInForm: json['includeInForm'] as bool?,
      includeInSummary: json['includeInSummary'] as bool?,
      navigateTo: json['navigateTo'] == null
          ? null
          : NavigateToConfig.fromJson(
              json['navigateTo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PropertySchemaImplToJson(
    _$PropertySchemaImpl instance) {
  final val = <String, dynamic>{
    'type': _$PropertySchemaTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('readOnly', instance.readOnly);
  writeNotNull('displayOnly', instance.displayOnly);
  writeNotNull('hidden', instance.hidden);
  writeNotNull('properties',
      instance.properties?.map((k, e) => MapEntry(k, e.toJson())));
  writeNotNull('enums', instance.enums?.map((e) => e.toJson()).toList());
  writeNotNull('schemaCode', instance.schemaCode);
  writeNotNull('systemDate', instance.systemDate);
  writeNotNull('charCount', instance.charCount);
  writeNotNull('format', _$PropertySchemaFormatEnumMap[instance.format]);
  writeNotNull('startDate', instance.startDate);
  writeNotNull('endDate', instance.endDate);
  writeNotNull('minValue', instance.minValue);
  writeNotNull('maxValue', instance.maxValue);
  writeNotNull('minLength', instance.minLength);
  writeNotNull('maxLength', instance.maxLength);
  writeNotNull('helpText', instance.helpText);
  writeNotNull('tooltip', instance.tooltip);
  writeNotNull('innerLabel', instance.innerLabel);
  writeNotNull('label', instance.label);
  writeNotNull('isMultiSelect', instance.isMultiSelect);
  writeNotNull('value', instance.value);
  writeNotNull('displayBehavior', instance.displayBehavior?.toJson());
  writeNotNull('conditions', instance.conditions);
  writeNotNull('order', instance.order);
  writeNotNull('actionLabel', instance.actionLabel);
  writeNotNull('description', instance.description);
  writeNotNull(
      'validations', instance.validations?.map((e) => e.toJson()).toList());
  writeNotNull('includeInForm', instance.includeInForm);
  writeNotNull('includeInSummary', instance.includeInSummary);
  writeNotNull('navigateTo', instance.navigateTo?.toJson());
  return val;
}

const _$PropertySchemaTypeEnumMap = {
  PropertySchemaType.object: 'object',
  PropertySchemaType.string: 'string',
  PropertySchemaType.integer: 'integer',
  PropertySchemaType.boolean: 'boolean',
  PropertySchemaType.dynamic: 'dynamic',
};

const _$PropertySchemaFormatEnumMap = {
  PropertySchemaFormat.date: 'date',
  PropertySchemaFormat.latLng: 'latLng',
  PropertySchemaFormat.custom: 'custom',
  PropertySchemaFormat.locality: 'locality',
  PropertySchemaFormat.select: 'select',
  PropertySchemaFormat.numeric: 'numeric',
  PropertySchemaFormat.dropdown: 'dropdown',
  PropertySchemaFormat.checkbox: 'checkbox',
  PropertySchemaFormat.radio: 'radio',
  PropertySchemaFormat.dob: 'dob',
  PropertySchemaFormat.scanner: 'scanner',
  PropertySchemaFormat.idPopulator: 'idPopulator',
  PropertySchemaFormat.mobileNumber: 'mobileNumber',
  PropertySchemaFormat.text: 'text',
};

_$ValidationRuleImpl _$$ValidationRuleImplFromJson(Map<String, dynamic> json) =>
    _$ValidationRuleImpl(
      type: json['type'] as String,
      value: json['value'],
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$ValidationRuleImplToJson(
        _$ValidationRuleImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'value': instance.value,
      'message': instance.message,
    };

_$OptionImpl _$$OptionImplFromJson(Map<String, dynamic> json) => _$OptionImpl(
      code: json['code'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$OptionImplToJson(_$OptionImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

_$DisplayBehaviorImpl _$$DisplayBehaviorImplFromJson(
        Map<String, dynamic> json) =>
    _$DisplayBehaviorImpl(
      behavior: $enumDecode(_$FormulaBehaviorEnumMap, json['behavior']),
      oneOf:
          (json['oneOf'] as List<dynamic>?)?.map((e) => e as String).toList(),
      allOf:
          (json['allOf'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$DisplayBehaviorImplToJson(
        _$DisplayBehaviorImpl instance) =>
    <String, dynamic>{
      'behavior': _$FormulaBehaviorEnumMap[instance.behavior]!,
      'oneOf': instance.oneOf,
      'allOf': instance.allOf,
    };

const _$FormulaBehaviorEnumMap = {
  FormulaBehavior.show: 'show',
  FormulaBehavior.hide: 'hide',
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
