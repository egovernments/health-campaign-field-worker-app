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
    required TResult Function(List<dynamic> codes) loadLocalization,
    required TResult Function() initial,
    required TResult Function(List<AttendancePackageRegisterModel> registers)
        loadAttendanceRegisters,
    required TResult Function(
            List<AttendancePackageRegisterModel> registers, String registerID)
        loadSelectedRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> codes)? loadLocalization,
    TResult? Function()? initial,
    TResult? Function(List<AttendancePackageRegisterModel> registers)?
        loadAttendanceRegisters,
    TResult? Function(
            List<AttendancePackageRegisterModel> registers, String registerID)?
        loadSelectedRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> codes)? loadLocalization,
    TResult Function()? initial,
    TResult Function(List<AttendancePackageRegisterModel> registers)?
        loadAttendanceRegisters,
    TResult Function(
            List<AttendancePackageRegisterModel> registers, String registerID)?
        loadSelectedRegister,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadLocalization value) loadLocalization,
    required TResult Function(InitialAttendance value) initial,
    required TResult Function(LoadAttendanceRegisterData value)
        loadAttendanceRegisters,
    required TResult Function(LoadSelectedAttendanceRegisterData value)
        loadSelectedRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadLocalization value)? loadLocalization,
    TResult? Function(InitialAttendance value)? initial,
    TResult? Function(LoadAttendanceRegisterData value)?
        loadAttendanceRegisters,
    TResult? Function(LoadSelectedAttendanceRegisterData value)?
        loadSelectedRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadLocalization value)? loadLocalization,
    TResult Function(InitialAttendance value)? initial,
    TResult Function(LoadAttendanceRegisterData value)? loadAttendanceRegisters,
    TResult Function(LoadSelectedAttendanceRegisterData value)?
        loadSelectedRegister,
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
abstract class _$$LoadLocalizationCopyWith<$Res> {
  factory _$$LoadLocalizationCopyWith(
          _$LoadLocalization value, $Res Function(_$LoadLocalization) then) =
      __$$LoadLocalizationCopyWithImpl<$Res>;
  @useResult
  $Res call({List<dynamic> codes});
}

/// @nodoc
class __$$LoadLocalizationCopyWithImpl<$Res>
    extends _$AttendanceEventsCopyWithImpl<$Res, _$LoadLocalization>
    implements _$$LoadLocalizationCopyWith<$Res> {
  __$$LoadLocalizationCopyWithImpl(
      _$LoadLocalization _value, $Res Function(_$LoadLocalization) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codes = null,
  }) {
    return _then(_$LoadLocalization(
      null == codes
          ? _value._codes
          : codes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$LoadLocalization implements LoadLocalization {
  const _$LoadLocalization(final List<dynamic> codes) : _codes = codes;

  final List<dynamic> _codes;
  @override
  List<dynamic> get codes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_codes);
  }

  @override
  String toString() {
    return 'AttendanceEvents.loadLocalization(codes: $codes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadLocalization &&
            const DeepCollectionEquality().equals(other._codes, _codes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_codes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadLocalizationCopyWith<_$LoadLocalization> get copyWith =>
      __$$LoadLocalizationCopyWithImpl<_$LoadLocalization>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<dynamic> codes) loadLocalization,
    required TResult Function() initial,
    required TResult Function(List<AttendancePackageRegisterModel> registers)
        loadAttendanceRegisters,
    required TResult Function(
            List<AttendancePackageRegisterModel> registers, String registerID)
        loadSelectedRegister,
  }) {
    return loadLocalization(codes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> codes)? loadLocalization,
    TResult? Function()? initial,
    TResult? Function(List<AttendancePackageRegisterModel> registers)?
        loadAttendanceRegisters,
    TResult? Function(
            List<AttendancePackageRegisterModel> registers, String registerID)?
        loadSelectedRegister,
  }) {
    return loadLocalization?.call(codes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> codes)? loadLocalization,
    TResult Function()? initial,
    TResult Function(List<AttendancePackageRegisterModel> registers)?
        loadAttendanceRegisters,
    TResult Function(
            List<AttendancePackageRegisterModel> registers, String registerID)?
        loadSelectedRegister,
    required TResult orElse(),
  }) {
    if (loadLocalization != null) {
      return loadLocalization(codes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadLocalization value) loadLocalization,
    required TResult Function(InitialAttendance value) initial,
    required TResult Function(LoadAttendanceRegisterData value)
        loadAttendanceRegisters,
    required TResult Function(LoadSelectedAttendanceRegisterData value)
        loadSelectedRegister,
  }) {
    return loadLocalization(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadLocalization value)? loadLocalization,
    TResult? Function(InitialAttendance value)? initial,
    TResult? Function(LoadAttendanceRegisterData value)?
        loadAttendanceRegisters,
    TResult? Function(LoadSelectedAttendanceRegisterData value)?
        loadSelectedRegister,
  }) {
    return loadLocalization?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadLocalization value)? loadLocalization,
    TResult Function(InitialAttendance value)? initial,
    TResult Function(LoadAttendanceRegisterData value)? loadAttendanceRegisters,
    TResult Function(LoadSelectedAttendanceRegisterData value)?
        loadSelectedRegister,
    required TResult orElse(),
  }) {
    if (loadLocalization != null) {
      return loadLocalization(this);
    }
    return orElse();
  }
}

