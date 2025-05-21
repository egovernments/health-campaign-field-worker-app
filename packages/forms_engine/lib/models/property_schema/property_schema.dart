// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'property_schema.freezed.dart';
part 'property_schema.g.dart';

@freezed
class PropertySchema with _$PropertySchema {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
  )
  const factory PropertySchema({
    @JsonKey(
      name: 'type',
      unknownEnumValue: PropertySchemaType.string,
    )
    required PropertySchemaType type,
    bool? readonly,
    bool? displayOnly,
    Map<String, PropertySchema>? properties,
    List<Option>? enums,
    String? schemaCode,
    @JsonKey(
      name: 'format',
      unknownEnumValue: PropertySchemaFormat.text,
    )
    PropertySchemaFormat? format,
    DateFormatValue? firstDate,
    DateFormatValue? lastDate,
    int? minValue,
    int? maxValue,
    int? minLength,
    int? maxLength,
    String? helpText,
    String? tooltipText,
    String? innerLabel,
    String? label,
    dynamic value,
    DisplayBehavior? displayBehavior,
    Map<String, dynamic>? conditions,
    int? order,
    String? actionLabel,
    String? description,
    List<ValidationRule>? validations,
  }) = _PropertySchema;



  factory PropertySchema.fromJson(Map<String, dynamic> json) =>
      _$PropertySchemaFromJson(json);
}

@freezed
class DateFormatValue with _$DateFormatValue {
  const DateFormatValue._();

  const factory DateFormatValue({
    required String value,
    @Default('yyyy-MM-dd') String format,
  }) = _DateFormatValue;

  factory DateFormatValue.fromJson(Map<String, dynamic> json) =>
      _$DateFormatValueFromJson(json);

  factory DateFormatValue.fromDateTime(
    DateTime dateTime, [
    String format = 'yyyy-MM-dd',
  ]) =>
      DateFormatValue(value: DateFormat(format).format(dateTime));

  DateTime get dateValue => DateFormat(format).parse(value);
}

@freezed
class ValidationRule with _$ValidationRule {
  const factory ValidationRule({
    required String type,
    dynamic value,
    String? message,
  }) = _ValidationRule;

  factory ValidationRule.fromJson(Map<String, dynamic> json) =>
      _$ValidationRuleFromJson(json);
}

@freezed
class Option with _$Option {
  const factory Option({
    required String code,
    required String name,
  }) = _Option;

  factory Option.fromJson(Map<String, dynamic> json) =>
      _$OptionFromJson(json);
}

@freezed
class DisplayBehavior with _$DisplayBehavior {
  const factory DisplayBehavior({
    required FormulaBehavior behavior,
    List<String>? oneOf,
    List<String>? allOf,
  }) = _DisplayBehavior;

  factory DisplayBehavior.fromJson(Map<String, dynamic> json) =>
      _$DisplayBehaviorFromJson(json);
}

enum FormulaBehavior { show, hide }

enum PropertySchemaFormat {
  date,
  latLng,
  custom,
  locality,
  select,
  numeric,
  dropdown,
  checkbox,
  radio,
  dob,
  scanner,
  text;
}

enum PropertySchemaType { object, string, integer, boolean }
