// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'switch_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SwitchDeviceEvent {
  String get selectedReason => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get apiEndPoint => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String selectedReason, String username,
            String password, String apiEndPoint)
        switchDevice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String selectedReason, String username, String password,
            String apiEndPoint)?
        switchDevice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String selectedReason, String username, String password,
            String apiEndPoint)?
        switchDevice,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SwitchDeviceEventSwitchDevice value) switchDevice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwitchDeviceEventSwitchDevice value)? switchDevice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwitchDeviceEventSwitchDevice value)? switchDevice,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SwitchDeviceEventCopyWith<SwitchDeviceEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwitchDeviceEventCopyWith<$Res> {
  factory $SwitchDeviceEventCopyWith(
          SwitchDeviceEvent value, $Res Function(SwitchDeviceEvent) then) =
      _$SwitchDeviceEventCopyWithImpl<$Res, SwitchDeviceEvent>;
  @useResult
  $Res call(
      {String selectedReason,
      String username,
      String password,
      String apiEndPoint});
}

/// @nodoc
class _$SwitchDeviceEventCopyWithImpl<$Res, $Val extends SwitchDeviceEvent>
    implements $SwitchDeviceEventCopyWith<$Res> {
  _$SwitchDeviceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedReason = null,
    Object? username = null,
    Object? password = null,
    Object? apiEndPoint = null,
  }) {
    return _then(_value.copyWith(
      selectedReason: null == selectedReason
          ? _value.selectedReason
          : selectedReason // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      apiEndPoint: null == apiEndPoint
          ? _value.apiEndPoint
          : apiEndPoint // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SwitchDeviceEventSwitchDeviceImplCopyWith<$Res>
    implements $SwitchDeviceEventCopyWith<$Res> {
  factory _$$SwitchDeviceEventSwitchDeviceImplCopyWith(
          _$SwitchDeviceEventSwitchDeviceImpl value,
          $Res Function(_$SwitchDeviceEventSwitchDeviceImpl) then) =
      __$$SwitchDeviceEventSwitchDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String selectedReason,
      String username,
      String password,
      String apiEndPoint});
}

/// @nodoc
class __$$SwitchDeviceEventSwitchDeviceImplCopyWithImpl<$Res>
    extends _$SwitchDeviceEventCopyWithImpl<$Res,
        _$SwitchDeviceEventSwitchDeviceImpl>
    implements _$$SwitchDeviceEventSwitchDeviceImplCopyWith<$Res> {
  __$$SwitchDeviceEventSwitchDeviceImplCopyWithImpl(
      _$SwitchDeviceEventSwitchDeviceImpl _value,
      $Res Function(_$SwitchDeviceEventSwitchDeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedReason = null,
    Object? username = null,
    Object? password = null,
    Object? apiEndPoint = null,
  }) {
    return _then(_$SwitchDeviceEventSwitchDeviceImpl(
      selectedReason: null == selectedReason
          ? _value.selectedReason
          : selectedReason // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      apiEndPoint: null == apiEndPoint
          ? _value.apiEndPoint
          : apiEndPoint // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SwitchDeviceEventSwitchDeviceImpl
    implements SwitchDeviceEventSwitchDevice {
  const _$SwitchDeviceEventSwitchDeviceImpl(
      {required this.selectedReason,
      required this.username,
      required this.password,
      required this.apiEndPoint});

  @override
  final String selectedReason;
  @override
  final String username;
  @override
  final String password;
  @override
  final String apiEndPoint;

  @override
  String toString() {
    return 'SwitchDeviceEvent.switchDevice(selectedReason: $selectedReason, username: $username, password: $password, apiEndPoint: $apiEndPoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwitchDeviceEventSwitchDeviceImpl &&
            (identical(other.selectedReason, selectedReason) ||
                other.selectedReason == selectedReason) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.apiEndPoint, apiEndPoint) ||
                other.apiEndPoint == apiEndPoint));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedReason, username, password, apiEndPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwitchDeviceEventSwitchDeviceImplCopyWith<
          _$SwitchDeviceEventSwitchDeviceImpl>
      get copyWith => __$$SwitchDeviceEventSwitchDeviceImplCopyWithImpl<
          _$SwitchDeviceEventSwitchDeviceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String selectedReason, String username,
            String password, String apiEndPoint)
        switchDevice,
  }) {
    return switchDevice(selectedReason, username, password, apiEndPoint);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String selectedReason, String username, String password,
            String apiEndPoint)?
        switchDevice,
  }) {
    return switchDevice?.call(selectedReason, username, password, apiEndPoint);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String selectedReason, String username, String password,
            String apiEndPoint)?
        switchDevice,
    required TResult orElse(),
  }) {
    if (switchDevice != null) {
      return switchDevice(selectedReason, username, password, apiEndPoint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SwitchDeviceEventSwitchDevice value) switchDevice,
  }) {
    return switchDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwitchDeviceEventSwitchDevice value)? switchDevice,
  }) {
    return switchDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwitchDeviceEventSwitchDevice value)? switchDevice,
    required TResult orElse(),
  }) {
    if (switchDevice != null) {
      return switchDevice(this);
    }
    return orElse();
  }
}

