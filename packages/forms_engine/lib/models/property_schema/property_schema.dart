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
    Map<String, PropertySchema>? properties,
    List<String>? required,
    List<String>? enums,
    PropertySchemaFormat? format,
    DateFormatValue? firstDate,
    DateFormatValue? lastDate,
    int? minLength,
    int? maxLength,
    String? hint,
    String? label,
    dynamic value,
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

enum PropertySchemaFormat {
  date,
  dateTime,
  incrementer;
}

enum PropertySchemaType { object, string }
