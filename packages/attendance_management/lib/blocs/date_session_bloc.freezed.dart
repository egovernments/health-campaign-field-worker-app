// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date_session_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DateSessionEvents {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<dynamic> codes) loadLocalization,
    required TResult Function() initial,
    required TResult Function(
            List<AttendanceRegisterModel> registers, String registerID)
        loadSelectedRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> codes)? loadLocalization,
    TResult? Function()? initial,
    TResult? Function(
            List<AttendanceRegisterModel> registers, String registerID)?
        loadSelectedRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> codes)? loadLocalization,
    TResult Function()? initial,
    TResult Function(
            List<AttendanceRegisterModel> registers, String registerID)?
        loadSelectedRegister,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadLocalization value) loadLocalization,
    required TResult Function(InitialDateSession value) initial,
    required TResult Function(LoadSelectedRegisterData value)
        loadSelectedRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadLocalization value)? loadLocalization,
    TResult? Function(InitialDateSession value)? initial,
    TResult? Function(LoadSelectedRegisterData value)? loadSelectedRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadLocalization value)? loadLocalization,
    TResult Function(InitialDateSession value)? initial,
    TResult Function(LoadSelectedRegisterData value)? loadSelectedRegister,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateSessionEventsCopyWith<$Res> {
  factory $DateSessionEventsCopyWith(
          DateSessionEvents value, $Res Function(DateSessionEvents) then) =
      _$DateSessionEventsCopyWithImpl<$Res, DateSessionEvents>;
}

/// @nodoc
class _$DateSessionEventsCopyWithImpl<$Res, $Val extends DateSessionEvents>
    implements $DateSessionEventsCopyWith<$Res> {
  _$DateSessionEventsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadLocalizationImplCopyWith<$Res> {
  factory _$$LoadLocalizationImplCopyWith(_$LoadLocalizationImpl value,
          $Res Function(_$LoadLocalizationImpl) then) =
      __$$LoadLocalizationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<dynamic> codes});
}

/// @nodoc
class __$$LoadLocalizationImplCopyWithImpl<$Res>
    extends _$DateSessionEventsCopyWithImpl<$Res, _$LoadLocalizationImpl>
    implements _$$LoadLocalizationImplCopyWith<$Res> {
  __$$LoadLocalizationImplCopyWithImpl(_$LoadLocalizationImpl _value,
      $Res Function(_$LoadLocalizationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codes = null,
  }) {
    return _then(_$LoadLocalizationImpl(
      null == codes
          ? _value._codes
          : codes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$LoadLocalizationImpl implements LoadLocalization {
  const _$LoadLocalizationImpl(final List<dynamic> codes) : _codes = codes;

  final List<dynamic> _codes;
  @override
  List<dynamic> get codes {
    if (_codes is EqualUnmodifiableListView) return _codes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_codes);
  }

  @override
  String toString() {
    return 'DateSessionEvents.loadLocalization(codes: $codes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadLocalizationImpl &&
            const DeepCollectionEquality().equals(other._codes, _codes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_codes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadLocalizationImplCopyWith<_$LoadLocalizationImpl> get copyWith =>
      __$$LoadLocalizationImplCopyWithImpl<_$LoadLocalizationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<dynamic> codes) loadLocalization,
    required TResult Function() initial,
    required TResult Function(
            List<AttendanceRegisterModel> registers, String registerID)
        loadSelectedRegister,
  }) {
    return loadLocalization(codes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> codes)? loadLocalization,
    TResult? Function()? initial,
    TResult? Function(
            List<AttendanceRegisterModel> registers, String registerID)?
        loadSelectedRegister,
  }) {
    return loadLocalization?.call(codes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> codes)? loadLocalization,
    TResult Function()? initial,
    TResult Function(
            List<AttendanceRegisterModel> registers, String registerID)?
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
    required TResult Function(InitialDateSession value) initial,
    required TResult Function(LoadSelectedRegisterData value)
        loadSelectedRegister,
  }) {
    return loadLocalization(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadLocalization value)? loadLocalization,
    TResult? Function(InitialDateSession value)? initial,
    TResult? Function(LoadSelectedRegisterData value)? loadSelectedRegister,
  }) {
    return loadLocalization?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadLocalization value)? loadLocalization,
    TResult Function(InitialDateSession value)? initial,
    TResult Function(LoadSelectedRegisterData value)? loadSelectedRegister,
    required TResult orElse(),
  }) {
    if (loadLocalization != null) {
      return loadLocalization(this);
    }
    return orElse();
  }
}

