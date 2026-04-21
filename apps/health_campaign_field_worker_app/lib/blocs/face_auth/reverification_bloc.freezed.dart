// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reverification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReVerificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReVerificationTrigger trigger) triggered,
    required TResult Function() tick,
    required TResult Function(List<double> embedding) faceScanned,
    required TResult Function(String pin, String individualId) pinUsed,
    required TResult Function() dismissed,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function() externalVerified,
    required TResult Function() timeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationTrigger trigger)? triggered,
    TResult? Function()? tick,
    TResult? Function(List<double> embedding)? faceScanned,
    TResult? Function(String pin, String individualId)? pinUsed,
    TResult? Function()? dismissed,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function()? externalVerified,
    TResult? Function()? timeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReVerificationTrigger trigger)? triggered,
    TResult Function()? tick,
    TResult Function(List<double> embedding)? faceScanned,
    TResult Function(String pin, String individualId)? pinUsed,
    TResult Function()? dismissed,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function()? externalVerified,
    TResult Function()? timeout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReVerificationTriggeredEvent value) triggered,
    required TResult Function(ReVerificationTickEvent value) tick,
    required TResult Function(ReVerificationFaceScannedEvent value) faceScanned,
    required TResult Function(ReVerificationPinUsedEvent value) pinUsed,
    required TResult Function(ReVerificationDismissedEvent value) dismissed,
    required TResult Function(ReVerificationPausedEvent value) paused,
    required TResult Function(ReVerificationResumedEvent value) resumed,
    required TResult Function(ReVerificationExternalVerifiedEvent value)
        externalVerified,
    required TResult Function(ReVerificationTimeoutEvent value) timeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationTriggeredEvent value)? triggered,
    TResult? Function(ReVerificationTickEvent value)? tick,
    TResult? Function(ReVerificationFaceScannedEvent value)? faceScanned,
    TResult? Function(ReVerificationPinUsedEvent value)? pinUsed,
    TResult? Function(ReVerificationDismissedEvent value)? dismissed,
    TResult? Function(ReVerificationPausedEvent value)? paused,
    TResult? Function(ReVerificationResumedEvent value)? resumed,
    TResult? Function(ReVerificationExternalVerifiedEvent value)?
        externalVerified,
    TResult? Function(ReVerificationTimeoutEvent value)? timeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReVerificationTriggeredEvent value)? triggered,
    TResult Function(ReVerificationTickEvent value)? tick,
    TResult Function(ReVerificationFaceScannedEvent value)? faceScanned,
    TResult Function(ReVerificationPinUsedEvent value)? pinUsed,
    TResult Function(ReVerificationDismissedEvent value)? dismissed,
    TResult Function(ReVerificationPausedEvent value)? paused,
    TResult Function(ReVerificationResumedEvent value)? resumed,
    TResult Function(ReVerificationExternalVerifiedEvent value)?
        externalVerified,
    TResult Function(ReVerificationTimeoutEvent value)? timeout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReVerificationEventCopyWith<$Res> {
  factory $ReVerificationEventCopyWith(
          ReVerificationEvent value, $Res Function(ReVerificationEvent) then) =
      _$ReVerificationEventCopyWithImpl<$Res, ReVerificationEvent>;
}

/// @nodoc
class _$ReVerificationEventCopyWithImpl<$Res, $Val extends ReVerificationEvent>
    implements $ReVerificationEventCopyWith<$Res> {
  _$ReVerificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ReVerificationTriggeredEventImplCopyWith<$Res> {
  factory _$$ReVerificationTriggeredEventImplCopyWith(
          _$ReVerificationTriggeredEventImpl value,
          $Res Function(_$ReVerificationTriggeredEventImpl) then) =
      __$$ReVerificationTriggeredEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReVerificationTrigger trigger});
}

/// @nodoc
class __$$ReVerificationTriggeredEventImplCopyWithImpl<$Res>
    extends _$ReVerificationEventCopyWithImpl<$Res,
        _$ReVerificationTriggeredEventImpl>
    implements _$$ReVerificationTriggeredEventImplCopyWith<$Res> {
  __$$ReVerificationTriggeredEventImplCopyWithImpl(
      _$ReVerificationTriggeredEventImpl _value,
      $Res Function(_$ReVerificationTriggeredEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trigger = null,
  }) {
    return _then(_$ReVerificationTriggeredEventImpl(
      trigger: null == trigger
          ? _value.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as ReVerificationTrigger,
    ));
  }
}

/// @nodoc

class _$ReVerificationTriggeredEventImpl
    implements ReVerificationTriggeredEvent {
  const _$ReVerificationTriggeredEventImpl({required this.trigger});

  @override
  final ReVerificationTrigger trigger;

  @override
  String toString() {
    return 'ReVerificationEvent.triggered(trigger: $trigger)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReVerificationTriggeredEventImpl &&
            (identical(other.trigger, trigger) || other.trigger == trigger));
  }

  @override
  int get hashCode => Object.hash(runtimeType, trigger);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReVerificationTriggeredEventImplCopyWith<
          _$ReVerificationTriggeredEventImpl>
      get copyWith => __$$ReVerificationTriggeredEventImplCopyWithImpl<
          _$ReVerificationTriggeredEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReVerificationTrigger trigger) triggered,
    required TResult Function() tick,
    required TResult Function(List<double> embedding) faceScanned,
    required TResult Function(String pin, String individualId) pinUsed,
    required TResult Function() dismissed,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function() externalVerified,
    required TResult Function() timeout,
  }) {
    return triggered(trigger);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationTrigger trigger)? triggered,
    TResult? Function()? tick,
    TResult? Function(List<double> embedding)? faceScanned,
    TResult? Function(String pin, String individualId)? pinUsed,
    TResult? Function()? dismissed,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function()? externalVerified,
    TResult? Function()? timeout,
  }) {
    return triggered?.call(trigger);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReVerificationTrigger trigger)? triggered,
    TResult Function()? tick,
    TResult Function(List<double> embedding)? faceScanned,
    TResult Function(String pin, String individualId)? pinUsed,
    TResult Function()? dismissed,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function()? externalVerified,
    TResult Function()? timeout,
    required TResult orElse(),
  }) {
    if (triggered != null) {
      return triggered(trigger);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReVerificationTriggeredEvent value) triggered,
    required TResult Function(ReVerificationTickEvent value) tick,
    required TResult Function(ReVerificationFaceScannedEvent value) faceScanned,
    required TResult Function(ReVerificationPinUsedEvent value) pinUsed,
    required TResult Function(ReVerificationDismissedEvent value) dismissed,
    required TResult Function(ReVerificationPausedEvent value) paused,
    required TResult Function(ReVerificationResumedEvent value) resumed,
    required TResult Function(ReVerificationExternalVerifiedEvent value)
        externalVerified,
    required TResult Function(ReVerificationTimeoutEvent value) timeout,
  }) {
    return triggered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationTriggeredEvent value)? triggered,
    TResult? Function(ReVerificationTickEvent value)? tick,
    TResult? Function(ReVerificationFaceScannedEvent value)? faceScanned,
    TResult? Function(ReVerificationPinUsedEvent value)? pinUsed,
    TResult? Function(ReVerificationDismissedEvent value)? dismissed,
    TResult? Function(ReVerificationPausedEvent value)? paused,
    TResult? Function(ReVerificationResumedEvent value)? resumed,
    TResult? Function(ReVerificationExternalVerifiedEvent value)?
        externalVerified,
    TResult? Function(ReVerificationTimeoutEvent value)? timeout,
  }) {
    return triggered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReVerificationTriggeredEvent value)? triggered,
    TResult Function(ReVerificationTickEvent value)? tick,
    TResult Function(ReVerificationFaceScannedEvent value)? faceScanned,
    TResult Function(ReVerificationPinUsedEvent value)? pinUsed,
    TResult Function(ReVerificationDismissedEvent value)? dismissed,
    TResult Function(ReVerificationPausedEvent value)? paused,
    TResult Function(ReVerificationResumedEvent value)? resumed,
    TResult Function(ReVerificationExternalVerifiedEvent value)?
        externalVerified,
    TResult Function(ReVerificationTimeoutEvent value)? timeout,
    required TResult orElse(),
  }) {
    if (triggered != null) {
      return triggered(this);
    }
    return orElse();
  }
}

abstract class ReVerificationTriggeredEvent implements ReVerificationEvent {
  const factory ReVerificationTriggeredEvent(
          {required final ReVerificationTrigger trigger}) =
      _$ReVerificationTriggeredEventImpl;

