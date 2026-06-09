// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PropertySchema _$PropertySchemaFromJson(Map<String, dynamic> json) =>
    _PropertySchema(
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

Map<String, dynamic> _$PropertySchemaToJson(_PropertySchema instance) =>
    <String, dynamic>{
      'type': _$PropertySchemaTypeEnumMap[instance.type]!,
      if (instance.readOnly case final value?) 'readOnly': value,
      if (instance.displayOnly case final value?) 'displayOnly': value,
      if (instance.hidden case final value?) 'hidden': value,
      if (instance.properties?.map((k, e) => MapEntry(k, e.toJson()))
          case final value?)
        'properties': value,
      if (instance.enums?.map((e) => e.toJson()).toList() case final value?)
        'enums': value,
      if (instance.schemaCode case final value?) 'schemaCode': value,
      if (instance.systemDate case final value?) 'systemDate': value,
      if (instance.charCount case final value?) 'charCount': value,
      if (_$PropertySchemaFormatEnumMap[instance.format] case final value?)
        'format': value,
      if (instance.startDate case final value?) 'startDate': value,
      if (instance.endDate case final value?) 'endDate': value,
      if (instance.minValue case final value?) 'minValue': value,
      if (instance.maxValue case final value?) 'maxValue': value,
      if (instance.minLength case final value?) 'minLength': value,
      if (instance.maxLength case final value?) 'maxLength': value,
      if (instance.min case final value?) 'min': value,
      if (instance.max case final value?) 'max': value,
      if (instance.helpText case final value?) 'helpText': value,
      if (instance.tooltip case final value?) 'tooltip': value,
      if (instance.prefixText case final value?) 'prefixText': value,
      if (instance.suffixText case final value?) 'suffixText': value,
      if (instance.innerLabel case final value?) 'innerLabel': value,
      if (instance.label case final value?) 'label': value,
      if (instance.isMultiSelect case final value?) 'isMultiSelect': value,
      if (instance.value case final value?) 'value': value,
      if (instance.displayBehavior?.toJson() case final value?)
        'displayBehavior': value,
      if (instance.conditions case final value?) 'conditions': value,
      if (instance.order case final value?) 'order': value,
      if (instance.actionLabel case final value?) 'actionLabel': value,
      if (instance.description case final value?) 'description': value,
      if (instance.validations?.map((e) => e.toJson()).toList()
          case final value?)
        'validations': value,
      if (instance.includeInForm case final value?) 'includeInForm': value,
      if (instance.includeInSummary case final value?)
        'includeInSummary': value,
      if (instance.navigateTo?.toJson() case final value?) 'navigateTo': value,
      if (instance.visibilityCondition?.toJson() case final value?)
        'visibilityCondition': value,
      if (instance.conditionalNavigateTo?.map((e) => e.toJson()).toList()
          case final value?)
        'conditionalNavigateTo': value,
      if (instance.autoFillCondition?.map((e) => e.toJson()).toList()
          case final value?)
        'autoFillCondition': value,
      if (instance.showAlertPopUp?.toJson() case final value?)
        'showAlertPopUp': value,
      if (instance.showSecondaryAlertPopUp?.toJson() case final value?)
        'showSecondaryAlertPopUp': value,
      if (instance.multiEntityConfig?.toJson() case final value?)
        'multiEntityConfig': value,
      if (instance.preventScreenCapture case final value?)
        'preventScreenCapture': value,
      if (instance.submitCondition?.toJson() case final value?)
        'submitCondition': value,
      if (instance.secondaryActionLabel case final value?)
        'secondaryActionLabel': value,
      if (instance.comparisonConfig?.toJson() case final value?)
        'comparisonConfig': value,
    };

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
};