abstract class LoadLocalization implements DateSessionEvents {
  const factory LoadLocalization(final List<dynamic> codes) =
      _$LoadLocalizationImpl;

  List<dynamic> get codes;
  @JsonKey(ignore: true)
  _$$LoadLocalizationImplCopyWith<_$LoadLocalizationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialDateSessionImplCopyWith<$Res> {
  factory _$$InitialDateSessionImplCopyWith(_$InitialDateSessionImpl value,
          $Res Function(_$InitialDateSessionImpl) then) =
      __$$InitialDateSessionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialDateSessionImplCopyWithImpl<$Res>
    extends _$DateSessionEventsCopyWithImpl<$Res, _$InitialDateSessionImpl>
    implements _$$InitialDateSessionImplCopyWith<$Res> {
  __$$InitialDateSessionImplCopyWithImpl(_$InitialDateSessionImpl _value,
      $Res Function(_$InitialDateSessionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialDateSessionImpl implements InitialDateSession {
  const _$InitialDateSessionImpl();

  @override
  String toString() {
    return 'DateSessionEvents.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialDateSessionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<dynamic> codes) loadLocalization,
    required TResult Function() initial,
    required TResult Function(
            List<AttendanceRegisterModel> registers, String registerID)
        loadSelectedRegister,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> codes)? loadLocalization,
    TResult? Function()? initial,
    TResult? Function(
            List<AttendanceRegisterModel> registers, String registerID)?
        loadSelectedRegister,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> codes)? loadLocalization,
    TResult Function()? initial,
    TResult Function(
            List<AttendanceRegisterModel> registers, String registerID)?
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
    required TResult Function(InitialDateSession value) initial,
    required TResult Function(LoadSelectedRegisterData value)
        loadSelectedRegister,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadLocalization value)? loadLocalization,
    TResult? Function(InitialDateSession value)? initial,
    TResult? Function(LoadSelectedRegisterData value)? loadSelectedRegister,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadLocalization value)? loadLocalization,
    TResult Function(InitialDateSession value)? initial,
    TResult Function(LoadSelectedRegisterData value)? loadSelectedRegister,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialDateSession implements DateSessionEvents {
  const factory InitialDateSession() = _$InitialDateSessionImpl;
}

/// @nodoc
abstract class _$$LoadSelectedRegisterDataImplCopyWith<$Res> {
  factory _$$LoadSelectedRegisterDataImplCopyWith(
          _$LoadSelectedRegisterDataImpl value,
          $Res Function(_$LoadSelectedRegisterDataImpl) then) =
      __$$LoadSelectedRegisterDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<AttendanceRegisterModel> registers, String registerID});
}

/// @nodoc
class __$$LoadSelectedRegisterDataImplCopyWithImpl<$Res>
    extends _$DateSessionEventsCopyWithImpl<$Res,
        _$LoadSelectedRegisterDataImpl>
    implements _$$LoadSelectedRegisterDataImplCopyWith<$Res> {
  __$$LoadSelectedRegisterDataImplCopyWithImpl(
      _$LoadSelectedRegisterDataImpl _value,
      $Res Function(_$LoadSelectedRegisterDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registers = null,
    Object? registerID = null,
  }) {
    return _then(_$LoadSelectedRegisterDataImpl(
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

class _$LoadSelectedRegisterDataImpl implements LoadSelectedRegisterData {
  const _$LoadSelectedRegisterDataImpl(
      {required final List<AttendanceRegisterModel> registers,
      required this.registerID})
      : _registers = registers;

  final List<AttendanceRegisterModel> _registers;
  @override
  List<AttendanceRegisterModel> get registers {
    if (_registers is EqualUnmodifiableListView) return _registers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_registers);
  }

  @override
  final String registerID;

  @override
  String toString() {
    return 'DateSessionEvents.loadSelectedRegister(registers: $registers, registerID: $registerID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSelectedRegisterDataImpl &&
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
  _$$LoadSelectedRegisterDataImplCopyWith<_$LoadSelectedRegisterDataImpl>
      get copyWith => __$$LoadSelectedRegisterDataImplCopyWithImpl<
          _$LoadSelectedRegisterDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<dynamic> codes) loadLocalization,
    required TResult Function() initial,
    required TResult Function(
            List<AttendanceRegisterModel> registers, String registerID)
        loadSelectedRegister,
  }) {
    return loadSelectedRegister(registers, registerID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> codes)? loadLocalization,
    TResult? Function()? initial,
    TResult? Function(
            List<AttendanceRegisterModel> registers, String registerID)?
        loadSelectedRegister,
  }) {
    return loadSelectedRegister?.call(registers, registerID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> codes)? loadLocalization,
    TResult Function()? initial,
    TResult Function(
            List<AttendanceRegisterModel> registers, String registerID)?
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
    required TResult Function(InitialDateSession value) initial,
    required TResult Function(LoadSelectedRegisterData value)
        loadSelectedRegister,
  }) {
    return loadSelectedRegister(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadLocalization value)? loadLocalization,
    TResult? Function(InitialDateSession value)? initial,
    TResult? Function(LoadSelectedRegisterData value)? loadSelectedRegister,
  }) {
    return loadSelectedRegister?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadLocalization value)? loadLocalization,
    TResult Function(InitialDateSession value)? initial,
    TResult Function(LoadSelectedRegisterData value)? loadSelectedRegister,
    required TResult orElse(),
  }) {
    if (loadSelectedRegister != null) {
      return loadSelectedRegister(this);
    }
    return orElse();
  }
}

