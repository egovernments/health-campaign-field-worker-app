// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'attendance_bloc.dart';

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
    required TResult Function() initial,
    required TResult Function(
            List<AttendanceRegisterModel> registers, int limit, int offset)
        loadAttendanceRegisters,
    required TResult Function(
            List<AttendanceRegisterModel> registers, String registerID)
        loadSelectedRegister,
    required TResult Function(int? limit, int? offset)
        loadMoreAttendanceRegisters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<AttendanceRegisterModel> registers, int limit, int offset)?
        loadAttendanceRegisters,
    TResult? Function(
            List<AttendanceRegisterModel> registers, String registerID)?
        loadSelectedRegister,
    TResult? Function(int? limit, int? offset)? loadMoreAttendanceRegisters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<AttendanceRegisterModel> registers, int limit, int offset)?
        loadAttendanceRegisters,
    TResult Function(
            List<AttendanceRegisterModel> registers, String registerID)?
        loadSelectedRegister,
    TResult Function(int? limit, int? offset)? loadMoreAttendanceRegisters,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAttendance value) initial,
    required TResult Function(LoadAttendanceRegisterData value)
        loadAttendanceRegisters,
    required TResult Function(LoadSelectedAttendanceRegisterData value)
        loadSelectedRegister,
    required TResult Function(LoadMoreAttendanceRegisterData value)
        loadMoreAttendanceRegisters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialAttendance value)? initial,
    TResult? Function(LoadAttendanceRegisterData value)?
        loadAttendanceRegisters,
    TResult? Function(LoadSelectedAttendanceRegisterData value)?
        loadSelectedRegister,
    TResult? Function(LoadMoreAttendanceRegisterData value)?
        loadMoreAttendanceRegisters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAttendance value)? initial,
    TResult Function(LoadAttendanceRegisterData value)? loadAttendanceRegisters,
    TResult Function(LoadSelectedAttendanceRegisterData value)?
        loadSelectedRegister,
    TResult Function(LoadMoreAttendanceRegisterData value)?
        loadMoreAttendanceRegisters,
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
}

/// @nodoc
class __$$InitialAttendanceCopyWithImpl<$Res>
    extends _$AttendanceEventsCopyWithImpl<$Res, _$InitialAttendance>
    implements _$$InitialAttendanceCopyWith<$Res> {
  __$$InitialAttendanceCopyWithImpl(
      _$InitialAttendance _value, $Res Function(_$InitialAttendance) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialAttendance implements InitialAttendance {
  const _$InitialAttendance();

  @override
  String toString() {
    return 'AttendanceEvents.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialAttendance);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<AttendanceRegisterModel> registers, int limit, int offset)
        loadAttendanceRegisters,
    required TResult Function(
            List<AttendanceRegisterModel> registers, String registerID)
        loadSelectedRegister,
    required TResult Function(int? limit, int? offset)
        loadMoreAttendanceRegisters,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<AttendanceRegisterModel> registers, int limit, int offset)?
        loadAttendanceRegisters,
    TResult? Function(
            List<AttendanceRegisterModel> registers, String registerID)?
        loadSelectedRegister,
    TResult? Function(int? limit, int? offset)? loadMoreAttendanceRegisters,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<AttendanceRegisterModel> registers, int limit, int offset)?
        loadAttendanceRegisters,
    TResult Function(
            List<AttendanceRegisterModel> registers, String registerID)?
        loadSelectedRegister,
    TResult Function(int? limit, int? offset)? loadMoreAttendanceRegisters,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAttendance value) initial,
    required TResult Function(LoadAttendanceRegisterData value)
        loadAttendanceRegisters,
    required TResult Function(LoadSelectedAttendanceRegisterData value)
        loadSelectedRegister,
    required TResult Function(LoadMoreAttendanceRegisterData value)
        loadMoreAttendanceRegisters,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialAttendance value)? initial,
    TResult? Function(LoadAttendanceRegisterData value)?
        loadAttendanceRegisters,
    TResult? Function(LoadSelectedAttendanceRegisterData value)?
        loadSelectedRegister,
    TResult? Function(LoadMoreAttendanceRegisterData value)?
        loadMoreAttendanceRegisters,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAttendance value)? initial,
    TResult Function(LoadAttendanceRegisterData value)? loadAttendanceRegisters,
    TResult Function(LoadSelectedAttendanceRegisterData value)?
        loadSelectedRegister,
    TResult Function(LoadMoreAttendanceRegisterData value)?
        loadMoreAttendanceRegisters,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialAttendance implements AttendanceEvents {
  const factory InitialAttendance() = _$InitialAttendance;
}

