// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ErrorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errorMessage) setError,
    required TResult Function() clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String errorMessage)? setError,
    TResult? Function()? clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errorMessage)? setError,
    TResult Function()? clearError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetErrorEvent value) setError,
    required TResult Function(ClearErrorEvent value) clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetErrorEvent value)? setError,
    TResult? Function(ClearErrorEvent value)? clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetErrorEvent value)? setError,
    TResult Function(ClearErrorEvent value)? clearError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorEventCopyWith<$Res> {
  factory $ErrorEventCopyWith(
          ErrorEvent value, $Res Function(ErrorEvent) then) =
      _$ErrorEventCopyWithImpl<$Res, ErrorEvent>;
}

/// @nodoc
class _$ErrorEventCopyWithImpl<$Res, $Val extends ErrorEvent>
    implements $ErrorEventCopyWith<$Res> {
  _$ErrorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SetErrorEventImplCopyWith<$Res> {
  factory _$$SetErrorEventImplCopyWith(
          _$SetErrorEventImpl value, $Res Function(_$SetErrorEventImpl) then) =
      __$$SetErrorEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$SetErrorEventImplCopyWithImpl<$Res>
    extends _$ErrorEventCopyWithImpl<$Res, _$SetErrorEventImpl>
    implements _$$SetErrorEventImplCopyWith<$Res> {
  __$$SetErrorEventImplCopyWithImpl(
      _$SetErrorEventImpl _value, $Res Function(_$SetErrorEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$SetErrorEventImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetErrorEventImpl implements SetErrorEvent {
  const _$SetErrorEventImpl({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'ErrorEvent.setError(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetErrorEventImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetErrorEventImplCopyWith<_$SetErrorEventImpl> get copyWith =>
      __$$SetErrorEventImplCopyWithImpl<_$SetErrorEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errorMessage) setError,
    required TResult Function() clearError,
  }) {
    return setError(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String errorMessage)? setError,
    TResult? Function()? clearError,
  }) {
    return setError?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errorMessage)? setError,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (setError != null) {
      return setError(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetErrorEvent value) setError,
    required TResult Function(ClearErrorEvent value) clearError,
  }) {
    return setError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetErrorEvent value)? setError,
    TResult? Function(ClearErrorEvent value)? clearError,
  }) {
    return setError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetErrorEvent value)? setError,
    TResult Function(ClearErrorEvent value)? clearError,
    required TResult orElse(),
  }) {
    if (setError != null) {
      return setError(this);
    }
    return orElse();
  }
}

abstract class SetErrorEvent implements ErrorEvent {
  const factory SetErrorEvent({required final String errorMessage}) =
      _$SetErrorEventImpl;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$SetErrorEventImplCopyWith<_$SetErrorEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearErrorEventImplCopyWith<$Res> {
  factory _$$ClearErrorEventImplCopyWith(_$ClearErrorEventImpl value,
          $Res Function(_$ClearErrorEventImpl) then) =
      __$$ClearErrorEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearErrorEventImplCopyWithImpl<$Res>
    extends _$ErrorEventCopyWithImpl<$Res, _$ClearErrorEventImpl>
    implements _$$ClearErrorEventImplCopyWith<$Res> {
  __$$ClearErrorEventImplCopyWithImpl(
      _$ClearErrorEventImpl _value, $Res Function(_$ClearErrorEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearErrorEventImpl implements ClearErrorEvent {
  const _$ClearErrorEventImpl();

  @override
  String toString() {
    return 'ErrorEvent.clearError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearErrorEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errorMessage) setError,
    required TResult Function() clearError,
  }) {
    return clearError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String errorMessage)? setError,
    TResult? Function()? clearError,
  }) {
    return clearError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errorMessage)? setError,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetErrorEvent value) setError,
    required TResult Function(ClearErrorEvent value) clearError,
  }) {
    return clearError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetErrorEvent value)? setError,
    TResult? Function(ClearErrorEvent value)? clearError,
  }) {
    return clearError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetErrorEvent value)? setError,
    TResult Function(ClearErrorEvent value)? clearError,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError(this);
    }
    return orElse();
  }
}

abstract class ClearErrorEvent implements ErrorEvent {
  const factory ClearErrorEvent() = _$ClearErrorEventImpl;
}