  ReVerificationTrigger get trigger;
  @JsonKey(ignore: true)
  _$$ReVerificationTriggeredEventImplCopyWith<
          _$ReVerificationTriggeredEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReVerificationTickEventImplCopyWith<$Res> {
  factory _$$ReVerificationTickEventImplCopyWith(
          _$ReVerificationTickEventImpl value,
          $Res Function(_$ReVerificationTickEventImpl) then) =
      __$$ReVerificationTickEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReVerificationTickEventImplCopyWithImpl<$Res>
    extends _$ReVerificationEventCopyWithImpl<$Res,
        _$ReVerificationTickEventImpl>
    implements _$$ReVerificationTickEventImplCopyWith<$Res> {
  __$$ReVerificationTickEventImplCopyWithImpl(
      _$ReVerificationTickEventImpl _value,
      $Res Function(_$ReVerificationTickEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReVerificationTickEventImpl implements ReVerificationTickEvent {
  const _$ReVerificationTickEventImpl();

  @override
  String toString() {
    return 'ReVerificationEvent.tick()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReVerificationTickEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReVerificationTrigger trigger) triggered,
    required TResult Function() tick,
    required TResult Function(List<double> embedding) faceScanned,
    required TResult Function(String pin, String individualId) pinUsed,
    required TResult Function() dismissed,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function() externalVerified,
    required TResult Function() timeout,
  }) {
    return tick();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationTrigger trigger)? triggered,
    TResult? Function()? tick,
    TResult? Function(List<double> embedding)? faceScanned,
    TResult? Function(String pin, String individualId)? pinUsed,
    TResult? Function()? dismissed,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function()? externalVerified,
    TResult? Function()? timeout,
  }) {
    return tick?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReVerificationTrigger trigger)? triggered,
    TResult Function()? tick,
    TResult Function(List<double> embedding)? faceScanned,
    TResult Function(String pin, String individualId)? pinUsed,
    TResult Function()? dismissed,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function()? externalVerified,
    TResult Function()? timeout,
    required TResult orElse(),
  }) {
    if (tick != null) {
      return tick();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReVerificationTriggeredEvent value) triggered,
    required TResult Function(ReVerificationTickEvent value) tick,
    required TResult Function(ReVerificationFaceScannedEvent value) faceScanned,
    required TResult Function(ReVerificationPinUsedEvent value) pinUsed,
    required TResult Function(ReVerificationDismissedEvent value) dismissed,
    required TResult Function(ReVerificationPausedEvent value) paused,
    required TResult Function(ReVerificationResumedEvent value) resumed,
    required TResult Function(ReVerificationExternalVerifiedEvent value)
        externalVerified,
    required TResult Function(ReVerificationTimeoutEvent value) timeout,
  }) {
    return tick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationTriggeredEvent value)? triggered,
    TResult? Function(ReVerificationTickEvent value)? tick,
    TResult? Function(ReVerificationFaceScannedEvent value)? faceScanned,
    TResult? Function(ReVerificationPinUsedEvent value)? pinUsed,
    TResult? Function(ReVerificationDismissedEvent value)? dismissed,
    TResult? Function(ReVerificationPausedEvent value)? paused,
    TResult? Function(ReVerificationResumedEvent value)? resumed,
    TResult? Function(ReVerificationExternalVerifiedEvent value)?
        externalVerified,
    TResult? Function(ReVerificationTimeoutEvent value)? timeout,
  }) {
    return tick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReVerificationTriggeredEvent value)? triggered,
    TResult Function(ReVerificationTickEvent value)? tick,
    TResult Function(ReVerificationFaceScannedEvent value)? faceScanned,
    TResult Function(ReVerificationPinUsedEvent value)? pinUsed,
    TResult Function(ReVerificationDismissedEvent value)? dismissed,
    TResult Function(ReVerificationPausedEvent value)? paused,
    TResult Function(ReVerificationResumedEvent value)? resumed,
    TResult Function(ReVerificationExternalVerifiedEvent value)?
        externalVerified,
    TResult Function(ReVerificationTimeoutEvent value)? timeout,
    required TResult orElse(),
  }) {
    if (tick != null) {
      return tick(this);
    }
    return orElse();
  }
}

abstract class ReVerificationTickEvent implements ReVerificationEvent {
  const factory ReVerificationTickEvent() = _$ReVerificationTickEventImpl;
}

/// @nodoc
abstract class _$$ReVerificationFaceScannedEventImplCopyWith<$Res> {
  factory _$$ReVerificationFaceScannedEventImplCopyWith(
          _$ReVerificationFaceScannedEventImpl value,
          $Res Function(_$ReVerificationFaceScannedEventImpl) then) =
      __$$ReVerificationFaceScannedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<double> embedding});
}

/// @nodoc
class __$$ReVerificationFaceScannedEventImplCopyWithImpl<$Res>
    extends _$ReVerificationEventCopyWithImpl<$Res,
        _$ReVerificationFaceScannedEventImpl>
    implements _$$ReVerificationFaceScannedEventImplCopyWith<$Res> {
  __$$ReVerificationFaceScannedEventImplCopyWithImpl(
      _$ReVerificationFaceScannedEventImpl _value,
      $Res Function(_$ReVerificationFaceScannedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? embedding = null,
  }) {
    return _then(_$ReVerificationFaceScannedEventImpl(
      embedding: null == embedding
          ? _value._embedding
          : embedding // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc

class _$ReVerificationFaceScannedEventImpl
    implements ReVerificationFaceScannedEvent {
  const _$ReVerificationFaceScannedEventImpl(
      {required final List<double> embedding})
      : _embedding = embedding;

  final List<double> _embedding;
  @override
  List<double> get embedding {
    if (_embedding is EqualUnmodifiableListView) return _embedding;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_embedding);
  }

  @override
  String toString() {
    return 'ReVerificationEvent.faceScanned(embedding: $embedding)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReVerificationFaceScannedEventImpl &&
            const DeepCollectionEquality()
                .equals(other._embedding, _embedding));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_embedding));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReVerificationFaceScannedEventImplCopyWith<
          _$ReVerificationFaceScannedEventImpl>
      get copyWith => __$$ReVerificationFaceScannedEventImplCopyWithImpl<
          _$ReVerificationFaceScannedEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReVerificationTrigger trigger) triggered,
    required TResult Function() tick,
    required TResult Function(List<double> embedding) faceScanned,
    required TResult Function(String pin, String individualId) pinUsed,
    required TResult Function() dismissed,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function() externalVerified,
    required TResult Function() timeout,
  }) {
    return faceScanned(embedding);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationTrigger trigger)? triggered,
    TResult? Function()? tick,
    TResult? Function(List<double> embedding)? faceScanned,
    TResult? Function(String pin, String individualId)? pinUsed,
    TResult? Function()? dismissed,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function()? externalVerified,
    TResult? Function()? timeout,
  }) {
    return faceScanned?.call(embedding);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReVerificationTrigger trigger)? triggered,
    TResult Function()? tick,
    TResult Function(List<double> embedding)? faceScanned,
    TResult Function(String pin, String individualId)? pinUsed,
    TResult Function()? dismissed,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function()? externalVerified,
    TResult Function()? timeout,
    required TResult orElse(),
  }) {
    if (faceScanned != null) {
      return faceScanned(embedding);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReVerificationTriggeredEvent value) triggered,
    required TResult Function(ReVerificationTickEvent value) tick,
    required TResult Function(ReVerificationFaceScannedEvent value) faceScanned,
    required TResult Function(ReVerificationPinUsedEvent value) pinUsed,
    required TResult Function(ReVerificationDismissedEvent value) dismissed,
    required TResult Function(ReVerificationPausedEvent value) paused,
    required TResult Function(ReVerificationResumedEvent value) resumed,
    required TResult Function(ReVerificationExternalVerifiedEvent value)
        externalVerified,
    required TResult Function(ReVerificationTimeoutEvent value) timeout,
  }) {
    return faceScanned(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationTriggeredEvent value)? triggered,
    TResult? Function(ReVerificationTickEvent value)? tick,
    TResult? Function(ReVerificationFaceScannedEvent value)? faceScanned,
    TResult? Function(ReVerificationPinUsedEvent value)? pinUsed,
    TResult? Function(ReVerificationDismissedEvent value)? dismissed,
    TResult? Function(ReVerificationPausedEvent value)? paused,
    TResult? Function(ReVerificationResumedEvent value)? resumed,
    TResult? Function(ReVerificationExternalVerifiedEvent value)?
        externalVerified,
    TResult? Function(ReVerificationTimeoutEvent value)? timeout,
  }) {
    return faceScanned?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReVerificationTriggeredEvent value)? triggered,
    TResult Function(ReVerificationTickEvent value)? tick,
    TResult Function(ReVerificationFaceScannedEvent value)? faceScanned,
    TResult Function(ReVerificationPinUsedEvent value)? pinUsed,
    TResult Function(ReVerificationDismissedEvent value)? dismissed,
    TResult Function(ReVerificationPausedEvent value)? paused,
    TResult Function(ReVerificationResumedEvent value)? resumed,
    TResult Function(ReVerificationExternalVerifiedEvent value)?
        externalVerified,
    TResult Function(ReVerificationTimeoutEvent value)? timeout,
    required TResult orElse(),
  }) {
    if (faceScanned != null) {
      return faceScanned(this);
    }
    return orElse();
  }
}