abstract class SwitchDeviceEventSwitchDevice implements SwitchDeviceEvent {
  const factory SwitchDeviceEventSwitchDevice(
      {required final String selectedReason,
      required final String username,
      required final String password,
      required final String apiEndPoint}) = _$SwitchDeviceEventSwitchDeviceImpl;

  @override
  String get selectedReason;
  @override
  String get username;
  @override
  String get password;
  @override
  String get apiEndPoint;
  @override
  @JsonKey(ignore: true)
  _$$SwitchDeviceEventSwitchDeviceImplCopyWith<
          _$SwitchDeviceEventSwitchDeviceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SwitchDeviceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SwitchDeviceInitial value) initial,
    required TResult Function(SwitchDeviceLoading value) loading,
    required TResult Function(SwitchDeviceSuccess value) success,
    required TResult Function(SwitchDeviceFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwitchDeviceInitial value)? initial,
    TResult? Function(SwitchDeviceLoading value)? loading,
    TResult? Function(SwitchDeviceSuccess value)? success,
    TResult? Function(SwitchDeviceFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwitchDeviceInitial value)? initial,
    TResult Function(SwitchDeviceLoading value)? loading,
    TResult Function(SwitchDeviceSuccess value)? success,
    TResult Function(SwitchDeviceFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwitchDeviceStateCopyWith<$Res> {
  factory $SwitchDeviceStateCopyWith(
          SwitchDeviceState value, $Res Function(SwitchDeviceState) then) =
      _$SwitchDeviceStateCopyWithImpl<$Res, SwitchDeviceState>;
}

/// @nodoc
class _$SwitchDeviceStateCopyWithImpl<$Res, $Val extends SwitchDeviceState>
    implements $SwitchDeviceStateCopyWith<$Res> {
  _$SwitchDeviceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SwitchDeviceInitialImplCopyWith<$Res> {
  factory _$$SwitchDeviceInitialImplCopyWith(_$SwitchDeviceInitialImpl value,
          $Res Function(_$SwitchDeviceInitialImpl) then) =
      __$$SwitchDeviceInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SwitchDeviceInitialImplCopyWithImpl<$Res>
    extends _$SwitchDeviceStateCopyWithImpl<$Res, _$SwitchDeviceInitialImpl>
    implements _$$SwitchDeviceInitialImplCopyWith<$Res> {
  __$$SwitchDeviceInitialImplCopyWithImpl(_$SwitchDeviceInitialImpl _value,
      $Res Function(_$SwitchDeviceInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SwitchDeviceInitialImpl implements SwitchDeviceInitial {
  const _$SwitchDeviceInitialImpl();

  @override
  String toString() {
    return 'SwitchDeviceState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwitchDeviceInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
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
    required TResult Function(SwitchDeviceInitial value) initial,
    required TResult Function(SwitchDeviceLoading value) loading,
    required TResult Function(SwitchDeviceSuccess value) success,
    required TResult Function(SwitchDeviceFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwitchDeviceInitial value)? initial,
    TResult? Function(SwitchDeviceLoading value)? loading,
    TResult? Function(SwitchDeviceSuccess value)? success,
    TResult? Function(SwitchDeviceFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwitchDeviceInitial value)? initial,
    TResult Function(SwitchDeviceLoading value)? loading,
    TResult Function(SwitchDeviceSuccess value)? success,
    TResult Function(SwitchDeviceFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SwitchDeviceInitial implements SwitchDeviceState {
  const factory SwitchDeviceInitial() = _$SwitchDeviceInitialImpl;
}

/// @nodoc
abstract class _$$SwitchDeviceLoadingImplCopyWith<$Res> {
  factory _$$SwitchDeviceLoadingImplCopyWith(_$SwitchDeviceLoadingImpl value,
          $Res Function(_$SwitchDeviceLoadingImpl) then) =
      __$$SwitchDeviceLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SwitchDeviceLoadingImplCopyWithImpl<$Res>
    extends _$SwitchDeviceStateCopyWithImpl<$Res, _$SwitchDeviceLoadingImpl>
    implements _$$SwitchDeviceLoadingImplCopyWith<$Res> {
  __$$SwitchDeviceLoadingImplCopyWithImpl(_$SwitchDeviceLoadingImpl _value,
      $Res Function(_$SwitchDeviceLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SwitchDeviceLoadingImpl implements SwitchDeviceLoading {
  const _$SwitchDeviceLoadingImpl();

  @override
  String toString() {
    return 'SwitchDeviceState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwitchDeviceLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SwitchDeviceInitial value) initial,
    required TResult Function(SwitchDeviceLoading value) loading,
    required TResult Function(SwitchDeviceSuccess value) success,
    required TResult Function(SwitchDeviceFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwitchDeviceInitial value)? initial,
    TResult? Function(SwitchDeviceLoading value)? loading,
    TResult? Function(SwitchDeviceSuccess value)? success,
    TResult? Function(SwitchDeviceFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwitchDeviceInitial value)? initial,
    TResult Function(SwitchDeviceLoading value)? loading,
    TResult Function(SwitchDeviceSuccess value)? success,
    TResult Function(SwitchDeviceFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SwitchDeviceLoading implements SwitchDeviceState {
  const factory SwitchDeviceLoading() = _$SwitchDeviceLoadingImpl;
}

/// @nodoc
abstract class _$$SwitchDeviceSuccessImplCopyWith<$Res> {
  factory _$$SwitchDeviceSuccessImplCopyWith(_$SwitchDeviceSuccessImpl value,
          $Res Function(_$SwitchDeviceSuccessImpl) then) =
      __$$SwitchDeviceSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SwitchDeviceSuccessImplCopyWithImpl<$Res>
    extends _$SwitchDeviceStateCopyWithImpl<$Res, _$SwitchDeviceSuccessImpl>
    implements _$$SwitchDeviceSuccessImplCopyWith<$Res> {
  __$$SwitchDeviceSuccessImplCopyWithImpl(_$SwitchDeviceSuccessImpl _value,
      $Res Function(_$SwitchDeviceSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SwitchDeviceSuccessImpl implements SwitchDeviceSuccess {
  const _$SwitchDeviceSuccessImpl();

  @override
  String toString() {
    return 'SwitchDeviceState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwitchDeviceSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SwitchDeviceInitial value) initial,
    required TResult Function(SwitchDeviceLoading value) loading,
    required TResult Function(SwitchDeviceSuccess value) success,
    required TResult Function(SwitchDeviceFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwitchDeviceInitial value)? initial,
    TResult? Function(SwitchDeviceLoading value)? loading,
    TResult? Function(SwitchDeviceSuccess value)? success,
    TResult? Function(SwitchDeviceFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwitchDeviceInitial value)? initial,
    TResult Function(SwitchDeviceLoading value)? loading,
    TResult Function(SwitchDeviceSuccess value)? success,
    TResult Function(SwitchDeviceFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SwitchDeviceSuccess implements SwitchDeviceState {
  const factory SwitchDeviceSuccess() = _$SwitchDeviceSuccessImpl;
}

/// @nodoc
abstract class _$$SwitchDeviceFailureImplCopyWith<$Res> {
  factory _$$SwitchDeviceFailureImplCopyWith(_$SwitchDeviceFailureImpl value,
          $Res Function(_$SwitchDeviceFailureImpl) then) =
      __$$SwitchDeviceFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$SwitchDeviceFailureImplCopyWithImpl<$Res>
    extends _$SwitchDeviceStateCopyWithImpl<$Res, _$SwitchDeviceFailureImpl>
    implements _$$SwitchDeviceFailureImplCopyWith<$Res> {
  __$$SwitchDeviceFailureImplCopyWithImpl(_$SwitchDeviceFailureImpl _value,
      $Res Function(_$SwitchDeviceFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$SwitchDeviceFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SwitchDeviceFailureImpl implements SwitchDeviceFailure {
  const _$SwitchDeviceFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'SwitchDeviceState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwitchDeviceFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwitchDeviceFailureImplCopyWith<_$SwitchDeviceFailureImpl> get copyWith =>
      __$$SwitchDeviceFailureImplCopyWithImpl<_$SwitchDeviceFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SwitchDeviceInitial value) initial,
    required TResult Function(SwitchDeviceLoading value) loading,
    required TResult Function(SwitchDeviceSuccess value) success,
    required TResult Function(SwitchDeviceFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwitchDeviceInitial value)? initial,
    TResult? Function(SwitchDeviceLoading value)? loading,
    TResult? Function(SwitchDeviceSuccess value)? success,
    TResult? Function(SwitchDeviceFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwitchDeviceInitial value)? initial,
    TResult Function(SwitchDeviceLoading value)? loading,
    TResult Function(SwitchDeviceSuccess value)? success,
    TResult Function(SwitchDeviceFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class SwitchDeviceFailure implements SwitchDeviceState {
  const factory SwitchDeviceFailure(final String error) =
      _$SwitchDeviceFailureImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$SwitchDeviceFailureImplCopyWith<_$SwitchDeviceFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