abstract class LoadLocalization implements AttendanceEvents {
  const factory LoadLocalization(final List<dynamic> codes) =
      _$LoadLocalization;

  List<dynamic> get codes;
  @JsonKey(ignore: true)
  _$$LoadLocalizationCopyWith<_$LoadLocalization> get copyWith =>
      throw _privateConstructorUsedError;
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
    required TResult Function(List<dynamic> codes) loadLocalization,
    required TResult Function() initial,
    required TResult Function(List<AttendancePackageRegisterModel> registers)
        loadAttendanceRegisters,
    required TResult Function(
            List<AttendancePackageRegisterModel> registers, String registerID)
        loadSelectedRegister,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> codes)? loadLocalization,
    TResult? Function()? initial,
    TResult? Function(List<AttendancePackageRegisterModel> registers)?
        loadAttendanceRegisters,
    TResult? Function(
            List<AttendancePackageRegisterModel> registers, String registerID)?
        loadSelectedRegister,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> codes)? loadLocalization,
    TResult Function()? initial,
    TResult Function(List<AttendancePackageRegisterModel> registers)?
        loadAttendanceRegisters,
    TResult Function(
            List<AttendancePackageRegisterModel> registers, String registerID)?
        loadSelectedRegister,
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
    required TResult Function(LoadLocalization value) loadLocalization,
    required TResult Function(InitialAttendance value) initial,
    required TResult Function(LoadAttendanceRegisterData value)
        loadAttendanceRegisters,
    required TResult Function(LoadSelectedAttendanceRegisterData value)
        loadSelectedRegister,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadLocalization value)? loadLocalization,
    TResult? Function(InitialAttendance value)? initial,
    TResult? Function(LoadAttendanceRegisterData value)?
        loadAttendanceRegisters,
    TResult? Function(LoadSelectedAttendanceRegisterData value)?
        loadSelectedRegister,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadLocalization value)? loadLocalization,
    TResult Function(InitialAttendance value)? initial,
    TResult Function(LoadAttendanceRegisterData value)? loadAttendanceRegisters,
    TResult Function(LoadSelectedAttendanceRegisterData value)?
        loadSelectedRegister,
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
  $Res call({List<AttendancePackageRegisterModel> registers});
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
  }) {
    return _then(_$LoadAttendanceRegisterData(
      null == registers
          ? _value._registers
          : registers // ignore: cast_nullable_to_non_nullable
              as List<AttendancePackageRegisterModel>,
    ));
  }
}

/// @nodoc