/// @nodoc
abstract class _$$LoadAttendanceRegisterDataCopyWith<$Res> {
  factory _$$LoadAttendanceRegisterDataCopyWith(
          _$LoadAttendanceRegisterData value,
          $Res Function(_$LoadAttendanceRegisterData) then) =
      __$$LoadAttendanceRegisterDataCopyWithImpl<$Res>;
  @useResult
  $Res call({List<AttendanceRegisterModel> registers, int limit, int offset});
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
    Object? registers = null,
    Object? limit = null,
    Object? offset = null,
  }) {
    return _then(_$LoadAttendanceRegisterData(
      null == registers
          ? _value._registers
          : registers // ignore: cast_nullable_to_non_nullable
              as List<AttendanceRegisterModel>,
      null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadAttendanceRegisterData implements LoadAttendanceRegisterData {
  const _$LoadAttendanceRegisterData(
      final List<AttendanceRegisterModel> registers, this.limit, this.offset)
      : _registers = registers;

  final List<AttendanceRegisterModel> _registers;
  @override
  List<AttendanceRegisterModel> get registers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_registers);
  }

  @override
  final int limit;
  @override
  final int offset;

  @override
  String toString() {
    return 'AttendanceEvents.loadAttendanceRegisters(registers: $registers, limit: $limit, offset: $offset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadAttendanceRegisterData &&
            const DeepCollectionEquality()
                .equals(other._registers, _registers) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_registers), limit, offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadAttendanceRegisterDataCopyWith<_$LoadAttendanceRegisterData>
      get copyWith => __$$LoadAttendanceRegisterDataCopyWithImpl<
          _$LoadAttendanceRegisterData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<AttendanceRegisterModel> registers, int limit, int offset)
        loadAttendanceRegisters,
    required TResult Function(
            List<AttendanceRegisterModel> registers, String registerID)
        loadSelectedRegister,
    required TResult Function(int? limit, int? offset)
        loadMoreAttendanceRegisters,
  }) {
    return loadAttendanceRegisters(registers, limit, offset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<AttendanceRegisterModel> registers, int limit, int offset)?
        loadAttendanceRegisters,
    TResult? Function(
            List<AttendanceRegisterModel> registers, String registerID)?
        loadSelectedRegister,
    TResult? Function(int? limit, int? offset)? loadMoreAttendanceRegisters,
  }) {
    return loadAttendanceRegisters?.call(registers, limit, offset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<AttendanceRegisterModel> registers, int limit, int offset)?
        loadAttendanceRegisters,
    TResult Function(
            List<AttendanceRegisterModel> registers, String registerID)?
        loadSelectedRegister,
    TResult Function(int? limit, int? offset)? loadMoreAttendanceRegisters,
    required TResult orElse(),
  }) {
    if (loadAttendanceRegisters != null) {
      return loadAttendanceRegisters(registers, limit, offset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAttendance value) initial,
    required TResult Function(LoadAttendanceRegisterData value)
        loadAttendanceRegisters,
    required TResult Function(LoadSelectedAttendanceRegisterData value)
        loadSelectedRegister,
    required TResult Function(LoadMoreAttendanceRegisterData value)
        loadMoreAttendanceRegisters,
  }) {
    return loadAttendanceRegisters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialAttendance value)? initial,
    TResult? Function(LoadAttendanceRegisterData value)?
        loadAttendanceRegisters,
    TResult? Function(LoadSelectedAttendanceRegisterData value)?
        loadSelectedRegister,
    TResult? Function(LoadMoreAttendanceRegisterData value)?
        loadMoreAttendanceRegisters,
  }) {
    return loadAttendanceRegisters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAttendance value)? initial,
    TResult Function(LoadAttendanceRegisterData value)? loadAttendanceRegisters,
    TResult Function(LoadSelectedAttendanceRegisterData value)?
        loadSelectedRegister,
    TResult Function(LoadMoreAttendanceRegisterData value)?
        loadMoreAttendanceRegisters,
    required TResult orElse(),
  }) {
    if (loadAttendanceRegisters != null) {
      return loadAttendanceRegisters(this);
    }
    return orElse();
  }
}

