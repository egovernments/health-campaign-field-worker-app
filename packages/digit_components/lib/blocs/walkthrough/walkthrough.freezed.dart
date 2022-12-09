// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'walkthrough.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WalkthroughEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int walkthroughIndex) handleNext,
    required TResult Function(DigitIconCardWrapperModel walkthroughData)
        loadWalkthrough,
    required TResult Function() handleReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int walkthroughIndex)? handleNext,
    TResult? Function(DigitIconCardWrapperModel walkthroughData)?
        loadWalkthrough,
    TResult? Function()? handleReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int walkthroughIndex)? handleNext,
    TResult Function(DigitIconCardWrapperModel walkthroughData)?
        loadWalkthrough,
    TResult Function()? handleReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestWalkthroughNextEvent value) handleNext,
    required TResult Function(RequestWalkthroughLoadEvent value)
        loadWalkthrough,
    required TResult Function(RequestWalkthroughResetEvent value) handleReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestWalkthroughNextEvent value)? handleNext,
    TResult? Function(RequestWalkthroughLoadEvent value)? loadWalkthrough,
    TResult? Function(RequestWalkthroughResetEvent value)? handleReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestWalkthroughNextEvent value)? handleNext,
    TResult Function(RequestWalkthroughLoadEvent value)? loadWalkthrough,
    TResult Function(RequestWalkthroughResetEvent value)? handleReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalkthroughEventCopyWith<$Res> {
  factory $WalkthroughEventCopyWith(
          WalkthroughEvent value, $Res Function(WalkthroughEvent) then) =
      _$WalkthroughEventCopyWithImpl<$Res, WalkthroughEvent>;
}

/// @nodoc
class _$WalkthroughEventCopyWithImpl<$Res, $Val extends WalkthroughEvent>
    implements $WalkthroughEventCopyWith<$Res> {
  _$WalkthroughEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RequestWalkthroughNextEventCopyWith<$Res> {
  factory _$$RequestWalkthroughNextEventCopyWith(
          _$RequestWalkthroughNextEvent value,
          $Res Function(_$RequestWalkthroughNextEvent) then) =
      __$$RequestWalkthroughNextEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int walkthroughIndex});
}

/// @nodoc
class __$$RequestWalkthroughNextEventCopyWithImpl<$Res>
    extends _$WalkthroughEventCopyWithImpl<$Res, _$RequestWalkthroughNextEvent>
    implements _$$RequestWalkthroughNextEventCopyWith<$Res> {
  __$$RequestWalkthroughNextEventCopyWithImpl(
      _$RequestWalkthroughNextEvent _value,
      $Res Function(_$RequestWalkthroughNextEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walkthroughIndex = null,
  }) {
    return _then(_$RequestWalkthroughNextEvent(
      walkthroughIndex: null == walkthroughIndex
          ? _value.walkthroughIndex
          : walkthroughIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RequestWalkthroughNextEvent implements RequestWalkthroughNextEvent {
  const _$RequestWalkthroughNextEvent({required this.walkthroughIndex});

  @override
  final int walkthroughIndex;

  @override
  String toString() {
    return 'WalkthroughEvent.handleNext(walkthroughIndex: $walkthroughIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestWalkthroughNextEvent &&
            (identical(other.walkthroughIndex, walkthroughIndex) ||
                other.walkthroughIndex == walkthroughIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, walkthroughIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestWalkthroughNextEventCopyWith<_$RequestWalkthroughNextEvent>
      get copyWith => __$$RequestWalkthroughNextEventCopyWithImpl<
          _$RequestWalkthroughNextEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int walkthroughIndex) handleNext,
    required TResult Function(DigitIconCardWrapperModel walkthroughData)
        loadWalkthrough,
    required TResult Function() handleReset,
  }) {
    return handleNext(walkthroughIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int walkthroughIndex)? handleNext,
    TResult? Function(DigitIconCardWrapperModel walkthroughData)?
        loadWalkthrough,
    TResult? Function()? handleReset,
  }) {
    return handleNext?.call(walkthroughIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int walkthroughIndex)? handleNext,
    TResult Function(DigitIconCardWrapperModel walkthroughData)?
        loadWalkthrough,
    TResult Function()? handleReset,
    required TResult orElse(),
  }) {
    if (handleNext != null) {
      return handleNext(walkthroughIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestWalkthroughNextEvent value) handleNext,
    required TResult Function(RequestWalkthroughLoadEvent value)
        loadWalkthrough,
    required TResult Function(RequestWalkthroughResetEvent value) handleReset,
  }) {
    return handleNext(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestWalkthroughNextEvent value)? handleNext,
    TResult? Function(RequestWalkthroughLoadEvent value)? loadWalkthrough,
    TResult? Function(RequestWalkthroughResetEvent value)? handleReset,
  }) {
    return handleNext?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestWalkthroughNextEvent value)? handleNext,
    TResult Function(RequestWalkthroughLoadEvent value)? loadWalkthrough,
    TResult Function(RequestWalkthroughResetEvent value)? handleReset,
    required TResult orElse(),
  }) {
    if (handleNext != null) {
      return handleNext(this);
    }
    return orElse();
  }
}