class _$LoadAttendanceRegisterData implements LoadAttendanceRegisterData {
  const _$LoadAttendanceRegisterData(
      final List<AttendancePackageRegisterModel> registers)
      : _registers = registers;

  final List<AttendancePackageRegisterModel> _registers;
  @override
  List<AttendancePackageRegisterModel> get registers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_registers);
  }

  @override
  String toString() {
    return 'AttendanceEvents.loadAttendanceRegisters(registers: $registers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadAttendanceRegisterData &&
            const DeepCollectionEquality()
                .equals(other._registers, _registers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_registers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadAttendanceRegisterDataCopyWith<_$LoadAttendanceRegisterData>
      get copyWith => __$$LoadAttendanceRegisterDataCopyWithImpl<
          _$LoadAttendanceRegisterData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<dynamic> codes) loadLocalization,
    required TResult Function() initial,
    required TResult Function(List<AttendancePackageRegisterModel> registers)
        loadAttendanceRegisters,
    required TResult Function(
            List<AttendancePackageRegisterModel> registers, String registerID)
        loadSelectedRegister,
  }) {
    return loadAttendanceRegisters(registers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> codes)? loadLocalization,
    TResult? Function()? initial,
    TResult? Function(List<AttendancePackageRegisterModel> registers)?
        loadAttendanceRegisters,
    TResult? Function(
            List<AttendancePackageRegisterModel> registers, String registerID)?
        loadSelectedRegister,
  }) {
    return loadAttendanceRegisters?.call(registers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> codes)? loadLocalization,
    TResult Function()? initial,
    TResult Function(List<AttendancePackageRegisterModel> registers)?
        loadAttendanceRegisters,
    TResult Function(
            List<AttendancePackageRegisterModel> registers, String registerID)?
        loadSelectedRegister,
    required TResult orElse(),
  }) {
    if (loadAttendanceRegisters != null) {
      return loadAttendanceRegisters(registers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadLocalization value) loadLocalization,
    required TResult Function(InitialAttendance value) initial,
    required TResult Function(LoadAttendanceRegisterData value)
        loadAttendanceRegisters,
    required TResult Function(LoadSelectedAttendanceRegisterData value)
        loadSelectedRegister,
  }) {
    return loadAttendanceRegisters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadLocalization value)? loadLocalization,
    TResult? Function(InitialAttendance value)? initial,
    TResult? Function(LoadAttendanceRegisterData value)?
        loadAttendanceRegisters,
    TResult? Function(LoadSelectedAttendanceRegisterData value)?
        loadSelectedRegister,
  }) {
    return loadAttendanceRegisters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadLocalization value)? loadLocalization,
    TResult Function(InitialAttendance value)? initial,
    TResult Function(LoadAttendanceRegisterData value)? loadAttendanceRegisters,
    TResult Function(LoadSelectedAttendanceRegisterData value)?
        loadSelectedRegister,
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
          final List<AttendancePackageRegisterModel> registers) =
      _$LoadAttendanceRegisterData;

  List<AttendancePackageRegisterModel> get registers;
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
  $Res call(
      {List<AttendancePackageRegisterModel> registers, String registerID});
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
              as List<AttendancePackageRegisterModel>,
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
      {required final List<AttendancePackageRegisterModel> registers,
      required this.registerID})
      : _registers = registers;

  final List<AttendancePackageRegisterModel> _registers;
  @override
  List<AttendancePackageRegisterModel> get registers {
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
    required TResult Function(List<dynamic> codes) loadLocalization,
    required TResult Function() initial,
    required TResult Function(List<AttendancePackageRegisterModel> registers)
        loadAttendanceRegisters,
    required TResult Function(
            List<AttendancePackageRegisterModel> registers, String registerID)
        loadSelectedRegister,
  }) {
    return loadSelectedRegister(registers, registerID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> codes)? loadLocalization,
    TResult? Function()? initial,
    TResult? Function(List<AttendancePackageRegisterModel> registers)?
        loadAttendanceRegisters,
    TResult? Function(
            List<AttendancePackageRegisterModel> registers, String registerID)?
        loadSelectedRegister,
  }) {
    return loadSelectedRegister?.call(registers, registerID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> codes)? loadLocalization,
    TResult Function()? initial,
    TResult Function(List<AttendancePackageRegisterModel> registers)?
        loadAttendanceRegisters,
    TResult Function(
            List<AttendancePackageRegisterModel> registers, String registerID)?
        loadSelectedRegister,
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
    required TResult Function(LoadLocalization value) loadLocalization,
    required TResult Function(InitialAttendance value) initial,
    required TResult Function(LoadAttendanceRegisterData value)
        loadAttendanceRegisters,
    required TResult Function(LoadSelectedAttendanceRegisterData value)
        loadSelectedRegister,
  }) {
    return loadSelectedRegister(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadLocalization value)? loadLocalization,
    TResult? Function(InitialAttendance value)? initial,
    TResult? Function(LoadAttendanceRegisterData value)?
        loadAttendanceRegisters,
    TResult? Function(LoadSelectedAttendanceRegisterData value)?
        loadSelectedRegister,
  }) {
    return loadSelectedRegister?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadLocalization value)? loadLocalization,
    TResult Function(InitialAttendance value)? initial,
    TResult Function(LoadAttendanceRegisterData value)? loadAttendanceRegisters,
    TResult Function(LoadSelectedAttendanceRegisterData value)?
        loadSelectedRegister,
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
      {required final List<AttendancePackageRegisterModel> registers,
      required final String registerID}) = _$LoadSelectedAttendanceRegisterData;

  List<AttendancePackageRegisterModel> get registers;
  String get registerID;
  @JsonKey(ignore: true)
  _$$LoadSelectedAttendanceRegisterDataCopyWith<
          _$LoadSelectedAttendanceRegisterData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AttendanceStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() registerLoading,
    required TResult Function(List<AttendancePackageRegisterModel> registers)
        registerLoaded,
    required TResult Function(AttendancePackageRegisterModel? selectedRegister)
        selectedRegisterLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? registerLoading,
    TResult? Function(List<AttendancePackageRegisterModel> registers)?
        registerLoaded,
    TResult? Function(AttendancePackageRegisterModel? selectedRegister)?
        selectedRegisterLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? registerLoading,
    TResult Function(List<AttendancePackageRegisterModel> registers)?
        registerLoaded,
    TResult Function(AttendancePackageRegisterModel? selectedRegister)?
        selectedRegisterLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterLoading value) registerLoading,
    required TResult Function(RegisterLoaded value) registerLoaded,
    required TResult Function(SelectedRegisterLoaded value)
        selectedRegisterLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterLoading value)? registerLoading,
    TResult? Function(RegisterLoaded value)? registerLoaded,
    TResult? Function(SelectedRegisterLoaded value)? selectedRegisterLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterLoading value)? registerLoading,
    TResult Function(RegisterLoaded value)? registerLoaded,
    TResult Function(SelectedRegisterLoaded value)? selectedRegisterLoaded,
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
    required TResult Function(List<AttendancePackageRegisterModel> registers)
        registerLoaded,
    required TResult Function(AttendancePackageRegisterModel? selectedRegister)
        selectedRegisterLoaded,
  }) {
    return registerLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? registerLoading,
    TResult? Function(List<AttendancePackageRegisterModel> registers)?
        registerLoaded,
    TResult? Function(AttendancePackageRegisterModel? selectedRegister)?
        selectedRegisterLoaded,
  }) {
    return registerLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? registerLoading,
    TResult Function(List<AttendancePackageRegisterModel> registers)?
        registerLoaded,
    TResult Function(AttendancePackageRegisterModel? selectedRegister)?
        selectedRegisterLoaded,
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
  }) {
    return registerLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterLoading value)? registerLoading,
    TResult? Function(RegisterLoaded value)? registerLoaded,
    TResult? Function(SelectedRegisterLoaded value)? selectedRegisterLoaded,
  }) {
    return registerLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterLoading value)? registerLoading,
    TResult Function(RegisterLoaded value)? registerLoaded,
    TResult Function(SelectedRegisterLoaded value)? selectedRegisterLoaded,
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
  $Res call({List<AttendancePackageRegisterModel> registers});
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
              as List<AttendancePackageRegisterModel>,
    ));
  }
}

