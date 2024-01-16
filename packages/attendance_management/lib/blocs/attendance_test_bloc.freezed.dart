// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'attendance_test_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AttendanceEvents {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AttendanceDependencies attendanceDependencies)
        initial,
    required TResult Function(String id) loadHCMData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AttendanceDependencies attendanceDependencies)? initial,
    TResult? Function(String id)? loadHCMData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AttendanceDependencies attendanceDependencies)? initial,
    TResult Function(String id)? loadHCMData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAttendance value) initial,
    required TResult Function(LoadAttendanceRegisterData value) loadHCMData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialAttendance value)? initial,
    TResult? Function(LoadAttendanceRegisterData value)? loadHCMData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAttendance value)? initial,
    TResult Function(LoadAttendanceRegisterData value)? loadHCMData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceEventsCopyWith<$Res> {
  factory $AttendanceEventsCopyWith(
          AttendanceEvents value, $Res Function(AttendanceEvents) then) =
      _$AttendanceEventsCopyWithImpl<$Res, AttendanceEvents>;
}

/// @nodoc
class _$AttendanceEventsCopyWithImpl<$Res, $Val extends AttendanceEvents>
    implements $AttendanceEventsCopyWith<$Res> {
  _$AttendanceEventsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialAttendanceCopyWith<$Res> {
  factory _$$InitialAttendanceCopyWith(
          _$InitialAttendance value, $Res Function(_$InitialAttendance) then) =
      __$$InitialAttendanceCopyWithImpl<$Res>;
  @useResult
  $Res call({AttendanceDependencies attendanceDependencies});
}

/// @nodoc
class __$$InitialAttendanceCopyWithImpl<$Res>
    extends _$AttendanceEventsCopyWithImpl<$Res, _$InitialAttendance>
    implements _$$InitialAttendanceCopyWith<$Res> {
  __$$InitialAttendanceCopyWithImpl(
      _$InitialAttendance _value, $Res Function(_$InitialAttendance) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceDependencies = null,
  }) {
    return _then(_$InitialAttendance(
      null == attendanceDependencies
          ? _value.attendanceDependencies
          : attendanceDependencies // ignore: cast_nullable_to_non_nullable
              as AttendanceDependencies,
    ));
  }
}

/// @nodoc

class _$InitialAttendance implements InitialAttendance {
  const _$InitialAttendance(this.attendanceDependencies);

  @override
  final AttendanceDependencies attendanceDependencies;

  @override
  String toString() {
    return 'AttendanceEvents.initial(attendanceDependencies: $attendanceDependencies)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialAttendance &&
            (identical(other.attendanceDependencies, attendanceDependencies) ||
                other.attendanceDependencies == attendanceDependencies));
  }

  @override
  int get hashCode => Object.hash(runtimeType, attendanceDependencies);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialAttendanceCopyWith<_$InitialAttendance> get copyWith =>
      __$$InitialAttendanceCopyWithImpl<_$InitialAttendance>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AttendanceDependencies attendanceDependencies)
        initial,
    required TResult Function(String id) loadHCMData,
  }) {
    return initial(attendanceDependencies);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AttendanceDependencies attendanceDependencies)? initial,
    TResult? Function(String id)? loadHCMData,
  }) {
    return initial?.call(attendanceDependencies);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AttendanceDependencies attendanceDependencies)? initial,
    TResult Function(String id)? loadHCMData,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(attendanceDependencies);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAttendance value) initial,
    required TResult Function(LoadAttendanceRegisterData value) loadHCMData,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialAttendance value)? initial,
    TResult? Function(LoadAttendanceRegisterData value)? loadHCMData,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAttendance value)? initial,
    TResult Function(LoadAttendanceRegisterData value)? loadHCMData,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialAttendance implements AttendanceEvents {
  const factory InitialAttendance(
          final AttendanceDependencies attendanceDependencies) =
      _$InitialAttendance;

  AttendanceDependencies get attendanceDependencies;
  @JsonKey(ignore: true)
  _$$InitialAttendanceCopyWith<_$InitialAttendance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadAttendanceRegisterDataCopyWith<$Res> {
  factory _$$LoadAttendanceRegisterDataCopyWith(
          _$LoadAttendanceRegisterData value,
          $Res Function(_$LoadAttendanceRegisterData) then) =
      __$$LoadAttendanceRegisterDataCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$LoadAttendanceRegisterDataCopyWithImpl<$Res>
    extends _$AttendanceEventsCopyWithImpl<$Res, _$LoadAttendanceRegisterData>
    implements _$$LoadAttendanceRegisterDataCopyWith<$Res> {
  __$$LoadAttendanceRegisterDataCopyWithImpl(
      _$LoadAttendanceRegisterData _value,
      $Res Function(_$LoadAttendanceRegisterData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$LoadAttendanceRegisterData(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadAttendanceRegisterData implements LoadAttendanceRegisterData {
  const _$LoadAttendanceRegisterData(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'AttendanceEvents.loadHCMData(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadAttendanceRegisterData &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadAttendanceRegisterDataCopyWith<_$LoadAttendanceRegisterData>
      get copyWith => __$$LoadAttendanceRegisterDataCopyWithImpl<
          _$LoadAttendanceRegisterData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AttendanceDependencies attendanceDependencies)
        initial,
    required TResult Function(String id) loadHCMData,
  }) {
    return loadHCMData(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AttendanceDependencies attendanceDependencies)? initial,
    TResult? Function(String id)? loadHCMData,
  }) {
    return loadHCMData?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AttendanceDependencies attendanceDependencies)? initial,
    TResult Function(String id)? loadHCMData,
    required TResult orElse(),
  }) {
    if (loadHCMData != null) {
      return loadHCMData(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAttendance value) initial,
    required TResult Function(LoadAttendanceRegisterData value) loadHCMData,
  }) {
    return loadHCMData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialAttendance value)? initial,
    TResult? Function(LoadAttendanceRegisterData value)? loadHCMData,
  }) {
    return loadHCMData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAttendance value)? initial,
    TResult Function(LoadAttendanceRegisterData value)? loadHCMData,
    required TResult orElse(),
  }) {
    if (loadHCMData != null) {
      return loadHCMData(this);
    }
    return orElse();
  }
}