abstract class LoadAttendanceRegisterData implements AttendanceEvents {
  const factory LoadAttendanceRegisterData(
      final List<AttendanceRegisterModel> registers,
      final int limit,
      final int offset) = _$LoadAttendanceRegisterData;

  List<AttendanceRegisterModel> get registers;
  int get limit;
  int get offset;
  @JsonKey(ignore: true)
  _$$LoadAttendanceRegisterDataCopyWith<_$LoadAttendanceRegisterData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadSelectedAttendanceRegisterDataCopyWith<$Res> {
  factory _$$LoadSelectedAttendanceRegisterDataCopyWith(
          _$LoadSelectedAttendanceRegisterData value,
          $Res Function(_$LoadSelectedAttendanceRegisterData) then) =
      __$$LoadSelectedAttendanceRegisterDataCopyWithImpl<$Res>;
  @useResult
  $Res call({List<AttendanceRegisterModel> registers, String registerID});
}

/// @nodoc
class __$$LoadSelectedAttendanceRegisterDataCopyWithImpl<$Res>
    extends _$AttendanceEventsCopyWithImpl<$Res,
        _$LoadSelectedAttendanceRegisterData>
    implements _$$LoadSelectedAttendanceRegisterDataCopyWith<$Res> {
  __$$LoadSelectedAttendanceRegisterDataCopyWithImpl(
      _$LoadSelectedAttendanceRegisterData _value,
      $Res Function(_$LoadSelectedAttendanceRegisterData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registers = null,
    Object? registerID = null,
  }) {
    return _then(_$LoadSelectedAttendanceRegisterData(
      registers: null == registers
          ? _value._registers
          : registers // ignore: cast_nullable_to_non_nullable
              as List<AttendanceRegisterModel>,
      registerID: null == registerID
          ? _value.registerID
          : registerID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadSelectedAttendanceRegisterData
    implements LoadSelectedAttendanceRegisterData {
  const _$LoadSelectedAttendanceRegisterData(
      {required final List<AttendanceRegisterModel> registers,
      required this.registerID})
      : _registers = registers;

  final List<AttendanceRegisterModel> _registers;
  @override
  List<AttendanceRegisterModel> get registers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_registers);
  }

  @override
  final String registerID;

  @override
  String toString() {
    return 'AttendanceEvents.loadSelectedRegister(registers: $registers, registerID: $registerID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSelectedAttendanceRegisterData &&
            const DeepCollectionEquality()
                .equals(other._registers, _registers) &&
            (identical(other.registerID, registerID) ||
                other.registerID == registerID));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_registers), registerID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSelectedAttendanceRegisterDataCopyWith<
          _$LoadSelectedAttendanceRegisterData>
      get copyWith => __$$LoadSelectedAttendanceRegisterDataCopyWithImpl<
          _$LoadSelectedAttendanceRegisterData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<AttendanceRegisterModel> registers, int limit, int offset)
        loadAttendanceRegisters,
    required TResult Function(
            List<AttendanceRegisterModel> registers, String registerID)
        loadSelectedRegister,
    required TResult Function(int? limit, int? offset)
        loadMoreAttendanceRegisters,
  }) {
    return loadSelectedRegister(registers, registerID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<AttendanceRegisterModel> registers, int limit, int offset)?
        loadAttendanceRegisters,
    TResult? Function(
            List<AttendanceRegisterModel> registers, String registerID)?
        loadSelectedRegister,
    TResult? Function(int? limit, int? offset)? loadMoreAttendanceRegisters,
  }) {
    return loadSelectedRegister?.call(registers, registerID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<AttendanceRegisterModel> registers, int limit, int offset)?
        loadAttendanceRegisters,
    TResult Function(
            List<AttendanceRegisterModel> registers, String registerID)?
        loadSelectedRegister,
    TResult Function(int? limit, int? offset)? loadMoreAttendanceRegisters,
    required TResult orElse(),
  }) {
    if (loadSelectedRegister != null) {
      return loadSelectedRegister(registers, registerID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAttendance value) initial,
    required TResult Function(LoadAttendanceRegisterData value)
        loadAttendanceRegisters,
    required TResult Function(LoadSelectedAttendanceRegisterData value)
        loadSelectedRegister,
    required TResult Function(LoadMoreAttendanceRegisterData value)
        loadMoreAttendanceRegisters,
  }) {
    return loadSelectedRegister(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialAttendance value)? initial,
    TResult? Function(LoadAttendanceRegisterData value)?
        loadAttendanceRegisters,
    TResult? Function(LoadSelectedAttendanceRegisterData value)?
        loadSelectedRegister,
    TResult? Function(LoadMoreAttendanceRegisterData value)?
        loadMoreAttendanceRegisters,
  }) {
    return loadSelectedRegister?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAttendance value)? initial,
    TResult Function(LoadAttendanceRegisterData value)? loadAttendanceRegisters,
    TResult Function(LoadSelectedAttendanceRegisterData value)?
        loadSelectedRegister,
    TResult Function(LoadMoreAttendanceRegisterData value)?
        loadMoreAttendanceRegisters,
    required TResult orElse(),
  }) {
    if (loadSelectedRegister != null) {
      return loadSelectedRegister(this);
    }
    return orElse();
  }
}