/// @nodoc

class _$RegisterLoaded implements RegisterLoaded {
  const _$RegisterLoaded(
      {required final List<AttendancePackageRegisterModel> registers})
      : _registers = registers;

  final List<AttendancePackageRegisterModel> _registers;
  @override
  List<AttendancePackageRegisterModel> get registers {
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
    required TResult Function(List<AttendancePackageRegisterModel> registers)
        registerLoaded,
    required TResult Function(AttendancePackageRegisterModel? selectedRegister)
        selectedRegisterLoaded,
  }) {
    return registerLoaded(registers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? registerLoading,
    TResult? Function(List<AttendancePackageRegisterModel> registers)?
        registerLoaded,
    TResult? Function(AttendancePackageRegisterModel? selectedRegister)?
        selectedRegisterLoaded,
  }) {
    return registerLoaded?.call(registers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? registerLoading,
    TResult Function(List<AttendancePackageRegisterModel> registers)?
        registerLoaded,
    TResult Function(AttendancePackageRegisterModel? selectedRegister)?
        selectedRegisterLoaded,
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
  }) {
    return registerLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterLoading value)? registerLoading,
    TResult? Function(RegisterLoaded value)? registerLoaded,
    TResult? Function(SelectedRegisterLoaded value)? selectedRegisterLoaded,
  }) {
    return registerLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterLoading value)? registerLoading,
    TResult Function(RegisterLoaded value)? registerLoaded,
    TResult Function(SelectedRegisterLoaded value)? selectedRegisterLoaded,
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
          {required final List<AttendancePackageRegisterModel> registers}) =
      _$RegisterLoaded;

  List<AttendancePackageRegisterModel> get registers;
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
  $Res call({AttendancePackageRegisterModel? selectedRegister});
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
              as AttendancePackageRegisterModel?,
    ));
  }
}

