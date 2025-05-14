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
    @JsonKey(name: 'type') required PropertySchemaType type,
    bool? readonly,
    bool? displayOnly,
    Map<String, PropertySchema>? properties,
    bool? required,
    List<String>? enums,
    PropertySchemaFormat? format,
    DateFormatValue? firstDate,
    DateFormatValue? lastDate,
    int? minLength,
    int? maxLength,
    num? maximum,
    String? helpText,
    String? innerLabel,
    num? minimum,
    String? hint,
    String? label,
    dynamic value,
    DisplayBehavior? displayBehavior,
    Map<String, dynamic>? conditions,
    int? order,
    String? actionLabel,
    String? description,
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
  string,
  mobileNumber,
  checkbox,
  integer,
  boolean,
  text;
}

enum PropertySchemaType { object, string, integer, boolean }
