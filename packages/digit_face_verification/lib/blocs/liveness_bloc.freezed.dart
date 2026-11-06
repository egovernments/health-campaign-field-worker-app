// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liveness_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LivenessEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(Face face) faceFrame,
    required TResult Function() timeout,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(Face face)? faceFrame,
    TResult? Function()? timeout,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(Face face)? faceFrame,
    TResult Function()? timeout,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LivenessStartEvent value) start,
    required TResult Function(LivenessFaceFrameEvent value) faceFrame,
    required TResult Function(LivenessTimeoutEvent value) timeout,
    required TResult Function(LivenessResetEvent value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LivenessStartEvent value)? start,
    TResult? Function(LivenessFaceFrameEvent value)? faceFrame,
    TResult? Function(LivenessTimeoutEvent value)? timeout,
    TResult? Function(LivenessResetEvent value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LivenessStartEvent value)? start,
    TResult Function(LivenessFaceFrameEvent value)? faceFrame,
    TResult Function(LivenessTimeoutEvent value)? timeout,
    TResult Function(LivenessResetEvent value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LivenessEventCopyWith<$Res> {
  factory $LivenessEventCopyWith(
          LivenessEvent value, $Res Function(LivenessEvent) then) =
      _$LivenessEventCopyWithImpl<$Res, LivenessEvent>;
}

/// @nodoc
class _$LivenessEventCopyWithImpl<$Res, $Val extends LivenessEvent>
    implements $LivenessEventCopyWith<$Res> {
  _$LivenessEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LivenessStartEventImplCopyWith<$Res> {
  factory _$$LivenessStartEventImplCopyWith(_$LivenessStartEventImpl value,
          $Res Function(_$LivenessStartEventImpl) then) =
      __$$LivenessStartEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LivenessStartEventImplCopyWithImpl<$Res>
    extends _$LivenessEventCopyWithImpl<$Res, _$LivenessStartEventImpl>
    implements _$$LivenessStartEventImplCopyWith<$Res> {
  __$$LivenessStartEventImplCopyWithImpl(_$LivenessStartEventImpl _value,
      $Res Function(_$LivenessStartEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LivenessStartEventImpl implements LivenessStartEvent {
  const _$LivenessStartEventImpl();

  @override
  String toString() {
    return 'LivenessEvent.start()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LivenessStartEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(Face face) faceFrame,
    required TResult Function() timeout,
    required TResult Function() reset,
  }) {
    return start();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(Face face)? faceFrame,
    TResult? Function()? timeout,
    TResult? Function()? reset,
  }) {
    return start?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(Face face)? faceFrame,
    TResult Function()? timeout,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LivenessStartEvent value) start,
    required TResult Function(LivenessFaceFrameEvent value) faceFrame,
    required TResult Function(LivenessTimeoutEvent value) timeout,
    required TResult Function(LivenessResetEvent value) reset,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LivenessStartEvent value)? start,
    TResult? Function(LivenessFaceFrameEvent value)? faceFrame,
    TResult? Function(LivenessTimeoutEvent value)? timeout,
    TResult? Function(LivenessResetEvent value)? reset,
  }) {
    return start?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LivenessStartEvent value)? start,
    TResult Function(LivenessFaceFrameEvent value)? faceFrame,
    TResult Function(LivenessTimeoutEvent value)? timeout,
    TResult Function(LivenessResetEvent value)? reset,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class LivenessStartEvent implements LivenessEvent {
  const factory LivenessStartEvent() = _$LivenessStartEventImpl;
}

/// @nodoc
abstract class _$$LivenessFaceFrameEventImplCopyWith<$Res> {
  factory _$$LivenessFaceFrameEventImplCopyWith(
          _$LivenessFaceFrameEventImpl value,
          $Res Function(_$LivenessFaceFrameEventImpl) then) =
      __$$LivenessFaceFrameEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Face face});
}

/// @nodoc
class __$$LivenessFaceFrameEventImplCopyWithImpl<$Res>
    extends _$LivenessEventCopyWithImpl<$Res, _$LivenessFaceFrameEventImpl>
    implements _$$LivenessFaceFrameEventImplCopyWith<$Res> {
  __$$LivenessFaceFrameEventImplCopyWithImpl(
      _$LivenessFaceFrameEventImpl _value,
      $Res Function(_$LivenessFaceFrameEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? face = null,
  }) {
    return _then(_$LivenessFaceFrameEventImpl(
      face: null == face
          ? _value.face
          : face // ignore: cast_nullable_to_non_nullable
              as Face,
    ));
  }
}

/// @nodoc