abstract class ReVerificationFaceScannedEvent implements ReVerificationEvent {
  const factory ReVerificationFaceScannedEvent(
          {required final List<double> embedding}) =
      _$ReVerificationFaceScannedEventImpl;

  List<double> get embedding;
  @JsonKey(ignore: true)
  _$$ReVerificationFaceScannedEventImplCopyWith<
          _$ReVerificationFaceScannedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReVerificationPinUsedEventImplCopyWith<$Res> {
  factory _$$ReVerificationPinUsedEventImplCopyWith(
          _$ReVerificationPinUsedEventImpl value,
          $Res Function(_$ReVerificationPinUsedEventImpl) then) =
      __$$ReVerificationPinUsedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String pin, String individualId});
}

/// @nodoc
class __$$ReVerificationPinUsedEventImplCopyWithImpl<$Res>
    extends _$ReVerificationEventCopyWithImpl<$Res,
        _$ReVerificationPinUsedEventImpl>
    implements _$$ReVerificationPinUsedEventImplCopyWith<$Res> {
  __$$ReVerificationPinUsedEventImplCopyWithImpl(
      _$ReVerificationPinUsedEventImpl _value,
      $Res Function(_$ReVerificationPinUsedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pin = null,
    Object? individualId = null,
  }) {
    return _then(_$ReVerificationPinUsedEventImpl(
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
      individualId: null == individualId
          ? _value.individualId
          : individualId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReVerificationPinUsedEventImpl implements ReVerificationPinUsedEvent {
  const _$ReVerificationPinUsedEventImpl(
      {required this.pin, required this.individualId});

  @override
  final String pin;
  @override
  final String individualId;

  @override
  String toString() {
    return 'ReVerificationEvent.pinUsed(pin: $pin, individualId: $individualId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReVerificationPinUsedEventImpl &&
            (identical(other.pin, pin) || other.pin == pin) &&
            (identical(other.individualId, individualId) ||
                other.individualId == individualId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pin, individualId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReVerificationPinUsedEventImplCopyWith<_$ReVerificationPinUsedEventImpl>
      get copyWith => __$$ReVerificationPinUsedEventImplCopyWithImpl<
          _$ReVerificationPinUsedEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReVerificationTrigger trigger) triggered,
    required TResult Function() tick,
    required TResult Function(List<double> embedding) faceScanned,
    required TResult Function(String pin, String individualId) pinUsed,
    required TResult Function() dismissed,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function() externalVerified,
    required TResult Function() timeout,
  }) {
    return pinUsed(pin, individualId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationTrigger trigger)? triggered,
    TResult? Function()? tick,
    TResult? Function(List<double> embedding)? faceScanned,
    TResult? Function(String pin, String individualId)? pinUsed,
    TResult? Function()? dismissed,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function()? externalVerified,
    TResult? Function()? timeout,
  }) {
    return pinUsed?.call(pin, individualId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReVerificationTrigger trigger)? triggered,
    TResult Function()? tick,
    TResult Function(List<double> embedding)? faceScanned,
    TResult Function(String pin, String individualId)? pinUsed,
    TResult Function()? dismissed,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function()? externalVerified,
    TResult Function()? timeout,
    required TResult orElse(),
  }) {
    if (pinUsed != null) {
      return pinUsed(pin, individualId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReVerificationTriggeredEvent value) triggered,
    required TResult Function(ReVerificationTickEvent value) tick,
    required TResult Function(ReVerificationFaceScannedEvent value) faceScanned,
    required TResult Function(ReVerificationPinUsedEvent value) pinUsed,
    required TResult Function(ReVerificationDismissedEvent value) dismissed,
    required TResult Function(ReVerificationPausedEvent value) paused,
    required TResult Function(ReVerificationResumedEvent value) resumed,
    required TResult Function(ReVerificationExternalVerifiedEvent value)
        externalVerified,
    required TResult Function(ReVerificationTimeoutEvent value) timeout,
  }) {
    return pinUsed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationTriggeredEvent value)? triggered,
    TResult? Function(ReVerificationTickEvent value)? tick,
    TResult? Function(ReVerificationFaceScannedEvent value)? faceScanned,
    TResult? Function(ReVerificationPinUsedEvent value)? pinUsed,
    TResult? Function(ReVerificationDismissedEvent value)? dismissed,
    TResult? Function(ReVerificationPausedEvent value)? paused,
    TResult? Function(ReVerificationResumedEvent value)? resumed,
    TResult? Function(ReVerificationExternalVerifiedEvent value)?
        externalVerified,
    TResult? Function(ReVerificationTimeoutEvent value)? timeout,
  }) {
    return pinUsed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReVerificationTriggeredEvent value)? triggered,
    TResult Function(ReVerificationTickEvent value)? tick,
    TResult Function(ReVerificationFaceScannedEvent value)? faceScanned,
    TResult Function(ReVerificationPinUsedEvent value)? pinUsed,
    TResult Function(ReVerificationDismissedEvent value)? dismissed,
    TResult Function(ReVerificationPausedEvent value)? paused,
    TResult Function(ReVerificationResumedEvent value)? resumed,
    TResult Function(ReVerificationExternalVerifiedEvent value)?
        externalVerified,
    TResult Function(ReVerificationTimeoutEvent value)? timeout,
    required TResult orElse(),
  }) {
    if (pinUsed != null) {
      return pinUsed(this);
    }
    return orElse();
  }
}

abstract class ReVerificationPinUsedEvent implements ReVerificationEvent {
  const factory ReVerificationPinUsedEvent(
      {required final String pin,
      required final String individualId}) = _$ReVerificationPinUsedEventImpl;

  String get pin;
  String get individualId;
  @JsonKey(ignore: true)
  _$$ReVerificationPinUsedEventImplCopyWith<_$ReVerificationPinUsedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReVerificationDismissedEventImplCopyWith<$Res> {
  factory _$$ReVerificationDismissedEventImplCopyWith(
          _$ReVerificationDismissedEventImpl value,
          $Res Function(_$ReVerificationDismissedEventImpl) then) =
      __$$ReVerificationDismissedEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReVerificationDismissedEventImplCopyWithImpl<$Res>
    extends _$ReVerificationEventCopyWithImpl<$Res,
        _$ReVerificationDismissedEventImpl>
    implements _$$ReVerificationDismissedEventImplCopyWith<$Res> {
  __$$ReVerificationDismissedEventImplCopyWithImpl(
      _$ReVerificationDismissedEventImpl _value,
      $Res Function(_$ReVerificationDismissedEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReVerificationDismissedEventImpl
    implements ReVerificationDismissedEvent {
  const _$ReVerificationDismissedEventImpl();

  @override
  String toString() {
    return 'ReVerificationEvent.dismissed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReVerificationDismissedEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReVerificationTrigger trigger) triggered,
    required TResult Function() tick,
    required TResult Function(List<double> embedding) faceScanned,
    required TResult Function(String pin, String individualId) pinUsed,
    required TResult Function() dismissed,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function() externalVerified,
    required TResult Function() timeout,
  }) {
    return dismissed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationTrigger trigger)? triggered,
    TResult? Function()? tick,
    TResult? Function(List<double> embedding)? faceScanned,
    TResult? Function(String pin, String individualId)? pinUsed,
    TResult? Function()? dismissed,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function()? externalVerified,
    TResult? Function()? timeout,
  }) {
    return dismissed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReVerificationTrigger trigger)? triggered,
    TResult Function()? tick,
    TResult Function(List<double> embedding)? faceScanned,
    TResult Function(String pin, String individualId)? pinUsed,
    TResult Function()? dismissed,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function()? externalVerified,
    TResult Function()? timeout,
    required TResult orElse(),
  }) {
    if (dismissed != null) {
      return dismissed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReVerificationTriggeredEvent value) triggered,
    required TResult Function(ReVerificationTickEvent value) tick,
    required TResult Function(ReVerificationFaceScannedEvent value) faceScanned,
    required TResult Function(ReVerificationPinUsedEvent value) pinUsed,
    required TResult Function(ReVerificationDismissedEvent value) dismissed,
    required TResult Function(ReVerificationPausedEvent value) paused,
    required TResult Function(ReVerificationResumedEvent value) resumed,
    required TResult Function(ReVerificationExternalVerifiedEvent value)
        externalVerified,
    required TResult Function(ReVerificationTimeoutEvent value) timeout,
  }) {
    return dismissed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationTriggeredEvent value)? triggered,
    TResult? Function(ReVerificationTickEvent value)? tick,
    TResult? Function(ReVerificationFaceScannedEvent value)? faceScanned,
    TResult? Function(ReVerificationPinUsedEvent value)? pinUsed,
    TResult? Function(ReVerificationDismissedEvent value)? dismissed,
    TResult? Function(ReVerificationPausedEvent value)? paused,
    TResult? Function(ReVerificationResumedEvent value)? resumed,
    TResult? Function(ReVerificationExternalVerifiedEvent value)?
        externalVerified,
    TResult? Function(ReVerificationTimeoutEvent value)? timeout,
  }) {
    return dismissed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReVerificationTriggeredEvent value)? triggered,
    TResult Function(ReVerificationTickEvent value)? tick,
    TResult Function(ReVerificationFaceScannedEvent value)? faceScanned,
    TResult Function(ReVerificationPinUsedEvent value)? pinUsed,
    TResult Function(ReVerificationDismissedEvent value)? dismissed,
    TResult Function(ReVerificationPausedEvent value)? paused,
    TResult Function(ReVerificationResumedEvent value)? resumed,
    TResult Function(ReVerificationExternalVerifiedEvent value)?
        externalVerified,
    TResult Function(ReVerificationTimeoutEvent value)? timeout,
    required TResult orElse(),
  }) {
    if (dismissed != null) {
      return dismissed(this);
    }
    return orElse();
  }
}

