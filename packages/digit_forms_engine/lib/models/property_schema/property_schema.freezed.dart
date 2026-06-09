// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PropertySchema {
  @JsonKey(name: 'type', unknownEnumValue: PropertySchemaType.string)
  PropertySchemaType get type;
  bool? get readOnly;
  bool? get displayOnly;
  bool? get hidden;
  Map<String, PropertySchema>? get properties;
  List<Option>? get enums;
  String? get schemaCode;
  bool? get systemDate;
  bool? get charCount;
  @JsonKey(name: 'format', unknownEnumValue: PropertySchemaFormat.text)
  PropertySchemaFormat? get format;
  @JsonKey(fromJson: _stringOrNull)
  String? get startDate;
  @JsonKey(fromJson: _stringOrNull)
  String? get endDate;
  @JsonKey(fromJson: _intOrNull)
  int? get minValue;
  @JsonKey(fromJson: _intOrNull)
  int? get maxValue;
  @JsonKey(fromJson: _intOrNull)
  int? get minLength;
  @JsonKey(fromJson: _intOrNull)
  int? get maxLength;
  @JsonKey(fromJson: _intOrNull)
  int? get min;
  @JsonKey(fromJson: _intOrNull)
  int? get max;
  String? get helpText;
  String? get tooltip;
  String? get prefixText;
  String? get suffixText;
  String? get innerLabel;
  String? get label;
  bool? get isMultiSelect;
  dynamic get value;
  DisplayBehavior? get displayBehavior;
  Map<String, dynamic>? get conditions;
  double? get order;
  String? get actionLabel;
  String? get description;
  List<ValidationRule>? get validations;
  bool? get includeInForm;
  bool? get includeInSummary;
  @JsonKey(fromJson: _navigateToConfigOrNull)
  NavigateToConfig? get navigateTo;
  @JsonKey(fromJson: _visibilityConditionOrNull)
  VisibilityCondition? get visibilityCondition;
  @JsonKey(fromJson: _conditionalNavigateListOrNull)
  List<ConditionalNavigateTo>?
      get conditionalNavigateTo; // New: AutoFillCondition list
  @JsonKey(fromJson: _autoFillConditionListOrNull)
  List<AutoFillCondition>? get autoFillCondition;
  @JsonKey(fromJson: _showAlertOrNull)
  ShowAlertPopUp?
      get showAlertPopUp; // Secondary action alert popup (e.g., for reject confirmation with comment)
  @JsonKey(fromJson: _showSecondaryAlertOrNull)
  ShowSecondaryAlertPopUp?
      get showSecondaryAlertPopUp; // Multi-entity tab configuration
  @JsonKey(fromJson: _multiEntityConfigOrNull)
  MultiEntityConfig?
      get multiEntityConfig; // Screenshot protection for this page
  bool?
      get preventScreenCapture; // Submit condition for pages - when true, form submits directly instead of navigating to next page
  @JsonKey(fromJson: _visibilityConditionOrNull)
  VisibilityCondition?
      get submitCondition; // Secondary action button label (e.g., "Decline" button alongside "Accept")
  String?
      get secondaryActionLabel; // Comparison config for scanner fields - enables duplicate detection against historical data
  @JsonKey(fromJson: _comparisonConfigOrNull)
  ComparisonConfig? get comparisonConfig;

  /// Create a copy of PropertySchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PropertySchemaCopyWith<PropertySchema> get copyWith =>
      _$PropertySchemaCopyWithImpl<PropertySchema>(
          this as PropertySchema, _$identity);

  /// Serializes this PropertySchema to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PropertySchema &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.readOnly, readOnly) ||
                other.readOnly == readOnly) &&
            (identical(other.displayOnly, displayOnly) ||
                other.displayOnly == displayOnly) &&
            (identical(other.hidden, hidden) || other.hidden == hidden) &&
            const DeepCollectionEquality()
                .equals(other.properties, properties) &&
            const DeepCollectionEquality().equals(other.enums, enums) &&
            (identical(other.schemaCode, schemaCode) ||
                other.schemaCode == schemaCode) &&
            (identical(other.systemDate, systemDate) ||
                other.systemDate == systemDate) &&
            (identical(other.charCount, charCount) ||
                other.charCount == charCount) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.minValue, minValue) ||
                other.minValue == minValue) &&
            (identical(other.maxValue, maxValue) ||
                other.maxValue == maxValue) &&
            (identical(other.minLength, minLength) ||
                other.minLength == minLength) &&
            (identical(other.maxLength, maxLength) ||
                other.maxLength == maxLength) &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.helpText, helpText) ||
                other.helpText == helpText) &&
            (identical(other.tooltip, tooltip) || other.tooltip == tooltip) &&
            (identical(other.prefixText, prefixText) ||
                other.prefixText == prefixText) &&
            (identical(other.suffixText, suffixText) ||
                other.suffixText == suffixText) &&
            (identical(other.innerLabel, innerLabel) ||
                other.innerLabel == innerLabel) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.isMultiSelect, isMultiSelect) ||
                other.isMultiSelect == isMultiSelect) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.displayBehavior, displayBehavior) ||
                other.displayBehavior == displayBehavior) &&
            const DeepCollectionEquality()
                .equals(other.conditions, conditions) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.actionLabel, actionLabel) ||
                other.actionLabel == actionLabel) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.validations, validations) &&
            (identical(other.includeInForm, includeInForm) ||
                other.includeInForm == includeInForm) &&
            (identical(other.includeInSummary, includeInSummary) ||
                other.includeInSummary == includeInSummary) &&
            (identical(other.navigateTo, navigateTo) ||
                other.navigateTo == navigateTo) &&
            (identical(other.visibilityCondition, visibilityCondition) ||
                other.visibilityCondition == visibilityCondition) &&
            const DeepCollectionEquality()
                .equals(other.conditionalNavigateTo, conditionalNavigateTo) &&
            const DeepCollectionEquality()
                .equals(other.autoFillCondition, autoFillCondition) &&
            (identical(other.showAlertPopUp, showAlertPopUp) ||
                other.showAlertPopUp == showAlertPopUp) &&
            (identical(
                    other.showSecondaryAlertPopUp, showSecondaryAlertPopUp) ||
                other.showSecondaryAlertPopUp == showSecondaryAlertPopUp) &&
            (identical(other.multiEntityConfig, multiEntityConfig) ||
                other.multiEntityConfig == multiEntityConfig) &&
            (identical(other.preventScreenCapture, preventScreenCapture) ||
                other.preventScreenCapture == preventScreenCapture) &&
            (identical(other.submitCondition, submitCondition) ||
                other.submitCondition == submitCondition) &&
            (identical(other.secondaryActionLabel, secondaryActionLabel) ||
                other.secondaryActionLabel == secondaryActionLabel) &&
            (identical(other.comparisonConfig, comparisonConfig) ||
                other.comparisonConfig == comparisonConfig));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        type,
        readOnly,
        displayOnly,
        hidden,
        const DeepCollectionEquality().hash(properties),
        const DeepCollectionEquality().hash(enums),
        schemaCode,
        systemDate,
        charCount,
        format,
        startDate,
        endDate,
        minValue,
        maxValue,
        minLength,
        maxLength,
        min,
        max,
        helpText,
        tooltip,
        prefixText,
        suffixText,
        innerLabel,
        label,
        isMultiSelect,
        const DeepCollectionEquality().hash(value),
        displayBehavior,
        const DeepCollectionEquality().hash(conditions),
        order,
        actionLabel,
        description,
        const DeepCollectionEquality().hash(validations),
        includeInForm,
        includeInSummary,
        navigateTo,
        visibilityCondition,
        const DeepCollectionEquality().hash(conditionalNavigateTo),
        const DeepCollectionEquality().hash(autoFillCondition),
        showAlertPopUp,
        showSecondaryAlertPopUp,
        multiEntityConfig,
        preventScreenCapture,
        submitCondition,
        secondaryActionLabel,
        comparisonConfig
      ]);

  @override
  String toString() {
    return 'PropertySchema(type: $type, readOnly: $readOnly, displayOnly: $displayOnly, hidden: $hidden, properties: $properties, enums: $enums, schemaCode: $schemaCode, systemDate: $systemDate, charCount: $charCount, format: $format, startDate: $startDate, endDate: $endDate, minValue: $minValue, maxValue: $maxValue, minLength: $minLength, maxLength: $maxLength, min: $min, max: $max, helpText: $helpText, tooltip: $tooltip, prefixText: $prefixText, suffixText: $suffixText, innerLabel: $innerLabel, label: $label, isMultiSelect: $isMultiSelect, value: $value, displayBehavior: $displayBehavior, conditions: $conditions, order: $order, actionLabel: $actionLabel, description: $description, validations: $validations, includeInForm: $includeInForm, includeInSummary: $includeInSummary, navigateTo: $navigateTo, visibilityCondition: $visibilityCondition, conditionalNavigateTo: $conditionalNavigateTo, autoFillCondition: $autoFillCondition, showAlertPopUp: $showAlertPopUp, showSecondaryAlertPopUp: $showSecondaryAlertPopUp, multiEntityConfig: $multiEntityConfig, preventScreenCapture: $preventScreenCapture, submitCondition: $submitCondition, secondaryActionLabel: $secondaryActionLabel, comparisonConfig: $comparisonConfig)';
  }
}

/// @nodoc
abstract mixin class $PropertySchemaCopyWith<$Res> {
  factory $PropertySchemaCopyWith(
          PropertySchema value, $Res Function(PropertySchema) _then) =
      _$PropertySchemaCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'type', unknownEnumValue: PropertySchemaType.string)
      PropertySchemaType type,
      bool? readOnly,
      bool? displayOnly,
      bool? hidden,
      Map<String, PropertySchema>? properties,
      List<Option>? enums,
      String? schemaCode,
      bool? systemDate,
      bool? charCount,
      @JsonKey(name: 'format', unknownEnumValue: PropertySchemaFormat.text)
      PropertySchemaFormat? format,
      @JsonKey(fromJson: _stringOrNull) String? startDate,
      @JsonKey(fromJson: _stringOrNull) String? endDate,
      @JsonKey(fromJson: _intOrNull) int? minValue,
      @JsonKey(fromJson: _intOrNull) int? maxValue,
      @JsonKey(fromJson: _intOrNull) int? minLength,
      @JsonKey(fromJson: _intOrNull) int? maxLength,
      @JsonKey(fromJson: _intOrNull) int? min,
      @JsonKey(fromJson: _intOrNull) int? max,
      String? helpText,
      String? tooltip,
      String? prefixText,
      String? suffixText,
      String? innerLabel,
      String? label,
      bool? isMultiSelect,
      dynamic value,
      DisplayBehavior? displayBehavior,
      Map<String, dynamic>? conditions,
      double? order,
      String? actionLabel,
      String? description,
      List<ValidationRule>? validations,
      bool? includeInForm,
      bool? includeInSummary,
      @JsonKey(fromJson: _navigateToConfigOrNull) NavigateToConfig? navigateTo,
      @JsonKey(fromJson: _visibilityConditionOrNull)
      VisibilityCondition? visibilityCondition,
      @JsonKey(fromJson: _conditionalNavigateListOrNull)
      List<ConditionalNavigateTo>? conditionalNavigateTo,
      @JsonKey(fromJson: _autoFillConditionListOrNull)
      List<AutoFillCondition>? autoFillCondition,
      @JsonKey(fromJson: _showAlertOrNull) ShowAlertPopUp? showAlertPopUp,
      @JsonKey(fromJson: _showSecondaryAlertOrNull)
      ShowSecondaryAlertPopUp? showSecondaryAlertPopUp,
      @JsonKey(fromJson: _multiEntityConfigOrNull)
      MultiEntityConfig? multiEntityConfig,
      bool? preventScreenCapture,
      @JsonKey(fromJson: _visibilityConditionOrNull)
      VisibilityCondition? submitCondition,
      String? secondaryActionLabel,
      @JsonKey(fromJson: _comparisonConfigOrNull)
      ComparisonConfig? comparisonConfig});

  $DisplayBehaviorCopyWith<$Res>? get displayBehavior;
  $NavigateToConfigCopyWith<$Res>? get navigateTo;
  $VisibilityConditionCopyWith<$Res>? get visibilityCondition;
  $ShowAlertPopUpCopyWith<$Res>? get showAlertPopUp;
  $ShowSecondaryAlertPopUpCopyWith<$Res>? get showSecondaryAlertPopUp;
  $MultiEntityConfigCopyWith<$Res>? get multiEntityConfig;
  $VisibilityConditionCopyWith<$Res>? get submitCondition;
  $ComparisonConfigCopyWith<$Res>? get comparisonConfig;
}

