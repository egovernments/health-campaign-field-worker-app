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
      startDate: _stringOrNull(json['startDate']),
      endDate: _stringOrNull(json['endDate']),
      minValue: _intOrNull(json['minValue']),
      maxValue: _intOrNull(json['maxValue']),
      minLength: _intOrNull(json['minLength']),
      maxLength: _intOrNull(json['maxLength']),
      min: _intOrNull(json['min']),
      max: _intOrNull(json['max']),
      helpText: json['helpText'] as String?,
      tooltip: json['tooltip'] as String?,
      prefixText: json['prefixText'] as String?,
      suffixText: json['suffixText'] as String?,
      innerLabel: json['innerLabel'] as String?,
      label: json['label'] as String?,
      isMultiSelect: json['isMultiSelect'] as bool?,
      value: json['value'],
      displayBehavior: json['displayBehavior'] == null
          ? null
          : DisplayBehavior.fromJson(
              json['displayBehavior'] as Map<String, dynamic>),
      conditions: json['conditions'] as Map<String, dynamic>?,
      order: (json['order'] as num?)?.toDouble(),
      actionLabel: json['actionLabel'] as String?,
      description: json['description'] as String?,
      validations: (json['validations'] as List<dynamic>?)
          ?.map((e) => ValidationRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      includeInForm: json['includeInForm'] as bool?,
      includeInSummary: json['includeInSummary'] as bool?,
      navigateTo: _navigateToConfigOrNull(json['navigateTo']),
      visibilityCondition:
          _visibilityConditionOrNull(json['visibilityCondition']),
      conditionalNavigateTo:
          _conditionalNavigateListOrNull(json['conditionalNavigateTo']),
      autoFillCondition:
          _autoFillConditionListOrNull(json['autoFillCondition']),
      showAlertPopUp: _showAlertOrNull(json['showAlertPopUp']),
      showSecondaryAlertPopUp:
          _showSecondaryAlertOrNull(json['showSecondaryAlertPopUp']),
      multiEntityConfig: _multiEntityConfigOrNull(json['multiEntityConfig']),
      preventScreenCapture: json['preventScreenCapture'] as bool?,
      submitCondition: _visibilityConditionOrNull(json['submitCondition']),
      secondaryActionLabel: json['secondaryActionLabel'] as String?,
      comparisonConfig: _comparisonConfigOrNull(json['comparisonConfig']),
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
  writeNotNull('min', instance.min);
  writeNotNull('max', instance.max);
  writeNotNull('helpText', instance.helpText);
  writeNotNull('tooltip', instance.tooltip);
  writeNotNull('prefixText', instance.prefixText);
  writeNotNull('suffixText', instance.suffixText);
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
  writeNotNull('visibilityCondition', instance.visibilityCondition?.toJson());
  writeNotNull('conditionalNavigateTo',
      instance.conditionalNavigateTo?.map((e) => e.toJson()).toList());
  writeNotNull('autoFillCondition',
      instance.autoFillCondition?.map((e) => e.toJson()).toList());
  writeNotNull('showAlertPopUp', instance.showAlertPopUp?.toJson());
  writeNotNull(
      'showSecondaryAlertPopUp', instance.showSecondaryAlertPopUp?.toJson());
  writeNotNull('multiEntityConfig', instance.multiEntityConfig?.toJson());
  writeNotNull('preventScreenCapture', instance.preventScreenCapture);
  writeNotNull('submitCondition', instance.submitCondition?.toJson());
  writeNotNull('secondaryActionLabel', instance.secondaryActionLabel);
  writeNotNull('comparisonConfig', instance.comparisonConfig?.toJson());
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
  PropertySchemaFormat.textArea: 'textArea',
  PropertySchemaFormat.text: 'text',
  PropertySchemaFormat.photo: 'photo',
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

_$VisibilityConditionImpl _$$VisibilityConditionImplFromJson(
        Map<String, dynamic> json) =>
    _$VisibilityConditionImpl(
      expression: (json['expression'] as List<dynamic>)
          .map((e) => VisibilityExpression.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VisibilityConditionImplToJson(
        _$VisibilityConditionImpl instance) =>
    <String, dynamic>{
      'expression': instance.expression,
    };

_$VisibilityExpressionImpl _$$VisibilityExpressionImplFromJson(
        Map<String, dynamic> json) =>
    _$VisibilityExpressionImpl(
      condition: json['condition'] as String,
    );

Map<String, dynamic> _$$VisibilityExpressionImplToJson(
        _$VisibilityExpressionImpl instance) =>
    <String, dynamic>{
      'condition': instance.condition,
    };

_$ConditionalNavigateToImpl _$$ConditionalNavigateToImplFromJson(
        Map<String, dynamic> json) =>
    _$ConditionalNavigateToImpl(
      condition: json['condition'] as String,
      navigateTo:
          NavigateToConfig.fromJson(json['navigateTo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ConditionalNavigateToImplToJson(
        _$ConditionalNavigateToImpl instance) =>
    <String, dynamic>{
      'condition': instance.condition,
      'navigateTo': instance.navigateTo,
    };

_$AutoFillConditionImpl _$$AutoFillConditionImplFromJson(
        Map<String, dynamic> json) =>
    _$AutoFillConditionImpl(
      expression: json['expression'] as String,
      value: json['value'],
    );

Map<String, dynamic> _$$AutoFillConditionImplToJson(
        _$AutoFillConditionImpl instance) =>
    <String, dynamic>{
      'expression': instance.expression,
      'value': instance.value,
    };

_$ShowAlertPopUpImpl _$$ShowAlertPopUpImplFromJson(Map<String, dynamic> json) =>
    _$ShowAlertPopUpImpl(
      title: json['title'] as String,
      description: json['description'] as String?,
      primaryActionLabel: json['primaryActionLabel'] as String,
      secondaryActionLabel: json['secondaryActionLabel'] as String,
      conditions: (json['conditions'] as List<dynamic>?)
          ?.map((e) => AlertCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ShowAlertPopUpImplToJson(
        _$ShowAlertPopUpImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'primaryActionLabel': instance.primaryActionLabel,
      'secondaryActionLabel': instance.secondaryActionLabel,
      'conditions': instance.conditions,
    };

_$ShowSecondaryAlertPopUpImpl _$$ShowSecondaryAlertPopUpImplFromJson(
        Map<String, dynamic> json) =>
    _$ShowSecondaryAlertPopUpImpl(
      title: json['title'] as String,
      description: json['description'] as String?,
      primaryActionLabel: json['primaryActionLabel'] as String,
      secondaryActionLabel: json['secondaryActionLabel'] as String,
      conditions: (json['conditions'] as List<dynamic>?)
          ?.map((e) => AlertCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      body: (json['body'] as List<dynamic>?)
          ?.map((e) =>
              SecondaryAlertBodyField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ShowSecondaryAlertPopUpImplToJson(
        _$ShowSecondaryAlertPopUpImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'primaryActionLabel': instance.primaryActionLabel,
      'secondaryActionLabel': instance.secondaryActionLabel,
      'conditions': instance.conditions,
      'body': instance.body,
    };

_$SecondaryAlertBodyFieldImpl _$$SecondaryAlertBodyFieldImplFromJson(
        Map<String, dynamic> json) =>
    _$SecondaryAlertBodyFieldImpl(
      type: json['type'] as String,
      label: json['label'] as String,
      format: json['format'] as String?,
      fieldName: json['fieldName'] as String,
      mandatory: json['mandatory'] as bool? ?? false,
    );

Map<String, dynamic> _$$SecondaryAlertBodyFieldImplToJson(
        _$SecondaryAlertBodyFieldImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'label': instance.label,
      'format': instance.format,
      'fieldName': instance.fieldName,
      'mandatory': instance.mandatory,
    };

_$AlertConditionImpl _$$AlertConditionImplFromJson(Map<String, dynamic> json) =>
    _$AlertConditionImpl(
      expression: json['expression'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$AlertConditionImplToJson(
        _$AlertConditionImpl instance) =>
    <String, dynamic>{
      'expression': instance.expression,
      'value': instance.value,
    };

_$MultiEntityConfigImpl _$$MultiEntityConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$MultiEntityConfigImpl(
      sourcePageKey: json['sourcePageKey'] as String,
      sourceFieldKey: json['sourceFieldKey'] as String,
    );

Map<String, dynamic> _$$MultiEntityConfigImplToJson(
        _$MultiEntityConfigImpl instance) =>
    <String, dynamic>{
      'sourcePageKey': instance.sourcePageKey,
      'sourceFieldKey': instance.sourceFieldKey,
    };

_$ComparisonConfigImpl _$$ComparisonConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$ComparisonConfigImpl(
      model: json['model'] as String,
      extractKey: json['extractKey'] as String,
      extractFrom: json['extractFrom'] as String? ?? 'additionalFields',
      filters: (json['filters'] as List<dynamic>?)
              ?.map((e) => ComparisonFilter.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$$ComparisonConfigImplToJson(
    _$ComparisonConfigImpl instance) {
  final val = <String, dynamic>{
    'model': instance.model,
    'extractKey': instance.extractKey,
    'extractFrom': instance.extractFrom,
    'filters': instance.filters.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('errorMessage', instance.errorMessage);
  return val;
}

_$ComparisonFilterImpl _$$ComparisonFilterImplFromJson(
        Map<String, dynamic> json) =>
    _$ComparisonFilterImpl(
      key: json['key'] as String,
      value: json['value'] as String,
      operation: json['operation'] as String? ?? 'equals',
      switchOn: json['switchOn'] as String?,
      cases: (json['cases'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$$ComparisonFilterImplToJson(
    _$ComparisonFilterImpl instance) {
  final val = <String, dynamic>{
    'key': instance.key,
    'value': instance.value,
    'operation': instance.operation,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('switchOn', instance.switchOn);
  writeNotNull('cases', instance.cases);
  return val;
}