class _$LivenessFaceFrameEventImpl implements LivenessFaceFrameEvent {
  const _$LivenessFaceFrameEventImpl({required this.face});

  @override
  final Face face;

  @override
  String toString() {
    return 'LivenessEvent.faceFrame(face: $face)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LivenessFaceFrameEventImpl &&
            (identical(other.face, face) || other.face == face));
  }

  @override
  int get hashCode => Object.hash(runtimeType, face);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LivenessFaceFrameEventImplCopyWith<_$LivenessFaceFrameEventImpl>
      get copyWith => __$$LivenessFaceFrameEventImplCopyWithImpl<
          _$LivenessFaceFrameEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(Face face) faceFrame,
    required TResult Function() timeout,
    required TResult Function() reset,
  }) {
    return faceFrame(face);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(Face face)? faceFrame,
    TResult? Function()? timeout,
    TResult? Function()? reset,
  }) {
    return faceFrame?.call(face);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(Face face)? faceFrame,
    TResult Function()? timeout,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (faceFrame != null) {
      return faceFrame(face);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LivenessStartEvent value) start,
    required TResult Function(LivenessFaceFrameEvent value) faceFrame,
    required TResult Function(LivenessTimeoutEvent value) timeout,
    required TResult Function(LivenessResetEvent value) reset,
  }) {
    return faceFrame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LivenessStartEvent value)? start,
    TResult? Function(LivenessFaceFrameEvent value)? faceFrame,
    TResult? Function(LivenessTimeoutEvent value)? timeout,
    TResult? Function(LivenessResetEvent value)? reset,
  }) {
    return faceFrame?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LivenessStartEvent value)? start,
    TResult Function(LivenessFaceFrameEvent value)? faceFrame,
    TResult Function(LivenessTimeoutEvent value)? timeout,
    TResult Function(LivenessResetEvent value)? reset,
    required TResult orElse(),
  }) {
    if (faceFrame != null) {
      return faceFrame(this);
    }
    return orElse();
  }
}

abstract class LivenessFaceFrameEvent implements LivenessEvent {
  const factory LivenessFaceFrameEvent({required final Face face}) =
      _$LivenessFaceFrameEventImpl;