/// @nodoc
class _$PropertySchemaCopyWithImpl<$Res>
    implements $PropertySchemaCopyWith<$Res> {
  _$PropertySchemaCopyWithImpl(this._self, this._then);

  final PropertySchema _self;
  final $Res Function(PropertySchema) _then;

  /// Create a copy of PropertySchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? readOnly = freezed,
    Object? displayOnly = freezed,
    Object? hidden = freezed,
    Object? properties = freezed,
    Object? enums = freezed,
    Object? schemaCode = freezed,
    Object? systemDate = freezed,
    Object? charCount = freezed,
    Object? format = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? minValue = freezed,
    Object? maxValue = freezed,
    Object? minLength = freezed,
    Object? maxLength = freezed,
    Object? min = freezed,
    Object? max = freezed,
    Object? helpText = freezed,
    Object? tooltip = freezed,
    Object? prefixText = freezed,
    Object? suffixText = freezed,
    Object? innerLabel = freezed,
    Object? label = freezed,
    Object? isMultiSelect = freezed,
    Object? value = freezed,
    Object? displayBehavior = freezed,
    Object? conditions = freezed,
    Object? order = freezed,
    Object? actionLabel = freezed,
    Object? description = freezed,
    Object? validations = freezed,
    Object? includeInForm = freezed,
    Object? includeInSummary = freezed,
    Object? navigateTo = freezed,
    Object? visibilityCondition = freezed,
    Object? conditionalNavigateTo = freezed,
    Object? autoFillCondition = freezed,
    Object? showAlertPopUp = freezed,
    Object? showSecondaryAlertPopUp = freezed,
    Object? multiEntityConfig = freezed,
    Object? preventScreenCapture = freezed,
    Object? submitCondition = freezed,
    Object? secondaryActionLabel = freezed,
    Object? comparisonConfig = freezed,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as PropertySchemaType,
      readOnly: freezed == readOnly
          ? _self.readOnly
          : readOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      displayOnly: freezed == displayOnly
          ? _self.displayOnly
          : displayOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      hidden: freezed == hidden
          ? _self.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      properties: freezed == properties
          ? _self.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, PropertySchema>?,
      enums: freezed == enums
          ? _self.enums
          : enums // ignore: cast_nullable_to_non_nullable
              as List<Option>?,
      schemaCode: freezed == schemaCode
          ? _self.schemaCode
          : schemaCode // ignore: cast_nullable_to_non_nullable
              as String?,
      systemDate: freezed == systemDate
          ? _self.systemDate
          : systemDate // ignore: cast_nullable_to_non_nullable
              as bool?,
      charCount: freezed == charCount
          ? _self.charCount
          : charCount // ignore: cast_nullable_to_non_nullable
              as bool?,
      format: freezed == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as PropertySchemaFormat?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      minValue: freezed == minValue
          ? _self.minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as int?,
      maxValue: freezed == maxValue
          ? _self.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as int?,
      minLength: freezed == minLength
          ? _self.minLength
          : minLength // ignore: cast_nullable_to_non_nullable
              as int?,
      maxLength: freezed == maxLength
          ? _self.maxLength
          : maxLength // ignore: cast_nullable_to_non_nullable
              as int?,
      min: freezed == min
          ? _self.min
          : min // ignore: cast_nullable_to_non_nullable
              as int?,
      max: freezed == max
          ? _self.max
          : max // ignore: cast_nullable_to_non_nullable
              as int?,
      helpText: freezed == helpText
          ? _self.helpText
          : helpText // ignore: cast_nullable_to_non_nullable
              as String?,
      tooltip: freezed == tooltip
          ? _self.tooltip
          : tooltip // ignore: cast_nullable_to_non_nullable
              as String?,
      prefixText: freezed == prefixText
          ? _self.prefixText
          : prefixText // ignore: cast_nullable_to_non_nullable
              as String?,
      suffixText: freezed == suffixText
          ? _self.suffixText
          : suffixText // ignore: cast_nullable_to_non_nullable
              as String?,
      innerLabel: freezed == innerLabel
          ? _self.innerLabel
          : innerLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      isMultiSelect: freezed == isMultiSelect
          ? _self.isMultiSelect
          : isMultiSelect // ignore: cast_nullable_to_non_nullable
              as bool?,
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      displayBehavior: freezed == displayBehavior
          ? _self.displayBehavior
          : displayBehavior // ignore: cast_nullable_to_non_nullable
              as DisplayBehavior?,
      conditions: freezed == conditions
          ? _self.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      order: freezed == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as double?,
      actionLabel: freezed == actionLabel
          ? _self.actionLabel
          : actionLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      validations: freezed == validations
          ? _self.validations
          : validations // ignore: cast_nullable_to_non_nullable
              as List<ValidationRule>?,
      includeInForm: freezed == includeInForm
          ? _self.includeInForm
          : includeInForm // ignore: cast_nullable_to_non_nullable
              as bool?,
      includeInSummary: freezed == includeInSummary
          ? _self.includeInSummary
          : includeInSummary // ignore: cast_nullable_to_non_nullable
              as bool?,
      navigateTo: freezed == navigateTo
          ? _self.navigateTo
          : navigateTo // ignore: cast_nullable_to_non_nullable
              as NavigateToConfig?,
      visibilityCondition: freezed == visibilityCondition
          ? _self.visibilityCondition
          : visibilityCondition // ignore: cast_nullable_to_non_nullable
              as VisibilityCondition?,
      conditionalNavigateTo: freezed == conditionalNavigateTo
          ? _self.conditionalNavigateTo
          : conditionalNavigateTo // ignore: cast_nullable_to_non_nullable
              as List<ConditionalNavigateTo>?,
      autoFillCondition: freezed == autoFillCondition
          ? _self.autoFillCondition
          : autoFillCondition // ignore: cast_nullable_to_non_nullable
              as List<AutoFillCondition>?,
      showAlertPopUp: freezed == showAlertPopUp
          ? _self.showAlertPopUp
          : showAlertPopUp // ignore: cast_nullable_to_non_nullable
              as ShowAlertPopUp?,
      showSecondaryAlertPopUp: freezed == showSecondaryAlertPopUp
          ? _self.showSecondaryAlertPopUp
          : showSecondaryAlertPopUp // ignore: cast_nullable_to_non_nullable
              as ShowSecondaryAlertPopUp?,
      multiEntityConfig: freezed == multiEntityConfig
          ? _self.multiEntityConfig
          : multiEntityConfig // ignore: cast_nullable_to_non_nullable
              as MultiEntityConfig?,
      preventScreenCapture: freezed == preventScreenCapture
          ? _self.preventScreenCapture
          : preventScreenCapture // ignore: cast_nullable_to_non_nullable
              as bool?,
      submitCondition: freezed == submitCondition
          ? _self.submitCondition
          : submitCondition // ignore: cast_nullable_to_non_nullable
              as VisibilityCondition?,
      secondaryActionLabel: freezed == secondaryActionLabel
          ? _self.secondaryActionLabel
          : secondaryActionLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      comparisonConfig: freezed == comparisonConfig
          ? _self.comparisonConfig
          : comparisonConfig // ignore: cast_nullable_to_non_nullable
              as ComparisonConfig?,
    ));
  }

  /// Create a copy of PropertySchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DisplayBehaviorCopyWith<$Res>? get displayBehavior {
    if (_self.displayBehavior == null) {
      return null;
    }

    return $DisplayBehaviorCopyWith<$Res>(_self.displayBehavior!, (value) {
      return _then(_self.copyWith(displayBehavior: value));
    });
  }

  /// Create a copy of PropertySchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NavigateToConfigCopyWith<$Res>? get navigateTo {
    if (_self.navigateTo == null) {
      return null;
    }

    return $NavigateToConfigCopyWith<$Res>(_self.navigateTo!, (value) {
      return _then(_self.copyWith(navigateTo: value));
    });
  }

  /// Create a copy of PropertySchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VisibilityConditionCopyWith<$Res>? get visibilityCondition {
    if (_self.visibilityCondition == null) {
      return null;
    }

    return $VisibilityConditionCopyWith<$Res>(_self.visibilityCondition!,
        (value) {
      return _then(_self.copyWith(visibilityCondition: value));
    });
  }

  /// Create a copy of PropertySchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShowAlertPopUpCopyWith<$Res>? get showAlertPopUp {
    if (_self.showAlertPopUp == null) {
      return null;
    }

    return $ShowAlertPopUpCopyWith<$Res>(_self.showAlertPopUp!, (value) {
      return _then(_self.copyWith(showAlertPopUp: value));
    });
  }

  /// Create a copy of PropertySchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShowSecondaryAlertPopUpCopyWith<$Res>? get showSecondaryAlertPopUp {
    if (_self.showSecondaryAlertPopUp == null) {
      return null;
    }

    return $ShowSecondaryAlertPopUpCopyWith<$Res>(
        _self.showSecondaryAlertPopUp!, (value) {
      return _then(_self.copyWith(showSecondaryAlertPopUp: value));
    });
  }

  /// Create a copy of PropertySchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MultiEntityConfigCopyWith<$Res>? get multiEntityConfig {
    if (_self.multiEntityConfig == null) {
      return null;
    }

    return $MultiEntityConfigCopyWith<$Res>(_self.multiEntityConfig!, (value) {
      return _then(_self.copyWith(multiEntityConfig: value));
    });
  }

  /// Create a copy of PropertySchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VisibilityConditionCopyWith<$Res>? get submitCondition {
    if (_self.submitCondition == null) {
      return null;
    }

    return $VisibilityConditionCopyWith<$Res>(_self.submitCondition!, (value) {
      return _then(_self.copyWith(submitCondition: value));
    });
  }

  /// Create a copy of PropertySchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ComparisonConfigCopyWith<$Res>? get comparisonConfig {
    if (_self.comparisonConfig == null) {
      return null;
    }

    return $ComparisonConfigCopyWith<$Res>(_self.comparisonConfig!, (value) {
      return _then(_self.copyWith(comparisonConfig: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PropertySchema].
extension PropertySchemaPatterns on PropertySchema {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PropertySchema value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PropertySchema() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PropertySchema value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PropertySchema():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PropertySchema value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PropertySchema() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'type', unknownEnumValue: PropertySchemaType.string)
            PropertySchemaType type,
            bool? readOnly,
            bool? displayOnly,
            bool? hidden,
            Map<String, PropertySchema>? properties,
            List<Option>? enums,
            String? schemaCode,
            bool? systemDate,
            bool? charCount,
            @JsonKey(
                name: 'format', unknownEnumValue: PropertySchemaFormat.text)
            PropertySchemaFormat? format,
            @JsonKey(fromJson: _stringOrNull) String? startDate,
            @JsonKey(fromJson: _stringOrNull) String? endDate,
            @JsonKey(fromJson: _intOrNull) int? minValue,
            @JsonKey(fromJson: _intOrNull) int? maxValue,
            @JsonKey(fromJson: _intOrNull) int? minLength,
            @JsonKey(fromJson: _intOrNull) int? maxLength,
            @JsonKey(fromJson: _intOrNull) int? min,
            @JsonKey(fromJson: _intOrNull) int? max,
            String? helpText,
            String? tooltip,
            String? prefixText,
            String? suffixText,
            String? innerLabel,
            String? label,
            bool? isMultiSelect,
            dynamic value,
            DisplayBehavior? displayBehavior,
            Map<String, dynamic>? conditions,
            double? order,
            String? actionLabel,
            String? description,
            List<ValidationRule>? validations,
            bool? includeInForm,
            bool? includeInSummary,
            @JsonKey(fromJson: _navigateToConfigOrNull)
            NavigateToConfig? navigateTo,
            @JsonKey(fromJson: _visibilityConditionOrNull)
            VisibilityCondition? visibilityCondition,
            @JsonKey(fromJson: _conditionalNavigateListOrNull)
            List<ConditionalNavigateTo>? conditionalNavigateTo,
            @JsonKey(fromJson: _autoFillConditionListOrNull)
            List<AutoFillCondition>? autoFillCondition,
            @JsonKey(fromJson: _showAlertOrNull) ShowAlertPopUp? showAlertPopUp,
            @JsonKey(fromJson: _showSecondaryAlertOrNull)
            ShowSecondaryAlertPopUp? showSecondaryAlertPopUp,
            @JsonKey(fromJson: _multiEntityConfigOrNull)
            MultiEntityConfig? multiEntityConfig,
            bool? preventScreenCapture,
            @JsonKey(fromJson: _visibilityConditionOrNull)
            VisibilityCondition? submitCondition,
            String? secondaryActionLabel,
            @JsonKey(fromJson: _comparisonConfigOrNull)
            ComparisonConfig? comparisonConfig)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PropertySchema() when $default != null:
        return $default(
            _that.type,
            _that.readOnly,
            _that.displayOnly,
            _that.hidden,
            _that.properties,
            _that.enums,
            _that.schemaCode,
            _that.systemDate,
            _that.charCount,
            _that.format,
            _that.startDate,
            _that.endDate,
            _that.minValue,
            _that.maxValue,
            _that.minLength,
            _that.maxLength,
            _that.min,
            _that.max,
            _that.helpText,
            _that.tooltip,
            _that.prefixText,
            _that.suffixText,
            _that.innerLabel,
            _that.label,
            _that.isMultiSelect,
            _that.value,
            _that.displayBehavior,
            _that.conditions,
            _that.order,
            _that.actionLabel,
            _that.description,
            _that.validations,
            _that.includeInForm,
            _that.includeInSummary,
            _that.navigateTo,
            _that.visibilityCondition,
            _that.conditionalNavigateTo,
            _that.autoFillCondition,
            _that.showAlertPopUp,
            _that.showSecondaryAlertPopUp,
            _that.multiEntityConfig,
            _that.preventScreenCapture,
            _that.submitCondition,
            _that.secondaryActionLabel,
            _that.comparisonConfig);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'type', unknownEnumValue: PropertySchemaType.string)
            PropertySchemaType type,
            bool? readOnly,
            bool? displayOnly,
            bool? hidden,
            Map<String, PropertySchema>? properties,
            List<Option>? enums,
            String? schemaCode,
            bool? systemDate,
            bool? charCount,
            @JsonKey(
                name: 'format', unknownEnumValue: PropertySchemaFormat.text)
            PropertySchemaFormat? format,
            @JsonKey(fromJson: _stringOrNull) String? startDate,
            @JsonKey(fromJson: _stringOrNull) String? endDate,
            @JsonKey(fromJson: _intOrNull) int? minValue,
            @JsonKey(fromJson: _intOrNull) int? maxValue,
            @JsonKey(fromJson: _intOrNull) int? minLength,
            @JsonKey(fromJson: _intOrNull) int? maxLength,
            @JsonKey(fromJson: _intOrNull) int? min,
            @JsonKey(fromJson: _intOrNull) int? max,
            String? helpText,
            String? tooltip,
            String? prefixText,
            String? suffixText,
            String? innerLabel,
            String? label,
            bool? isMultiSelect,
            dynamic value,
            DisplayBehavior? displayBehavior,
            Map<String, dynamic>? conditions,
            double? order,
            String? actionLabel,
            String? description,
            List<ValidationRule>? validations,
            bool? includeInForm,
            bool? includeInSummary,
            @JsonKey(fromJson: _navigateToConfigOrNull)
            NavigateToConfig? navigateTo,
            @JsonKey(fromJson: _visibilityConditionOrNull)
            VisibilityCondition? visibilityCondition,
            @JsonKey(fromJson: _conditionalNavigateListOrNull)
            List<ConditionalNavigateTo>? conditionalNavigateTo,
            @JsonKey(fromJson: _autoFillConditionListOrNull)
            List<AutoFillCondition>? autoFillCondition,
            @JsonKey(fromJson: _showAlertOrNull) ShowAlertPopUp? showAlertPopUp,
            @JsonKey(fromJson: _showSecondaryAlertOrNull)
            ShowSecondaryAlertPopUp? showSecondaryAlertPopUp,
            @JsonKey(fromJson: _multiEntityConfigOrNull)
            MultiEntityConfig? multiEntityConfig,
            bool? preventScreenCapture,
            @JsonKey(fromJson: _visibilityConditionOrNull)
            VisibilityCondition? submitCondition,
            String? secondaryActionLabel,
            @JsonKey(fromJson: _comparisonConfigOrNull)
            ComparisonConfig? comparisonConfig)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PropertySchema():
        return $default(
            _that.type,
            _that.readOnly,
            _that.displayOnly,
            _that.hidden,
            _that.properties,
            _that.enums,
            _that.schemaCode,
            _that.systemDate,
            _that.charCount,
            _that.format,
            _that.startDate,
            _that.endDate,
            _that.minValue,
            _that.maxValue,
            _that.minLength,
            _that.maxLength,
            _that.min,
            _that.max,
            _that.helpText,
            _that.tooltip,
            _that.prefixText,
            _that.suffixText,
            _that.innerLabel,
            _that.label,
            _that.isMultiSelect,
            _that.value,
            _that.displayBehavior,
            _that.conditions,
            _that.order,
            _that.actionLabel,
            _that.description,
            _that.validations,
            _that.includeInForm,
            _that.includeInSummary,
            _that.navigateTo,
            _that.visibilityCondition,
            _that.conditionalNavigateTo,
            _that.autoFillCondition,
            _that.showAlertPopUp,
            _that.showSecondaryAlertPopUp,
            _that.multiEntityConfig,
            _that.preventScreenCapture,
            _that.submitCondition,
            _that.secondaryActionLabel,
            _that.comparisonConfig);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'type', unknownEnumValue: PropertySchemaType.string)
            PropertySchemaType type,
            bool? readOnly,
            bool? displayOnly,
            bool? hidden,
            Map<String, PropertySchema>? properties,
            List<Option>? enums,
            String? schemaCode,
            bool? systemDate,
            bool? charCount,
            @JsonKey(
                name: 'format', unknownEnumValue: PropertySchemaFormat.text)
            PropertySchemaFormat? format,
            @JsonKey(fromJson: _stringOrNull) String? startDate,
            @JsonKey(fromJson: _stringOrNull) String? endDate,
            @JsonKey(fromJson: _intOrNull) int? minValue,
            @JsonKey(fromJson: _intOrNull) int? maxValue,
            @JsonKey(fromJson: _intOrNull) int? minLength,
            @JsonKey(fromJson: _intOrNull) int? maxLength,
            @JsonKey(fromJson: _intOrNull) int? min,
            @JsonKey(fromJson: _intOrNull) int? max,
            String? helpText,
            String? tooltip,
            String? prefixText,
            String? suffixText,
            String? innerLabel,
            String? label,
            bool? isMultiSelect,
            dynamic value,
            DisplayBehavior? displayBehavior,
            Map<String, dynamic>? conditions,
            double? order,
            String? actionLabel,
            String? description,
            List<ValidationRule>? validations,
            bool? includeInForm,
            bool? includeInSummary,
            @JsonKey(fromJson: _navigateToConfigOrNull)
            NavigateToConfig? navigateTo,
            @JsonKey(fromJson: _visibilityConditionOrNull)
            VisibilityCondition? visibilityCondition,
            @JsonKey(fromJson: _conditionalNavigateListOrNull)
            List<ConditionalNavigateTo>? conditionalNavigateTo,
            @JsonKey(fromJson: _autoFillConditionListOrNull)
            List<AutoFillCondition>? autoFillCondition,
            @JsonKey(fromJson: _showAlertOrNull) ShowAlertPopUp? showAlertPopUp,
            @JsonKey(fromJson: _showSecondaryAlertOrNull)
            ShowSecondaryAlertPopUp? showSecondaryAlertPopUp,
            @JsonKey(fromJson: _multiEntityConfigOrNull)
            MultiEntityConfig? multiEntityConfig,
            bool? preventScreenCapture,
            @JsonKey(fromJson: _visibilityConditionOrNull)
            VisibilityCondition? submitCondition,
            String? secondaryActionLabel,
            @JsonKey(fromJson: _comparisonConfigOrNull)
            ComparisonConfig? comparisonConfig)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PropertySchema() when $default != null:
        return $default(
            _that.type,
            _that.readOnly,
            _that.displayOnly,
            _that.hidden,
            _that.properties,
            _that.enums,
            _that.schemaCode,
            _that.systemDate,
            _that.charCount,
            _that.format,
            _that.startDate,
            _that.endDate,
            _that.minValue,
            _that.maxValue,
            _that.minLength,
            _that.maxLength,
            _that.min,
            _that.max,
            _that.helpText,
            _that.tooltip,
            _that.prefixText,
            _that.suffixText,
            _that.innerLabel,
            _that.label,
            _that.isMultiSelect,
            _that.value,
            _that.displayBehavior,
            _that.conditions,
            _that.order,
            _that.actionLabel,
            _that.description,
            _that.validations,
            _that.includeInForm,
            _that.includeInSummary,
            _that.navigateTo,
            _that.visibilityCondition,
            _that.conditionalNavigateTo,
            _that.autoFillCondition,
            _that.showAlertPopUp,
            _that.showSecondaryAlertPopUp,
            _that.multiEntityConfig,
            _that.preventScreenCapture,
            _that.submitCondition,
            _that.secondaryActionLabel,
            _that.comparisonConfig);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _PropertySchema implements PropertySchema {
  const _PropertySchema(
      {@JsonKey(name: 'type', unknownEnumValue: PropertySchemaType.string)
      required this.type,
      this.readOnly,
      this.displayOnly,
      this.hidden,
      final Map<String, PropertySchema>? properties,
      final List<Option>? enums,
      this.schemaCode,
      this.systemDate,
      this.charCount,
      @JsonKey(name: 'format', unknownEnumValue: PropertySchemaFormat.text)
      this.format,
      @JsonKey(fromJson: _stringOrNull) this.startDate,
      @JsonKey(fromJson: _stringOrNull) this.endDate,
      @JsonKey(fromJson: _intOrNull) this.minValue,
      @JsonKey(fromJson: _intOrNull) this.maxValue,
      @JsonKey(fromJson: _intOrNull) this.minLength,
      @JsonKey(fromJson: _intOrNull) this.maxLength,
      @JsonKey(fromJson: _intOrNull) this.min,
      @JsonKey(fromJson: _intOrNull) this.max,
      this.helpText,
      this.tooltip,
      this.prefixText,
      this.suffixText,
      this.innerLabel,
      this.label,
      this.isMultiSelect,
      this.value,
      this.displayBehavior,
      final Map<String, dynamic>? conditions,
      this.order,
      this.actionLabel,
      this.description,
      final List<ValidationRule>? validations,
      this.includeInForm,
      this.includeInSummary,
      @JsonKey(fromJson: _navigateToConfigOrNull) this.navigateTo,
      @JsonKey(fromJson: _visibilityConditionOrNull) this.visibilityCondition,
      @JsonKey(fromJson: _conditionalNavigateListOrNull)
      final List<ConditionalNavigateTo>? conditionalNavigateTo,
      @JsonKey(fromJson: _autoFillConditionListOrNull)
      final List<AutoFillCondition>? autoFillCondition,
      @JsonKey(fromJson: _showAlertOrNull) this.showAlertPopUp,
      @JsonKey(fromJson: _showSecondaryAlertOrNull)
      this.showSecondaryAlertPopUp,
      @JsonKey(fromJson: _multiEntityConfigOrNull) this.multiEntityConfig,
      this.preventScreenCapture,
      @JsonKey(fromJson: _visibilityConditionOrNull) this.submitCondition,
      this.secondaryActionLabel,
      @JsonKey(fromJson: _comparisonConfigOrNull) this.comparisonConfig})
      : _properties = properties,
        _enums = enums,
        _conditions = conditions,
        _validations = validations,
        _conditionalNavigateTo = conditionalNavigateTo,
        _autoFillCondition = autoFillCondition;
  factory _PropertySchema.fromJson(Map<String, dynamic> json) =>
      _$PropertySchemaFromJson(json);

  @override
  @JsonKey(name: 'type', unknownEnumValue: PropertySchemaType.string)
  final PropertySchemaType type;
  @override
  final bool? readOnly;
  @override
  final bool? displayOnly;
  @override
  final bool? hidden;
  final Map<String, PropertySchema>? _properties;
  @override
  Map<String, PropertySchema>? get properties {
    final value = _properties;
    if (value == null) return null;
    if (_properties is EqualUnmodifiableMapView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<Option>? _enums;
  @override
  List<Option>? get enums {
    final value = _enums;
    if (value == null) return null;
    if (_enums is EqualUnmodifiableListView) return _enums;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? schemaCode;
  @override
  final bool? systemDate;
  @override
  final bool? charCount;
  @override
  @JsonKey(name: 'format', unknownEnumValue: PropertySchemaFormat.text)
  final PropertySchemaFormat? format;
  @override
  @JsonKey(fromJson: _stringOrNull)
  final String? startDate;
  @override
  @JsonKey(fromJson: _stringOrNull)
  final String? endDate;
  @override
  @JsonKey(fromJson: _intOrNull)
  final int? minValue;
  @override
  @JsonKey(fromJson: _intOrNull)
  final int? maxValue;
  @override
  @JsonKey(fromJson: _intOrNull)
  final int? minLength;
  @override
  @JsonKey(fromJson: _intOrNull)
  final int? maxLength;
  @override
  @JsonKey(fromJson: _intOrNull)
  final int? min;
  @override
  @JsonKey(fromJson: _intOrNull)
  final int? max;
  @override
  final String? helpText;
  @override
  final String? tooltip;
  @override
  final String? prefixText;
  @override
  final String? suffixText;
  @override
  final String? innerLabel;
  @override
  final String? label;
  @override
  final bool? isMultiSelect;
  @override
  final dynamic value;
  @override
  final DisplayBehavior? displayBehavior;
  final Map<String, dynamic>? _conditions;
  @override
  Map<String, dynamic>? get conditions {
    final value = _conditions;
    if (value == null) return null;
    if (_conditions is EqualUnmodifiableMapView) return _conditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final double? order;
  @override
  final String? actionLabel;
  @override
  final String? description;
  final List<ValidationRule>? _validations;
  @override
  List<ValidationRule>? get validations {
    final value = _validations;
    if (value == null) return null;
    if (_validations is EqualUnmodifiableListView) return _validations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? includeInForm;
  @override
  final bool? includeInSummary;
  @override
  @JsonKey(fromJson: _navigateToConfigOrNull)
  final NavigateToConfig? navigateTo;
  @override
  @JsonKey(fromJson: _visibilityConditionOrNull)
  final VisibilityCondition? visibilityCondition;
  final List<ConditionalNavigateTo>? _conditionalNavigateTo;
  @override
  @JsonKey(fromJson: _conditionalNavigateListOrNull)
  List<ConditionalNavigateTo>? get conditionalNavigateTo {
    final value = _conditionalNavigateTo;
    if (value == null) return null;
    if (_conditionalNavigateTo is EqualUnmodifiableListView)
      return _conditionalNavigateTo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// New: AutoFillCondition list
  final List<AutoFillCondition>? _autoFillCondition;
// New: AutoFillCondition list
  @override
  @JsonKey(fromJson: _autoFillConditionListOrNull)
  List<AutoFillCondition>? get autoFillCondition {
    final value = _autoFillCondition;
    if (value == null) return null;
    if (_autoFillCondition is EqualUnmodifiableListView)
      return _autoFillCondition;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(fromJson: _showAlertOrNull)
  final ShowAlertPopUp? showAlertPopUp;
// Secondary action alert popup (e.g., for reject confirmation with comment)
  @override
  @JsonKey(fromJson: _showSecondaryAlertOrNull)
  final ShowSecondaryAlertPopUp? showSecondaryAlertPopUp;
// Multi-entity tab configuration
  @override
  @JsonKey(fromJson: _multiEntityConfigOrNull)
  final MultiEntityConfig? multiEntityConfig;
// Screenshot protection for this page
  @override
  final bool? preventScreenCapture;
// Submit condition for pages - when true, form submits directly instead of navigating to next page
  @override
  @JsonKey(fromJson: _visibilityConditionOrNull)
  final VisibilityCondition? submitCondition;
// Secondary action button label (e.g., "Decline" button alongside "Accept")
  @override
  final String? secondaryActionLabel;
// Comparison config for scanner fields - enables duplicate detection against historical data
  @override
  @JsonKey(fromJson: _comparisonConfigOrNull)
  final ComparisonConfig? comparisonConfig;

  /// Create a copy of PropertySchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PropertySchemaCopyWith<_PropertySchema> get copyWith =>
      __$PropertySchemaCopyWithImpl<_PropertySchema>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PropertySchemaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PropertySchema &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.readOnly, readOnly) ||
                other.readOnly == readOnly) &&
            (identical(other.displayOnly, displayOnly) ||
                other.displayOnly == displayOnly) &&
            (identical(other.hidden, hidden) || other.hidden == hidden) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            const DeepCollectionEquality().equals(other._enums, _enums) &&
            (identical(other.schemaCode, schemaCode) ||
                other.schemaCode == schemaCode) &&
            (identical(other.systemDate, systemDate) ||
                other.systemDate == systemDate) &&
            (identical(other.charCount, charCount) ||
                other.charCount == charCount) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.minValue, minValue) ||
                other.minValue == minValue) &&
            (identical(other.maxValue, maxValue) ||
                other.maxValue == maxValue) &&
            (identical(other.minLength, minLength) ||
                other.minLength == minLength) &&
            (identical(other.maxLength, maxLength) ||
                other.maxLength == maxLength) &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.helpText, helpText) ||
                other.helpText == helpText) &&
            (identical(other.tooltip, tooltip) || other.tooltip == tooltip) &&
            (identical(other.prefixText, prefixText) ||
                other.prefixText == prefixText) &&
            (identical(other.suffixText, suffixText) ||
                other.suffixText == suffixText) &&
            (identical(other.innerLabel, innerLabel) ||
                other.innerLabel == innerLabel) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.isMultiSelect, isMultiSelect) ||
                other.isMultiSelect == isMultiSelect) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.displayBehavior, displayBehavior) ||
                other.displayBehavior == displayBehavior) &&
            const DeepCollectionEquality()
                .equals(other._conditions, _conditions) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.actionLabel, actionLabel) ||
                other.actionLabel == actionLabel) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._validations, _validations) &&
            (identical(other.includeInForm, includeInForm) ||
                other.includeInForm == includeInForm) &&
            (identical(other.includeInSummary, includeInSummary) ||
                other.includeInSummary == includeInSummary) &&
            (identical(other.navigateTo, navigateTo) ||
                other.navigateTo == navigateTo) &&
            (identical(other.visibilityCondition, visibilityCondition) ||
                other.visibilityCondition == visibilityCondition) &&
            const DeepCollectionEquality()
                .equals(other._conditionalNavigateTo, _conditionalNavigateTo) &&
            const DeepCollectionEquality()
                .equals(other._autoFillCondition, _autoFillCondition) &&
            (identical(other.showAlertPopUp, showAlertPopUp) ||
                other.showAlertPopUp == showAlertPopUp) &&
            (identical(
                    other.showSecondaryAlertPopUp, showSecondaryAlertPopUp) ||
                other.showSecondaryAlertPopUp == showSecondaryAlertPopUp) &&
            (identical(other.multiEntityConfig, multiEntityConfig) ||
                other.multiEntityConfig == multiEntityConfig) &&
            (identical(other.preventScreenCapture, preventScreenCapture) ||
                other.preventScreenCapture == preventScreenCapture) &&
            (identical(other.submitCondition, submitCondition) ||
                other.submitCondition == submitCondition) &&
            (identical(other.secondaryActionLabel, secondaryActionLabel) ||
                other.secondaryActionLabel == secondaryActionLabel) &&
            (identical(other.comparisonConfig, comparisonConfig) ||
                other.comparisonConfig == comparisonConfig));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        type,
        readOnly,
        displayOnly,
        hidden,
        const DeepCollectionEquality().hash(_properties),
        const DeepCollectionEquality().hash(_enums),
        schemaCode,
        systemDate,
        charCount,
        format,
        startDate,
        endDate,
        minValue,
        maxValue,
        minLength,
        maxLength,
        min,
        max,
        helpText,
        tooltip,
        prefixText,
        suffixText,
        innerLabel,
        label,
        isMultiSelect,
        const DeepCollectionEquality().hash(value),
        displayBehavior,
        const DeepCollectionEquality().hash(_conditions),
        order,
        actionLabel,
        description,
        const DeepCollectionEquality().hash(_validations),
        includeInForm,
        includeInSummary,
        navigateTo,
        visibilityCondition,
        const DeepCollectionEquality().hash(_conditionalNavigateTo),
        const DeepCollectionEquality().hash(_autoFillCondition),
        showAlertPopUp,
        showSecondaryAlertPopUp,
        multiEntityConfig,
        preventScreenCapture,
        submitCondition,
        secondaryActionLabel,
        comparisonConfig
      ]);

  @override
  String toString() {
    return 'PropertySchema(type: $type, readOnly: $readOnly, displayOnly: $displayOnly, hidden: $hidden, properties: $properties, enums: $enums, schemaCode: $schemaCode, systemDate: $systemDate, charCount: $charCount, format: $format, startDate: $startDate, endDate: $endDate, minValue: $minValue, maxValue: $maxValue, minLength: $minLength, maxLength: $maxLength, min: $min, max: $max, helpText: $helpText, tooltip: $tooltip, prefixText: $prefixText, suffixText: $suffixText, innerLabel: $innerLabel, label: $label, isMultiSelect: $isMultiSelect, value: $value, displayBehavior: $displayBehavior, conditions: $conditions, order: $order, actionLabel: $actionLabel, description: $description, validations: $validations, includeInForm: $includeInForm, includeInSummary: $includeInSummary, navigateTo: $navigateTo, visibilityCondition: $visibilityCondition, conditionalNavigateTo: $conditionalNavigateTo, autoFillCondition: $autoFillCondition, showAlertPopUp: $showAlertPopUp, showSecondaryAlertPopUp: $showSecondaryAlertPopUp, multiEntityConfig: $multiEntityConfig, preventScreenCapture: $preventScreenCapture, submitCondition: $submitCondition, secondaryActionLabel: $secondaryActionLabel, comparisonConfig: $comparisonConfig)';
  }
}