abstract class LoadSelectedAttendanceRegisterData implements AttendanceEvents {
  const factory LoadSelectedAttendanceRegisterData(
      {required final List<AttendanceRegisterModel> registers,
      required final String registerID}) = _$LoadSelectedAttendanceRegisterData;

  List<AttendanceRegisterModel> get registers;
  String get registerID;
  @JsonKey(ignore: true)
  _$$LoadSelectedAttendanceRegisterDataCopyWith<
          _$LoadSelectedAttendanceRegisterData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreAttendanceRegisterDataCopyWith<$Res> {
  factory _$$LoadMoreAttendanceRegisterDataCopyWith(
          _$LoadMoreAttendanceRegisterData value,
          $Res Function(_$LoadMoreAttendanceRegisterData) then) =
      __$$LoadMoreAttendanceRegisterDataCopyWithImpl<$Res>;
  @useResult
  $Res call({int? limit, int? offset});
}

/// @nodoc
class __$$LoadMoreAttendanceRegisterDataCopyWithImpl<$Res>
    extends _$AttendanceEventsCopyWithImpl<$Res,
        _$LoadMoreAttendanceRegisterData>
    implements _$$LoadMoreAttendanceRegisterDataCopyWith<$Res> {
  __$$LoadMoreAttendanceRegisterDataCopyWithImpl(
      _$LoadMoreAttendanceRegisterData _value,
      $Res Function(_$LoadMoreAttendanceRegisterData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = freezed,
    Object? offset = freezed,
  }) {
    return _then(_$LoadMoreAttendanceRegisterData(
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$LoadMoreAttendanceRegisterData
    implements LoadMoreAttendanceRegisterData {
  const _$LoadMoreAttendanceRegisterData({this.limit, this.offset});

  @override
  final int? limit;
  @override
  final int? offset;

  @override
  String toString() {
    return 'AttendanceEvents.loadMoreAttendanceRegisters(limit: $limit, offset: $offset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMoreAttendanceRegisterData &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit, offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMoreAttendanceRegisterDataCopyWith<_$LoadMoreAttendanceRegisterData>
      get copyWith => __$$LoadMoreAttendanceRegisterDataCopyWithImpl<
          _$LoadMoreAttendanceRegisterData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<AttendanceRegisterModel> registers, int limit, int offset)
        loadAttendanceRegisters,
    required TResult Function(
            List<AttendanceRegisterModel> registers, String registerID)
        loadSelectedRegister,
    required TResult Function(int? limit, int? offset)
        loadMoreAttendanceRegisters,
  }) {
    return loadMoreAttendanceRegisters(limit, offset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<AttendanceRegisterModel> registers, int limit, int offset)?
        loadAttendanceRegisters,
    TResult? Function(
            List<AttendanceRegisterModel> registers, String registerID)?
        loadSelectedRegister,
    TResult? Function(int? limit, int? offset)? loadMoreAttendanceRegisters,
  }) {
    return loadMoreAttendanceRegisters?.call(limit, offset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<AttendanceRegisterModel> registers, int limit, int offset)?
        loadAttendanceRegisters,
    TResult Function(
            List<AttendanceRegisterModel> registers, String registerID)?
        loadSelectedRegister,
    TResult Function(int? limit, int? offset)? loadMoreAttendanceRegisters,
    required TResult orElse(),
  }) {
    if (loadMoreAttendanceRegisters != null) {
      return loadMoreAttendanceRegisters(limit, offset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAttendance value) initial,
    required TResult Function(LoadAttendanceRegisterData value)
        loadAttendanceRegisters,
    required TResult Function(LoadSelectedAttendanceRegisterData value)
        loadSelectedRegister,
    required TResult Function(LoadMoreAttendanceRegisterData value)
        loadMoreAttendanceRegisters,
  }) {
    return loadMoreAttendanceRegisters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialAttendance value)? initial,
    TResult? Function(LoadAttendanceRegisterData value)?
        loadAttendanceRegisters,
    TResult? Function(LoadSelectedAttendanceRegisterData value)?
        loadSelectedRegister,
    TResult? Function(LoadMoreAttendanceRegisterData value)?
        loadMoreAttendanceRegisters,
  }) {
    return loadMoreAttendanceRegisters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAttendance value)? initial,
    TResult Function(LoadAttendanceRegisterData value)? loadAttendanceRegisters,
    TResult Function(LoadSelectedAttendanceRegisterData value)?
        loadSelectedRegister,
    TResult Function(LoadMoreAttendanceRegisterData value)?
        loadMoreAttendanceRegisters,
    required TResult orElse(),
  }) {
    if (loadMoreAttendanceRegisters != null) {
      return loadMoreAttendanceRegisters(this);
    }
    return orElse();
  }
}