abstract class ReVerificationDismissedEvent implements ReVerificationEvent {
  const factory ReVerificationDismissedEvent() =
      _$ReVerificationDismissedEventImpl;
}

/// @nodoc
abstract class _$$ReVerificationPausedEventImplCopyWith<$Res> {
  factory _$$ReVerificationPausedEventImplCopyWith(
          _$ReVerificationPausedEventImpl value,
          $Res Function(_$ReVerificationPausedEventImpl) then) =
      __$$ReVerificationPausedEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReVerificationPausedEventImplCopyWithImpl<$Res>
    extends _$ReVerificationEventCopyWithImpl<$Res,
        _$ReVerificationPausedEventImpl>
    implements _$$ReVerificationPausedEventImplCopyWith<$Res> {
  __$$ReVerificationPausedEventImplCopyWithImpl(
      _$ReVerificationPausedEventImpl _value,
      $Res Function(_$ReVerificationPausedEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReVerificationPausedEventImpl implements ReVerificationPausedEvent {
  const _$ReVerificationPausedEventImpl();

  @override
  String toString() {
    return 'ReVerificationEvent.paused()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReVerificationPausedEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReVerificationTrigger trigger) triggered,
    required TResult Function() tick,
    required TResult Function(List<double> embedding) faceScanned,
    required TResult Function(String pin, String individualId) pinUsed,
    required TResult Function() dismissed,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function() externalVerified,
    required TResult Function() timeout,
  }) {
    return paused();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationTrigger trigger)? triggered,
    TResult? Function()? tick,
    TResult? Function(List<double> embedding)? faceScanned,
    TResult? Function(String pin, String individualId)? pinUsed,
    TResult? Function()? dismissed,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function()? externalVerified,
    TResult? Function()? timeout,
  }) {
    return paused?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReVerificationTrigger trigger)? triggered,
    TResult Function()? tick,
    TResult Function(List<double> embedding)? faceScanned,
    TResult Function(String pin, String individualId)? pinUsed,
    TResult Function()? dismissed,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function()? externalVerified,
    TResult Function()? timeout,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReVerificationTriggeredEvent value) triggered,
    required TResult Function(ReVerificationTickEvent value) tick,
    required TResult Function(ReVerificationFaceScannedEvent value) faceScanned,
    required TResult Function(ReVerificationPinUsedEvent value) pinUsed,
    required TResult Function(ReVerificationDismissedEvent value) dismissed,
    required TResult Function(ReVerificationPausedEvent value) paused,
    required TResult Function(ReVerificationResumedEvent value) resumed,
    required TResult Function(ReVerificationExternalVerifiedEvent value)
        externalVerified,
    required TResult Function(ReVerificationTimeoutEvent value) timeout,
  }) {
    return paused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationTriggeredEvent value)? triggered,
    TResult? Function(ReVerificationTickEvent value)? tick,
    TResult? Function(ReVerificationFaceScannedEvent value)? faceScanned,
    TResult? Function(ReVerificationPinUsedEvent value)? pinUsed,
    TResult? Function(ReVerificationDismissedEvent value)? dismissed,
    TResult? Function(ReVerificationPausedEvent value)? paused,
    TResult? Function(ReVerificationResumedEvent value)? resumed,
    TResult? Function(ReVerificationExternalVerifiedEvent value)?
        externalVerified,
    TResult? Function(ReVerificationTimeoutEvent value)? timeout,
  }) {
    return paused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReVerificationTriggeredEvent value)? triggered,
    TResult Function(ReVerificationTickEvent value)? tick,
    TResult Function(ReVerificationFaceScannedEvent value)? faceScanned,
    TResult Function(ReVerificationPinUsedEvent value)? pinUsed,
    TResult Function(ReVerificationDismissedEvent value)? dismissed,
    TResult Function(ReVerificationPausedEvent value)? paused,
    TResult Function(ReVerificationResumedEvent value)? resumed,
    TResult Function(ReVerificationExternalVerifiedEvent value)?
        externalVerified,
    TResult Function(ReVerificationTimeoutEvent value)? timeout,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }
}

abstract class ReVerificationPausedEvent implements ReVerificationEvent {
  const factory ReVerificationPausedEvent() = _$ReVerificationPausedEventImpl;
}

/// @nodoc
abstract class _$$ReVerificationResumedEventImplCopyWith<$Res> {
  factory _$$ReVerificationResumedEventImplCopyWith(
          _$ReVerificationResumedEventImpl value,
          $Res Function(_$ReVerificationResumedEventImpl) then) =
      __$$ReVerificationResumedEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReVerificationResumedEventImplCopyWithImpl<$Res>
    extends _$ReVerificationEventCopyWithImpl<$Res,
        _$ReVerificationResumedEventImpl>
    implements _$$ReVerificationResumedEventImplCopyWith<$Res> {
  __$$ReVerificationResumedEventImplCopyWithImpl(
      _$ReVerificationResumedEventImpl _value,
      $Res Function(_$ReVerificationResumedEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReVerificationResumedEventImpl implements ReVerificationResumedEvent {
  const _$ReVerificationResumedEventImpl();

  @override
  String toString() {
    return 'ReVerificationEvent.resumed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReVerificationResumedEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReVerificationTrigger trigger) triggered,
    required TResult Function() tick,
    required TResult Function(List<double> embedding) faceScanned,
    required TResult Function(String pin, String individualId) pinUsed,
    required TResult Function() dismissed,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function() externalVerified,
    required TResult Function() timeout,
  }) {
    return resumed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationTrigger trigger)? triggered,
    TResult? Function()? tick,
    TResult? Function(List<double> embedding)? faceScanned,
    TResult? Function(String pin, String individualId)? pinUsed,
    TResult? Function()? dismissed,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function()? externalVerified,
    TResult? Function()? timeout,
  }) {
    return resumed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReVerificationTrigger trigger)? triggered,
    TResult Function()? tick,
    TResult Function(List<double> embedding)? faceScanned,
    TResult Function(String pin, String individualId)? pinUsed,
    TResult Function()? dismissed,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function()? externalVerified,
    TResult Function()? timeout,
    required TResult orElse(),
  }) {
    if (resumed != null) {
      return resumed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReVerificationTriggeredEvent value) triggered,
    required TResult Function(ReVerificationTickEvent value) tick,
    required TResult Function(ReVerificationFaceScannedEvent value) faceScanned,
    required TResult Function(ReVerificationPinUsedEvent value) pinUsed,
    required TResult Function(ReVerificationDismissedEvent value) dismissed,
    required TResult Function(ReVerificationPausedEvent value) paused,
    required TResult Function(ReVerificationResumedEvent value) resumed,
    required TResult Function(ReVerificationExternalVerifiedEvent value)
        externalVerified,
    required TResult Function(ReVerificationTimeoutEvent value) timeout,
  }) {
    return resumed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationTriggeredEvent value)? triggered,
    TResult? Function(ReVerificationTickEvent value)? tick,
    TResult? Function(ReVerificationFaceScannedEvent value)? faceScanned,
    TResult? Function(ReVerificationPinUsedEvent value)? pinUsed,
    TResult? Function(ReVerificationDismissedEvent value)? dismissed,
    TResult? Function(ReVerificationPausedEvent value)? paused,
    TResult? Function(ReVerificationResumedEvent value)? resumed,
    TResult? Function(ReVerificationExternalVerifiedEvent value)?
        externalVerified,
    TResult? Function(ReVerificationTimeoutEvent value)? timeout,
  }) {
    return resumed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReVerificationTriggeredEvent value)? triggered,
    TResult Function(ReVerificationTickEvent value)? tick,
    TResult Function(ReVerificationFaceScannedEvent value)? faceScanned,
    TResult Function(ReVerificationPinUsedEvent value)? pinUsed,
    TResult Function(ReVerificationDismissedEvent value)? dismissed,
    TResult Function(ReVerificationPausedEvent value)? paused,
    TResult Function(ReVerificationResumedEvent value)? resumed,
    TResult Function(ReVerificationExternalVerifiedEvent value)?
        externalVerified,
    TResult Function(ReVerificationTimeoutEvent value)? timeout,
    required TResult orElse(),
  }) {
    if (resumed != null) {
      return resumed(this);
    }
    return orElse();
  }
}