abstract class LoadAttendanceRegisterData implements AttendanceEvents {
  const factory LoadAttendanceRegisterData(final String id) =
      _$LoadAttendanceRegisterData;

  String get id;
  @JsonKey(ignore: true)
  _$$LoadAttendanceRegisterDataCopyWith<_$LoadAttendanceRegisterData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AttendanceStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() registerLoading,
    required TResult Function(String id) registerLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? registerLoading,
    TResult? Function(String id)? registerLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? registerLoading,
    TResult Function(String id)? registerLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterLoading value) registerLoading,
    required TResult Function(RegisterLoaded value) registerLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterLoading value)? registerLoading,
    TResult? Function(RegisterLoaded value)? registerLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterLoading value)? registerLoading,
    TResult Function(RegisterLoaded value)? registerLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceStatesCopyWith<$Res> {
  factory $AttendanceStatesCopyWith(
          AttendanceStates value, $Res Function(AttendanceStates) then) =
      _$AttendanceStatesCopyWithImpl<$Res, AttendanceStates>;
}

/// @nodoc
class _$AttendanceStatesCopyWithImpl<$Res, $Val extends AttendanceStates>
    implements $AttendanceStatesCopyWith<$Res> {
  _$AttendanceStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RegisterLoadingCopyWith<$Res> {
  factory _$$RegisterLoadingCopyWith(
          _$RegisterLoading value, $Res Function(_$RegisterLoading) then) =
      __$$RegisterLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterLoadingCopyWithImpl<$Res>
    extends _$AttendanceStatesCopyWithImpl<$Res, _$RegisterLoading>
    implements _$$RegisterLoadingCopyWith<$Res> {
  __$$RegisterLoadingCopyWithImpl(
      _$RegisterLoading _value, $Res Function(_$RegisterLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterLoading implements RegisterLoading {
  const _$RegisterLoading();

  @override
  String toString() {
    return 'AttendanceStates.registerLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegisterLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() registerLoading,
    required TResult Function(String id) registerLoaded,
  }) {
    return registerLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? registerLoading,
    TResult? Function(String id)? registerLoaded,
  }) {
    return registerLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? registerLoading,
    TResult Function(String id)? registerLoaded,
    required TResult orElse(),
  }) {
    if (registerLoading != null) {
      return registerLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterLoading value) registerLoading,
    required TResult Function(RegisterLoaded value) registerLoaded,
  }) {
    return registerLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterLoading value)? registerLoading,
    TResult? Function(RegisterLoaded value)? registerLoaded,
  }) {
    return registerLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterLoading value)? registerLoading,
    TResult Function(RegisterLoaded value)? registerLoaded,
    required TResult orElse(),
  }) {
    if (registerLoading != null) {
      return registerLoading(this);
    }
    return orElse();
  }
}

abstract class RegisterLoading implements AttendanceStates {
  const factory RegisterLoading() = _$RegisterLoading;
}

/// @nodoc
abstract class _$$RegisterLoadedCopyWith<$Res> {
  factory _$$RegisterLoadedCopyWith(
          _$RegisterLoaded value, $Res Function(_$RegisterLoaded) then) =
      __$$RegisterLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$RegisterLoadedCopyWithImpl<$Res>
    extends _$AttendanceStatesCopyWithImpl<$Res, _$RegisterLoaded>
    implements _$$RegisterLoadedCopyWith<$Res> {
  __$$RegisterLoadedCopyWithImpl(
      _$RegisterLoaded _value, $Res Function(_$RegisterLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RegisterLoaded(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterLoaded implements RegisterLoaded {
  const _$RegisterLoaded(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'AttendanceStates.registerLoaded(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterLoaded &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterLoadedCopyWith<_$RegisterLoaded> get copyWith =>
      __$$RegisterLoadedCopyWithImpl<_$RegisterLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() registerLoading,
    required TResult Function(String id) registerLoaded,
  }) {
    return registerLoaded(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? registerLoading,
    TResult? Function(String id)? registerLoaded,
  }) {
    return registerLoaded?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? registerLoading,
    TResult Function(String id)? registerLoaded,
    required TResult orElse(),
  }) {
    if (registerLoaded != null) {
      return registerLoaded(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterLoading value) registerLoading,
    required TResult Function(RegisterLoaded value) registerLoaded,
  }) {
    return registerLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterLoading value)? registerLoading,
    TResult? Function(RegisterLoaded value)? registerLoaded,
  }) {
    return registerLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterLoading value)? registerLoading,
    TResult Function(RegisterLoaded value)? registerLoaded,
    required TResult orElse(),
  }) {
    if (registerLoaded != null) {
      return registerLoaded(this);
    }
    return orElse();
  }
}

abstract class RegisterLoaded implements AttendanceStates {
  const factory RegisterLoaded(final String id) = _$RegisterLoaded;

  String get id;
  @JsonKey(ignore: true)
  _$$RegisterLoadedCopyWith<_$RegisterLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