abstract class LoadSelectedRegisterData implements DateSessionEvents {
  const factory LoadSelectedRegisterData(
      {required final List<AttendanceRegisterModel> registers,
      required final String registerID}) = _$LoadSelectedRegisterDataImpl;

  List<AttendanceRegisterModel> get registers;
  String get registerID;
  @JsonKey(ignore: true)
  _$$LoadSelectedRegisterDataImplCopyWith<_$LoadSelectedRegisterDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DateSessionStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() dateSessionLoading,
    required TResult Function(AttendanceRegisterModel selectedRegister)
        dateSessionLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? dateSessionLoading,
    TResult? Function(AttendanceRegisterModel selectedRegister)?
        dateSessionLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? dateSessionLoading,
    TResult Function(AttendanceRegisterModel selectedRegister)?
        dateSessionLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DateSessionLoading value) dateSessionLoading,
    required TResult Function(DateSessionLoaded value) dateSessionLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DateSessionLoading value)? dateSessionLoading,
    TResult? Function(DateSessionLoaded value)? dateSessionLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DateSessionLoading value)? dateSessionLoading,
    TResult Function(DateSessionLoaded value)? dateSessionLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateSessionStatesCopyWith<$Res> {
  factory $DateSessionStatesCopyWith(
          DateSessionStates value, $Res Function(DateSessionStates) then) =
      _$DateSessionStatesCopyWithImpl<$Res, DateSessionStates>;
}

/// @nodoc
class _$DateSessionStatesCopyWithImpl<$Res, $Val extends DateSessionStates>
    implements $DateSessionStatesCopyWith<$Res> {
  _$DateSessionStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DateSessionLoadingImplCopyWith<$Res> {
  factory _$$DateSessionLoadingImplCopyWith(_$DateSessionLoadingImpl value,
          $Res Function(_$DateSessionLoadingImpl) then) =
      __$$DateSessionLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DateSessionLoadingImplCopyWithImpl<$Res>
    extends _$DateSessionStatesCopyWithImpl<$Res, _$DateSessionLoadingImpl>
    implements _$$DateSessionLoadingImplCopyWith<$Res> {
  __$$DateSessionLoadingImplCopyWithImpl(_$DateSessionLoadingImpl _value,
      $Res Function(_$DateSessionLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DateSessionLoadingImpl implements DateSessionLoading {
  const _$DateSessionLoadingImpl();

  @override
  String toString() {
    return 'DateSessionStates.dateSessionLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DateSessionLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() dateSessionLoading,
    required TResult Function(AttendanceRegisterModel selectedRegister)
        dateSessionLoaded,
  }) {
    return dateSessionLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? dateSessionLoading,
    TResult? Function(AttendanceRegisterModel selectedRegister)?
        dateSessionLoaded,
  }) {
    return dateSessionLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? dateSessionLoading,
    TResult Function(AttendanceRegisterModel selectedRegister)?
        dateSessionLoaded,
    required TResult orElse(),
  }) {
    if (dateSessionLoading != null) {
      return dateSessionLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DateSessionLoading value) dateSessionLoading,
    required TResult Function(DateSessionLoaded value) dateSessionLoaded,
  }) {
    return dateSessionLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DateSessionLoading value)? dateSessionLoading,
    TResult? Function(DateSessionLoaded value)? dateSessionLoaded,
  }) {
    return dateSessionLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DateSessionLoading value)? dateSessionLoading,
    TResult Function(DateSessionLoaded value)? dateSessionLoaded,
    required TResult orElse(),
  }) {
    if (dateSessionLoading != null) {
      return dateSessionLoading(this);
    }
    return orElse();
  }
}