/// @nodoc
mixin _$ErrorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noError,
    required TResult Function(String errorMessage) hasError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noError,
    TResult? Function(String errorMessage)? hasError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noError,
    TResult Function(String errorMessage)? hasError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoErrorState value) noError,
    required TResult Function(HasErrorState value) hasError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NoErrorState value)? noError,
    TResult? Function(HasErrorState value)? hasError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoErrorState value)? noError,
    TResult Function(HasErrorState value)? hasError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorStateCopyWith<$Res> {
  factory $ErrorStateCopyWith(
          ErrorState value, $Res Function(ErrorState) then) =
      _$ErrorStateCopyWithImpl<$Res, ErrorState>;
}

/// @nodoc
class _$ErrorStateCopyWithImpl<$Res, $Val extends ErrorState>
    implements $ErrorStateCopyWith<$Res> {
  _$ErrorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NoErrorStateImplCopyWith<$Res> {
  factory _$$NoErrorStateImplCopyWith(
          _$NoErrorStateImpl value, $Res Function(_$NoErrorStateImpl) then) =
      __$$NoErrorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoErrorStateImplCopyWithImpl<$Res>
    extends _$ErrorStateCopyWithImpl<$Res, _$NoErrorStateImpl>
    implements _$$NoErrorStateImplCopyWith<$Res> {
  __$$NoErrorStateImplCopyWithImpl(
      _$NoErrorStateImpl _value, $Res Function(_$NoErrorStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoErrorStateImpl implements NoErrorState {
  const _$NoErrorStateImpl();

  @override
  String toString() {
    return 'ErrorState.noError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoErrorStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noError,
    required TResult Function(String errorMessage) hasError,
  }) {
    return noError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noError,
    TResult? Function(String errorMessage)? hasError,
  }) {
    return noError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noError,
    TResult Function(String errorMessage)? hasError,
    required TResult orElse(),
  }) {
    if (noError != null) {
      return noError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoErrorState value) noError,
    required TResult Function(HasErrorState value) hasError,
  }) {
    return noError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NoErrorState value)? noError,
    TResult? Function(HasErrorState value)? hasError,
  }) {
    return noError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoErrorState value)? noError,
    TResult Function(HasErrorState value)? hasError,
    required TResult orElse(),
  }) {
    if (noError != null) {
      return noError(this);
    }
    return orElse();
  }
}

abstract class NoErrorState implements ErrorState {
  const factory NoErrorState() = _$NoErrorStateImpl;
}

/// @nodoc
abstract class _$$HasErrorStateImplCopyWith<$Res> {
  factory _$$HasErrorStateImplCopyWith(
          _$HasErrorStateImpl value, $Res Function(_$HasErrorStateImpl) then) =
      __$$HasErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$HasErrorStateImplCopyWithImpl<$Res>
    extends _$ErrorStateCopyWithImpl<$Res, _$HasErrorStateImpl>
    implements _$$HasErrorStateImplCopyWith<$Res> {
  __$$HasErrorStateImplCopyWithImpl(
      _$HasErrorStateImpl _value, $Res Function(_$HasErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$HasErrorStateImpl(
      null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HasErrorStateImpl implements HasErrorState {
  const _$HasErrorStateImpl(this.errorMessage);

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'ErrorState.hasError(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HasErrorStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HasErrorStateImplCopyWith<_$HasErrorStateImpl> get copyWith =>
      __$$HasErrorStateImplCopyWithImpl<_$HasErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noError,
    required TResult Function(String errorMessage) hasError,
  }) {
    return hasError(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noError,
    TResult? Function(String errorMessage)? hasError,
  }) {
    return hasError?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noError,
    TResult Function(String errorMessage)? hasError,
    required TResult orElse(),
  }) {
    if (hasError != null) {
      return hasError(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoErrorState value) noError,
    required TResult Function(HasErrorState value) hasError,
  }) {
    return hasError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NoErrorState value)? noError,
    TResult? Function(HasErrorState value)? hasError,
  }) {
    return hasError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoErrorState value)? noError,
    TResult Function(HasErrorState value)? hasError,
    required TResult orElse(),
  }) {
    if (hasError != null) {
      return hasError(this);
    }
    return orElse();
  }
}

abstract class HasErrorState implements ErrorState {
  const factory HasErrorState(final String errorMessage) = _$HasErrorStateImpl;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$HasErrorStateImplCopyWith<_$HasErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