abstract class RequestWalkthroughNextEvent implements WalkthroughEvent {
  const factory RequestWalkthroughNextEvent(
      {required final int walkthroughIndex}) = _$RequestWalkthroughNextEvent;

  int get walkthroughIndex;
  @JsonKey(ignore: true)
  _$$RequestWalkthroughNextEventCopyWith<_$RequestWalkthroughNextEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestWalkthroughLoadEventCopyWith<$Res> {
  factory _$$RequestWalkthroughLoadEventCopyWith(
          _$RequestWalkthroughLoadEvent value,
          $Res Function(_$RequestWalkthroughLoadEvent) then) =
      __$$RequestWalkthroughLoadEventCopyWithImpl<$Res>;
  @useResult
  $Res call({DigitIconCardWrapperModel walkthroughData});

  $DigitIconCardWrapperModelCopyWith<$Res> get walkthroughData;
}

/// @nodoc
class __$$RequestWalkthroughLoadEventCopyWithImpl<$Res>
    extends _$WalkthroughEventCopyWithImpl<$Res, _$RequestWalkthroughLoadEvent>
    implements _$$RequestWalkthroughLoadEventCopyWith<$Res> {
  __$$RequestWalkthroughLoadEventCopyWithImpl(
      _$RequestWalkthroughLoadEvent _value,
      $Res Function(_$RequestWalkthroughLoadEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walkthroughData = null,
  }) {
    return _then(_$RequestWalkthroughLoadEvent(
      walkthroughData: null == walkthroughData
          ? _value.walkthroughData
          : walkthroughData // ignore: cast_nullable_to_non_nullable
              as DigitIconCardWrapperModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DigitIconCardWrapperModelCopyWith<$Res> get walkthroughData {
    return $DigitIconCardWrapperModelCopyWith<$Res>(_value.walkthroughData,
        (value) {
      return _then(_value.copyWith(walkthroughData: value));
    });
  }
}

/// @nodoc

class _$RequestWalkthroughLoadEvent implements RequestWalkthroughLoadEvent {
  const _$RequestWalkthroughLoadEvent({required this.walkthroughData});

  @override
  final DigitIconCardWrapperModel walkthroughData;

  @override
  String toString() {
    return 'WalkthroughEvent.loadWalkthrough(walkthroughData: $walkthroughData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestWalkthroughLoadEvent &&
            (identical(other.walkthroughData, walkthroughData) ||
                other.walkthroughData == walkthroughData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, walkthroughData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestWalkthroughLoadEventCopyWith<_$RequestWalkthroughLoadEvent>
      get copyWith => __$$RequestWalkthroughLoadEventCopyWithImpl<
          _$RequestWalkthroughLoadEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int walkthroughIndex) handleNext,
    required TResult Function(DigitIconCardWrapperModel walkthroughData)
        loadWalkthrough,
    required TResult Function() handleReset,
  }) {
    return loadWalkthrough(walkthroughData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int walkthroughIndex)? handleNext,
    TResult? Function(DigitIconCardWrapperModel walkthroughData)?
        loadWalkthrough,
    TResult? Function()? handleReset,
  }) {
    return loadWalkthrough?.call(walkthroughData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int walkthroughIndex)? handleNext,
    TResult Function(DigitIconCardWrapperModel walkthroughData)?
        loadWalkthrough,
    TResult Function()? handleReset,
    required TResult orElse(),
  }) {
    if (loadWalkthrough != null) {
      return loadWalkthrough(walkthroughData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestWalkthroughNextEvent value) handleNext,
    required TResult Function(RequestWalkthroughLoadEvent value)
        loadWalkthrough,
    required TResult Function(RequestWalkthroughResetEvent value) handleReset,
  }) {
    return loadWalkthrough(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestWalkthroughNextEvent value)? handleNext,
    TResult? Function(RequestWalkthroughLoadEvent value)? loadWalkthrough,
    TResult? Function(RequestWalkthroughResetEvent value)? handleReset,
  }) {
    return loadWalkthrough?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestWalkthroughNextEvent value)? handleNext,
    TResult Function(RequestWalkthroughLoadEvent value)? loadWalkthrough,
    TResult Function(RequestWalkthroughResetEvent value)? handleReset,
    required TResult orElse(),
  }) {
    if (loadWalkthrough != null) {
      return loadWalkthrough(this);
    }
    return orElse();
  }
}