abstract class LoadMoreAttendanceRegisterData implements AttendanceEvents {
  const factory LoadMoreAttendanceRegisterData(
      {final int? limit, final int? offset}) = _$LoadMoreAttendanceRegisterData;

  int? get limit;
  int? get offset;
  @JsonKey(ignore: true)
  _$$LoadMoreAttendanceRegisterDataCopyWith<_$LoadMoreAttendanceRegisterData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AttendanceStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() registerLoading,
    required TResult Function(List<AttendanceRegisterModel> registers)
        registerLoaded,
    required TResult Function(AttendanceRegisterModel? selectedRegister)
        selectedRegisterLoaded,
    required TResult Function(String message) registerError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? registerLoading,
    TResult? Function(List<AttendanceRegisterModel> registers)? registerLoaded,
    TResult? Function(AttendanceRegisterModel? selectedRegister)?
        selectedRegisterLoaded,
    TResult? Function(String message)? registerError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? registerLoading,
    TResult Function(List<AttendanceRegisterModel> registers)? registerLoaded,
    TResult Function(AttendanceRegisterModel? selectedRegister)?
        selectedRegisterLoaded,
    TResult Function(String message)? registerError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterLoading value) registerLoading,
    required TResult Function(RegisterLoaded value) registerLoaded,
    required TResult Function(SelectedRegisterLoaded value)
        selectedRegisterLoaded,
    required TResult Function(RegisterError value) registerError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterLoading value)? registerLoading,
    TResult? Function(RegisterLoaded value)? registerLoaded,
    TResult? Function(SelectedRegisterLoaded value)? selectedRegisterLoaded,
    TResult? Function(RegisterError value)? registerError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterLoading value)? registerLoading,
    TResult Function(RegisterLoaded value)? registerLoaded,
    TResult Function(SelectedRegisterLoaded value)? selectedRegisterLoaded,
    TResult Function(RegisterError value)? registerError,
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
    required TResult Function(List<AttendanceRegisterModel> registers)
        registerLoaded,
    required TResult Function(AttendanceRegisterModel? selectedRegister)
        selectedRegisterLoaded,
    required TResult Function(String message) registerError,
  }) {
    return registerLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? registerLoading,
    TResult? Function(List<AttendanceRegisterModel> registers)? registerLoaded,
    TResult? Function(AttendanceRegisterModel? selectedRegister)?
        selectedRegisterLoaded,
    TResult? Function(String message)? registerError,
  }) {
    return registerLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? registerLoading,
    TResult Function(List<AttendanceRegisterModel> registers)? registerLoaded,
    TResult Function(AttendanceRegisterModel? selectedRegister)?
        selectedRegisterLoaded,
    TResult Function(String message)? registerError,
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
    required TResult Function(SelectedRegisterLoaded value)
        selectedRegisterLoaded,
    required TResult Function(RegisterError value) registerError,
  }) {
    return registerLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterLoading value)? registerLoading,
    TResult? Function(RegisterLoaded value)? registerLoaded,
    TResult? Function(SelectedRegisterLoaded value)? selectedRegisterLoaded,
    TResult? Function(RegisterError value)? registerError,
  }) {
    return registerLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterLoading value)? registerLoading,
    TResult Function(RegisterLoaded value)? registerLoaded,
    TResult Function(SelectedRegisterLoaded value)? selectedRegisterLoaded,
    TResult Function(RegisterError value)? registerError,
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
  $Res call({List<AttendanceRegisterModel> registers});
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
    Object? registers = null,
  }) {
    return _then(_$RegisterLoaded(
      registers: null == registers
          ? _value._registers
          : registers // ignore: cast_nullable_to_non_nullable
              as List<AttendanceRegisterModel>,
    ));
  }
}