  Face get face;
  @JsonKey(ignore: true)
  _$$LivenessFaceFrameEventImplCopyWith<_$LivenessFaceFrameEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LivenessTimeoutEventImplCopyWith<$Res> {
  factory _$$LivenessTimeoutEventImplCopyWith(_$LivenessTimeoutEventImpl value,
          $Res Function(_$LivenessTimeoutEventImpl) then) =
      __$$LivenessTimeoutEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LivenessTimeoutEventImplCopyWithImpl<$Res>
    extends _$LivenessEventCopyWithImpl<$Res, _$LivenessTimeoutEventImpl>
    implements _$$LivenessTimeoutEventImplCopyWith<$Res> {
  __$$LivenessTimeoutEventImplCopyWithImpl(_$LivenessTimeoutEventImpl _value,
      $Res Function(_$LivenessTimeoutEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LivenessTimeoutEventImpl implements LivenessTimeoutEvent {
  const _$LivenessTimeoutEventImpl();

  @override
  String toString() {
    return 'LivenessEvent.timeout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LivenessTimeoutEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(Face face) faceFrame,
    required TResult Function() timeout,
    required TResult Function() reset,
  }) {
    return timeout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(Face face)? faceFrame,
    TResult? Function()? timeout,
    TResult? Function()? reset,
  }) {
    return timeout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(Face face)? faceFrame,
    TResult Function()? timeout,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LivenessStartEvent value) start,
    required TResult Function(LivenessFaceFrameEvent value) faceFrame,
    required TResult Function(LivenessTimeoutEvent value) timeout,
    required TResult Function(LivenessResetEvent value) reset,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LivenessStartEvent value)? start,
    TResult? Function(LivenessFaceFrameEvent value)? faceFrame,
    TResult? Function(LivenessTimeoutEvent value)? timeout,
    TResult? Function(LivenessResetEvent value)? reset,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LivenessStartEvent value)? start,
    TResult Function(LivenessFaceFrameEvent value)? faceFrame,
    TResult Function(LivenessTimeoutEvent value)? timeout,
    TResult Function(LivenessResetEvent value)? reset,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class LivenessTimeoutEvent implements LivenessEvent {
  const factory LivenessTimeoutEvent() = _$LivenessTimeoutEventImpl;
}

/// @nodoc
abstract class _$$LivenessResetEventImplCopyWith<$Res> {
  factory _$$LivenessResetEventImplCopyWith(_$LivenessResetEventImpl value,
          $Res Function(_$LivenessResetEventImpl) then) =
      __$$LivenessResetEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LivenessResetEventImplCopyWithImpl<$Res>
    extends _$LivenessEventCopyWithImpl<$Res, _$LivenessResetEventImpl>
    implements _$$LivenessResetEventImplCopyWith<$Res> {
  __$$LivenessResetEventImplCopyWithImpl(_$LivenessResetEventImpl _value,
      $Res Function(_$LivenessResetEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LivenessResetEventImpl implements LivenessResetEvent {
  const _$LivenessResetEventImpl();

  @override
  String toString() {
    return 'LivenessEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LivenessResetEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(Face face) faceFrame,
    required TResult Function() timeout,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(Face face)? faceFrame,
    TResult? Function()? timeout,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(Face face)? faceFrame,
    TResult Function()? timeout,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LivenessStartEvent value) start,
    required TResult Function(LivenessFaceFrameEvent value) faceFrame,
    required TResult Function(LivenessTimeoutEvent value) timeout,
    required TResult Function(LivenessResetEvent value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LivenessStartEvent value)? start,
    TResult? Function(LivenessFaceFrameEvent value)? faceFrame,
    TResult? Function(LivenessTimeoutEvent value)? timeout,
    TResult? Function(LivenessResetEvent value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LivenessStartEvent value)? start,
    TResult Function(LivenessFaceFrameEvent value)? faceFrame,
    TResult Function(LivenessTimeoutEvent value)? timeout,
    TResult Function(LivenessResetEvent value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class LivenessResetEvent implements LivenessEvent {
  const factory LivenessResetEvent() = _$LivenessResetEventImpl;
}

/// @nodoc
mixin _$LivenessState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            LivenessChallenge challenge, String instruction, double progress)
        challenging,
    required TResult Function() passed,
    required TResult Function(String reason) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
            LivenessChallenge challenge, String instruction, double progress)?
        challenging,
    TResult? Function()? passed,
    TResult? Function(String reason)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            LivenessChallenge challenge, String instruction, double progress)?
        challenging,
    TResult Function()? passed,
    TResult Function(String reason)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LivenessIdleState value) idle,
    required TResult Function(LivenessChallengingState value) challenging,
    required TResult Function(LivenessPassedState value) passed,
    required TResult Function(LivenessFailedState value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LivenessIdleState value)? idle,
    TResult? Function(LivenessChallengingState value)? challenging,
    TResult? Function(LivenessPassedState value)? passed,
    TResult? Function(LivenessFailedState value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LivenessIdleState value)? idle,
    TResult Function(LivenessChallengingState value)? challenging,
    TResult Function(LivenessPassedState value)? passed,
    TResult Function(LivenessFailedState value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LivenessStateCopyWith<$Res> {
  factory $LivenessStateCopyWith(
          LivenessState value, $Res Function(LivenessState) then) =
      _$LivenessStateCopyWithImpl<$Res, LivenessState>;
}

/// @nodoc
class _$LivenessStateCopyWithImpl<$Res, $Val extends LivenessState>
    implements $LivenessStateCopyWith<$Res> {
  _$LivenessStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LivenessIdleStateImplCopyWith<$Res> {
  factory _$$LivenessIdleStateImplCopyWith(_$LivenessIdleStateImpl value,
          $Res Function(_$LivenessIdleStateImpl) then) =
      __$$LivenessIdleStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LivenessIdleStateImplCopyWithImpl<$Res>
    extends _$LivenessStateCopyWithImpl<$Res, _$LivenessIdleStateImpl>
    implements _$$LivenessIdleStateImplCopyWith<$Res> {
  __$$LivenessIdleStateImplCopyWithImpl(_$LivenessIdleStateImpl _value,
      $Res Function(_$LivenessIdleStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LivenessIdleStateImpl implements LivenessIdleState {
  const _$LivenessIdleStateImpl();

  @override
  String toString() {
    return 'LivenessState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LivenessIdleStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            LivenessChallenge challenge, String instruction, double progress)
        challenging,
    required TResult Function() passed,
    required TResult Function(String reason) failed,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
            LivenessChallenge challenge, String instruction, double progress)?
        challenging,
    TResult? Function()? passed,
    TResult? Function(String reason)? failed,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            LivenessChallenge challenge, String instruction, double progress)?
        challenging,
    TResult Function()? passed,
    TResult Function(String reason)? failed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LivenessIdleState value) idle,
    required TResult Function(LivenessChallengingState value) challenging,
    required TResult Function(LivenessPassedState value) passed,
    required TResult Function(LivenessFailedState value) failed,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LivenessIdleState value)? idle,
    TResult? Function(LivenessChallengingState value)? challenging,
    TResult? Function(LivenessPassedState value)? passed,
    TResult? Function(LivenessFailedState value)? failed,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LivenessIdleState value)? idle,
    TResult Function(LivenessChallengingState value)? challenging,
    TResult Function(LivenessPassedState value)? passed,
    TResult Function(LivenessFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class LivenessIdleState implements LivenessState {
  const factory LivenessIdleState() = _$LivenessIdleStateImpl;
}

/// @nodoc
abstract class _$$LivenessChallengingStateImplCopyWith<$Res> {
  factory _$$LivenessChallengingStateImplCopyWith(
          _$LivenessChallengingStateImpl value,
          $Res Function(_$LivenessChallengingStateImpl) then) =
      __$$LivenessChallengingStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LivenessChallenge challenge, String instruction, double progress});
}

/// @nodoc
class __$$LivenessChallengingStateImplCopyWithImpl<$Res>
    extends _$LivenessStateCopyWithImpl<$Res, _$LivenessChallengingStateImpl>
    implements _$$LivenessChallengingStateImplCopyWith<$Res> {
  __$$LivenessChallengingStateImplCopyWithImpl(
      _$LivenessChallengingStateImpl _value,
      $Res Function(_$LivenessChallengingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challenge = null,
    Object? instruction = null,
    Object? progress = null,
  }) {
    return _then(_$LivenessChallengingStateImpl(
      challenge: null == challenge
          ? _value.challenge
          : challenge // ignore: cast_nullable_to_non_nullable
              as LivenessChallenge,
      instruction: null == instruction
          ? _value.instruction
          : instruction // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$LivenessChallengingStateImpl implements LivenessChallengingState {
  const _$LivenessChallengingStateImpl(
      {required this.challenge,
      required this.instruction,
      this.progress = 0.0});

  @override
  final LivenessChallenge challenge;
  @override
  final String instruction;
  @override
  @JsonKey()
  final double progress;

  @override
  String toString() {
    return 'LivenessState.challenging(challenge: $challenge, instruction: $instruction, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LivenessChallengingStateImpl &&
            (identical(other.challenge, challenge) ||
                other.challenge == challenge) &&
            (identical(other.instruction, instruction) ||
                other.instruction == instruction) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, challenge, instruction, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LivenessChallengingStateImplCopyWith<_$LivenessChallengingStateImpl>
      get copyWith => __$$LivenessChallengingStateImplCopyWithImpl<
          _$LivenessChallengingStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            LivenessChallenge challenge, String instruction, double progress)
        challenging,
    required TResult Function() passed,
    required TResult Function(String reason) failed,
  }) {
    return challenging(challenge, instruction, progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
            LivenessChallenge challenge, String instruction, double progress)?
        challenging,
    TResult? Function()? passed,
    TResult? Function(String reason)? failed,
  }) {
    return challenging?.call(challenge, instruction, progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            LivenessChallenge challenge, String instruction, double progress)?
        challenging,
    TResult Function()? passed,
    TResult Function(String reason)? failed,
    required TResult orElse(),
  }) {
    if (challenging != null) {
      return challenging(challenge, instruction, progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LivenessIdleState value) idle,
    required TResult Function(LivenessChallengingState value) challenging,
    required TResult Function(LivenessPassedState value) passed,
    required TResult Function(LivenessFailedState value) failed,
  }) {
    return challenging(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LivenessIdleState value)? idle,
    TResult? Function(LivenessChallengingState value)? challenging,
    TResult? Function(LivenessPassedState value)? passed,
    TResult? Function(LivenessFailedState value)? failed,
  }) {
    return challenging?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LivenessIdleState value)? idle,
    TResult Function(LivenessChallengingState value)? challenging,
    TResult Function(LivenessPassedState value)? passed,
    TResult Function(LivenessFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (challenging != null) {
      return challenging(this);
    }
    return orElse();
  }
}

abstract class LivenessChallengingState implements LivenessState {
  const factory LivenessChallengingState(
      {required final LivenessChallenge challenge,
      required final String instruction,
      final double progress}) = _$LivenessChallengingStateImpl;

  LivenessChallenge get challenge;
  String get instruction;
  double get progress;
  @JsonKey(ignore: true)
  _$$LivenessChallengingStateImplCopyWith<_$LivenessChallengingStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LivenessPassedStateImplCopyWith<$Res> {
  factory _$$LivenessPassedStateImplCopyWith(_$LivenessPassedStateImpl value,
          $Res Function(_$LivenessPassedStateImpl) then) =
      __$$LivenessPassedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LivenessPassedStateImplCopyWithImpl<$Res>
    extends _$LivenessStateCopyWithImpl<$Res, _$LivenessPassedStateImpl>
    implements _$$LivenessPassedStateImplCopyWith<$Res> {
  __$$LivenessPassedStateImplCopyWithImpl(_$LivenessPassedStateImpl _value,
      $Res Function(_$LivenessPassedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LivenessPassedStateImpl implements LivenessPassedState {
  const _$LivenessPassedStateImpl();

  @override
  String toString() {
    return 'LivenessState.passed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LivenessPassedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            LivenessChallenge challenge, String instruction, double progress)
        challenging,
    required TResult Function() passed,
    required TResult Function(String reason) failed,
  }) {
    return passed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
            LivenessChallenge challenge, String instruction, double progress)?
        challenging,
    TResult? Function()? passed,
    TResult? Function(String reason)? failed,
  }) {
    return passed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            LivenessChallenge challenge, String instruction, double progress)?
        challenging,
    TResult Function()? passed,
    TResult Function(String reason)? failed,
    required TResult orElse(),
  }) {
    if (passed != null) {
      return passed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LivenessIdleState value) idle,
    required TResult Function(LivenessChallengingState value) challenging,
    required TResult Function(LivenessPassedState value) passed,
    required TResult Function(LivenessFailedState value) failed,
  }) {
    return passed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LivenessIdleState value)? idle,
    TResult? Function(LivenessChallengingState value)? challenging,
    TResult? Function(LivenessPassedState value)? passed,
    TResult? Function(LivenessFailedState value)? failed,
  }) {
    return passed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LivenessIdleState value)? idle,
    TResult Function(LivenessChallengingState value)? challenging,
    TResult Function(LivenessPassedState value)? passed,
    TResult Function(LivenessFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (passed != null) {
      return passed(this);
    }
    return orElse();
  }
}

abstract class LivenessPassedState implements LivenessState {
  const factory LivenessPassedState() = _$LivenessPassedStateImpl;
}

/// @nodoc
abstract class _$$LivenessFailedStateImplCopyWith<$Res> {
  factory _$$LivenessFailedStateImplCopyWith(_$LivenessFailedStateImpl value,
          $Res Function(_$LivenessFailedStateImpl) then) =
      __$$LivenessFailedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String reason});
}