/// @nodoc
abstract mixin class _$PropertySchemaCopyWith<$Res>
    implements $PropertySchemaCopyWith<$Res> {
  factory _$PropertySchemaCopyWith(
          _PropertySchema value, $Res Function(_PropertySchema) _then) =
      __$PropertySchemaCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type', unknownEnumValue: PropertySchemaType.string)
      PropertySchemaType type,
      bool? readOnly,
      bool? displayOnly,
      bool? hidden,
      Map<String, PropertySchema>? properties,
      List<Option>? enums,
      String? schemaCode,
      bool? systemDate,
      bool? charCount,
      @JsonKey(name: 'format', unknownEnumValue: PropertySchemaFormat.text)
      PropertySchemaFormat? format,
      @JsonKey(fromJson: _stringOrNull) String? startDate,
      @JsonKey(fromJson: _stringOrNull) String? endDate,
      @JsonKey(fromJson: _intOrNull) int? minValue,
      @JsonKey(fromJson: _intOrNull) int? maxValue,
      @JsonKey(fromJson: _intOrNull) int? minLength,
      @JsonKey(fromJson: _intOrNull) int? maxLength,
      @JsonKey(fromJson: _intOrNull) int? min,
      @JsonKey(fromJson: _intOrNull) int? max,
      String? helpText,
      String? tooltip,
      String? prefixText,
      String? suffixText,
      String? innerLabel,
      String? label,
      bool? isMultiSelect,
      dynamic value,
      DisplayBehavior? displayBehavior,
      Map<String, dynamic>? conditions,
      double? order,
      String? actionLabel,
      String? description,
      List<ValidationRule>? validations,
      bool? includeInForm,
      bool? includeInSummary,
      @JsonKey(fromJson: _navigateToConfigOrNull) NavigateToConfig? navigateTo,
      @JsonKey(fromJson: _visibilityConditionOrNull)
      VisibilityCondition? visibilityCondition,
      @JsonKey(fromJson: _conditionalNavigateListOrNull)
      List<ConditionalNavigateTo>? conditionalNavigateTo,
      @JsonKey(fromJson: _autoFillConditionListOrNull)
      List<AutoFillCondition>? autoFillCondition,
      @JsonKey(fromJson: _showAlertOrNull) ShowAlertPopUp? showAlertPopUp,
      @JsonKey(fromJson: _showSecondaryAlertOrNull)
      ShowSecondaryAlertPopUp? showSecondaryAlertPopUp,
      @JsonKey(fromJson: _multiEntityConfigOrNull)
      MultiEntityConfig? multiEntityConfig,
      bool? preventScreenCapture,
      @JsonKey(fromJson: _visibilityConditionOrNull)
      VisibilityCondition? submitCondition,
      String? secondaryActionLabel,
      @JsonKey(fromJson: _comparisonConfigOrNull)
      ComparisonConfig? comparisonConfig});

  @override
  $DisplayBehaviorCopyWith<$Res>? get displayBehavior;
  @override
  $NavigateToConfigCopyWith<$Res>? get navigateTo;
  @override
  $VisibilityConditionCopyWith<$Res>? get visibilityCondition;
  @override
  $ShowAlertPopUpCopyWith<$Res>? get showAlertPopUp;
  @override
  $ShowSecondaryAlertPopUpCopyWith<$Res>? get showSecondaryAlertPopUp;
  @override
  $MultiEntityConfigCopyWith<$Res>? get multiEntityConfig;
  @override
  $VisibilityConditionCopyWith<$Res>? get submitCondition;
  @override
  $ComparisonConfigCopyWith<$Res>? get comparisonConfig;
}

