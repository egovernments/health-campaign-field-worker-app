import 'package:freezed_annotation/freezed_annotation.dart';

part 'manual_attendance_reasons_model.freezed.dart';
part 'manual_attendance_reasons_model.g.dart';

@freezed
class ManualAttendanceReasonsWrapperModel with _$ManualAttendanceReasonsWrapperModel {
  const factory ManualAttendanceReasonsWrapperModel({
    @JsonKey(name: 'manualAttendanceReasons')
        List<ManualAttendanceReasonType>? manualAttendanceReasons,
  }) = _ManualAttendanceReasonsWrapperModel;

  factory ManualAttendanceReasonsWrapperModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ManualAttendanceReasonsWrapperModelFromJson(json);
}

@freezed
class ManualAttendanceReasonType with _$ManualAttendanceReasonType {
  const factory ManualAttendanceReasonType({
    required String code,
    required String name,
    required bool active,
  }) = _ManualAttendanceReasonType;

  factory ManualAttendanceReasonType.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ManualAttendanceReasonTypeFromJson(json);
}