/// @nodoc
class __$$LivenessFailedStateImplCopyWithImpl<$Res>
    extends _$LivenessStateCopyWithImpl<$Res, _$LivenessFailedStateImpl>
    implements _$$LivenessFailedStateImplCopyWith<$Res> {
  __$$LivenessFailedStateImplCopyWithImpl(_$LivenessFailedStateImpl _value,
      $Res Function(_$LivenessFailedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
  }) {
    return _then(_$LivenessFailedStateImpl(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LivenessFailedStateImpl implements LivenessFailedState {
  const _$LivenessFailedStateImpl({required this.reason});

  @override
  final String reason;

  @override
  String toString() {
    return 'LivenessState.failed(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LivenessFailedStateImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LivenessFailedStateImplCopyWith<_$LivenessFailedStateImpl> get copyWith =>
      __$$LivenessFailedStateImplCopyWithImpl<_$LivenessFailedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            LivenessChallenge challenge, String instruction, double progress)
        challenging,
    required TResult Function() passed,
    required TResult Function(String reason) failed,
  }) {
    return failed(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
            LivenessChallenge challenge, String instruction, double progress)?
        challenging,
    TResult? Function()? passed,
    TResult? Function(String reason)? failed,
  }) {
    return failed?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            LivenessChallenge challenge, String instruction, double progress)?
        challenging,
    TResult Function()? passed,
    TResult Function(String reason)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LivenessIdleState value) idle,
    required TResult Function(LivenessChallengingState value) challenging,
    required TResult Function(LivenessPassedState value) passed,
    required TResult Function(LivenessFailedState value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LivenessIdleState value)? idle,
    TResult? Function(LivenessChallengingState value)? challenging,
    TResult? Function(LivenessPassedState value)? passed,
    TResult? Function(LivenessFailedState value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LivenessIdleState value)? idle,
    TResult Function(LivenessChallengingState value)? challenging,
    TResult Function(LivenessPassedState value)? passed,
    TResult Function(LivenessFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class LivenessFailedState implements LivenessState {
  const factory LivenessFailedState({required final String reason}) =
      _$LivenessFailedStateImpl;

  String get reason;
  @JsonKey(ignore: true)
  _$$LivenessFailedStateImplCopyWith<_$LivenessFailedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