/// @nodoc
class __$PropertySchemaCopyWithImpl<$Res>
    implements _$PropertySchemaCopyWith<$Res> {
  __$PropertySchemaCopyWithImpl(this._self, this._then);

  final _PropertySchema _self;
  final $Res Function(_PropertySchema) _then;

  /// Create a copy of PropertySchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? readOnly = freezed,
    Object? displayOnly = freezed,
    Object? hidden = freezed,
    Object? properties = freezed,
    Object? enums = freezed,
    Object? schemaCode = freezed,
    Object? systemDate = freezed,
    Object? charCount = freezed,
    Object? format = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? minValue = freezed,
    Object? maxValue = freezed,
    Object? minLength = freezed,
    Object? maxLength = freezed,
    Object? min = freezed,
    Object? max = freezed,
    Object? helpText = freezed,
    Object? tooltip = freezed,
    Object? prefixText = freezed,
    Object? suffixText = freezed,
    Object? innerLabel = freezed,
    Object? label = freezed,
    Object? isMultiSelect = freezed,
    Object? value = freezed,
    Object? displayBehavior = freezed,
    Object? conditions = freezed,
    Object? order = freezed,
    Object? actionLabel = freezed,
    Object? description = freezed,
    Object? validations = freezed,
    Object? includeInForm = freezed,
    Object? includeInSummary = freezed,
    Object? navigateTo = freezed,
    Object? visibilityCondition = freezed,
    Object? conditionalNavigateTo = freezed,
    Object? autoFillCondition = freezed,
    Object? showAlertPopUp = freezed,
    Object? showSecondaryAlertPopUp = freezed,
    Object? multiEntityConfig = freezed,
    Object? preventScreenCapture = freezed,
    Object? submitCondition = freezed,
    Object? secondaryActionLabel = freezed,
    Object? comparisonConfig = freezed,
  }) {
    return _then(_PropertySchema(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as PropertySchemaType,
      readOnly: freezed == readOnly
          ? _self.readOnly
          : readOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      displayOnly: freezed == displayOnly
          ? _self.displayOnly
          : displayOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      hidden: freezed == hidden
          ? _self.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      properties: freezed == properties
          ? _self._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, PropertySchema>?,
      enums: freezed == enums
          ? _self._enums
          : enums // ignore: cast_nullable_to_non_nullable
              as List<Option>?,
      schemaCode: freezed == schemaCode
          ? _self.schemaCode
          : schemaCode // ignore: cast_nullable_to_non_nullable
              as String?,
      systemDate: freezed == systemDate
          ? _self.systemDate
          : systemDate // ignore: cast_nullable_to_non_nullable
              as bool?,
      charCount: freezed == charCount
          ? _self.charCount
          : charCount // ignore: cast_nullable_to_non_nullable
              as bool?,
      format: freezed == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as PropertySchemaFormat?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      minValue: freezed == minValue
          ? _self.minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as int?,
      maxValue: freezed == maxValue
          ? _self.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as int?,
      minLength: freezed == minLength
          ? _self.minLength
          : minLength // ignore: cast_nullable_to_non_nullable
              as int?,
      maxLength: freezed == maxLength
          ? _self.maxLength
          : maxLength // ignore: cast_nullable_to_non_nullable
              as int?,
      min: freezed == min
          ? _self.min
          : min // ignore: cast_nullable_to_non_nullable
              as int?,
      max: freezed == max
          ? _self.max
          : max // ignore: cast_nullable_to_non_nullable
              as int?,
      helpText: freezed == helpText
          ? _self.helpText
          : helpText // ignore: cast_nullable_to_non_nullable
              as String?,
      tooltip: freezed == tooltip
          ? _self.tooltip
          : tooltip // ignore: cast_nullable_to_non_nullable
              as String?,
      prefixText: freezed == prefixText
          ? _self.prefixText
          : prefixText // ignore: cast_nullable_to_non_nullable
              as String?,
      suffixText: freezed == suffixText
          ? _self.suffixText
          : suffixText // ignore: cast_nullable_to_non_nullable
              as String?,
      innerLabel: freezed == innerLabel
          ? _self.innerLabel
          : innerLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      isMultiSelect: freezed == isMultiSelect
          ? _self.isMultiSelect
          : isMultiSelect // ignore: cast_nullable_to_non_nullable
              as bool?,
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      displayBehavior: freezed == displayBehavior
          ? _self.displayBehavior
          : displayBehavior // ignore: cast_nullable_to_non_nullable
              as DisplayBehavior?,
      conditions: freezed == conditions
          ? _self._conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      order: freezed == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as double?,
      actionLabel: freezed == actionLabel
          ? _self.actionLabel
          : actionLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      validations: freezed == validations
          ? _self._validations
          : validations // ignore: cast_nullable_to_non_nullable
              as List<ValidationRule>?,
      includeInForm: freezed == includeInForm
          ? _self.includeInForm
          : includeInForm // ignore: cast_nullable_to_non_nullable
              as bool?,
      includeInSummary: freezed == includeInSummary
          ? _self.includeInSummary
          : includeInSummary // ignore: cast_nullable_to_non_nullable
              as bool?,
      navigateTo: freezed == navigateTo
          ? _self.navigateTo
          : navigateTo // ignore: cast_nullable_to_non_nullable
              as NavigateToConfig?,
      visibilityCondition: freezed == visibilityCondition
          ? _self.visibilityCondition
          : visibilityCondition // ignore: cast_nullable_to_non_nullable
              as VisibilityCondition?,
      conditionalNavigateTo: freezed == conditionalNavigateTo
          ? _self._conditionalNavigateTo
          : conditionalNavigateTo // ignore: cast_nullable_to_non_nullable
              as List<ConditionalNavigateTo>?,
      autoFillCondition: freezed == autoFillCondition
          ? _self._autoFillCondition
          : autoFillCondition // ignore: cast_nullable_to_non_nullable
              as List<AutoFillCondition>?,
      showAlertPopUp: freezed == showAlertPopUp
          ? _self.showAlertPopUp
          : showAlertPopUp // ignore: cast_nullable_to_non_nullable
              as ShowAlertPopUp?,
      showSecondaryAlertPopUp: freezed == showSecondaryAlertPopUp
          ? _self.showSecondaryAlertPopUp
          : showSecondaryAlertPopUp // ignore: cast_nullable_to_non_nullable
              as ShowSecondaryAlertPopUp?,
      multiEntityConfig: freezed == multiEntityConfig
          ? _self.multiEntityConfig
          : multiEntityConfig // ignore: cast_nullable_to_non_nullable
              as MultiEntityConfig?,
      preventScreenCapture: freezed == preventScreenCapture
          ? _self.preventScreenCapture
          : preventScreenCapture // ignore: cast_nullable_to_non_nullable
              as bool?,
      submitCondition: freezed == submitCondition
          ? _self.submitCondition
          : submitCondition // ignore: cast_nullable_to_non_nullable
              as VisibilityCondition?,
      secondaryActionLabel: freezed == secondaryActionLabel
          ? _self.secondaryActionLabel
          : secondaryActionLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      comparisonConfig: freezed == comparisonConfig
          ? _self.comparisonConfig
          : comparisonConfig // ignore: cast_nullable_to_non_nullable
              as ComparisonConfig?,
    ));
  }

  /// Create a copy of PropertySchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DisplayBehaviorCopyWith<$Res>? get displayBehavior {
    if (_self.displayBehavior == null) {
      return null;
    }

    return $DisplayBehaviorCopyWith<$Res>(_self.displayBehavior!, (value) {
      return _then(_self.copyWith(displayBehavior: value));
    });
  }

  /// Create a copy of PropertySchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NavigateToConfigCopyWith<$Res>? get navigateTo {
    if (_self.navigateTo == null) {
      return null;
    }

    return $NavigateToConfigCopyWith<$Res>(_self.navigateTo!, (value) {
      return _then(_self.copyWith(navigateTo: value));
    });
  }

  /// Create a copy of PropertySchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VisibilityConditionCopyWith<$Res>? get visibilityCondition {
    if (_self.visibilityCondition == null) {
      return null;
    }

    return $VisibilityConditionCopyWith<$Res>(_self.visibilityCondition!,
        (value) {
      return _then(_self.copyWith(visibilityCondition: value));
    });
  }

  /// Create a copy of PropertySchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShowAlertPopUpCopyWith<$Res>? get showAlertPopUp {
    if (_self.showAlertPopUp == null) {
      return null;
    }

    return $ShowAlertPopUpCopyWith<$Res>(_self.showAlertPopUp!, (value) {
      return _then(_self.copyWith(showAlertPopUp: value));
    });
  }

  /// Create a copy of PropertySchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShowSecondaryAlertPopUpCopyWith<$Res>? get showSecondaryAlertPopUp {
    if (_self.showSecondaryAlertPopUp == null) {
      return null;
    }

    return $ShowSecondaryAlertPopUpCopyWith<$Res>(
        _self.showSecondaryAlertPopUp!, (value) {
      return _then(_self.copyWith(showSecondaryAlertPopUp: value));
    });
  }

  /// Create a copy of PropertySchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MultiEntityConfigCopyWith<$Res>? get multiEntityConfig {
    if (_self.multiEntityConfig == null) {
      return null;
    }

    return $MultiEntityConfigCopyWith<$Res>(_self.multiEntityConfig!, (value) {
      return _then(_self.copyWith(multiEntityConfig: value));
    });
  }

  /// Create a copy of PropertySchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VisibilityConditionCopyWith<$Res>? get submitCondition {
    if (_self.submitCondition == null) {
      return null;
    }

    return $VisibilityConditionCopyWith<$Res>(_self.submitCondition!, (value) {
      return _then(_self.copyWith(submitCondition: value));
    });
  }

  /// Create a copy of PropertySchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ComparisonConfigCopyWith<$Res>? get comparisonConfig {
    if (_self.comparisonConfig == null) {
      return null;
    }

    return $ComparisonConfigCopyWith<$Res>(_self.comparisonConfig!, (value) {
      return _then(_self.copyWith(comparisonConfig: value));
    });
  }
}

/// @nodoc
mixin _$ValidationRule {
  String get type;
  dynamic get value;
  String? get message;

  /// Create a copy of ValidationRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ValidationRuleCopyWith<ValidationRule> get copyWith =>
      _$ValidationRuleCopyWithImpl<ValidationRule>(
          this as ValidationRule, _$identity);

  /// Serializes this ValidationRule to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ValidationRule &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(value), message);

  @override
  String toString() {
    return 'ValidationRule(type: $type, value: $value, message: $message)';
  }
}

/// @nodoc
abstract mixin class $ValidationRuleCopyWith<$Res> {
  factory $ValidationRuleCopyWith(
          ValidationRule value, $Res Function(ValidationRule) _then) =
      _$ValidationRuleCopyWithImpl;
  @useResult
  $Res call({String type, dynamic value, String? message});
}

/// @nodoc
class _$ValidationRuleCopyWithImpl<$Res>
    implements $ValidationRuleCopyWith<$Res> {
  _$ValidationRuleCopyWithImpl(this._self, this._then);

  final ValidationRule _self;
  final $Res Function(ValidationRule) _then;

  /// Create a copy of ValidationRule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = freezed,
    Object? message = freezed,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ValidationRule].