abstract class RequestWalkthroughLoadEvent implements WalkthroughEvent {
  const factory RequestWalkthroughLoadEvent(
          {required final DigitIconCardWrapperModel walkthroughData}) =
      _$RequestWalkthroughLoadEvent;

  DigitIconCardWrapperModel get walkthroughData;
  @JsonKey(ignore: true)
  _$$RequestWalkthroughLoadEventCopyWith<_$RequestWalkthroughLoadEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestWalkthroughResetEventCopyWith<$Res> {
  factory _$$RequestWalkthroughResetEventCopyWith(
          _$RequestWalkthroughResetEvent value,
          $Res Function(_$RequestWalkthroughResetEvent) then) =
      __$$RequestWalkthroughResetEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequestWalkthroughResetEventCopyWithImpl<$Res>
    extends _$WalkthroughEventCopyWithImpl<$Res, _$RequestWalkthroughResetEvent>
    implements _$$RequestWalkthroughResetEventCopyWith<$Res> {
  __$$RequestWalkthroughResetEventCopyWithImpl(
      _$RequestWalkthroughResetEvent _value,
      $Res Function(_$RequestWalkthroughResetEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequestWalkthroughResetEvent implements RequestWalkthroughResetEvent {
  const _$RequestWalkthroughResetEvent();

  @override
  String toString() {
    return 'WalkthroughEvent.handleReset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestWalkthroughResetEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int walkthroughIndex) handleNext,
    required TResult Function(DigitIconCardWrapperModel walkthroughData)
        loadWalkthrough,
    required TResult Function() handleReset,
  }) {
    return handleReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int walkthroughIndex)? handleNext,
    TResult? Function(DigitIconCardWrapperModel walkthroughData)?
        loadWalkthrough,
    TResult? Function()? handleReset,
  }) {
    return handleReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int walkthroughIndex)? handleNext,
    TResult Function(DigitIconCardWrapperModel walkthroughData)?
        loadWalkthrough,
    TResult Function()? handleReset,
    required TResult orElse(),
  }) {
    if (handleReset != null) {
      return handleReset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestWalkthroughNextEvent value) handleNext,
    required TResult Function(RequestWalkthroughLoadEvent value)
        loadWalkthrough,
    required TResult Function(RequestWalkthroughResetEvent value) handleReset,
  }) {
    return handleReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestWalkthroughNextEvent value)? handleNext,
    TResult? Function(RequestWalkthroughLoadEvent value)? loadWalkthrough,
    TResult? Function(RequestWalkthroughResetEvent value)? handleReset,
  }) {
    return handleReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestWalkthroughNextEvent value)? handleNext,
    TResult Function(RequestWalkthroughLoadEvent value)? loadWalkthrough,
    TResult Function(RequestWalkthroughResetEvent value)? handleReset,
    required TResult orElse(),
  }) {
    if (handleReset != null) {
      return handleReset(this);
    }
    return orElse();
  }
}

abstract class RequestWalkthroughResetEvent implements WalkthroughEvent {
  const factory RequestWalkthroughResetEvent() = _$RequestWalkthroughResetEvent;
}