_ValidationRule _$ValidationRuleFromJson(Map<String, dynamic> json) =>
    _ValidationRule(
      type: json['type'] as String,
      value: json['value'],
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ValidationRuleToJson(_ValidationRule instance) =>
    <String, dynamic>{
      'type': instance.type,
      'value': instance.value,
      'message': instance.message,
    };

_Option _$OptionFromJson(Map<String, dynamic> json) => _Option(
      code: json['code'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$OptionToJson(_Option instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

_DisplayBehavior _$DisplayBehaviorFromJson(Map<String, dynamic> json) =>
    _DisplayBehavior(
      behavior: $enumDecode(_$FormulaBehaviorEnumMap, json['behavior']),
      oneOf:
          (json['oneOf'] as List<dynamic>?)?.map((e) => e as String).toList(),
      allOf:
          (json['allOf'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DisplayBehaviorToJson(_DisplayBehavior instance) =>
    <String, dynamic>{
      'behavior': _$FormulaBehaviorEnumMap[instance.behavior]!,
      'oneOf': instance.oneOf,
      'allOf': instance.allOf,
    };

const _$FormulaBehaviorEnumMap = {
  FormulaBehavior.show: 'show',
  FormulaBehavior.hide: 'hide',
};

_NavigateToConfig _$NavigateToConfigFromJson(Map<String, dynamic> json) =>
    _NavigateToConfig(
      type: json['type'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$NavigateToConfigToJson(_NavigateToConfig instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
    };

_VisibilityCondition _$VisibilityConditionFromJson(Map<String, dynamic> json) =>
    _VisibilityCondition(
      expression: (json['expression'] as List<dynamic>)
          .map((e) => VisibilityExpression.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VisibilityConditionToJson(
        _VisibilityCondition instance) =>
    <String, dynamic>{
      'expression': instance.expression,
    };

_VisibilityExpression _$VisibilityExpressionFromJson(
        Map<String, dynamic> json) =>
    _VisibilityExpression(
      condition: json['condition'] as String,
    );

Map<String, dynamic> _$VisibilityExpressionToJson(
        _VisibilityExpression instance) =>
    <String, dynamic>{
      'condition': instance.condition,
    };

_ConditionalNavigateTo _$ConditionalNavigateToFromJson(
        Map<String, dynamic> json) =>
    _ConditionalNavigateTo(
      condition: json['condition'] as String,
      navigateTo:
          NavigateToConfig.fromJson(json['navigateTo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConditionalNavigateToToJson(
        _ConditionalNavigateTo instance) =>
    <String, dynamic>{
      'condition': instance.condition,
      'navigateTo': instance.navigateTo,
    };

_AutoFillCondition _$AutoFillConditionFromJson(Map<String, dynamic> json) =>
    _AutoFillCondition(
      expression: json['expression'] as String,
      value: json['value'],
    );

Map<String, dynamic> _$AutoFillConditionToJson(_AutoFillCondition instance) =>
    <String, dynamic>{
      'expression': instance.expression,
      'value': instance.value,
    };

_ShowAlertPopUp _$ShowAlertPopUpFromJson(Map<String, dynamic> json) =>
    _ShowAlertPopUp(
      title: json['title'] as String,
      description: json['description'] as String?,
      primaryActionLabel: json['primaryActionLabel'] as String,
      secondaryActionLabel: json['secondaryActionLabel'] as String,
      conditions: (json['conditions'] as List<dynamic>?)
          ?.map((e) => AlertCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShowAlertPopUpToJson(_ShowAlertPopUp instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'primaryActionLabel': instance.primaryActionLabel,
      'secondaryActionLabel': instance.secondaryActionLabel,
      'conditions': instance.conditions,
    };

_ShowSecondaryAlertPopUp _$ShowSecondaryAlertPopUpFromJson(
        Map<String, dynamic> json) =>
    _ShowSecondaryAlertPopUp(
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

Map<String, dynamic> _$ShowSecondaryAlertPopUpToJson(
        _ShowSecondaryAlertPopUp instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'primaryActionLabel': instance.primaryActionLabel,
      'secondaryActionLabel': instance.secondaryActionLabel,
      'conditions': instance.conditions,
      'body': instance.body,
    };

_SecondaryAlertBodyField _$SecondaryAlertBodyFieldFromJson(
        Map<String, dynamic> json) =>
    _SecondaryAlertBodyField(
      type: json['type'] as String,
      label: json['label'] as String,
      format: json['format'] as String?,
      fieldName: json['fieldName'] as String,
      mandatory: json['mandatory'] as bool? ?? false,
    );

Map<String, dynamic> _$SecondaryAlertBodyFieldToJson(
        _SecondaryAlertBodyField instance) =>
    <String, dynamic>{
      'type': instance.type,
      'label': instance.label,
      'format': instance.format,
      'fieldName': instance.fieldName,
      'mandatory': instance.mandatory,
    };

_AlertCondition _$AlertConditionFromJson(Map<String, dynamic> json) =>
    _AlertCondition(
      expression: json['expression'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$AlertConditionToJson(_AlertCondition instance) =>
    <String, dynamic>{
      'expression': instance.expression,
      'value': instance.value,
    };

_MultiEntityConfig _$MultiEntityConfigFromJson(Map<String, dynamic> json) =>
    _MultiEntityConfig(
      sourcePageKey: json['sourcePageKey'] as String,
      sourceFieldKey: json['sourceFieldKey'] as String,
    );

Map<String, dynamic> _$MultiEntityConfigToJson(_MultiEntityConfig instance) =>
    <String, dynamic>{
      'sourcePageKey': instance.sourcePageKey,
      'sourceFieldKey': instance.sourceFieldKey,
    };

_ComparisonConfig _$ComparisonConfigFromJson(Map<String, dynamic> json) =>
    _ComparisonConfig(
      model: json['model'] as String,
      extractKey: json['extractKey'] as String,
      extractFrom: json['extractFrom'] as String? ?? 'additionalFields',
      filters: (json['filters'] as List<dynamic>?)
              ?.map((e) => ComparisonFilter.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$ComparisonConfigToJson(_ComparisonConfig instance) =>
    <String, dynamic>{
      'model': instance.model,
      'extractKey': instance.extractKey,
      'extractFrom': instance.extractFrom,
      'filters': instance.filters.map((e) => e.toJson()).toList(),
      if (instance.errorMessage case final value?) 'errorMessage': value,
    };

_ComparisonFilter _$ComparisonFilterFromJson(Map<String, dynamic> json) =>
    _ComparisonFilter(
      key: json['key'] as String,
      value: json['value'] as String,
      operation: json['operation'] as String? ?? 'equals',
      switchOn: json['switchOn'] as String?,
      cases: (json['cases'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$ComparisonFilterToJson(_ComparisonFilter instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
      'operation': instance.operation,
      if (instance.switchOn case final value?) 'switchOn': value,
      if (instance.cases case final value?) 'cases': value,
    };