abstract class ReVerificationResumedEvent implements ReVerificationEvent {
  const factory ReVerificationResumedEvent() = _$ReVerificationResumedEventImpl;
}

/// @nodoc
abstract class _$$ReVerificationExternalVerifiedEventImplCopyWith<$Res> {
  factory _$$ReVerificationExternalVerifiedEventImplCopyWith(
          _$ReVerificationExternalVerifiedEventImpl value,
          $Res Function(_$ReVerificationExternalVerifiedEventImpl) then) =
      __$$ReVerificationExternalVerifiedEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReVerificationExternalVerifiedEventImplCopyWithImpl<$Res>
    extends _$ReVerificationEventCopyWithImpl<$Res,
        _$ReVerificationExternalVerifiedEventImpl>
    implements _$$ReVerificationExternalVerifiedEventImplCopyWith<$Res> {
  __$$ReVerificationExternalVerifiedEventImplCopyWithImpl(
      _$ReVerificationExternalVerifiedEventImpl _value,
      $Res Function(_$ReVerificationExternalVerifiedEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReVerificationExternalVerifiedEventImpl
    implements ReVerificationExternalVerifiedEvent {
  const _$ReVerificationExternalVerifiedEventImpl();

  @override
  String toString() {
    return 'ReVerificationEvent.externalVerified()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReVerificationExternalVerifiedEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReVerificationTrigger trigger) triggered,
    required TResult Function() tick,
    required TResult Function(List<double> embedding) faceScanned,
    required TResult Function(String pin, String individualId) pinUsed,
    required TResult Function() dismissed,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function() externalVerified,
    required TResult Function() timeout,
  }) {
    return externalVerified();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationTrigger trigger)? triggered,
    TResult? Function()? tick,
    TResult? Function(List<double> embedding)? faceScanned,
    TResult? Function(String pin, String individualId)? pinUsed,
    TResult? Function()? dismissed,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function()? externalVerified,
    TResult? Function()? timeout,
  }) {
    return externalVerified?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReVerificationTrigger trigger)? triggered,
    TResult Function()? tick,
    TResult Function(List<double> embedding)? faceScanned,
    TResult Function(String pin, String individualId)? pinUsed,
    TResult Function()? dismissed,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function()? externalVerified,
    TResult Function()? timeout,
    required TResult orElse(),
  }) {
    if (externalVerified != null) {
      return externalVerified();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReVerificationTriggeredEvent value) triggered,
    required TResult Function(ReVerificationTickEvent value) tick,
    required TResult Function(ReVerificationFaceScannedEvent value) faceScanned,
    required TResult Function(ReVerificationPinUsedEvent value) pinUsed,
    required TResult Function(ReVerificationDismissedEvent value) dismissed,
    required TResult Function(ReVerificationPausedEvent value) paused,
    required TResult Function(ReVerificationResumedEvent value) resumed,
    required TResult Function(ReVerificationExternalVerifiedEvent value)
        externalVerified,
    required TResult Function(ReVerificationTimeoutEvent value) timeout,
  }) {
    return externalVerified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationTriggeredEvent value)? triggered,
    TResult? Function(ReVerificationTickEvent value)? tick,
    TResult? Function(ReVerificationFaceScannedEvent value)? faceScanned,
    TResult? Function(ReVerificationPinUsedEvent value)? pinUsed,
    TResult? Function(ReVerificationDismissedEvent value)? dismissed,
    TResult? Function(ReVerificationPausedEvent value)? paused,
    TResult? Function(ReVerificationResumedEvent value)? resumed,
    TResult? Function(ReVerificationExternalVerifiedEvent value)?
        externalVerified,
    TResult? Function(ReVerificationTimeoutEvent value)? timeout,
  }) {
    return externalVerified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReVerificationTriggeredEvent value)? triggered,
    TResult Function(ReVerificationTickEvent value)? tick,
    TResult Function(ReVerificationFaceScannedEvent value)? faceScanned,
    TResult Function(ReVerificationPinUsedEvent value)? pinUsed,
    TResult Function(ReVerificationDismissedEvent value)? dismissed,
    TResult Function(ReVerificationPausedEvent value)? paused,
    TResult Function(ReVerificationResumedEvent value)? resumed,
    TResult Function(ReVerificationExternalVerifiedEvent value)?
        externalVerified,
    TResult Function(ReVerificationTimeoutEvent value)? timeout,
    required TResult orElse(),
  }) {
    if (externalVerified != null) {
      return externalVerified(this);
    }
    return orElse();
  }
}

abstract class ReVerificationExternalVerifiedEvent
    implements ReVerificationEvent {
  const factory ReVerificationExternalVerifiedEvent() =
      _$ReVerificationExternalVerifiedEventImpl;
}

/// @nodoc
abstract class _$$ReVerificationTimeoutEventImplCopyWith<$Res> {
  factory _$$ReVerificationTimeoutEventImplCopyWith(
          _$ReVerificationTimeoutEventImpl value,
          $Res Function(_$ReVerificationTimeoutEventImpl) then) =
      __$$ReVerificationTimeoutEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReVerificationTimeoutEventImplCopyWithImpl<$Res>
    extends _$ReVerificationEventCopyWithImpl<$Res,
        _$ReVerificationTimeoutEventImpl>
    implements _$$ReVerificationTimeoutEventImplCopyWith<$Res> {
  __$$ReVerificationTimeoutEventImplCopyWithImpl(
      _$ReVerificationTimeoutEventImpl _value,
      $Res Function(_$ReVerificationTimeoutEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReVerificationTimeoutEventImpl implements ReVerificationTimeoutEvent {
  const _$ReVerificationTimeoutEventImpl();

  @override
  String toString() {
    return 'ReVerificationEvent.timeout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReVerificationTimeoutEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReVerificationTrigger trigger) triggered,
    required TResult Function() tick,
    required TResult Function(List<double> embedding) faceScanned,
    required TResult Function(String pin, String individualId) pinUsed,
    required TResult Function() dismissed,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function() externalVerified,
    required TResult Function() timeout,
  }) {
    return timeout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationTrigger trigger)? triggered,
    TResult? Function()? tick,
    TResult? Function(List<double> embedding)? faceScanned,
    TResult? Function(String pin, String individualId)? pinUsed,
    TResult? Function()? dismissed,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function()? externalVerified,
    TResult? Function()? timeout,
  }) {
    return timeout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReVerificationTrigger trigger)? triggered,
    TResult Function()? tick,
    TResult Function(List<double> embedding)? faceScanned,
    TResult Function(String pin, String individualId)? pinUsed,
    TResult Function()? dismissed,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function()? externalVerified,
    TResult Function()? timeout,
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
    required TResult Function(ReVerificationTriggeredEvent value) triggered,
    required TResult Function(ReVerificationTickEvent value) tick,
    required TResult Function(ReVerificationFaceScannedEvent value) faceScanned,
    required TResult Function(ReVerificationPinUsedEvent value) pinUsed,
    required TResult Function(ReVerificationDismissedEvent value) dismissed,
    required TResult Function(ReVerificationPausedEvent value) paused,
    required TResult Function(ReVerificationResumedEvent value) resumed,
    required TResult Function(ReVerificationExternalVerifiedEvent value)
        externalVerified,
    required TResult Function(ReVerificationTimeoutEvent value) timeout,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationTriggeredEvent value)? triggered,
    TResult? Function(ReVerificationTickEvent value)? tick,
    TResult? Function(ReVerificationFaceScannedEvent value)? faceScanned,
    TResult? Function(ReVerificationPinUsedEvent value)? pinUsed,
    TResult? Function(ReVerificationDismissedEvent value)? dismissed,
    TResult? Function(ReVerificationPausedEvent value)? paused,
    TResult? Function(ReVerificationResumedEvent value)? resumed,
    TResult? Function(ReVerificationExternalVerifiedEvent value)?
        externalVerified,
    TResult? Function(ReVerificationTimeoutEvent value)? timeout,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReVerificationTriggeredEvent value)? triggered,
    TResult Function(ReVerificationTickEvent value)? tick,
    TResult Function(ReVerificationFaceScannedEvent value)? faceScanned,
    TResult Function(ReVerificationPinUsedEvent value)? pinUsed,
    TResult Function(ReVerificationDismissedEvent value)? dismissed,
    TResult Function(ReVerificationPausedEvent value)? paused,
    TResult Function(ReVerificationResumedEvent value)? resumed,
    TResult Function(ReVerificationExternalVerifiedEvent value)?
        externalVerified,
    TResult Function(ReVerificationTimeoutEvent value)? timeout,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class ReVerificationTimeoutEvent implements ReVerificationEvent {
  const factory ReVerificationTimeoutEvent() = _$ReVerificationTimeoutEventImpl;
}

