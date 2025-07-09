// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manual_attendance_reasons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ManualAttendanceReasonsWrapperModelImpl
    _$$ManualAttendanceReasonsWrapperModelImplFromJson(
            Map<String, dynamic> json) =>
        _$ManualAttendanceReasonsWrapperModelImpl(
          manualAttendanceReasons:
              (json['manualAttendanceReasons'] as List<dynamic>?)
                  ?.map((e) => ManualAttendanceReasonType.fromJson(
                      e as Map<String, dynamic>))
                  .toList(),
        );

Map<String, dynamic> _$$ManualAttendanceReasonsWrapperModelImplToJson(
        _$ManualAttendanceReasonsWrapperModelImpl instance) =>
    <String, dynamic>{
      'manualAttendanceReasons': instance.manualAttendanceReasons,
    };

_$ManualAttendanceReasonTypeImpl _$$ManualAttendanceReasonTypeImplFromJson(
        Map<String, dynamic> json) =>
    _$ManualAttendanceReasonTypeImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$ManualAttendanceReasonTypeImplToJson(
        _$ManualAttendanceReasonTypeImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'active': instance.active,
    };