extension ValidationRulePatterns on ValidationRule {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ValidationRule value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ValidationRule() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ValidationRule value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValidationRule():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ValidationRule value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValidationRule() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String type, dynamic value, String? message)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ValidationRule() when $default != null:
        return $default(_that.type, _that.value, _that.message);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String type, dynamic value, String? message) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValidationRule():
        return $default(_that.type, _that.value, _that.message);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String type, dynamic value, String? message)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValidationRule() when $default != null:
        return $default(_that.type, _that.value, _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ValidationRule implements ValidationRule {
  const _ValidationRule({required this.type, this.value, this.message});
  factory _ValidationRule.fromJson(Map<String, dynamic> json) =>
      _$ValidationRuleFromJson(json);

  @override
  final String type;
  @override
  final dynamic value;
  @override
  final String? message;

  /// Create a copy of ValidationRule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ValidationRuleCopyWith<_ValidationRule> get copyWith =>
      __$ValidationRuleCopyWithImpl<_ValidationRule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ValidationRuleToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ValidationRule &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(value), message);

  @override
  String toString() {
    return 'ValidationRule(type: $type, value: $value, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ValidationRuleCopyWith<$Res>
    implements $ValidationRuleCopyWith<$Res> {
  factory _$ValidationRuleCopyWith(
          _ValidationRule value, $Res Function(_ValidationRule) _then) =
      __$ValidationRuleCopyWithImpl;
  @override
  @useResult
  $Res call({String type, dynamic value, String? message});
}

/// @nodoc
class __$ValidationRuleCopyWithImpl<$Res>
    implements _$ValidationRuleCopyWith<$Res> {
  __$ValidationRuleCopyWithImpl(this._self, this._then);

  final _ValidationRule _self;
  final $Res Function(_ValidationRule) _then;

  /// Create a copy of ValidationRule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? value = freezed,
    Object? message = freezed,
  }) {
    return _then(_ValidationRule(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$Option {
  String get code;
  String get name;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OptionCopyWith<Option> get copyWith =>
      _$OptionCopyWithImpl<Option>(this as Option, _$identity);

  /// Serializes this Option to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Option &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name);

  @override
  String toString() {
    return 'Option(code: $code, name: $name)';
  }
}

/// @nodoc
abstract mixin class $OptionCopyWith<$Res> {
  factory $OptionCopyWith(Option value, $Res Function(Option) _then) =
      _$OptionCopyWithImpl;
  @useResult
  $Res call({String code, String name});
}

/// @nodoc
class _$OptionCopyWithImpl<$Res> implements $OptionCopyWith<$Res> {
  _$OptionCopyWithImpl(this._self, this._then);

  final Option _self;
  final $Res Function(Option) _then;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Option].
extension OptionPatterns on Option {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Option value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Option() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Option value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Option():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Option value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Option() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String code, String name)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Option() when $default != null:
        return $default(_that.code, _that.name);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String code, String name) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Option():
        return $default(_that.code, _that.name);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String code, String name)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Option() when $default != null:
        return $default(_that.code, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Option implements Option {
  const _Option({required this.code, required this.name});
  factory _Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

  @override
  final String code;
  @override
  final String name;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OptionCopyWith<_Option> get copyWith =>
      __$OptionCopyWithImpl<_Option>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OptionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Option &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name);

  @override
  String toString() {
    return 'Option(code: $code, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$OptionCopyWith<$Res> implements $OptionCopyWith<$Res> {
  factory _$OptionCopyWith(_Option value, $Res Function(_Option) _then) =
      __$OptionCopyWithImpl;
  @override
  @useResult
  $Res call({String code, String name});
}

/// @nodoc
class __$OptionCopyWithImpl<$Res> implements _$OptionCopyWith<$Res> {
  __$OptionCopyWithImpl(this._self, this._then);

  final _Option _self;
  final $Res Function(_Option) _then;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? name = null,
  }) {
    return _then(_Option(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$DisplayBehavior {
  FormulaBehavior get behavior;
  List<String>? get oneOf;
  List<String>? get allOf;

  /// Create a copy of DisplayBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DisplayBehaviorCopyWith<DisplayBehavior> get copyWith =>
      _$DisplayBehaviorCopyWithImpl<DisplayBehavior>(
          this as DisplayBehavior, _$identity);

  /// Serializes this DisplayBehavior to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DisplayBehavior &&
            (identical(other.behavior, behavior) ||
                other.behavior == behavior) &&
            const DeepCollectionEquality().equals(other.oneOf, oneOf) &&
            const DeepCollectionEquality().equals(other.allOf, allOf));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      behavior,
      const DeepCollectionEquality().hash(oneOf),
      const DeepCollectionEquality().hash(allOf));

  @override
  String toString() {
    return 'DisplayBehavior(behavior: $behavior, oneOf: $oneOf, allOf: $allOf)';
  }
}

/// @nodoc
abstract mixin class $DisplayBehaviorCopyWith<$Res> {
  factory $DisplayBehaviorCopyWith(
          DisplayBehavior value, $Res Function(DisplayBehavior) _then) =
      _$DisplayBehaviorCopyWithImpl;
  @useResult
  $Res call(
      {FormulaBehavior behavior, List<String>? oneOf, List<String>? allOf});
}

/// @nodoc
class _$DisplayBehaviorCopyWithImpl<$Res>
    implements $DisplayBehaviorCopyWith<$Res> {
  _$DisplayBehaviorCopyWithImpl(this._self, this._then);

  final DisplayBehavior _self;
  final $Res Function(DisplayBehavior) _then;

  /// Create a copy of DisplayBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? behavior = null,
    Object? oneOf = freezed,
    Object? allOf = freezed,
  }) {
    return _then(_self.copyWith(
      behavior: null == behavior
          ? _self.behavior
          : behavior // ignore: cast_nullable_to_non_nullable
              as FormulaBehavior,
      oneOf: freezed == oneOf
          ? _self.oneOf
          : oneOf // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      allOf: freezed == allOf
          ? _self.allOf
          : allOf // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [DisplayBehavior].
extension DisplayBehaviorPatterns on DisplayBehavior {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DisplayBehavior value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DisplayBehavior() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DisplayBehavior value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DisplayBehavior():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DisplayBehavior value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DisplayBehavior() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            FormulaBehavior behavior, List<String>? oneOf, List<String>? allOf)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DisplayBehavior() when $default != null:
        return $default(_that.behavior, _that.oneOf, _that.allOf);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            FormulaBehavior behavior, List<String>? oneOf, List<String>? allOf)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DisplayBehavior():
        return $default(_that.behavior, _that.oneOf, _that.allOf);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            FormulaBehavior behavior, List<String>? oneOf, List<String>? allOf)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DisplayBehavior() when $default != null:
        return $default(_that.behavior, _that.oneOf, _that.allOf);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DisplayBehavior implements DisplayBehavior {
  const _DisplayBehavior(
      {required this.behavior,
      final List<String>? oneOf,
      final List<String>? allOf})
      : _oneOf = oneOf,
        _allOf = allOf;
  factory _DisplayBehavior.fromJson(Map<String, dynamic> json) =>
      _$DisplayBehaviorFromJson(json);

  @override
  final FormulaBehavior behavior;
  final List<String>? _oneOf;
  @override
  List<String>? get oneOf {
    final value = _oneOf;
    if (value == null) return null;
    if (_oneOf is EqualUnmodifiableListView) return _oneOf;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _allOf;
  @override
  List<String>? get allOf {
    final value = _allOf;
    if (value == null) return null;
    if (_allOf is EqualUnmodifiableListView) return _allOf;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of DisplayBehavior
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DisplayBehaviorCopyWith<_DisplayBehavior> get copyWith =>
      __$DisplayBehaviorCopyWithImpl<_DisplayBehavior>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DisplayBehaviorToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DisplayBehavior &&
            (identical(other.behavior, behavior) ||
                other.behavior == behavior) &&
            const DeepCollectionEquality().equals(other._oneOf, _oneOf) &&
            const DeepCollectionEquality().equals(other._allOf, _allOf));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      behavior,
      const DeepCollectionEquality().hash(_oneOf),
      const DeepCollectionEquality().hash(_allOf));

  @override
  String toString() {
    return 'DisplayBehavior(behavior: $behavior, oneOf: $oneOf, allOf: $allOf)';
  }
}

/// @nodoc
abstract mixin class _$DisplayBehaviorCopyWith<$Res>
    implements $DisplayBehaviorCopyWith<$Res> {
  factory _$DisplayBehaviorCopyWith(
          _DisplayBehavior value, $Res Function(_DisplayBehavior) _then) =
      __$DisplayBehaviorCopyWithImpl;
  @override
  @useResult
  $Res call(
      {FormulaBehavior behavior, List<String>? oneOf, List<String>? allOf});
}

/// @nodoc
class __$DisplayBehaviorCopyWithImpl<$Res>
    implements _$DisplayBehaviorCopyWith<$Res> {
  __$DisplayBehaviorCopyWithImpl(this._self, this._then);

  final _DisplayBehavior _self;
  final $Res Function(_DisplayBehavior) _then;

  /// Create a copy of DisplayBehavior
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? behavior = null,
    Object? oneOf = freezed,
    Object? allOf = freezed,
  }) {
    return _then(_DisplayBehavior(
      behavior: null == behavior
          ? _self.behavior
          : behavior // ignore: cast_nullable_to_non_nullable
              as FormulaBehavior,
      oneOf: freezed == oneOf
          ? _self._oneOf
          : oneOf // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      allOf: freezed == allOf
          ? _self._allOf
          : allOf // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
mixin _$NavigateToConfig {
  String get type; // "template" or "form"
  String get name;

  /// Create a copy of NavigateToConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NavigateToConfigCopyWith<NavigateToConfig> get copyWith =>
      _$NavigateToConfigCopyWithImpl<NavigateToConfig>(
          this as NavigateToConfig, _$identity);

  /// Serializes this NavigateToConfig to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NavigateToConfig &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, name);

  @override
  String toString() {
    return 'NavigateToConfig(type: $type, name: $name)';
  }
}

/// @nodoc
abstract mixin class $NavigateToConfigCopyWith<$Res> {
  factory $NavigateToConfigCopyWith(
          NavigateToConfig value, $Res Function(NavigateToConfig) _then) =
      _$NavigateToConfigCopyWithImpl;
  @useResult
  $Res call({String type, String name});
}

/// @nodoc
class _$NavigateToConfigCopyWithImpl<$Res>
    implements $NavigateToConfigCopyWith<$Res> {
  _$NavigateToConfigCopyWithImpl(this._self, this._then);

  final NavigateToConfig _self;
  final $Res Function(NavigateToConfig) _then;

  /// Create a copy of NavigateToConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [NavigateToConfig].
extension NavigateToConfigPatterns on NavigateToConfig {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NavigateToConfig value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NavigateToConfig() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NavigateToConfig value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NavigateToConfig():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_NavigateToConfig value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NavigateToConfig() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String type, String name)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NavigateToConfig() when $default != null:
        return $default(_that.type, _that.name);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String type, String name) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NavigateToConfig():
        return $default(_that.type, _that.name);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String type, String name)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NavigateToConfig() when $default != null:
        return $default(_that.type, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NavigateToConfig implements NavigateToConfig {
  const _NavigateToConfig({required this.type, required this.name});
  factory _NavigateToConfig.fromJson(Map<String, dynamic> json) =>
      _$NavigateToConfigFromJson(json);

  @override
  final String type;
// "template" or "form"
  @override
  final String name;

  /// Create a copy of NavigateToConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NavigateToConfigCopyWith<_NavigateToConfig> get copyWith =>
      __$NavigateToConfigCopyWithImpl<_NavigateToConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NavigateToConfigToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NavigateToConfig &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, name);

  @override
  String toString() {
    return 'NavigateToConfig(type: $type, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$NavigateToConfigCopyWith<$Res>
    implements $NavigateToConfigCopyWith<$Res> {
  factory _$NavigateToConfigCopyWith(
          _NavigateToConfig value, $Res Function(_NavigateToConfig) _then) =
      __$NavigateToConfigCopyWithImpl;
  @override
  @useResult
  $Res call({String type, String name});
}

/// @nodoc
class __$NavigateToConfigCopyWithImpl<$Res>
    implements _$NavigateToConfigCopyWith<$Res> {
  __$NavigateToConfigCopyWithImpl(this._self, this._then);

  final _NavigateToConfig _self;
  final $Res Function(_NavigateToConfig) _then;

  /// Create a copy of NavigateToConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? name = null,
  }) {
    return _then(_NavigateToConfig(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$VisibilityCondition {
  List<VisibilityExpression> get expression;

  /// Create a copy of VisibilityCondition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VisibilityConditionCopyWith<VisibilityCondition> get copyWith =>
      _$VisibilityConditionCopyWithImpl<VisibilityCondition>(
          this as VisibilityCondition, _$identity);

  /// Serializes this VisibilityCondition to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VisibilityCondition &&
            const DeepCollectionEquality()
                .equals(other.expression, expression));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(expression));

  @override
  String toString() {
    return 'VisibilityCondition(expression: $expression)';
  }
}

/// @nodoc
abstract mixin class $VisibilityConditionCopyWith<$Res> {
  factory $VisibilityConditionCopyWith(
          VisibilityCondition value, $Res Function(VisibilityCondition) _then) =
      _$VisibilityConditionCopyWithImpl;
  @useResult
  $Res call({List<VisibilityExpression> expression});
}

/// @nodoc
class _$VisibilityConditionCopyWithImpl<$Res>
    implements $VisibilityConditionCopyWith<$Res> {
  _$VisibilityConditionCopyWithImpl(this._self, this._then);

  final VisibilityCondition _self;
  final $Res Function(VisibilityCondition) _then;

  /// Create a copy of VisibilityCondition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expression = null,
  }) {
    return _then(_self.copyWith(
      expression: null == expression
          ? _self.expression
          : expression // ignore: cast_nullable_to_non_nullable
              as List<VisibilityExpression>,
    ));
  }
}

/// Adds pattern-matching-related methods to [VisibilityCondition].
extension VisibilityConditionPatterns on VisibilityCondition {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VisibilityCondition value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VisibilityCondition() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VisibilityCondition value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisibilityCondition():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VisibilityCondition value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisibilityCondition() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<VisibilityExpression> expression)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VisibilityCondition() when $default != null:
        return $default(_that.expression);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<VisibilityExpression> expression) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisibilityCondition():
        return $default(_that.expression);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<VisibilityExpression> expression)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisibilityCondition() when $default != null:
        return $default(_that.expression);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VisibilityCondition implements VisibilityCondition {
  const _VisibilityCondition(
      {required final List<VisibilityExpression> expression})
      : _expression = expression;
  factory _VisibilityCondition.fromJson(Map<String, dynamic> json) =>
      _$VisibilityConditionFromJson(json);

  final List<VisibilityExpression> _expression;
  @override
  List<VisibilityExpression> get expression {
    if (_expression is EqualUnmodifiableListView) return _expression;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expression);
  }

  /// Create a copy of VisibilityCondition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VisibilityConditionCopyWith<_VisibilityCondition> get copyWith =>
      __$VisibilityConditionCopyWithImpl<_VisibilityCondition>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VisibilityConditionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VisibilityCondition &&
            const DeepCollectionEquality()
                .equals(other._expression, _expression));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_expression));

  @override
  String toString() {
    return 'VisibilityCondition(expression: $expression)';
  }
}

/// @nodoc
abstract mixin class _$VisibilityConditionCopyWith<$Res>
    implements $VisibilityConditionCopyWith<$Res> {
  factory _$VisibilityConditionCopyWith(_VisibilityCondition value,
          $Res Function(_VisibilityCondition) _then) =
      __$VisibilityConditionCopyWithImpl;
  @override
  @useResult
  $Res call({List<VisibilityExpression> expression});
}

/// @nodoc
class __$VisibilityConditionCopyWithImpl<$Res>
    implements _$VisibilityConditionCopyWith<$Res> {
  __$VisibilityConditionCopyWithImpl(this._self, this._then);

  final _VisibilityCondition _self;
  final $Res Function(_VisibilityCondition) _then;

  /// Create a copy of VisibilityCondition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? expression = null,
  }) {
    return _then(_VisibilityCondition(
      expression: null == expression
          ? _self._expression
          : expression // ignore: cast_nullable_to_non_nullable
              as List<VisibilityExpression>,
    ));
  }
}

/// @nodoc
mixin _$VisibilityExpression {
  String get condition;

  /// Create a copy of VisibilityExpression
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VisibilityExpressionCopyWith<VisibilityExpression> get copyWith =>
      _$VisibilityExpressionCopyWithImpl<VisibilityExpression>(
          this as VisibilityExpression, _$identity);

  /// Serializes this VisibilityExpression to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VisibilityExpression &&
            (identical(other.condition, condition) ||
                other.condition == condition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, condition);

  @override
  String toString() {
    return 'VisibilityExpression(condition: $condition)';
  }
}

/// @nodoc
abstract mixin class $VisibilityExpressionCopyWith<$Res> {
  factory $VisibilityExpressionCopyWith(VisibilityExpression value,
          $Res Function(VisibilityExpression) _then) =
      _$VisibilityExpressionCopyWithImpl;
  @useResult
  $Res call({String condition});
}

/// @nodoc
class _$VisibilityExpressionCopyWithImpl<$Res>
    implements $VisibilityExpressionCopyWith<$Res> {
  _$VisibilityExpressionCopyWithImpl(this._self, this._then);

  final VisibilityExpression _self;
  final $Res Function(VisibilityExpression) _then;

  /// Create a copy of VisibilityExpression
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? condition = null,
  }) {
    return _then(_self.copyWith(
      condition: null == condition
          ? _self.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [VisibilityExpression].
extension VisibilityExpressionPatterns on VisibilityExpression {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VisibilityExpression value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VisibilityExpression() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VisibilityExpression value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisibilityExpression():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VisibilityExpression value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisibilityExpression() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String condition)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VisibilityExpression() when $default != null:
        return $default(_that.condition);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String condition) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisibilityExpression():
        return $default(_that.condition);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String condition)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisibilityExpression() when $default != null:
        return $default(_that.condition);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VisibilityExpression implements VisibilityExpression {
  const _VisibilityExpression({required this.condition});
  factory _VisibilityExpression.fromJson(Map<String, dynamic> json) =>
      _$VisibilityExpressionFromJson(json);

  @override
  final String condition;

  /// Create a copy of VisibilityExpression
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VisibilityExpressionCopyWith<_VisibilityExpression> get copyWith =>
      __$VisibilityExpressionCopyWithImpl<_VisibilityExpression>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VisibilityExpressionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VisibilityExpression &&
            (identical(other.condition, condition) ||
                other.condition == condition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, condition);

  @override
  String toString() {
    return 'VisibilityExpression(condition: $condition)';
  }
}

/// @nodoc
abstract mixin class _$VisibilityExpressionCopyWith<$Res>
    implements $VisibilityExpressionCopyWith<$Res> {
  factory _$VisibilityExpressionCopyWith(_VisibilityExpression value,
          $Res Function(_VisibilityExpression) _then) =
      __$VisibilityExpressionCopyWithImpl;
  @override
  @useResult
  $Res call({String condition});
}

/// @nodoc
class __$VisibilityExpressionCopyWithImpl<$Res>
    implements _$VisibilityExpressionCopyWith<$Res> {
  __$VisibilityExpressionCopyWithImpl(this._self, this._then);

  final _VisibilityExpression _self;
  final $Res Function(_VisibilityExpression) _then;

  /// Create a copy of VisibilityExpression
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? condition = null,
  }) {
    return _then(_VisibilityExpression(
      condition: null == condition
          ? _self.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ConditionalNavigateTo {
  String get condition;
  NavigateToConfig get navigateTo;

  /// Create a copy of ConditionalNavigateTo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConditionalNavigateToCopyWith<ConditionalNavigateTo> get copyWith =>
      _$ConditionalNavigateToCopyWithImpl<ConditionalNavigateTo>(
          this as ConditionalNavigateTo, _$identity);

  /// Serializes this ConditionalNavigateTo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConditionalNavigateTo &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.navigateTo, navigateTo) ||
                other.navigateTo == navigateTo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, condition, navigateTo);

  @override
  String toString() {
    return 'ConditionalNavigateTo(condition: $condition, navigateTo: $navigateTo)';
  }
}

/// @nodoc
abstract mixin class $ConditionalNavigateToCopyWith<$Res> {
  factory $ConditionalNavigateToCopyWith(ConditionalNavigateTo value,
          $Res Function(ConditionalNavigateTo) _then) =
      _$ConditionalNavigateToCopyWithImpl;
  @useResult
  $Res call({String condition, NavigateToConfig navigateTo});

  $NavigateToConfigCopyWith<$Res> get navigateTo;
}

/// @nodoc
class _$ConditionalNavigateToCopyWithImpl<$Res>
    implements $ConditionalNavigateToCopyWith<$Res> {
  _$ConditionalNavigateToCopyWithImpl(this._self, this._then);

  final ConditionalNavigateTo _self;
  final $Res Function(ConditionalNavigateTo) _then;

  /// Create a copy of ConditionalNavigateTo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? condition = null,
    Object? navigateTo = null,
  }) {
    return _then(_self.copyWith(
      condition: null == condition
          ? _self.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      navigateTo: null == navigateTo
          ? _self.navigateTo
          : navigateTo // ignore: cast_nullable_to_non_nullable
              as NavigateToConfig,
    ));
  }

  /// Create a copy of ConditionalNavigateTo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NavigateToConfigCopyWith<$Res> get navigateTo {
    return $NavigateToConfigCopyWith<$Res>(_self.navigateTo, (value) {
      return _then(_self.copyWith(navigateTo: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ConditionalNavigateTo].
extension ConditionalNavigateToPatterns on ConditionalNavigateTo {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ConditionalNavigateTo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ConditionalNavigateTo() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ConditionalNavigateTo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConditionalNavigateTo():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ConditionalNavigateTo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConditionalNavigateTo() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String condition, NavigateToConfig navigateTo)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ConditionalNavigateTo() when $default != null:
        return $default(_that.condition, _that.navigateTo);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String condition, NavigateToConfig navigateTo) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConditionalNavigateTo():
        return $default(_that.condition, _that.navigateTo);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String condition, NavigateToConfig navigateTo)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConditionalNavigateTo() when $default != null:
        return $default(_that.condition, _that.navigateTo);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ConditionalNavigateTo implements ConditionalNavigateTo {
  const _ConditionalNavigateTo(
      {required this.condition, required this.navigateTo});
  factory _ConditionalNavigateTo.fromJson(Map<String, dynamic> json) =>
      _$ConditionalNavigateToFromJson(json);

  @override
  final String condition;
  @override
  final NavigateToConfig navigateTo;

  /// Create a copy of ConditionalNavigateTo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConditionalNavigateToCopyWith<_ConditionalNavigateTo> get copyWith =>
      __$ConditionalNavigateToCopyWithImpl<_ConditionalNavigateTo>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ConditionalNavigateToToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConditionalNavigateTo &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.navigateTo, navigateTo) ||
                other.navigateTo == navigateTo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, condition, navigateTo);

  @override
  String toString() {
    return 'ConditionalNavigateTo(condition: $condition, navigateTo: $navigateTo)';
  }
}