/// @nodoc
mixin _$ReVerificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(int popupTime, int remainingSeconds,
            int iteration, int maxIterations)
        prompted,
    required TResult Function() scanning,
    required TResult Function(double confidence, int elapsedMs) verified,
    required TResult Function() pinFallback,
    required TResult Function(int popupTime) missed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(int popupTime, int remainingSeconds, int iteration,
            int maxIterations)?
        prompted,
    TResult? Function()? scanning,
    TResult? Function(double confidence, int elapsedMs)? verified,
    TResult? Function()? pinFallback,
    TResult? Function(int popupTime)? missed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(int popupTime, int remainingSeconds, int iteration,
            int maxIterations)?
        prompted,
    TResult Function()? scanning,
    TResult Function(double confidence, int elapsedMs)? verified,
    TResult Function()? pinFallback,
    TResult Function(int popupTime)? missed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReVerificationIdleState value) idle,
    required TResult Function(ReVerificationPromptedState value) prompted,
    required TResult Function(ReVerificationScanningState value) scanning,
    required TResult Function(ReVerificationVerifiedState value) verified,
    required TResult Function(ReVerificationPinFallbackState value) pinFallback,
    required TResult Function(ReVerificationMissedState value) missed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationIdleState value)? idle,
    TResult? Function(ReVerificationPromptedState value)? prompted,
    TResult? Function(ReVerificationScanningState value)? scanning,
    TResult? Function(ReVerificationVerifiedState value)? verified,
    TResult? Function(ReVerificationPinFallbackState value)? pinFallback,
    TResult? Function(ReVerificationMissedState value)? missed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReVerificationIdleState value)? idle,
    TResult Function(ReVerificationPromptedState value)? prompted,
    TResult Function(ReVerificationScanningState value)? scanning,
    TResult Function(ReVerificationVerifiedState value)? verified,
    TResult Function(ReVerificationPinFallbackState value)? pinFallback,
    TResult Function(ReVerificationMissedState value)? missed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReVerificationStateCopyWith<$Res> {
  factory $ReVerificationStateCopyWith(
          ReVerificationState value, $Res Function(ReVerificationState) then) =
      _$ReVerificationStateCopyWithImpl<$Res, ReVerificationState>;
}

/// @nodoc
class _$ReVerificationStateCopyWithImpl<$Res, $Val extends ReVerificationState>
    implements $ReVerificationStateCopyWith<$Res> {
  _$ReVerificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ReVerificationIdleStateImplCopyWith<$Res> {
  factory _$$ReVerificationIdleStateImplCopyWith(
          _$ReVerificationIdleStateImpl value,
          $Res Function(_$ReVerificationIdleStateImpl) then) =
      __$$ReVerificationIdleStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReVerificationIdleStateImplCopyWithImpl<$Res>
    extends _$ReVerificationStateCopyWithImpl<$Res,
        _$ReVerificationIdleStateImpl>
    implements _$$ReVerificationIdleStateImplCopyWith<$Res> {
  __$$ReVerificationIdleStateImplCopyWithImpl(
      _$ReVerificationIdleStateImpl _value,
      $Res Function(_$ReVerificationIdleStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReVerificationIdleStateImpl implements ReVerificationIdleState {
  const _$ReVerificationIdleStateImpl();

  @override
  String toString() {
    return 'ReVerificationState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReVerificationIdleStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(int popupTime, int remainingSeconds,
            int iteration, int maxIterations)
        prompted,
    required TResult Function() scanning,
    required TResult Function(double confidence, int elapsedMs) verified,
    required TResult Function() pinFallback,
    required TResult Function(int popupTime) missed,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(int popupTime, int remainingSeconds, int iteration,
            int maxIterations)?
        prompted,
    TResult? Function()? scanning,
    TResult? Function(double confidence, int elapsedMs)? verified,
    TResult? Function()? pinFallback,
    TResult? Function(int popupTime)? missed,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(int popupTime, int remainingSeconds, int iteration,
            int maxIterations)?
        prompted,
    TResult Function()? scanning,
    TResult Function(double confidence, int elapsedMs)? verified,
    TResult Function()? pinFallback,
    TResult Function(int popupTime)? missed,
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
    required TResult Function(ReVerificationIdleState value) idle,
    required TResult Function(ReVerificationPromptedState value) prompted,
    required TResult Function(ReVerificationScanningState value) scanning,
    required TResult Function(ReVerificationVerifiedState value) verified,
    required TResult Function(ReVerificationPinFallbackState value) pinFallback,
    required TResult Function(ReVerificationMissedState value) missed,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationIdleState value)? idle,
    TResult? Function(ReVerificationPromptedState value)? prompted,
    TResult? Function(ReVerificationScanningState value)? scanning,
    TResult? Function(ReVerificationVerifiedState value)? verified,
    TResult? Function(ReVerificationPinFallbackState value)? pinFallback,
    TResult? Function(ReVerificationMissedState value)? missed,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReVerificationIdleState value)? idle,
    TResult Function(ReVerificationPromptedState value)? prompted,
    TResult Function(ReVerificationScanningState value)? scanning,
    TResult Function(ReVerificationVerifiedState value)? verified,
    TResult Function(ReVerificationPinFallbackState value)? pinFallback,
    TResult Function(ReVerificationMissedState value)? missed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class ReVerificationIdleState implements ReVerificationState {
  const factory ReVerificationIdleState() = _$ReVerificationIdleStateImpl;
}

/// @nodoc
abstract class _$$ReVerificationPromptedStateImplCopyWith<$Res> {
  factory _$$ReVerificationPromptedStateImplCopyWith(
          _$ReVerificationPromptedStateImpl value,
          $Res Function(_$ReVerificationPromptedStateImpl) then) =
      __$$ReVerificationPromptedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int popupTime, int remainingSeconds, int iteration, int maxIterations});
}

/// @nodoc
class __$$ReVerificationPromptedStateImplCopyWithImpl<$Res>
    extends _$ReVerificationStateCopyWithImpl<$Res,
        _$ReVerificationPromptedStateImpl>
    implements _$$ReVerificationPromptedStateImplCopyWith<$Res> {
  __$$ReVerificationPromptedStateImplCopyWithImpl(
      _$ReVerificationPromptedStateImpl _value,
      $Res Function(_$ReVerificationPromptedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? popupTime = null,
    Object? remainingSeconds = null,
    Object? iteration = null,
    Object? maxIterations = null,
  }) {
    return _then(_$ReVerificationPromptedStateImpl(
      popupTime: null == popupTime
          ? _value.popupTime
          : popupTime // ignore: cast_nullable_to_non_nullable
              as int,
      remainingSeconds: null == remainingSeconds
          ? _value.remainingSeconds
          : remainingSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      iteration: null == iteration
          ? _value.iteration
          : iteration // ignore: cast_nullable_to_non_nullable
              as int,
      maxIterations: null == maxIterations
          ? _value.maxIterations
          : maxIterations // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ReVerificationPromptedStateImpl implements ReVerificationPromptedState {
  const _$ReVerificationPromptedStateImpl(
      {required this.popupTime,
      required this.remainingSeconds,
      this.iteration = 1,
      this.maxIterations = 3});

  @override
  final int popupTime;
  @override
  final int remainingSeconds;
  @override
  @JsonKey()
  final int iteration;
  @override
  @JsonKey()
  final int maxIterations;

  @override
  String toString() {
    return 'ReVerificationState.prompted(popupTime: $popupTime, remainingSeconds: $remainingSeconds, iteration: $iteration, maxIterations: $maxIterations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReVerificationPromptedStateImpl &&
            (identical(other.popupTime, popupTime) ||
                other.popupTime == popupTime) &&
            (identical(other.remainingSeconds, remainingSeconds) ||
                other.remainingSeconds == remainingSeconds) &&
            (identical(other.iteration, iteration) ||
                other.iteration == iteration) &&
            (identical(other.maxIterations, maxIterations) ||
                other.maxIterations == maxIterations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, popupTime, remainingSeconds, iteration, maxIterations);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReVerificationPromptedStateImplCopyWith<_$ReVerificationPromptedStateImpl>
      get copyWith => __$$ReVerificationPromptedStateImplCopyWithImpl<
          _$ReVerificationPromptedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(int popupTime, int remainingSeconds,
            int iteration, int maxIterations)
        prompted,
    required TResult Function() scanning,
    required TResult Function(double confidence, int elapsedMs) verified,
    required TResult Function() pinFallback,
    required TResult Function(int popupTime) missed,
  }) {
    return prompted(popupTime, remainingSeconds, iteration, maxIterations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(int popupTime, int remainingSeconds, int iteration,
            int maxIterations)?
        prompted,
    TResult? Function()? scanning,
    TResult? Function(double confidence, int elapsedMs)? verified,
    TResult? Function()? pinFallback,
    TResult? Function(int popupTime)? missed,
  }) {
    return prompted?.call(
        popupTime, remainingSeconds, iteration, maxIterations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(int popupTime, int remainingSeconds, int iteration,
            int maxIterations)?
        prompted,
    TResult Function()? scanning,
    TResult Function(double confidence, int elapsedMs)? verified,
    TResult Function()? pinFallback,
    TResult Function(int popupTime)? missed,
    required TResult orElse(),
  }) {
    if (prompted != null) {
      return prompted(popupTime, remainingSeconds, iteration, maxIterations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReVerificationIdleState value) idle,
    required TResult Function(ReVerificationPromptedState value) prompted,
    required TResult Function(ReVerificationScanningState value) scanning,
    required TResult Function(ReVerificationVerifiedState value) verified,
    required TResult Function(ReVerificationPinFallbackState value) pinFallback,
    required TResult Function(ReVerificationMissedState value) missed,
  }) {
    return prompted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationIdleState value)? idle,
    TResult? Function(ReVerificationPromptedState value)? prompted,
    TResult? Function(ReVerificationScanningState value)? scanning,
    TResult? Function(ReVerificationVerifiedState value)? verified,
    TResult? Function(ReVerificationPinFallbackState value)? pinFallback,
    TResult? Function(ReVerificationMissedState value)? missed,
  }) {
    return prompted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReVerificationIdleState value)? idle,
    TResult Function(ReVerificationPromptedState value)? prompted,
    TResult Function(ReVerificationScanningState value)? scanning,
    TResult Function(ReVerificationVerifiedState value)? verified,
    TResult Function(ReVerificationPinFallbackState value)? pinFallback,
    TResult Function(ReVerificationMissedState value)? missed,
    required TResult orElse(),
  }) {
    if (prompted != null) {
      return prompted(this);
    }
    return orElse();
  }
}