/// @nodoc

class _$RegisterLoaded implements RegisterLoaded {
  const _$RegisterLoaded(
      {required final List<AttendanceRegisterModel> registers})
      : _registers = registers;

  final List<AttendanceRegisterModel> _registers;
  @override
  List<AttendanceRegisterModel> get registers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_registers);
  }

  @override
  String toString() {
    return 'AttendanceStates.registerLoaded(registers: $registers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterLoaded &&
            const DeepCollectionEquality()
                .equals(other._registers, _registers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_registers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterLoadedCopyWith<_$RegisterLoaded> get copyWith =>
      __$$RegisterLoadedCopyWithImpl<_$RegisterLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() registerLoading,
    required TResult Function(List<AttendanceRegisterModel> registers)
        registerLoaded,
    required TResult Function(AttendanceRegisterModel? selectedRegister)
        selectedRegisterLoaded,
    required TResult Function(String message) registerError,
  }) {
    return registerLoaded(registers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? registerLoading,
    TResult? Function(List<AttendanceRegisterModel> registers)? registerLoaded,
    TResult? Function(AttendanceRegisterModel? selectedRegister)?
        selectedRegisterLoaded,
    TResult? Function(String message)? registerError,
  }) {
    return registerLoaded?.call(registers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? registerLoading,
    TResult Function(List<AttendanceRegisterModel> registers)? registerLoaded,
    TResult Function(AttendanceRegisterModel? selectedRegister)?
        selectedRegisterLoaded,
    TResult Function(String message)? registerError,
    required TResult orElse(),
  }) {
    if (registerLoaded != null) {
      return registerLoaded(registers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterLoading value) registerLoading,
    required TResult Function(RegisterLoaded value) registerLoaded,
    required TResult Function(SelectedRegisterLoaded value)
        selectedRegisterLoaded,
    required TResult Function(RegisterError value) registerError,
  }) {
    return registerLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterLoading value)? registerLoading,
    TResult? Function(RegisterLoaded value)? registerLoaded,
    TResult? Function(SelectedRegisterLoaded value)? selectedRegisterLoaded,
    TResult? Function(RegisterError value)? registerError,
  }) {
    return registerLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterLoading value)? registerLoading,
    TResult Function(RegisterLoaded value)? registerLoaded,
    TResult Function(SelectedRegisterLoaded value)? selectedRegisterLoaded,
    TResult Function(RegisterError value)? registerError,
    required TResult orElse(),
  }) {
    if (registerLoaded != null) {
      return registerLoaded(this);
    }
    return orElse();
  }
}