/// @nodoc
abstract mixin class _$ConditionalNavigateToCopyWith<$Res>
    implements $ConditionalNavigateToCopyWith<$Res> {
  factory _$ConditionalNavigateToCopyWith(_ConditionalNavigateTo value,
          $Res Function(_ConditionalNavigateTo) _then) =
      __$ConditionalNavigateToCopyWithImpl;
  @override
  @useResult
  $Res call({String condition, NavigateToConfig navigateTo});

  @override
  $NavigateToConfigCopyWith<$Res> get navigateTo;
}

/// @nodoc
class __$ConditionalNavigateToCopyWithImpl<$Res>
    implements _$ConditionalNavigateToCopyWith<$Res> {
  __$ConditionalNavigateToCopyWithImpl(this._self, this._then);

  final _ConditionalNavigateTo _self;
  final $Res Function(_ConditionalNavigateTo) _then;

  /// Create a copy of ConditionalNavigateTo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? condition = null,
    Object? navigateTo = null,
  }) {
    return _then(_ConditionalNavigateTo(
      condition: null == condition
          ? _self.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      navigateTo: null == navigateTo
          ? _self.navigateTo
          : navigateTo // ignore: cast_nullable_to_non_nullable
              as NavigateToConfig,
    ));
  }

  /// Create a copy of ConditionalNavigateTo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NavigateToConfigCopyWith<$Res> get navigateTo {
    return $NavigateToConfigCopyWith<$Res>(_self.navigateTo, (value) {
      return _then(_self.copyWith(navigateTo: value));
    });
  }
}

/// @nodoc
mixin _$AutoFillCondition {
  String get expression;
  dynamic get value;

  /// Create a copy of AutoFillCondition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AutoFillConditionCopyWith<AutoFillCondition> get copyWith =>
      _$AutoFillConditionCopyWithImpl<AutoFillCondition>(
          this as AutoFillCondition, _$identity);

  /// Serializes this AutoFillCondition to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AutoFillCondition &&
            (identical(other.expression, expression) ||
                other.expression == expression) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, expression, const DeepCollectionEquality().hash(value));

  @override
  String toString() {
    return 'AutoFillCondition(expression: $expression, value: $value)';
  }
}

/// @nodoc
abstract mixin class $AutoFillConditionCopyWith<$Res> {
  factory $AutoFillConditionCopyWith(
          AutoFillCondition value, $Res Function(AutoFillCondition) _then) =
      _$AutoFillConditionCopyWithImpl;
  @useResult
  $Res call({String expression, dynamic value});
}

/// @nodoc
class _$AutoFillConditionCopyWithImpl<$Res>
    implements $AutoFillConditionCopyWith<$Res> {
  _$AutoFillConditionCopyWithImpl(this._self, this._then);

  final AutoFillCondition _self;
  final $Res Function(AutoFillCondition) _then;

  /// Create a copy of AutoFillCondition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expression = null,
    Object? value = freezed,
  }) {
    return _then(_self.copyWith(
      expression: null == expression
          ? _self.expression
          : expression // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// Adds pattern-matching-related methods to [AutoFillCondition].
extension AutoFillConditionPatterns on AutoFillCondition {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AutoFillCondition value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AutoFillCondition() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AutoFillCondition value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AutoFillCondition():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AutoFillCondition value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AutoFillCondition() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String expression, dynamic value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AutoFillCondition() when $default != null:
        return $default(_that.expression, _that.value);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String expression, dynamic value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AutoFillCondition():
        return $default(_that.expression, _that.value);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String expression, dynamic value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AutoFillCondition() when $default != null:
        return $default(_that.expression, _that.value);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AutoFillCondition implements AutoFillCondition {
  const _AutoFillCondition({required this.expression, required this.value});
  factory _AutoFillCondition.fromJson(Map<String, dynamic> json) =>
      _$AutoFillConditionFromJson(json);

  @override
  final String expression;
  @override
  final dynamic value;

  /// Create a copy of AutoFillCondition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AutoFillConditionCopyWith<_AutoFillCondition> get copyWith =>
      __$AutoFillConditionCopyWithImpl<_AutoFillCondition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AutoFillConditionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AutoFillCondition &&
            (identical(other.expression, expression) ||
                other.expression == expression) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, expression, const DeepCollectionEquality().hash(value));

  @override
  String toString() {
    return 'AutoFillCondition(expression: $expression, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$AutoFillConditionCopyWith<$Res>
    implements $AutoFillConditionCopyWith<$Res> {
  factory _$AutoFillConditionCopyWith(
          _AutoFillCondition value, $Res Function(_AutoFillCondition) _then) =
      __$AutoFillConditionCopyWithImpl;
  @override
  @useResult
  $Res call({String expression, dynamic value});
}

/// @nodoc
class __$AutoFillConditionCopyWithImpl<$Res>
    implements _$AutoFillConditionCopyWith<$Res> {
  __$AutoFillConditionCopyWithImpl(this._self, this._then);

  final _AutoFillCondition _self;
  final $Res Function(_AutoFillCondition) _then;

  /// Create a copy of AutoFillCondition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? expression = null,
    Object? value = freezed,
  }) {
    return _then(_AutoFillCondition(
      expression: null == expression
          ? _self.expression
          : expression // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
mixin _$ShowAlertPopUp {
  String get title;
  String? get description; // optional
  String get primaryActionLabel;
  String get secondaryActionLabel;
  List<AlertCondition>? get conditions;

  /// Create a copy of ShowAlertPopUp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShowAlertPopUpCopyWith<ShowAlertPopUp> get copyWith =>
      _$ShowAlertPopUpCopyWithImpl<ShowAlertPopUp>(
          this as ShowAlertPopUp, _$identity);

  /// Serializes this ShowAlertPopUp to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShowAlertPopUp &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.primaryActionLabel, primaryActionLabel) ||
                other.primaryActionLabel == primaryActionLabel) &&
            (identical(other.secondaryActionLabel, secondaryActionLabel) ||
                other.secondaryActionLabel == secondaryActionLabel) &&
            const DeepCollectionEquality()
                .equals(other.conditions, conditions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      description,
      primaryActionLabel,
      secondaryActionLabel,
      const DeepCollectionEquality().hash(conditions));

  @override
  String toString() {
    return 'ShowAlertPopUp(title: $title, description: $description, primaryActionLabel: $primaryActionLabel, secondaryActionLabel: $secondaryActionLabel, conditions: $conditions)';
  }
}

/// @nodoc
abstract mixin class $ShowAlertPopUpCopyWith<$Res> {
  factory $ShowAlertPopUpCopyWith(
          ShowAlertPopUp value, $Res Function(ShowAlertPopUp) _then) =
      _$ShowAlertPopUpCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      String? description,
      String primaryActionLabel,
      String secondaryActionLabel,
      List<AlertCondition>? conditions});
}

/// @nodoc
class _$ShowAlertPopUpCopyWithImpl<$Res>
    implements $ShowAlertPopUpCopyWith<$Res> {
  _$ShowAlertPopUpCopyWithImpl(this._self, this._then);

  final ShowAlertPopUp _self;
  final $Res Function(ShowAlertPopUp) _then;

  /// Create a copy of ShowAlertPopUp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? primaryActionLabel = null,
    Object? secondaryActionLabel = null,
    Object? conditions = freezed,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryActionLabel: null == primaryActionLabel
          ? _self.primaryActionLabel
          : primaryActionLabel // ignore: cast_nullable_to_non_nullable
              as String,
      secondaryActionLabel: null == secondaryActionLabel
          ? _self.secondaryActionLabel
          : secondaryActionLabel // ignore: cast_nullable_to_non_nullable
              as String,
      conditions: freezed == conditions
          ? _self.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as List<AlertCondition>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ShowAlertPopUp].
extension ShowAlertPopUpPatterns on ShowAlertPopUp {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ShowAlertPopUp value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShowAlertPopUp() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ShowAlertPopUp value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShowAlertPopUp():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ShowAlertPopUp value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShowAlertPopUp() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String title,
            String? description,
            String primaryActionLabel,
            String secondaryActionLabel,
            List<AlertCondition>? conditions)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShowAlertPopUp() when $default != null:
        return $default(
            _that.title,
            _that.description,
            _that.primaryActionLabel,
            _that.secondaryActionLabel,
            _that.conditions);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String title,
            String? description,
            String primaryActionLabel,
            String secondaryActionLabel,
            List<AlertCondition>? conditions)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShowAlertPopUp():
        return $default(
            _that.title,
            _that.description,
            _that.primaryActionLabel,
            _that.secondaryActionLabel,
            _that.conditions);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String title,
            String? description,
            String primaryActionLabel,
            String secondaryActionLabel,
            List<AlertCondition>? conditions)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShowAlertPopUp() when $default != null:
        return $default(
            _that.title,
            _that.description,
            _that.primaryActionLabel,
            _that.secondaryActionLabel,
            _that.conditions);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ShowAlertPopUp implements ShowAlertPopUp {
  const _ShowAlertPopUp(
      {required this.title,
      this.description,
      required this.primaryActionLabel,
      required this.secondaryActionLabel,
      final List<AlertCondition>? conditions})
      : _conditions = conditions;
  factory _ShowAlertPopUp.fromJson(Map<String, dynamic> json) =>
      _$ShowAlertPopUpFromJson(json);

  @override
  final String title;
  @override
  final String? description;
// optional
  @override
  final String primaryActionLabel;
  @override
  final String secondaryActionLabel;
  final List<AlertCondition>? _conditions;
  @override
  List<AlertCondition>? get conditions {
    final value = _conditions;
    if (value == null) return null;
    if (_conditions is EqualUnmodifiableListView) return _conditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of ShowAlertPopUp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShowAlertPopUpCopyWith<_ShowAlertPopUp> get copyWith =>
      __$ShowAlertPopUpCopyWithImpl<_ShowAlertPopUp>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ShowAlertPopUpToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShowAlertPopUp &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.primaryActionLabel, primaryActionLabel) ||
                other.primaryActionLabel == primaryActionLabel) &&
            (identical(other.secondaryActionLabel, secondaryActionLabel) ||
                other.secondaryActionLabel == secondaryActionLabel) &&
            const DeepCollectionEquality()
                .equals(other._conditions, _conditions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      description,
      primaryActionLabel,
      secondaryActionLabel,
      const DeepCollectionEquality().hash(_conditions));

  @override
  String toString() {
    return 'ShowAlertPopUp(title: $title, description: $description, primaryActionLabel: $primaryActionLabel, secondaryActionLabel: $secondaryActionLabel, conditions: $conditions)';
  }
}

/// @nodoc
abstract mixin class _$ShowAlertPopUpCopyWith<$Res>
    implements $ShowAlertPopUpCopyWith<$Res> {
  factory _$ShowAlertPopUpCopyWith(
          _ShowAlertPopUp value, $Res Function(_ShowAlertPopUp) _then) =
      __$ShowAlertPopUpCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      String? description,
      String primaryActionLabel,
      String secondaryActionLabel,
      List<AlertCondition>? conditions});
}

/// @nodoc
class __$ShowAlertPopUpCopyWithImpl<$Res>
    implements _$ShowAlertPopUpCopyWith<$Res> {
  __$ShowAlertPopUpCopyWithImpl(this._self, this._then);

  final _ShowAlertPopUp _self;
  final $Res Function(_ShowAlertPopUp) _then;

  /// Create a copy of ShowAlertPopUp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? primaryActionLabel = null,
    Object? secondaryActionLabel = null,
    Object? conditions = freezed,
  }) {
    return _then(_ShowAlertPopUp(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryActionLabel: null == primaryActionLabel
          ? _self.primaryActionLabel
          : primaryActionLabel // ignore: cast_nullable_to_non_nullable
              as String,
      secondaryActionLabel: null == secondaryActionLabel
          ? _self.secondaryActionLabel
          : secondaryActionLabel // ignore: cast_nullable_to_non_nullable
              as String,
      conditions: freezed == conditions
          ? _self._conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as List<AlertCondition>?,
    ));
  }
}

/// @nodoc
mixin _$ShowSecondaryAlertPopUp {
  String get title;
  String? get description;
  String get primaryActionLabel;
  String get secondaryActionLabel;
  List<AlertCondition>?
      get conditions; // Body fields for form inputs inside the popup (e.g., mandatory comment)
  List<SecondaryAlertBodyField>? get body;

  /// Create a copy of ShowSecondaryAlertPopUp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShowSecondaryAlertPopUpCopyWith<ShowSecondaryAlertPopUp> get copyWith =>
      _$ShowSecondaryAlertPopUpCopyWithImpl<ShowSecondaryAlertPopUp>(
          this as ShowSecondaryAlertPopUp, _$identity);

  /// Serializes this ShowSecondaryAlertPopUp to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShowSecondaryAlertPopUp &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.primaryActionLabel, primaryActionLabel) ||
                other.primaryActionLabel == primaryActionLabel) &&
            (identical(other.secondaryActionLabel, secondaryActionLabel) ||
                other.secondaryActionLabel == secondaryActionLabel) &&
            const DeepCollectionEquality()
                .equals(other.conditions, conditions) &&
            const DeepCollectionEquality().equals(other.body, body));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      description,
      primaryActionLabel,
      secondaryActionLabel,
      const DeepCollectionEquality().hash(conditions),
      const DeepCollectionEquality().hash(body));

  @override
  String toString() {
    return 'ShowSecondaryAlertPopUp(title: $title, description: $description, primaryActionLabel: $primaryActionLabel, secondaryActionLabel: $secondaryActionLabel, conditions: $conditions, body: $body)';
  }
}