abstract class ReVerificationPromptedState implements ReVerificationState {
  const factory ReVerificationPromptedState(
      {required final int popupTime,
      required final int remainingSeconds,
      final int iteration,
      final int maxIterations}) = _$ReVerificationPromptedStateImpl;

  int get popupTime;
  int get remainingSeconds;
  int get iteration;
  int get maxIterations;
  @JsonKey(ignore: true)
  _$$ReVerificationPromptedStateImplCopyWith<_$ReVerificationPromptedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReVerificationScanningStateImplCopyWith<$Res> {
  factory _$$ReVerificationScanningStateImplCopyWith(
          _$ReVerificationScanningStateImpl value,
          $Res Function(_$ReVerificationScanningStateImpl) then) =
      __$$ReVerificationScanningStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReVerificationScanningStateImplCopyWithImpl<$Res>
    extends _$ReVerificationStateCopyWithImpl<$Res,
        _$ReVerificationScanningStateImpl>
    implements _$$ReVerificationScanningStateImplCopyWith<$Res> {
  __$$ReVerificationScanningStateImplCopyWithImpl(
      _$ReVerificationScanningStateImpl _value,
      $Res Function(_$ReVerificationScanningStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReVerificationScanningStateImpl implements ReVerificationScanningState {
  const _$ReVerificationScanningStateImpl();

  @override
  String toString() {
    return 'ReVerificationState.scanning()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReVerificationScanningStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(int popupTime, int remainingSeconds,
            int iteration, int maxIterations)
        prompted,
    required TResult Function() scanning,
    required TResult Function(double confidence, int elapsedMs) verified,
    required TResult Function() pinFallback,
    required TResult Function(int popupTime) missed,
  }) {
    return scanning();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(int popupTime, int remainingSeconds, int iteration,
            int maxIterations)?
        prompted,
    TResult? Function()? scanning,
    TResult? Function(double confidence, int elapsedMs)? verified,
    TResult? Function()? pinFallback,
    TResult? Function(int popupTime)? missed,
  }) {
    return scanning?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(int popupTime, int remainingSeconds, int iteration,
            int maxIterations)?
        prompted,
    TResult Function()? scanning,
    TResult Function(double confidence, int elapsedMs)? verified,
    TResult Function()? pinFallback,
    TResult Function(int popupTime)? missed,
    required TResult orElse(),
  }) {
    if (scanning != null) {
      return scanning();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReVerificationIdleState value) idle,
    required TResult Function(ReVerificationPromptedState value) prompted,
    required TResult Function(ReVerificationScanningState value) scanning,
    required TResult Function(ReVerificationVerifiedState value) verified,
    required TResult Function(ReVerificationPinFallbackState value) pinFallback,
    required TResult Function(ReVerificationMissedState value) missed,
  }) {
    return scanning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationIdleState value)? idle,
    TResult? Function(ReVerificationPromptedState value)? prompted,
    TResult? Function(ReVerificationScanningState value)? scanning,
    TResult? Function(ReVerificationVerifiedState value)? verified,
    TResult? Function(ReVerificationPinFallbackState value)? pinFallback,
    TResult? Function(ReVerificationMissedState value)? missed,
  }) {
    return scanning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReVerificationIdleState value)? idle,
    TResult Function(ReVerificationPromptedState value)? prompted,
    TResult Function(ReVerificationScanningState value)? scanning,
    TResult Function(ReVerificationVerifiedState value)? verified,
    TResult Function(ReVerificationPinFallbackState value)? pinFallback,
    TResult Function(ReVerificationMissedState value)? missed,
    required TResult orElse(),
  }) {
    if (scanning != null) {
      return scanning(this);
    }
    return orElse();
  }
}

abstract class ReVerificationScanningState implements ReVerificationState {
  const factory ReVerificationScanningState() =
      _$ReVerificationScanningStateImpl;
}

/// @nodoc
abstract class _$$ReVerificationVerifiedStateImplCopyWith<$Res> {
  factory _$$ReVerificationVerifiedStateImplCopyWith(
          _$ReVerificationVerifiedStateImpl value,
          $Res Function(_$ReVerificationVerifiedStateImpl) then) =
      __$$ReVerificationVerifiedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double confidence, int elapsedMs});
}

/// @nodoc
class __$$ReVerificationVerifiedStateImplCopyWithImpl<$Res>
    extends _$ReVerificationStateCopyWithImpl<$Res,
        _$ReVerificationVerifiedStateImpl>
    implements _$$ReVerificationVerifiedStateImplCopyWith<$Res> {
  __$$ReVerificationVerifiedStateImplCopyWithImpl(
      _$ReVerificationVerifiedStateImpl _value,
      $Res Function(_$ReVerificationVerifiedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confidence = null,
    Object? elapsedMs = null,
  }) {
    return _then(_$ReVerificationVerifiedStateImpl(
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      elapsedMs: null == elapsedMs
          ? _value.elapsedMs
          : elapsedMs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ReVerificationVerifiedStateImpl implements ReVerificationVerifiedState {
  const _$ReVerificationVerifiedStateImpl(
      {required this.confidence, required this.elapsedMs});

  @override
  final double confidence;
  @override
  final int elapsedMs;

  @override
  String toString() {
    return 'ReVerificationState.verified(confidence: $confidence, elapsedMs: $elapsedMs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReVerificationVerifiedStateImpl &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.elapsedMs, elapsedMs) ||
                other.elapsedMs == elapsedMs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, confidence, elapsedMs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReVerificationVerifiedStateImplCopyWith<_$ReVerificationVerifiedStateImpl>
      get copyWith => __$$ReVerificationVerifiedStateImplCopyWithImpl<
          _$ReVerificationVerifiedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(int popupTime, int remainingSeconds,
            int iteration, int maxIterations)
        prompted,
    required TResult Function() scanning,
    required TResult Function(double confidence, int elapsedMs) verified,
    required TResult Function() pinFallback,
    required TResult Function(int popupTime) missed,
  }) {
    return verified(confidence, elapsedMs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(int popupTime, int remainingSeconds, int iteration,
            int maxIterations)?
        prompted,
    TResult? Function()? scanning,
    TResult? Function(double confidence, int elapsedMs)? verified,
    TResult? Function()? pinFallback,
    TResult? Function(int popupTime)? missed,
  }) {
    return verified?.call(confidence, elapsedMs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(int popupTime, int remainingSeconds, int iteration,
            int maxIterations)?
        prompted,
    TResult Function()? scanning,
    TResult Function(double confidence, int elapsedMs)? verified,
    TResult Function()? pinFallback,
    TResult Function(int popupTime)? missed,
    required TResult orElse(),
  }) {
    if (verified != null) {
      return verified(confidence, elapsedMs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReVerificationIdleState value) idle,
    required TResult Function(ReVerificationPromptedState value) prompted,
    required TResult Function(ReVerificationScanningState value) scanning,
    required TResult Function(ReVerificationVerifiedState value) verified,
    required TResult Function(ReVerificationPinFallbackState value) pinFallback,
    required TResult Function(ReVerificationMissedState value) missed,
  }) {
    return verified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationIdleState value)? idle,
    TResult? Function(ReVerificationPromptedState value)? prompted,
    TResult? Function(ReVerificationScanningState value)? scanning,
    TResult? Function(ReVerificationVerifiedState value)? verified,
    TResult? Function(ReVerificationPinFallbackState value)? pinFallback,
    TResult? Function(ReVerificationMissedState value)? missed,
  }) {
    return verified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReVerificationIdleState value)? idle,
    TResult Function(ReVerificationPromptedState value)? prompted,
    TResult Function(ReVerificationScanningState value)? scanning,
    TResult Function(ReVerificationVerifiedState value)? verified,
    TResult Function(ReVerificationPinFallbackState value)? pinFallback,
    TResult Function(ReVerificationMissedState value)? missed,
    required TResult orElse(),
  }) {
    if (verified != null) {
      return verified(this);
    }
    return orElse();
  }
}