abstract class RegisterLoaded implements AttendanceStates {
  const factory RegisterLoaded(
          {required final List<AttendanceRegisterModel> registers}) =
      _$RegisterLoaded;

  List<AttendanceRegisterModel> get registers;
  @JsonKey(ignore: true)
  _$$RegisterLoadedCopyWith<_$RegisterLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectedRegisterLoadedCopyWith<$Res> {
  factory _$$SelectedRegisterLoadedCopyWith(_$SelectedRegisterLoaded value,
          $Res Function(_$SelectedRegisterLoaded) then) =
      __$$SelectedRegisterLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({AttendanceRegisterModel? selectedRegister});
}

/// @nodoc
class __$$SelectedRegisterLoadedCopyWithImpl<$Res>
    extends _$AttendanceStatesCopyWithImpl<$Res, _$SelectedRegisterLoaded>
    implements _$$SelectedRegisterLoadedCopyWith<$Res> {
  __$$SelectedRegisterLoadedCopyWithImpl(_$SelectedRegisterLoaded _value,
      $Res Function(_$SelectedRegisterLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedRegister = freezed,
  }) {
    return _then(_$SelectedRegisterLoaded(
      selectedRegister: freezed == selectedRegister
          ? _value.selectedRegister
          : selectedRegister // ignore: cast_nullable_to_non_nullable
              as AttendanceRegisterModel?,
    ));
  }
}

/// @nodoc

class _$SelectedRegisterLoaded implements SelectedRegisterLoaded {
  const _$SelectedRegisterLoaded({this.selectedRegister});

  @override
  final AttendanceRegisterModel? selectedRegister;

  @override
  String toString() {
    return 'AttendanceStates.selectedRegisterLoaded(selectedRegister: $selectedRegister)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedRegisterLoaded &&
            (identical(other.selectedRegister, selectedRegister) ||
                other.selectedRegister == selectedRegister));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedRegister);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedRegisterLoadedCopyWith<_$SelectedRegisterLoaded> get copyWith =>
      __$$SelectedRegisterLoadedCopyWithImpl<_$SelectedRegisterLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() registerLoading,
    required TResult Function(List<AttendanceRegisterModel> registers)
        registerLoaded,
    required TResult Function(AttendanceRegisterModel? selectedRegister)
        selectedRegisterLoaded,
    required TResult Function(String message) registerError,
  }) {
    return selectedRegisterLoaded(selectedRegister);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? registerLoading,
    TResult? Function(List<AttendanceRegisterModel> registers)? registerLoaded,
    TResult? Function(AttendanceRegisterModel? selectedRegister)?
        selectedRegisterLoaded,
    TResult? Function(String message)? registerError,
  }) {
    return selectedRegisterLoaded?.call(selectedRegister);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? registerLoading,
    TResult Function(List<AttendanceRegisterModel> registers)? registerLoaded,
    TResult Function(AttendanceRegisterModel? selectedRegister)?
        selectedRegisterLoaded,
    TResult Function(String message)? registerError,
    required TResult orElse(),
  }) {
    if (selectedRegisterLoaded != null) {
      return selectedRegisterLoaded(selectedRegister);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterLoading value) registerLoading,
    required TResult Function(RegisterLoaded value) registerLoaded,
    required TResult Function(SelectedRegisterLoaded value)
        selectedRegisterLoaded,
    required TResult Function(RegisterError value) registerError,
  }) {
    return selectedRegisterLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterLoading value)? registerLoading,
    TResult? Function(RegisterLoaded value)? registerLoaded,
    TResult? Function(SelectedRegisterLoaded value)? selectedRegisterLoaded,
    TResult? Function(RegisterError value)? registerError,
  }) {
    return selectedRegisterLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterLoading value)? registerLoading,
    TResult Function(RegisterLoaded value)? registerLoaded,
    TResult Function(SelectedRegisterLoaded value)? selectedRegisterLoaded,
    TResult Function(RegisterError value)? registerError,
    required TResult orElse(),
  }) {
    if (selectedRegisterLoaded != null) {
      return selectedRegisterLoaded(this);
    }
    return orElse();
  }
}