/// @nodoc
abstract mixin class $ShowSecondaryAlertPopUpCopyWith<$Res> {
  factory $ShowSecondaryAlertPopUpCopyWith(ShowSecondaryAlertPopUp value,
          $Res Function(ShowSecondaryAlertPopUp) _then) =
      _$ShowSecondaryAlertPopUpCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      String? description,
      String primaryActionLabel,
      String secondaryActionLabel,
      List<AlertCondition>? conditions,
      List<SecondaryAlertBodyField>? body});
}

/// @nodoc
class _$ShowSecondaryAlertPopUpCopyWithImpl<$Res>
    implements $ShowSecondaryAlertPopUpCopyWith<$Res> {
  _$ShowSecondaryAlertPopUpCopyWithImpl(this._self, this._then);

  final ShowSecondaryAlertPopUp _self;
  final $Res Function(ShowSecondaryAlertPopUp) _then;

  /// Create a copy of ShowSecondaryAlertPopUp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? primaryActionLabel = null,
    Object? secondaryActionLabel = null,
    Object? conditions = freezed,
    Object? body = freezed,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryActionLabel: null == primaryActionLabel
          ? _self.primaryActionLabel
          : primaryActionLabel // ignore: cast_nullable_to_non_nullable
              as String,
      secondaryActionLabel: null == secondaryActionLabel
          ? _self.secondaryActionLabel
          : secondaryActionLabel // ignore: cast_nullable_to_non_nullable
              as String,
      conditions: freezed == conditions
          ? _self.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as List<AlertCondition>?,
      body: freezed == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as List<SecondaryAlertBodyField>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ShowSecondaryAlertPopUp].
extension ShowSecondaryAlertPopUpPatterns on ShowSecondaryAlertPopUp {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ShowSecondaryAlertPopUp value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShowSecondaryAlertPopUp() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ShowSecondaryAlertPopUp value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShowSecondaryAlertPopUp():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ShowSecondaryAlertPopUp value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShowSecondaryAlertPopUp() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String title,
            String? description,
            String primaryActionLabel,
            String secondaryActionLabel,
            List<AlertCondition>? conditions,
            List<SecondaryAlertBodyField>? body)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShowSecondaryAlertPopUp() when $default != null:
        return $default(
            _that.title,
            _that.description,
            _that.primaryActionLabel,
            _that.secondaryActionLabel,
            _that.conditions,
            _that.body);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String title,
            String? description,
            String primaryActionLabel,
            String secondaryActionLabel,
            List<AlertCondition>? conditions,
            List<SecondaryAlertBodyField>? body)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShowSecondaryAlertPopUp():
        return $default(
            _that.title,
            _that.description,
            _that.primaryActionLabel,
            _that.secondaryActionLabel,
            _that.conditions,
            _that.body);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String title,
            String? description,
            String primaryActionLabel,
            String secondaryActionLabel,
            List<AlertCondition>? conditions,
            List<SecondaryAlertBodyField>? body)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShowSecondaryAlertPopUp() when $default != null:
        return $default(
            _that.title,
            _that.description,
            _that.primaryActionLabel,
            _that.secondaryActionLabel,
            _that.conditions,
            _that.body);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ShowSecondaryAlertPopUp implements ShowSecondaryAlertPopUp {
  const _ShowSecondaryAlertPopUp(
      {required this.title,
      this.description,
      required this.primaryActionLabel,
      required this.secondaryActionLabel,
      final List<AlertCondition>? conditions,
      final List<SecondaryAlertBodyField>? body})
      : _conditions = conditions,
        _body = body;
  factory _ShowSecondaryAlertPopUp.fromJson(Map<String, dynamic> json) =>
      _$ShowSecondaryAlertPopUpFromJson(json);

  @override
  final String title;
  @override
  final String? description;
  @override
  final String primaryActionLabel;
  @override
  final String secondaryActionLabel;
  final List<AlertCondition>? _conditions;
  @override
  List<AlertCondition>? get conditions {
    final value = _conditions;
    if (value == null) return null;
    if (_conditions is EqualUnmodifiableListView) return _conditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// Body fields for form inputs inside the popup (e.g., mandatory comment)
  final List<SecondaryAlertBodyField>? _body;
// Body fields for form inputs inside the popup (e.g., mandatory comment)
  @override
  List<SecondaryAlertBodyField>? get body {
    final value = _body;
    if (value == null) return null;
    if (_body is EqualUnmodifiableListView) return _body;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of ShowSecondaryAlertPopUp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShowSecondaryAlertPopUpCopyWith<_ShowSecondaryAlertPopUp> get copyWith =>
      __$ShowSecondaryAlertPopUpCopyWithImpl<_ShowSecondaryAlertPopUp>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ShowSecondaryAlertPopUpToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShowSecondaryAlertPopUp &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.primaryActionLabel, primaryActionLabel) ||
                other.primaryActionLabel == primaryActionLabel) &&
            (identical(other.secondaryActionLabel, secondaryActionLabel) ||
                other.secondaryActionLabel == secondaryActionLabel) &&
            const DeepCollectionEquality()
                .equals(other._conditions, _conditions) &&
            const DeepCollectionEquality().equals(other._body, _body));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      description,
      primaryActionLabel,
      secondaryActionLabel,
      const DeepCollectionEquality().hash(_conditions),
      const DeepCollectionEquality().hash(_body));

  @override
  String toString() {
    return 'ShowSecondaryAlertPopUp(title: $title, description: $description, primaryActionLabel: $primaryActionLabel, secondaryActionLabel: $secondaryActionLabel, conditions: $conditions, body: $body)';
  }
}

/// @nodoc
abstract mixin class _$ShowSecondaryAlertPopUpCopyWith<$Res>
    implements $ShowSecondaryAlertPopUpCopyWith<$Res> {
  factory _$ShowSecondaryAlertPopUpCopyWith(_ShowSecondaryAlertPopUp value,
          $Res Function(_ShowSecondaryAlertPopUp) _then) =
      __$ShowSecondaryAlertPopUpCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      String? description,
      String primaryActionLabel,
      String secondaryActionLabel,
      List<AlertCondition>? conditions,
      List<SecondaryAlertBodyField>? body});
}

/// @nodoc
class __$ShowSecondaryAlertPopUpCopyWithImpl<$Res>
    implements _$ShowSecondaryAlertPopUpCopyWith<$Res> {
  __$ShowSecondaryAlertPopUpCopyWithImpl(this._self, this._then);

  final _ShowSecondaryAlertPopUp _self;
  final $Res Function(_ShowSecondaryAlertPopUp) _then;

  /// Create a copy of ShowSecondaryAlertPopUp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? primaryActionLabel = null,
    Object? secondaryActionLabel = null,
    Object? conditions = freezed,
    Object? body = freezed,
  }) {
    return _then(_ShowSecondaryAlertPopUp(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryActionLabel: null == primaryActionLabel
          ? _self.primaryActionLabel
          : primaryActionLabel // ignore: cast_nullable_to_non_nullable
              as String,
      secondaryActionLabel: null == secondaryActionLabel
          ? _self.secondaryActionLabel
          : secondaryActionLabel // ignore: cast_nullable_to_non_nullable
              as String,
      conditions: freezed == conditions
          ? _self._conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as List<AlertCondition>?,
      body: freezed == body
          ? _self._body
          : body // ignore: cast_nullable_to_non_nullable
              as List<SecondaryAlertBodyField>?,
    ));
  }
}

/// @nodoc
mixin _$SecondaryAlertBodyField {
  String get type;
  String get label;
  String? get format;
  String get fieldName;
  bool get mandatory;

  /// Create a copy of SecondaryAlertBodyField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SecondaryAlertBodyFieldCopyWith<SecondaryAlertBodyField> get copyWith =>
      _$SecondaryAlertBodyFieldCopyWithImpl<SecondaryAlertBodyField>(
          this as SecondaryAlertBodyField, _$identity);

  /// Serializes this SecondaryAlertBodyField to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SecondaryAlertBodyField &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.fieldName, fieldName) ||
                other.fieldName == fieldName) &&
            (identical(other.mandatory, mandatory) ||
                other.mandatory == mandatory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, label, format, fieldName, mandatory);

  @override
  String toString() {
    return 'SecondaryAlertBodyField(type: $type, label: $label, format: $format, fieldName: $fieldName, mandatory: $mandatory)';
  }
}

/// @nodoc
abstract mixin class $SecondaryAlertBodyFieldCopyWith<$Res> {
  factory $SecondaryAlertBodyFieldCopyWith(SecondaryAlertBodyField value,
          $Res Function(SecondaryAlertBodyField) _then) =
      _$SecondaryAlertBodyFieldCopyWithImpl;
  @useResult
  $Res call(
      {String type,
      String label,
      String? format,
      String fieldName,
      bool mandatory});
}

/// @nodoc
class _$SecondaryAlertBodyFieldCopyWithImpl<$Res>
    implements $SecondaryAlertBodyFieldCopyWith<$Res> {
  _$SecondaryAlertBodyFieldCopyWithImpl(this._self, this._then);

  final SecondaryAlertBodyField _self;
  final $Res Function(SecondaryAlertBodyField) _then;

  /// Create a copy of SecondaryAlertBodyField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? label = null,
    Object? format = freezed,
    Object? fieldName = null,
    Object? mandatory = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      format: freezed == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldName: null == fieldName
          ? _self.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String,
      mandatory: null == mandatory
          ? _self.mandatory
          : mandatory // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [SecondaryAlertBodyField].
extension SecondaryAlertBodyFieldPatterns on SecondaryAlertBodyField {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SecondaryAlertBodyField value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SecondaryAlertBodyField() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SecondaryAlertBodyField value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SecondaryAlertBodyField():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SecondaryAlertBodyField value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SecondaryAlertBodyField() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String type, String label, String? format,
            String fieldName, bool mandatory)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SecondaryAlertBodyField() when $default != null:
        return $default(_that.type, _that.label, _that.format, _that.fieldName,
            _that.mandatory);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String type, String label, String? format,
            String fieldName, bool mandatory)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SecondaryAlertBodyField():
        return $default(_that.type, _that.label, _that.format, _that.fieldName,
            _that.mandatory);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String type, String label, String? format,
            String fieldName, bool mandatory)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SecondaryAlertBodyField() when $default != null:
        return $default(_that.type, _that.label, _that.format, _that.fieldName,
            _that.mandatory);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SecondaryAlertBodyField implements SecondaryAlertBodyField {
  const _SecondaryAlertBodyField(
      {required this.type,
      required this.label,
      this.format,
      required this.fieldName,
      this.mandatory = false});
  factory _SecondaryAlertBodyField.fromJson(Map<String, dynamic> json) =>
      _$SecondaryAlertBodyFieldFromJson(json);

  @override
  final String type;
  @override
  final String label;
  @override
  final String? format;
  @override
  final String fieldName;
  @override
  @JsonKey()
  final bool mandatory;

  /// Create a copy of SecondaryAlertBodyField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SecondaryAlertBodyFieldCopyWith<_SecondaryAlertBodyField> get copyWith =>
      __$SecondaryAlertBodyFieldCopyWithImpl<_SecondaryAlertBodyField>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SecondaryAlertBodyFieldToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SecondaryAlertBodyField &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.fieldName, fieldName) ||
                other.fieldName == fieldName) &&
            (identical(other.mandatory, mandatory) ||
                other.mandatory == mandatory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, label, format, fieldName, mandatory);

  @override
  String toString() {
    return 'SecondaryAlertBodyField(type: $type, label: $label, format: $format, fieldName: $fieldName, mandatory: $mandatory)';
  }
}

/// @nodoc
abstract mixin class _$SecondaryAlertBodyFieldCopyWith<$Res>
    implements $SecondaryAlertBodyFieldCopyWith<$Res> {
  factory _$SecondaryAlertBodyFieldCopyWith(_SecondaryAlertBodyField value,
          $Res Function(_SecondaryAlertBodyField) _then) =
      __$SecondaryAlertBodyFieldCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String type,
      String label,
      String? format,
      String fieldName,
      bool mandatory});
}