abstract class ReVerificationVerifiedState implements ReVerificationState {
  const factory ReVerificationVerifiedState(
      {required final double confidence,
      required final int elapsedMs}) = _$ReVerificationVerifiedStateImpl;

  double get confidence;
  int get elapsedMs;
  @JsonKey(ignore: true)
  _$$ReVerificationVerifiedStateImplCopyWith<_$ReVerificationVerifiedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReVerificationPinFallbackStateImplCopyWith<$Res> {
  factory _$$ReVerificationPinFallbackStateImplCopyWith(
          _$ReVerificationPinFallbackStateImpl value,
          $Res Function(_$ReVerificationPinFallbackStateImpl) then) =
      __$$ReVerificationPinFallbackStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReVerificationPinFallbackStateImplCopyWithImpl<$Res>
    extends _$ReVerificationStateCopyWithImpl<$Res,
        _$ReVerificationPinFallbackStateImpl>
    implements _$$ReVerificationPinFallbackStateImplCopyWith<$Res> {
  __$$ReVerificationPinFallbackStateImplCopyWithImpl(
      _$ReVerificationPinFallbackStateImpl _value,
      $Res Function(_$ReVerificationPinFallbackStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReVerificationPinFallbackStateImpl
    implements ReVerificationPinFallbackState {
  const _$ReVerificationPinFallbackStateImpl();

  @override
  String toString() {
    return 'ReVerificationState.pinFallback()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReVerificationPinFallbackStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(int popupTime, int remainingSeconds,
            int iteration, int maxIterations)
        prompted,
    required TResult Function() scanning,
    required TResult Function(double confidence, int elapsedMs) verified,
    required TResult Function() pinFallback,
    required TResult Function(int popupTime) missed,
  }) {
    return pinFallback();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(int popupTime, int remainingSeconds, int iteration,
            int maxIterations)?
        prompted,
    TResult? Function()? scanning,
    TResult? Function(double confidence, int elapsedMs)? verified,
    TResult? Function()? pinFallback,
    TResult? Function(int popupTime)? missed,
  }) {
    return pinFallback?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(int popupTime, int remainingSeconds, int iteration,
            int maxIterations)?
        prompted,
    TResult Function()? scanning,
    TResult Function(double confidence, int elapsedMs)? verified,
    TResult Function()? pinFallback,
    TResult Function(int popupTime)? missed,
    required TResult orElse(),
  }) {
    if (pinFallback != null) {
      return pinFallback();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReVerificationIdleState value) idle,
    required TResult Function(ReVerificationPromptedState value) prompted,
    required TResult Function(ReVerificationScanningState value) scanning,
    required TResult Function(ReVerificationVerifiedState value) verified,
    required TResult Function(ReVerificationPinFallbackState value) pinFallback,
    required TResult Function(ReVerificationMissedState value) missed,
  }) {
    return pinFallback(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationIdleState value)? idle,
    TResult? Function(ReVerificationPromptedState value)? prompted,
    TResult? Function(ReVerificationScanningState value)? scanning,
    TResult? Function(ReVerificationVerifiedState value)? verified,
    TResult? Function(ReVerificationPinFallbackState value)? pinFallback,
    TResult? Function(ReVerificationMissedState value)? missed,
  }) {
    return pinFallback?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReVerificationIdleState value)? idle,
    TResult Function(ReVerificationPromptedState value)? prompted,
    TResult Function(ReVerificationScanningState value)? scanning,
    TResult Function(ReVerificationVerifiedState value)? verified,
    TResult Function(ReVerificationPinFallbackState value)? pinFallback,
    TResult Function(ReVerificationMissedState value)? missed,
    required TResult orElse(),
  }) {
    if (pinFallback != null) {
      return pinFallback(this);
    }
    return orElse();
  }
}

abstract class ReVerificationPinFallbackState implements ReVerificationState {
  const factory ReVerificationPinFallbackState() =
      _$ReVerificationPinFallbackStateImpl;
}

/// @nodoc
abstract class _$$ReVerificationMissedStateImplCopyWith<$Res> {
  factory _$$ReVerificationMissedStateImplCopyWith(
          _$ReVerificationMissedStateImpl value,
          $Res Function(_$ReVerificationMissedStateImpl) then) =
      __$$ReVerificationMissedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int popupTime});
}

/// @nodoc
class __$$ReVerificationMissedStateImplCopyWithImpl<$Res>
    extends _$ReVerificationStateCopyWithImpl<$Res,
        _$ReVerificationMissedStateImpl>
    implements _$$ReVerificationMissedStateImplCopyWith<$Res> {
  __$$ReVerificationMissedStateImplCopyWithImpl(
      _$ReVerificationMissedStateImpl _value,
      $Res Function(_$ReVerificationMissedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? popupTime = null,
  }) {
    return _then(_$ReVerificationMissedStateImpl(
      popupTime: null == popupTime
          ? _value.popupTime
          : popupTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ReVerificationMissedStateImpl implements ReVerificationMissedState {
  const _$ReVerificationMissedStateImpl({required this.popupTime});

  @override
  final int popupTime;

  @override
  String toString() {
    return 'ReVerificationState.missed(popupTime: $popupTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReVerificationMissedStateImpl &&
            (identical(other.popupTime, popupTime) ||
                other.popupTime == popupTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, popupTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReVerificationMissedStateImplCopyWith<_$ReVerificationMissedStateImpl>
      get copyWith => __$$ReVerificationMissedStateImplCopyWithImpl<
          _$ReVerificationMissedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(int popupTime, int remainingSeconds,
            int iteration, int maxIterations)
        prompted,
    required TResult Function() scanning,
    required TResult Function(double confidence, int elapsedMs) verified,
    required TResult Function() pinFallback,
    required TResult Function(int popupTime) missed,
  }) {
    return missed(popupTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(int popupTime, int remainingSeconds, int iteration,
            int maxIterations)?
        prompted,
    TResult? Function()? scanning,
    TResult? Function(double confidence, int elapsedMs)? verified,
    TResult? Function()? pinFallback,
    TResult? Function(int popupTime)? missed,
  }) {
    return missed?.call(popupTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(int popupTime, int remainingSeconds, int iteration,
            int maxIterations)?
        prompted,
    TResult Function()? scanning,
    TResult Function(double confidence, int elapsedMs)? verified,
    TResult Function()? pinFallback,
    TResult Function(int popupTime)? missed,
    required TResult orElse(),
  }) {
    if (missed != null) {
      return missed(popupTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReVerificationIdleState value) idle,
    required TResult Function(ReVerificationPromptedState value) prompted,
    required TResult Function(ReVerificationScanningState value) scanning,
    required TResult Function(ReVerificationVerifiedState value) verified,
    required TResult Function(ReVerificationPinFallbackState value) pinFallback,
    required TResult Function(ReVerificationMissedState value) missed,
  }) {
    return missed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReVerificationIdleState value)? idle,
    TResult? Function(ReVerificationPromptedState value)? prompted,
    TResult? Function(ReVerificationScanningState value)? scanning,
    TResult? Function(ReVerificationVerifiedState value)? verified,
    TResult? Function(ReVerificationPinFallbackState value)? pinFallback,
    TResult? Function(ReVerificationMissedState value)? missed,
  }) {
    return missed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReVerificationIdleState value)? idle,
    TResult Function(ReVerificationPromptedState value)? prompted,
    TResult Function(ReVerificationScanningState value)? scanning,
    TResult Function(ReVerificationVerifiedState value)? verified,
    TResult Function(ReVerificationPinFallbackState value)? pinFallback,
    TResult Function(ReVerificationMissedState value)? missed,
    required TResult orElse(),
  }) {
    if (missed != null) {
      return missed(this);
    }
    return orElse();
  }
}

abstract class ReVerificationMissedState implements ReVerificationState {
  const factory ReVerificationMissedState({required final int popupTime}) =
      _$ReVerificationMissedStateImpl;

  int get popupTime;
  @JsonKey(ignore: true)
  _$$ReVerificationMissedStateImplCopyWith<_$ReVerificationMissedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