/// @nodoc
mixin _$WalkthroughState {
  DigitIconCardWrapperModel get walkthroughData =>
      throw _privateConstructorUsedError;
  int get walkthroughIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalkthroughStateCopyWith<WalkthroughState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalkthroughStateCopyWith<$Res> {
  factory $WalkthroughStateCopyWith(
          WalkthroughState value, $Res Function(WalkthroughState) then) =
      _$WalkthroughStateCopyWithImpl<$Res, WalkthroughState>;
  @useResult
  $Res call({DigitIconCardWrapperModel walkthroughData, int walkthroughIndex});

  $DigitIconCardWrapperModelCopyWith<$Res> get walkthroughData;
}

/// @nodoc
class _$WalkthroughStateCopyWithImpl<$Res, $Val extends WalkthroughState>
    implements $WalkthroughStateCopyWith<$Res> {
  _$WalkthroughStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walkthroughData = null,
    Object? walkthroughIndex = null,
  }) {
    return _then(_value.copyWith(
      walkthroughData: null == walkthroughData
          ? _value.walkthroughData
          : walkthroughData // ignore: cast_nullable_to_non_nullable
              as DigitIconCardWrapperModel,
      walkthroughIndex: null == walkthroughIndex
          ? _value.walkthroughIndex
          : walkthroughIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DigitIconCardWrapperModelCopyWith<$Res> get walkthroughData {
    return $DigitIconCardWrapperModelCopyWith<$Res>(_value.walkthroughData,
        (value) {
      return _then(_value.copyWith(walkthroughData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WalkthroughStateCopyWith<$Res>
    implements $WalkthroughStateCopyWith<$Res> {
  factory _$$_WalkthroughStateCopyWith(
          _$_WalkthroughState value, $Res Function(_$_WalkthroughState) then) =
      __$$_WalkthroughStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DigitIconCardWrapperModel walkthroughData, int walkthroughIndex});

  @override
  $DigitIconCardWrapperModelCopyWith<$Res> get walkthroughData;
}

/// @nodoc
class __$$_WalkthroughStateCopyWithImpl<$Res>
    extends _$WalkthroughStateCopyWithImpl<$Res, _$_WalkthroughState>
    implements _$$_WalkthroughStateCopyWith<$Res> {
  __$$_WalkthroughStateCopyWithImpl(
      _$_WalkthroughState _value, $Res Function(_$_WalkthroughState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walkthroughData = null,
    Object? walkthroughIndex = null,
  }) {
    return _then(_$_WalkthroughState(
      walkthroughData: null == walkthroughData
          ? _value.walkthroughData
          : walkthroughData // ignore: cast_nullable_to_non_nullable
              as DigitIconCardWrapperModel,
      walkthroughIndex: null == walkthroughIndex
          ? _value.walkthroughIndex
          : walkthroughIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_WalkthroughState extends _WalkthroughState {
  const _$_WalkthroughState(
      {required this.walkthroughData, this.walkthroughIndex = 0})
      : super._();

  @override
  final DigitIconCardWrapperModel walkthroughData;
  @override
  @JsonKey()
  final int walkthroughIndex;

  @override
  String toString() {
    return 'WalkthroughState(walkthroughData: $walkthroughData, walkthroughIndex: $walkthroughIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalkthroughState &&
            (identical(other.walkthroughData, walkthroughData) ||
                other.walkthroughData == walkthroughData) &&
            (identical(other.walkthroughIndex, walkthroughIndex) ||
                other.walkthroughIndex == walkthroughIndex));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, walkthroughData, walkthroughIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WalkthroughStateCopyWith<_$_WalkthroughState> get copyWith =>
      __$$_WalkthroughStateCopyWithImpl<_$_WalkthroughState>(this, _$identity);
}

abstract class _WalkthroughState extends WalkthroughState {
  const factory _WalkthroughState(
      {required final DigitIconCardWrapperModel walkthroughData,
      final int walkthroughIndex}) = _$_WalkthroughState;
  const _WalkthroughState._() : super._();

  @override
  DigitIconCardWrapperModel get walkthroughData;
  @override
  int get walkthroughIndex;
  @override
  @JsonKey(ignore: true)
  _$$_WalkthroughStateCopyWith<_$_WalkthroughState> get copyWith =>
      throw _privateConstructorUsedError;
}
