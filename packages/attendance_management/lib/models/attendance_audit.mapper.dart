// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'attendance_audit.dart';

class AttendanceAuditDetailsMapper
    extends ClassMapperBase<AttendanceAuditDetails> {
  AttendanceAuditDetailsMapper._();

  static AttendanceAuditDetailsMapper? _instance;
  static AttendanceAuditDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AttendanceAuditDetailsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AttendanceAuditDetails';

  static String _$createdBy(AttendanceAuditDetails v) => v.createdBy;
  static const Field<AttendanceAuditDetails, String> _f$createdBy =
      Field('createdBy', _$createdBy);
  static int _$createdTime(AttendanceAuditDetails v) => v.createdTime;
  static const Field<AttendanceAuditDetails, int> _f$createdTime =
      Field('createdTime', _$createdTime);
  static String _$lastModifiedBy(AttendanceAuditDetails v) => v.lastModifiedBy;
  static const Field<AttendanceAuditDetails, String> _f$lastModifiedBy =
      Field('lastModifiedBy', _$lastModifiedBy, opt: true);
  static int _$lastModifiedTime(AttendanceAuditDetails v) => v.lastModifiedTime;
  static const Field<AttendanceAuditDetails, int> _f$lastModifiedTime =
      Field('lastModifiedTime', _$lastModifiedTime, opt: true);

  @override
  final MappableFields<AttendanceAuditDetails> fields = const {
    #createdBy: _f$createdBy,
    #createdTime: _f$createdTime,
    #lastModifiedBy: _f$lastModifiedBy,
    #lastModifiedTime: _f$lastModifiedTime,
  };

  static AttendanceAuditDetails _instantiate(DecodingData data) {
    return AttendanceAuditDetails(
        createdBy: data.dec(_f$createdBy),
        createdTime: data.dec(_f$createdTime),
        lastModifiedBy: data.dec(_f$lastModifiedBy),
        lastModifiedTime: data.dec(_f$lastModifiedTime));
  }

  @override
  final Function instantiate = _instantiate;

  static AttendanceAuditDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AttendanceAuditDetails>(map);
  }

  static AttendanceAuditDetails fromJson(String json) {
    return ensureInitialized().decodeJson<AttendanceAuditDetails>(json);
  }
}

mixin AttendanceAuditDetailsMappable {
  String toJson() {
    return AttendanceAuditDetailsMapper.ensureInitialized()
        .encodeJson<AttendanceAuditDetails>(this as AttendanceAuditDetails);
  }

  Map<String, dynamic> toMap() {
    return AttendanceAuditDetailsMapper.ensureInitialized()
        .encodeMap<AttendanceAuditDetails>(this as AttendanceAuditDetails);
  }

  AttendanceAuditDetailsCopyWith<AttendanceAuditDetails, AttendanceAuditDetails,
          AttendanceAuditDetails>
      get copyWith => _AttendanceAuditDetailsCopyWithImpl(
          this as AttendanceAuditDetails, $identity, $identity);
  @override
  String toString() {
    return AttendanceAuditDetailsMapper.ensureInitialized()
        .stringifyValue(this as AttendanceAuditDetails);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AttendanceAuditDetailsMapper.ensureInitialized()
                .isValueEqual(this as AttendanceAuditDetails, other));
  }

  @override
  int get hashCode {
    return AttendanceAuditDetailsMapper.ensureInitialized()
        .hashValue(this as AttendanceAuditDetails);
  }
}

extension AttendanceAuditDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AttendanceAuditDetails, $Out> {
  AttendanceAuditDetailsCopyWith<$R, AttendanceAuditDetails, $Out>
      get $asAttendanceAuditDetails =>
          $base.as((v, t, t2) => _AttendanceAuditDetailsCopyWithImpl(v, t, t2));
}

abstract class AttendanceAuditDetailsCopyWith<
    $R,
    $In extends AttendanceAuditDetails,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? createdBy,
      int? createdTime,
      String? lastModifiedBy,
      int? lastModifiedTime});
  AttendanceAuditDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AttendanceAuditDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AttendanceAuditDetails, $Out>
    implements
        AttendanceAuditDetailsCopyWith<$R, AttendanceAuditDetails, $Out> {
  _AttendanceAuditDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AttendanceAuditDetails> $mapper =
      AttendanceAuditDetailsMapper.ensureInitialized();
  @override
  $R call(
          {String? createdBy,
          int? createdTime,
          Object? lastModifiedBy = $none,
          Object? lastModifiedTime = $none}) =>
      $apply(FieldCopyWithData({
        if (createdBy != null) #createdBy: createdBy,
        if (createdTime != null) #createdTime: createdTime,
        if (lastModifiedBy != $none) #lastModifiedBy: lastModifiedBy,
        if (lastModifiedTime != $none) #lastModifiedTime: lastModifiedTime
      }));
  @override
  AttendanceAuditDetails $make(CopyWithData data) => AttendanceAuditDetails(
      createdBy: data.get(#createdBy, or: $value.createdBy),
      createdTime: data.get(#createdTime, or: $value.createdTime),
      lastModifiedBy: data.get(#lastModifiedBy, or: $value.lastModifiedBy),
      lastModifiedTime:
          data.get(#lastModifiedTime, or: $value.lastModifiedTime));

  @override
  AttendanceAuditDetailsCopyWith<$R2, AttendanceAuditDetails, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AttendanceAuditDetailsCopyWithImpl($value, $cast, t);
}
