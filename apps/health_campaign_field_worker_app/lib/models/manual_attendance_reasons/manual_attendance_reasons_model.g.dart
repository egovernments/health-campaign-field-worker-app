// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manual_attendance_reasons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManualAttendanceReasonsWrapperModel
_$ManualAttendanceReasonsWrapperModelFromJson(
  Map<String, dynamic> json,
) => _ManualAttendanceReasonsWrapperModel(
  manualAttendanceReasons: (json['manualAttendanceReasons'] as List<dynamic>?)
      ?.map(
        (e) => ManualAttendanceReasonType.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$ManualAttendanceReasonsWrapperModelToJson(
  _ManualAttendanceReasonsWrapperModel instance,
) => <String, dynamic>{
  'manualAttendanceReasons': instance.manualAttendanceReasons,
};

_ManualAttendanceReasonType _$ManualAttendanceReasonTypeFromJson(
  Map<String, dynamic> json,
) => _ManualAttendanceReasonType(
  code: json['code'] as String,
  name: json['name'] as String,
  active: json['active'] as bool,
);

Map<String, dynamic> _$ManualAttendanceReasonTypeToJson(
  _ManualAttendanceReasonType instance,
) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'active': instance.active,
};