abstract class SelectedRegisterLoaded implements AttendanceStates {
  const factory SelectedRegisterLoaded(
          {final AttendanceRegisterModel? selectedRegister}) =
      _$SelectedRegisterLoaded;

  AttendanceRegisterModel? get selectedRegister;
  @JsonKey(ignore: true)
  _$$SelectedRegisterLoadedCopyWith<_$SelectedRegisterLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterErrorCopyWith<$Res> {
  factory _$$RegisterErrorCopyWith(
          _$RegisterError value, $Res Function(_$RegisterError) then) =
      __$$RegisterErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RegisterErrorCopyWithImpl<$Res>
    extends _$AttendanceStatesCopyWithImpl<$Res, _$RegisterError>
    implements _$$RegisterErrorCopyWith<$Res> {
  __$$RegisterErrorCopyWithImpl(
      _$RegisterError _value, $Res Function(_$RegisterError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$RegisterError(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterError implements RegisterError {
  const _$RegisterError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AttendanceStates.registerError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterErrorCopyWith<_$RegisterError> get copyWith =>
      __$$RegisterErrorCopyWithImpl<_$RegisterError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() registerLoading,
    required TResult Function(List<AttendanceRegisterModel> registers)
        registerLoaded,
    required TResult Function(AttendanceRegisterModel? selectedRegister)
        selectedRegisterLoaded,
    required TResult Function(String message) registerError,
  }) {
    return registerError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? registerLoading,
    TResult? Function(List<AttendanceRegisterModel> registers)? registerLoaded,
    TResult? Function(AttendanceRegisterModel? selectedRegister)?
        selectedRegisterLoaded,
    TResult? Function(String message)? registerError,
  }) {
    return registerError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? registerLoading,
    TResult Function(List<AttendanceRegisterModel> registers)? registerLoaded,
    TResult Function(AttendanceRegisterModel? selectedRegister)?
        selectedRegisterLoaded,
    TResult Function(String message)? registerError,
    required TResult orElse(),
  }) {
    if (registerError != null) {
      return registerError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterLoading value) registerLoading,
    required TResult Function(RegisterLoaded value) registerLoaded,
    required TResult Function(SelectedRegisterLoaded value)
        selectedRegisterLoaded,
    required TResult Function(RegisterError value) registerError,
  }) {
    return registerError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterLoading value)? registerLoading,
    TResult? Function(RegisterLoaded value)? registerLoaded,
    TResult? Function(SelectedRegisterLoaded value)? selectedRegisterLoaded,
    TResult? Function(RegisterError value)? registerError,
  }) {
    return registerError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterLoading value)? registerLoading,
    TResult Function(RegisterLoaded value)? registerLoaded,
    TResult Function(SelectedRegisterLoaded value)? selectedRegisterLoaded,
    TResult Function(RegisterError value)? registerError,
    required TResult orElse(),
  }) {
    if (registerError != null) {
      return registerError(this);
    }
    return orElse();
  }
}

abstract class RegisterError implements AttendanceStates {
  const factory RegisterError(final String message) = _$RegisterError;

  String get message;
  @JsonKey(ignore: true)
  _$$RegisterErrorCopyWith<_$RegisterError> get copyWith =>
      throw _privateConstructorUsedError;
}