abstract class DateSessionLoading implements DateSessionStates {
  const factory DateSessionLoading() = _$DateSessionLoadingImpl;
}

/// @nodoc
abstract class _$$DateSessionLoadedImplCopyWith<$Res> {
  factory _$$DateSessionLoadedImplCopyWith(_$DateSessionLoadedImpl value,
          $Res Function(_$DateSessionLoadedImpl) then) =
      __$$DateSessionLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AttendanceRegisterModel selectedRegister});
}

/// @nodoc
class __$$DateSessionLoadedImplCopyWithImpl<$Res>
    extends _$DateSessionStatesCopyWithImpl<$Res, _$DateSessionLoadedImpl>
    implements _$$DateSessionLoadedImplCopyWith<$Res> {
  __$$DateSessionLoadedImplCopyWithImpl(_$DateSessionLoadedImpl _value,
      $Res Function(_$DateSessionLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedRegister = null,
  }) {
    return _then(_$DateSessionLoadedImpl(
      selectedRegister: null == selectedRegister
          ? _value.selectedRegister
          : selectedRegister // ignore: cast_nullable_to_non_nullable
              as AttendanceRegisterModel,
    ));
  }
}

/// @nodoc

class _$DateSessionLoadedImpl implements DateSessionLoaded {
  const _$DateSessionLoadedImpl({required this.selectedRegister});

  @override
  final AttendanceRegisterModel selectedRegister;

  @override
  String toString() {
    return 'DateSessionStates.dateSessionLoaded(selectedRegister: $selectedRegister)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateSessionLoadedImpl &&
            (identical(other.selectedRegister, selectedRegister) ||
                other.selectedRegister == selectedRegister));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedRegister);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DateSessionLoadedImplCopyWith<_$DateSessionLoadedImpl> get copyWith =>
      __$$DateSessionLoadedImplCopyWithImpl<_$DateSessionLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() dateSessionLoading,
    required TResult Function(AttendanceRegisterModel selectedRegister)
        dateSessionLoaded,
  }) {
    return dateSessionLoaded(selectedRegister);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? dateSessionLoading,
    TResult? Function(AttendanceRegisterModel selectedRegister)?
        dateSessionLoaded,
  }) {
    return dateSessionLoaded?.call(selectedRegister);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? dateSessionLoading,
    TResult Function(AttendanceRegisterModel selectedRegister)?
        dateSessionLoaded,
    required TResult orElse(),
  }) {
    if (dateSessionLoaded != null) {
      return dateSessionLoaded(selectedRegister);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DateSessionLoading value) dateSessionLoading,
    required TResult Function(DateSessionLoaded value) dateSessionLoaded,
  }) {
    return dateSessionLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DateSessionLoading value)? dateSessionLoading,
    TResult? Function(DateSessionLoaded value)? dateSessionLoaded,
  }) {
    return dateSessionLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DateSessionLoading value)? dateSessionLoading,
    TResult Function(DateSessionLoaded value)? dateSessionLoaded,
    required TResult orElse(),
  }) {
    if (dateSessionLoaded != null) {
      return dateSessionLoaded(this);
    }
    return orElse();
  }
}

abstract class DateSessionLoaded implements DateSessionStates {
  const factory DateSessionLoaded(
          {required final AttendanceRegisterModel selectedRegister}) =
      _$DateSessionLoadedImpl;

  AttendanceRegisterModel get selectedRegister;
  @JsonKey(ignore: true)
  _$$DateSessionLoadedImplCopyWith<_$DateSessionLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