/// @nodoc

class _$SelectedRegisterLoaded implements SelectedRegisterLoaded {
  const _$SelectedRegisterLoaded({this.selectedRegister});

  @override
  final AttendancePackageRegisterModel? selectedRegister;

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
    required TResult Function(List<AttendancePackageRegisterModel> registers)
        registerLoaded,
    required TResult Function(AttendancePackageRegisterModel? selectedRegister)
        selectedRegisterLoaded,
  }) {
    return selectedRegisterLoaded(selectedRegister);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? registerLoading,
    TResult? Function(List<AttendancePackageRegisterModel> registers)?
        registerLoaded,
    TResult? Function(AttendancePackageRegisterModel? selectedRegister)?
        selectedRegisterLoaded,
  }) {
    return selectedRegisterLoaded?.call(selectedRegister);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? registerLoading,
    TResult Function(List<AttendancePackageRegisterModel> registers)?
        registerLoaded,
    TResult Function(AttendancePackageRegisterModel? selectedRegister)?
        selectedRegisterLoaded,
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
  }) {
    return selectedRegisterLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterLoading value)? registerLoading,
    TResult? Function(RegisterLoaded value)? registerLoaded,
    TResult? Function(SelectedRegisterLoaded value)? selectedRegisterLoaded,
  }) {
    return selectedRegisterLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterLoading value)? registerLoading,
    TResult Function(RegisterLoaded value)? registerLoaded,
    TResult Function(SelectedRegisterLoaded value)? selectedRegisterLoaded,
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
          {final AttendancePackageRegisterModel? selectedRegister}) =
      _$SelectedRegisterLoaded;

  AttendancePackageRegisterModel? get selectedRegister;
  @JsonKey(ignore: true)
  _$$SelectedRegisterLoadedCopyWith<_$SelectedRegisterLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