/// @nodoc
class __$SecondaryAlertBodyFieldCopyWithImpl<$Res>
    implements _$SecondaryAlertBodyFieldCopyWith<$Res> {
  __$SecondaryAlertBodyFieldCopyWithImpl(this._self, this._then);

  final _SecondaryAlertBodyField _self;
  final $Res Function(_SecondaryAlertBodyField) _then;

  /// Create a copy of SecondaryAlertBodyField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? label = null,
    Object? format = freezed,
    Object? fieldName = null,
    Object? mandatory = null,
  }) {
    return _then(_SecondaryAlertBodyField(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      format: freezed == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldName: null == fieldName
          ? _self.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String,
      mandatory: null == mandatory
          ? _self.mandatory
          : mandatory // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$AlertCondition {
  String get expression; // e.g., condition or "DEFAULT"
  String get value;

  /// Create a copy of AlertCondition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AlertConditionCopyWith<AlertCondition> get copyWith =>
      _$AlertConditionCopyWithImpl<AlertCondition>(
          this as AlertCondition, _$identity);

  /// Serializes this AlertCondition to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AlertCondition &&
            (identical(other.expression, expression) ||
                other.expression == expression) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, expression, value);

  @override
  String toString() {
    return 'AlertCondition(expression: $expression, value: $value)';
  }
}

/// @nodoc
abstract mixin class $AlertConditionCopyWith<$Res> {
  factory $AlertConditionCopyWith(
          AlertCondition value, $Res Function(AlertCondition) _then) =
      _$AlertConditionCopyWithImpl;
  @useResult
  $Res call({String expression, String value});
}

/// @nodoc
class _$AlertConditionCopyWithImpl<$Res>
    implements $AlertConditionCopyWith<$Res> {
  _$AlertConditionCopyWithImpl(this._self, this._then);

  final AlertCondition _self;
  final $Res Function(AlertCondition) _then;

  /// Create a copy of AlertCondition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expression = null,
    Object? value = null,
  }) {
    return _then(_self.copyWith(
      expression: null == expression
          ? _self.expression
          : expression // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [AlertCondition].
extension AlertConditionPatterns on AlertCondition {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AlertCondition value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AlertCondition() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AlertCondition value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AlertCondition():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AlertCondition value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AlertCondition() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String expression, String value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AlertCondition() when $default != null:
        return $default(_that.expression, _that.value);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String expression, String value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AlertCondition():
        return $default(_that.expression, _that.value);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String expression, String value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AlertCondition() when $default != null:
        return $default(_that.expression, _that.value);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AlertCondition implements AlertCondition {
  const _AlertCondition({required this.expression, required this.value});
  factory _AlertCondition.fromJson(Map<String, dynamic> json) =>
      _$AlertConditionFromJson(json);

  @override
  final String expression;
// e.g., condition or "DEFAULT"
  @override
  final String value;

  /// Create a copy of AlertCondition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AlertConditionCopyWith<_AlertCondition> get copyWith =>
      __$AlertConditionCopyWithImpl<_AlertCondition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AlertConditionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AlertCondition &&
            (identical(other.expression, expression) ||
                other.expression == expression) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, expression, value);

  @override
  String toString() {
    return 'AlertCondition(expression: $expression, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$AlertConditionCopyWith<$Res>
    implements $AlertConditionCopyWith<$Res> {
  factory _$AlertConditionCopyWith(
          _AlertCondition value, $Res Function(_AlertCondition) _then) =
      __$AlertConditionCopyWithImpl;
  @override
  @useResult
  $Res call({String expression, String value});
}

/// @nodoc
class __$AlertConditionCopyWithImpl<$Res>
    implements _$AlertConditionCopyWith<$Res> {
  __$AlertConditionCopyWithImpl(this._self, this._then);

  final _AlertCondition _self;
  final $Res Function(_AlertCondition) _then;

  /// Create a copy of AlertCondition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? expression = null,
    Object? value = null,
  }) {
    return _then(_AlertCondition(
      expression: null == expression
          ? _self.expression
          : expression // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$MultiEntityConfig {
  String get sourcePageKey; // Page containing the multi-select field
  String get sourceFieldKey;

  /// Create a copy of MultiEntityConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MultiEntityConfigCopyWith<MultiEntityConfig> get copyWith =>
      _$MultiEntityConfigCopyWithImpl<MultiEntityConfig>(
          this as MultiEntityConfig, _$identity);

  /// Serializes this MultiEntityConfig to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MultiEntityConfig &&
            (identical(other.sourcePageKey, sourcePageKey) ||
                other.sourcePageKey == sourcePageKey) &&
            (identical(other.sourceFieldKey, sourceFieldKey) ||
                other.sourceFieldKey == sourceFieldKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sourcePageKey, sourceFieldKey);

  @override
  String toString() {
    return 'MultiEntityConfig(sourcePageKey: $sourcePageKey, sourceFieldKey: $sourceFieldKey)';
  }
}

/// @nodoc
abstract mixin class $MultiEntityConfigCopyWith<$Res> {
  factory $MultiEntityConfigCopyWith(
          MultiEntityConfig value, $Res Function(MultiEntityConfig) _then) =
      _$MultiEntityConfigCopyWithImpl;
  @useResult
  $Res call({String sourcePageKey, String sourceFieldKey});
}

/// @nodoc
class _$MultiEntityConfigCopyWithImpl<$Res>
    implements $MultiEntityConfigCopyWith<$Res> {
  _$MultiEntityConfigCopyWithImpl(this._self, this._then);

  final MultiEntityConfig _self;
  final $Res Function(MultiEntityConfig) _then;

  /// Create a copy of MultiEntityConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourcePageKey = null,
    Object? sourceFieldKey = null,
  }) {
    return _then(_self.copyWith(
      sourcePageKey: null == sourcePageKey
          ? _self.sourcePageKey
          : sourcePageKey // ignore: cast_nullable_to_non_nullable
              as String,
      sourceFieldKey: null == sourceFieldKey
          ? _self.sourceFieldKey
          : sourceFieldKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [MultiEntityConfig].
extension MultiEntityConfigPatterns on MultiEntityConfig {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MultiEntityConfig value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MultiEntityConfig() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MultiEntityConfig value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MultiEntityConfig():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MultiEntityConfig value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MultiEntityConfig() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String sourcePageKey, String sourceFieldKey)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MultiEntityConfig() when $default != null:
        return $default(_that.sourcePageKey, _that.sourceFieldKey);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String sourcePageKey, String sourceFieldKey) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MultiEntityConfig():
        return $default(_that.sourcePageKey, _that.sourceFieldKey);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String sourcePageKey, String sourceFieldKey)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MultiEntityConfig() when $default != null:
        return $default(_that.sourcePageKey, _that.sourceFieldKey);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MultiEntityConfig implements MultiEntityConfig {
  const _MultiEntityConfig(
      {required this.sourcePageKey, required this.sourceFieldKey});
  factory _MultiEntityConfig.fromJson(Map<String, dynamic> json) =>
      _$MultiEntityConfigFromJson(json);

  @override
  final String sourcePageKey;
// Page containing the multi-select field
  @override
  final String sourceFieldKey;

  /// Create a copy of MultiEntityConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MultiEntityConfigCopyWith<_MultiEntityConfig> get copyWith =>
      __$MultiEntityConfigCopyWithImpl<_MultiEntityConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MultiEntityConfigToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MultiEntityConfig &&
            (identical(other.sourcePageKey, sourcePageKey) ||
                other.sourcePageKey == sourcePageKey) &&
            (identical(other.sourceFieldKey, sourceFieldKey) ||
                other.sourceFieldKey == sourceFieldKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sourcePageKey, sourceFieldKey);

  @override
  String toString() {
    return 'MultiEntityConfig(sourcePageKey: $sourcePageKey, sourceFieldKey: $sourceFieldKey)';
  }
}

/// @nodoc
abstract mixin class _$MultiEntityConfigCopyWith<$Res>
    implements $MultiEntityConfigCopyWith<$Res> {
  factory _$MultiEntityConfigCopyWith(
          _MultiEntityConfig value, $Res Function(_MultiEntityConfig) _then) =
      __$MultiEntityConfigCopyWithImpl;
  @override
  @useResult
  $Res call({String sourcePageKey, String sourceFieldKey});
}

/// @nodoc
class __$MultiEntityConfigCopyWithImpl<$Res>
    implements _$MultiEntityConfigCopyWith<$Res> {
  __$MultiEntityConfigCopyWithImpl(this._self, this._then);

  final _MultiEntityConfig _self;
  final $Res Function(_MultiEntityConfig) _then;

  /// Create a copy of MultiEntityConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sourcePageKey = null,
    Object? sourceFieldKey = null,
  }) {
    return _then(_MultiEntityConfig(
      sourcePageKey: null == sourcePageKey
          ? _self.sourcePageKey
          : sourcePageKey // ignore: cast_nullable_to_non_nullable
              as String,
      sourceFieldKey: null == sourceFieldKey
          ? _self.sourceFieldKey
          : sourceFieldKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ComparisonConfig {
  String get model; // table to search (e.g., "stock", "projectBeneficiary")
  String get extractKey; // field to match scanned value against
  String get extractFrom; // "additionalFields" or "column"
  List<ComparisonFilter> get filters;
  String? get errorMessage;

  /// Create a copy of ComparisonConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ComparisonConfigCopyWith<ComparisonConfig> get copyWith =>
      _$ComparisonConfigCopyWithImpl<ComparisonConfig>(
          this as ComparisonConfig, _$identity);

  /// Serializes this ComparisonConfig to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ComparisonConfig &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.extractKey, extractKey) ||
                other.extractKey == extractKey) &&
            (identical(other.extractFrom, extractFrom) ||
                other.extractFrom == extractFrom) &&
            const DeepCollectionEquality().equals(other.filters, filters) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, model, extractKey, extractFrom,
      const DeepCollectionEquality().hash(filters), errorMessage);

  @override
  String toString() {
    return 'ComparisonConfig(model: $model, extractKey: $extractKey, extractFrom: $extractFrom, filters: $filters, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $ComparisonConfigCopyWith<$Res> {
  factory $ComparisonConfigCopyWith(
          ComparisonConfig value, $Res Function(ComparisonConfig) _then) =
      _$ComparisonConfigCopyWithImpl;
  @useResult
  $Res call(
      {String model,
      String extractKey,
      String extractFrom,
      List<ComparisonFilter> filters,
      String? errorMessage});
}

/// @nodoc
class _$ComparisonConfigCopyWithImpl<$Res>
    implements $ComparisonConfigCopyWith<$Res> {
  _$ComparisonConfigCopyWithImpl(this._self, this._then);

  final ComparisonConfig _self;
  final $Res Function(ComparisonConfig) _then;

  /// Create a copy of ComparisonConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? extractKey = null,
    Object? extractFrom = null,
    Object? filters = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      model: null == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      extractKey: null == extractKey
          ? _self.extractKey
          : extractKey // ignore: cast_nullable_to_non_nullable
              as String,
      extractFrom: null == extractFrom
          ? _self.extractFrom
          : extractFrom // ignore: cast_nullable_to_non_nullable
              as String,
      filters: null == filters
          ? _self.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<ComparisonFilter>,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ComparisonConfig].
extension ComparisonConfigPatterns on ComparisonConfig {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ComparisonConfig value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ComparisonConfig() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ComparisonConfig value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ComparisonConfig():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ComparisonConfig value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ComparisonConfig() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String model, String extractKey, String extractFrom,
            List<ComparisonFilter> filters, String? errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ComparisonConfig() when $default != null:
        return $default(_that.model, _that.extractKey, _that.extractFrom,
            _that.filters, _that.errorMessage);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String model, String extractKey, String extractFrom,
            List<ComparisonFilter> filters, String? errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ComparisonConfig():
        return $default(_that.model, _that.extractKey, _that.extractFrom,
            _that.filters, _that.errorMessage);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String model, String extractKey, String extractFrom,
            List<ComparisonFilter> filters, String? errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ComparisonConfig() when $default != null:
        return $default(_that.model, _that.extractKey, _that.extractFrom,
            _that.filters, _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _ComparisonConfig implements ComparisonConfig {
  const _ComparisonConfig(
      {required this.model,
      required this.extractKey,
      this.extractFrom = 'additionalFields',
      final List<ComparisonFilter> filters = const [],
      this.errorMessage})
      : _filters = filters;
  factory _ComparisonConfig.fromJson(Map<String, dynamic> json) =>
      _$ComparisonConfigFromJson(json);

  @override
  final String model;
// table to search (e.g., "stock", "projectBeneficiary")
  @override
  final String extractKey;
// field to match scanned value against
  @override
  @JsonKey()
  final String extractFrom;
// "additionalFields" or "column"
  final List<ComparisonFilter> _filters;
// "additionalFields" or "column"
  @override
  @JsonKey()
  List<ComparisonFilter> get filters {
    if (_filters is EqualUnmodifiableListView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filters);
  }

  @override
  final String? errorMessage;

  /// Create a copy of ComparisonConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ComparisonConfigCopyWith<_ComparisonConfig> get copyWith =>
      __$ComparisonConfigCopyWithImpl<_ComparisonConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ComparisonConfigToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ComparisonConfig &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.extractKey, extractKey) ||
                other.extractKey == extractKey) &&
            (identical(other.extractFrom, extractFrom) ||
                other.extractFrom == extractFrom) &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, model, extractKey, extractFrom,
      const DeepCollectionEquality().hash(_filters), errorMessage);

  @override
  String toString() {
    return 'ComparisonConfig(model: $model, extractKey: $extractKey, extractFrom: $extractFrom, filters: $filters, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$ComparisonConfigCopyWith<$Res>
    implements $ComparisonConfigCopyWith<$Res> {
  factory _$ComparisonConfigCopyWith(
          _ComparisonConfig value, $Res Function(_ComparisonConfig) _then) =
      __$ComparisonConfigCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String model,
      String extractKey,
      String extractFrom,
      List<ComparisonFilter> filters,
      String? errorMessage});
}

/// @nodoc
class __$ComparisonConfigCopyWithImpl<$Res>
    implements _$ComparisonConfigCopyWith<$Res> {
  __$ComparisonConfigCopyWithImpl(this._self, this._then);

  final _ComparisonConfig _self;
  final $Res Function(_ComparisonConfig) _then;

  /// Create a copy of ComparisonConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? model = null,
    Object? extractKey = null,
    Object? extractFrom = null,
    Object? filters = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_ComparisonConfig(
      model: null == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      extractKey: null == extractKey
          ? _self.extractKey
          : extractKey // ignore: cast_nullable_to_non_nullable
              as String,
      extractFrom: null == extractFrom
          ? _self.extractFrom
          : extractFrom // ignore: cast_nullable_to_non_nullable
              as String,
      filters: null == filters
          ? _self._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<ComparisonFilter>,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ComparisonFilter {
  String get key; // DB column name (e.g., "senderId")
  String
      get value; // default template (e.g., "{{navigation.facilityFromWhich}}")
  String get operation;
  String?
      get switchOn; // template for conditional switch (e.g., "{{navigation.stockEntryType}}")
  Map<String, String>? get cases;

  /// Create a copy of ComparisonFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ComparisonFilterCopyWith<ComparisonFilter> get copyWith =>
      _$ComparisonFilterCopyWithImpl<ComparisonFilter>(
          this as ComparisonFilter, _$identity);

  /// Serializes this ComparisonFilter to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ComparisonFilter &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            (identical(other.switchOn, switchOn) ||
                other.switchOn == switchOn) &&
            const DeepCollectionEquality().equals(other.cases, cases));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, value, operation, switchOn,
      const DeepCollectionEquality().hash(cases));

  @override
  String toString() {
    return 'ComparisonFilter(key: $key, value: $value, operation: $operation, switchOn: $switchOn, cases: $cases)';
  }
}

/// @nodoc
abstract mixin class $ComparisonFilterCopyWith<$Res> {
  factory $ComparisonFilterCopyWith(
          ComparisonFilter value, $Res Function(ComparisonFilter) _then) =
      _$ComparisonFilterCopyWithImpl;
  @useResult
  $Res call(
      {String key,
      String value,
      String operation,
      String? switchOn,
      Map<String, String>? cases});
}

/// @nodoc
class _$ComparisonFilterCopyWithImpl<$Res>
    implements $ComparisonFilterCopyWith<$Res> {
  _$ComparisonFilterCopyWithImpl(this._self, this._then);

  final ComparisonFilter _self;
  final $Res Function(ComparisonFilter) _then;

  /// Create a copy of ComparisonFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = null,
    Object? operation = null,
    Object? switchOn = freezed,
    Object? cases = freezed,
  }) {
    return _then(_self.copyWith(
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      operation: null == operation
          ? _self.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String,
      switchOn: freezed == switchOn
          ? _self.switchOn
          : switchOn // ignore: cast_nullable_to_non_nullable
              as String?,
      cases: freezed == cases
          ? _self.cases
          : cases // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ComparisonFilter].
extension ComparisonFilterPatterns on ComparisonFilter {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ComparisonFilter value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ComparisonFilter() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ComparisonFilter value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ComparisonFilter():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ComparisonFilter value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ComparisonFilter() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String key, String value, String operation,
            String? switchOn, Map<String, String>? cases)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ComparisonFilter() when $default != null:
        return $default(_that.key, _that.value, _that.operation, _that.switchOn,
            _that.cases);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String key, String value, String operation,
            String? switchOn, Map<String, String>? cases)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ComparisonFilter():
        return $default(_that.key, _that.value, _that.operation, _that.switchOn,
            _that.cases);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String key, String value, String operation,
            String? switchOn, Map<String, String>? cases)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ComparisonFilter() when $default != null:
        return $default(_that.key, _that.value, _that.operation, _that.switchOn,
            _that.cases);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _ComparisonFilter implements ComparisonFilter {
  const _ComparisonFilter(
      {required this.key,
      required this.value,
      this.operation = 'equals',
      this.switchOn,
      final Map<String, String>? cases})
      : _cases = cases;
  factory _ComparisonFilter.fromJson(Map<String, dynamic> json) =>
      _$ComparisonFilterFromJson(json);

  @override
  final String key;
// DB column name (e.g., "senderId")
  @override
  final String value;
// default template (e.g., "{{navigation.facilityFromWhich}}")
  @override
  @JsonKey()
  final String operation;
  @override
  final String? switchOn;
// template for conditional switch (e.g., "{{navigation.stockEntryType}}")
  final Map<String, String>? _cases;
// template for conditional switch (e.g., "{{navigation.stockEntryType}}")
  @override
  Map<String, String>? get cases {
    final value = _cases;
    if (value == null) return null;
    if (_cases is EqualUnmodifiableMapView) return _cases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of ComparisonFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ComparisonFilterCopyWith<_ComparisonFilter> get copyWith =>
      __$ComparisonFilterCopyWithImpl<_ComparisonFilter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ComparisonFilterToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ComparisonFilter &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            (identical(other.switchOn, switchOn) ||
                other.switchOn == switchOn) &&
            const DeepCollectionEquality().equals(other._cases, _cases));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, value, operation, switchOn,
      const DeepCollectionEquality().hash(_cases));

  @override
  String toString() {
    return 'ComparisonFilter(key: $key, value: $value, operation: $operation, switchOn: $switchOn, cases: $cases)';
  }
}

/// @nodoc
abstract mixin class _$ComparisonFilterCopyWith<$Res>
    implements $ComparisonFilterCopyWith<$Res> {
  factory _$ComparisonFilterCopyWith(
          _ComparisonFilter value, $Res Function(_ComparisonFilter) _then) =
      __$ComparisonFilterCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String key,
      String value,
      String operation,
      String? switchOn,
      Map<String, String>? cases});
}

/// @nodoc
class __$ComparisonFilterCopyWithImpl<$Res>
    implements _$ComparisonFilterCopyWith<$Res> {
  __$ComparisonFilterCopyWithImpl(this._self, this._then);

  final _ComparisonFilter _self;
  final $Res Function(_ComparisonFilter) _then;

  /// Create a copy of ComparisonFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? key = null,
    Object? value = null,
    Object? operation = null,
    Object? switchOn = freezed,
    Object? cases = freezed,
  }) {
    return _then(_ComparisonFilter(
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      operation: null == operation
          ? _self.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String,
      switchOn: freezed == switchOn
          ? _self.switchOn
          : switchOn // ignore: cast_nullable_to_non_nullable
              as String?,
      cases: freezed == cases
          ? _self._cases
          : cases // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

// dart format on
