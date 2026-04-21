// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_gate_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FaceGateEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String individualId, bool skipWorkerCheck)
        checkEnrollment,
    required TResult Function(List<double> embedding, Uint8List? faceImageBytes)
        attemptFaceVerify,
    required TResult Function(String pin, String individualId) pinFallback,
    required TResult Function() skipToEnrollment,
    required TResult Function() reset,
    required TResult Function() goToPinEntry,
    required TResult Function() registryCheckFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String individualId, bool skipWorkerCheck)?
        checkEnrollment,
    TResult? Function(List<double> embedding, Uint8List? faceImageBytes)?
        attemptFaceVerify,
    TResult? Function(String pin, String individualId)? pinFallback,
    TResult? Function()? skipToEnrollment,
    TResult? Function()? reset,
    TResult? Function()? goToPinEntry,
    TResult? Function()? registryCheckFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String individualId, bool skipWorkerCheck)?
        checkEnrollment,
    TResult Function(List<double> embedding, Uint8List? faceImageBytes)?
        attemptFaceVerify,
    TResult Function(String pin, String individualId)? pinFallback,
    TResult Function()? skipToEnrollment,
    TResult Function()? reset,
    TResult Function()? goToPinEntry,
    TResult Function()? registryCheckFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceGateCheckEnrollmentEvent value)
        checkEnrollment,
    required TResult Function(FaceGateAttemptFaceVerifyEvent value)
        attemptFaceVerify,
    required TResult Function(FaceGatePinFallbackEvent value) pinFallback,
    required TResult Function(FaceGateSkipToEnrollmentEvent value)
        skipToEnrollment,
    required TResult Function(FaceGateResetEvent value) reset,
    required TResult Function(FaceGateGoToPinEntryEvent value) goToPinEntry,
    required TResult Function(FaceGateRegistryCheckFailedEvent value)
        registryCheckFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceGateCheckEnrollmentEvent value)? checkEnrollment,
    TResult? Function(FaceGateAttemptFaceVerifyEvent value)? attemptFaceVerify,
    TResult? Function(FaceGatePinFallbackEvent value)? pinFallback,
    TResult? Function(FaceGateSkipToEnrollmentEvent value)? skipToEnrollment,
    TResult? Function(FaceGateResetEvent value)? reset,
    TResult? Function(FaceGateGoToPinEntryEvent value)? goToPinEntry,
    TResult? Function(FaceGateRegistryCheckFailedEvent value)?
        registryCheckFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceGateCheckEnrollmentEvent value)? checkEnrollment,
    TResult Function(FaceGateAttemptFaceVerifyEvent value)? attemptFaceVerify,
    TResult Function(FaceGatePinFallbackEvent value)? pinFallback,
    TResult Function(FaceGateSkipToEnrollmentEvent value)? skipToEnrollment,
    TResult Function(FaceGateResetEvent value)? reset,
    TResult Function(FaceGateGoToPinEntryEvent value)? goToPinEntry,
    TResult Function(FaceGateRegistryCheckFailedEvent value)?
        registryCheckFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaceGateEventCopyWith<$Res> {
  factory $FaceGateEventCopyWith(
          FaceGateEvent value, $Res Function(FaceGateEvent) then) =
      _$FaceGateEventCopyWithImpl<$Res, FaceGateEvent>;
}

/// @nodoc
class _$FaceGateEventCopyWithImpl<$Res, $Val extends FaceGateEvent>
    implements $FaceGateEventCopyWith<$Res> {
  _$FaceGateEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FaceGateCheckEnrollmentEventImplCopyWith<$Res> {
  factory _$$FaceGateCheckEnrollmentEventImplCopyWith(
          _$FaceGateCheckEnrollmentEventImpl value,
          $Res Function(_$FaceGateCheckEnrollmentEventImpl) then) =
      __$$FaceGateCheckEnrollmentEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String individualId, bool skipWorkerCheck});
}

/// @nodoc
class __$$FaceGateCheckEnrollmentEventImplCopyWithImpl<$Res>
    extends _$FaceGateEventCopyWithImpl<$Res,
        _$FaceGateCheckEnrollmentEventImpl>
    implements _$$FaceGateCheckEnrollmentEventImplCopyWith<$Res> {
  __$$FaceGateCheckEnrollmentEventImplCopyWithImpl(
      _$FaceGateCheckEnrollmentEventImpl _value,
      $Res Function(_$FaceGateCheckEnrollmentEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? individualId = null,
    Object? skipWorkerCheck = null,
  }) {
    return _then(_$FaceGateCheckEnrollmentEventImpl(
      individualId: null == individualId
          ? _value.individualId
          : individualId // ignore: cast_nullable_to_non_nullable
              as String,
      skipWorkerCheck: null == skipWorkerCheck
          ? _value.skipWorkerCheck
          : skipWorkerCheck // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FaceGateCheckEnrollmentEventImpl
    with DiagnosticableTreeMixin
    implements FaceGateCheckEnrollmentEvent {
  const _$FaceGateCheckEnrollmentEventImpl(
      {this.individualId = '', this.skipWorkerCheck = false});

  @override
  @JsonKey()
  final String individualId;
  @override
  @JsonKey()
  final bool skipWorkerCheck;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FaceGateEvent.checkEnrollment(individualId: $individualId, skipWorkerCheck: $skipWorkerCheck)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FaceGateEvent.checkEnrollment'))
      ..add(DiagnosticsProperty('individualId', individualId))
      ..add(DiagnosticsProperty('skipWorkerCheck', skipWorkerCheck));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceGateCheckEnrollmentEventImpl &&
            (identical(other.individualId, individualId) ||
                other.individualId == individualId) &&
            (identical(other.skipWorkerCheck, skipWorkerCheck) ||
                other.skipWorkerCheck == skipWorkerCheck));
  }

  @override
  int get hashCode => Object.hash(runtimeType, individualId, skipWorkerCheck);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceGateCheckEnrollmentEventImplCopyWith<
          _$FaceGateCheckEnrollmentEventImpl>
      get copyWith => __$$FaceGateCheckEnrollmentEventImplCopyWithImpl<
          _$FaceGateCheckEnrollmentEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String individualId, bool skipWorkerCheck)
        checkEnrollment,
    required TResult Function(List<double> embedding, Uint8List? faceImageBytes)
        attemptFaceVerify,
    required TResult Function(String pin, String individualId) pinFallback,
    required TResult Function() skipToEnrollment,
    required TResult Function() reset,
    required TResult Function() goToPinEntry,
    required TResult Function() registryCheckFailed,
  }) {
    return checkEnrollment(individualId, skipWorkerCheck);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String individualId, bool skipWorkerCheck)?
        checkEnrollment,
    TResult? Function(List<double> embedding, Uint8List? faceImageBytes)?
        attemptFaceVerify,
    TResult? Function(String pin, String individualId)? pinFallback,
    TResult? Function()? skipToEnrollment,
    TResult? Function()? reset,
    TResult? Function()? goToPinEntry,
    TResult? Function()? registryCheckFailed,
  }) {
    return checkEnrollment?.call(individualId, skipWorkerCheck);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String individualId, bool skipWorkerCheck)?
        checkEnrollment,
    TResult Function(List<double> embedding, Uint8List? faceImageBytes)?
        attemptFaceVerify,
    TResult Function(String pin, String individualId)? pinFallback,
    TResult Function()? skipToEnrollment,
    TResult Function()? reset,
    TResult Function()? goToPinEntry,
    TResult Function()? registryCheckFailed,
    required TResult orElse(),
  }) {
    if (checkEnrollment != null) {
      return checkEnrollment(individualId, skipWorkerCheck);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceGateCheckEnrollmentEvent value)
        checkEnrollment,
    required TResult Function(FaceGateAttemptFaceVerifyEvent value)
        attemptFaceVerify,
    required TResult Function(FaceGatePinFallbackEvent value) pinFallback,
    required TResult Function(FaceGateSkipToEnrollmentEvent value)
        skipToEnrollment,
    required TResult Function(FaceGateResetEvent value) reset,
    required TResult Function(FaceGateGoToPinEntryEvent value) goToPinEntry,
    required TResult Function(FaceGateRegistryCheckFailedEvent value)
        registryCheckFailed,
  }) {
    return checkEnrollment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceGateCheckEnrollmentEvent value)? checkEnrollment,
    TResult? Function(FaceGateAttemptFaceVerifyEvent value)? attemptFaceVerify,
    TResult? Function(FaceGatePinFallbackEvent value)? pinFallback,
    TResult? Function(FaceGateSkipToEnrollmentEvent value)? skipToEnrollment,
    TResult? Function(FaceGateResetEvent value)? reset,
    TResult? Function(FaceGateGoToPinEntryEvent value)? goToPinEntry,
    TResult? Function(FaceGateRegistryCheckFailedEvent value)?
        registryCheckFailed,
  }) {
    return checkEnrollment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceGateCheckEnrollmentEvent value)? checkEnrollment,
    TResult Function(FaceGateAttemptFaceVerifyEvent value)? attemptFaceVerify,
    TResult Function(FaceGatePinFallbackEvent value)? pinFallback,
    TResult Function(FaceGateSkipToEnrollmentEvent value)? skipToEnrollment,
    TResult Function(FaceGateResetEvent value)? reset,
    TResult Function(FaceGateGoToPinEntryEvent value)? goToPinEntry,
    TResult Function(FaceGateRegistryCheckFailedEvent value)?
        registryCheckFailed,
    required TResult orElse(),
  }) {
    if (checkEnrollment != null) {
      return checkEnrollment(this);
    }
    return orElse();
  }
}

abstract class FaceGateCheckEnrollmentEvent implements FaceGateEvent {
  const factory FaceGateCheckEnrollmentEvent(
      {final String individualId,
      final bool skipWorkerCheck}) = _$FaceGateCheckEnrollmentEventImpl;

  String get individualId;
  bool get skipWorkerCheck;
  @JsonKey(ignore: true)
  _$$FaceGateCheckEnrollmentEventImplCopyWith<
          _$FaceGateCheckEnrollmentEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FaceGateAttemptFaceVerifyEventImplCopyWith<$Res> {
  factory _$$FaceGateAttemptFaceVerifyEventImplCopyWith(
          _$FaceGateAttemptFaceVerifyEventImpl value,
          $Res Function(_$FaceGateAttemptFaceVerifyEventImpl) then) =
      __$$FaceGateAttemptFaceVerifyEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<double> embedding, Uint8List? faceImageBytes});
}

/// @nodoc
class __$$FaceGateAttemptFaceVerifyEventImplCopyWithImpl<$Res>
    extends _$FaceGateEventCopyWithImpl<$Res,
        _$FaceGateAttemptFaceVerifyEventImpl>
    implements _$$FaceGateAttemptFaceVerifyEventImplCopyWith<$Res> {
  __$$FaceGateAttemptFaceVerifyEventImplCopyWithImpl(
      _$FaceGateAttemptFaceVerifyEventImpl _value,
      $Res Function(_$FaceGateAttemptFaceVerifyEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? embedding = null,
    Object? faceImageBytes = freezed,
  }) {
    return _then(_$FaceGateAttemptFaceVerifyEventImpl(
      embedding: null == embedding
          ? _value._embedding
          : embedding // ignore: cast_nullable_to_non_nullable
              as List<double>,
      faceImageBytes: freezed == faceImageBytes
          ? _value.faceImageBytes
          : faceImageBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$FaceGateAttemptFaceVerifyEventImpl
    with DiagnosticableTreeMixin
    implements FaceGateAttemptFaceVerifyEvent {
  const _$FaceGateAttemptFaceVerifyEventImpl(
      {required final List<double> embedding, this.faceImageBytes})
      : _embedding = embedding;

  final List<double> _embedding;
  @override
  List<double> get embedding {
    if (_embedding is EqualUnmodifiableListView) return _embedding;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_embedding);
  }

  @override
  final Uint8List? faceImageBytes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FaceGateEvent.attemptFaceVerify(embedding: $embedding, faceImageBytes: $faceImageBytes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FaceGateEvent.attemptFaceVerify'))
      ..add(DiagnosticsProperty('embedding', embedding))
      ..add(DiagnosticsProperty('faceImageBytes', faceImageBytes));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceGateAttemptFaceVerifyEventImpl &&
            const DeepCollectionEquality()
                .equals(other._embedding, _embedding) &&
            const DeepCollectionEquality()
                .equals(other.faceImageBytes, faceImageBytes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_embedding),
      const DeepCollectionEquality().hash(faceImageBytes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceGateAttemptFaceVerifyEventImplCopyWith<
          _$FaceGateAttemptFaceVerifyEventImpl>
      get copyWith => __$$FaceGateAttemptFaceVerifyEventImplCopyWithImpl<
          _$FaceGateAttemptFaceVerifyEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String individualId, bool skipWorkerCheck)
        checkEnrollment,
    required TResult Function(List<double> embedding, Uint8List? faceImageBytes)
        attemptFaceVerify,
    required TResult Function(String pin, String individualId) pinFallback,
    required TResult Function() skipToEnrollment,
    required TResult Function() reset,
    required TResult Function() goToPinEntry,
    required TResult Function() registryCheckFailed,
  }) {
    return attemptFaceVerify(embedding, faceImageBytes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String individualId, bool skipWorkerCheck)?
        checkEnrollment,
    TResult? Function(List<double> embedding, Uint8List? faceImageBytes)?
        attemptFaceVerify,
    TResult? Function(String pin, String individualId)? pinFallback,
    TResult? Function()? skipToEnrollment,
    TResult? Function()? reset,
    TResult? Function()? goToPinEntry,
    TResult? Function()? registryCheckFailed,
  }) {
    return attemptFaceVerify?.call(embedding, faceImageBytes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String individualId, bool skipWorkerCheck)?
        checkEnrollment,
    TResult Function(List<double> embedding, Uint8List? faceImageBytes)?
        attemptFaceVerify,
    TResult Function(String pin, String individualId)? pinFallback,
    TResult Function()? skipToEnrollment,
    TResult Function()? reset,
    TResult Function()? goToPinEntry,
    TResult Function()? registryCheckFailed,
    required TResult orElse(),
  }) {
    if (attemptFaceVerify != null) {
      return attemptFaceVerify(embedding, faceImageBytes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceGateCheckEnrollmentEvent value)
        checkEnrollment,
    required TResult Function(FaceGateAttemptFaceVerifyEvent value)
        attemptFaceVerify,
    required TResult Function(FaceGatePinFallbackEvent value) pinFallback,
    required TResult Function(FaceGateSkipToEnrollmentEvent value)
        skipToEnrollment,
    required TResult Function(FaceGateResetEvent value) reset,
    required TResult Function(FaceGateGoToPinEntryEvent value) goToPinEntry,
    required TResult Function(FaceGateRegistryCheckFailedEvent value)
        registryCheckFailed,
  }) {
    return attemptFaceVerify(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceGateCheckEnrollmentEvent value)? checkEnrollment,
    TResult? Function(FaceGateAttemptFaceVerifyEvent value)? attemptFaceVerify,
    TResult? Function(FaceGatePinFallbackEvent value)? pinFallback,
    TResult? Function(FaceGateSkipToEnrollmentEvent value)? skipToEnrollment,
    TResult? Function(FaceGateResetEvent value)? reset,
    TResult? Function(FaceGateGoToPinEntryEvent value)? goToPinEntry,
    TResult? Function(FaceGateRegistryCheckFailedEvent value)?
        registryCheckFailed,
  }) {
    return attemptFaceVerify?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceGateCheckEnrollmentEvent value)? checkEnrollment,
    TResult Function(FaceGateAttemptFaceVerifyEvent value)? attemptFaceVerify,
    TResult Function(FaceGatePinFallbackEvent value)? pinFallback,
    TResult Function(FaceGateSkipToEnrollmentEvent value)? skipToEnrollment,
    TResult Function(FaceGateResetEvent value)? reset,
    TResult Function(FaceGateGoToPinEntryEvent value)? goToPinEntry,
    TResult Function(FaceGateRegistryCheckFailedEvent value)?
        registryCheckFailed,
    required TResult orElse(),
  }) {
    if (attemptFaceVerify != null) {
      return attemptFaceVerify(this);
    }
    return orElse();
  }
}

abstract class FaceGateAttemptFaceVerifyEvent implements FaceGateEvent {
  const factory FaceGateAttemptFaceVerifyEvent(
      {required final List<double> embedding,
      final Uint8List? faceImageBytes}) = _$FaceGateAttemptFaceVerifyEventImpl;

  List<double> get embedding;
  Uint8List? get faceImageBytes;
  @JsonKey(ignore: true)
  _$$FaceGateAttemptFaceVerifyEventImplCopyWith<
          _$FaceGateAttemptFaceVerifyEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FaceGatePinFallbackEventImplCopyWith<$Res> {
  factory _$$FaceGatePinFallbackEventImplCopyWith(
          _$FaceGatePinFallbackEventImpl value,
          $Res Function(_$FaceGatePinFallbackEventImpl) then) =
      __$$FaceGatePinFallbackEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String pin, String individualId});
}

/// @nodoc
class __$$FaceGatePinFallbackEventImplCopyWithImpl<$Res>
    extends _$FaceGateEventCopyWithImpl<$Res, _$FaceGatePinFallbackEventImpl>
    implements _$$FaceGatePinFallbackEventImplCopyWith<$Res> {
  __$$FaceGatePinFallbackEventImplCopyWithImpl(
      _$FaceGatePinFallbackEventImpl _value,
      $Res Function(_$FaceGatePinFallbackEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pin = null,
    Object? individualId = null,
  }) {
    return _then(_$FaceGatePinFallbackEventImpl(
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

class _$FaceGatePinFallbackEventImpl
    with DiagnosticableTreeMixin
    implements FaceGatePinFallbackEvent {
  const _$FaceGatePinFallbackEventImpl(
      {required this.pin, required this.individualId});

  @override
  final String pin;
  @override
  final String individualId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FaceGateEvent.pinFallback(pin: $pin, individualId: $individualId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FaceGateEvent.pinFallback'))
      ..add(DiagnosticsProperty('pin', pin))
      ..add(DiagnosticsProperty('individualId', individualId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceGatePinFallbackEventImpl &&
            (identical(other.pin, pin) || other.pin == pin) &&
            (identical(other.individualId, individualId) ||
                other.individualId == individualId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pin, individualId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceGatePinFallbackEventImplCopyWith<_$FaceGatePinFallbackEventImpl>
      get copyWith => __$$FaceGatePinFallbackEventImplCopyWithImpl<
          _$FaceGatePinFallbackEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String individualId, bool skipWorkerCheck)
        checkEnrollment,
    required TResult Function(List<double> embedding, Uint8List? faceImageBytes)
        attemptFaceVerify,
    required TResult Function(String pin, String individualId) pinFallback,
    required TResult Function() skipToEnrollment,
    required TResult Function() reset,
    required TResult Function() goToPinEntry,
    required TResult Function() registryCheckFailed,
  }) {
    return pinFallback(pin, individualId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String individualId, bool skipWorkerCheck)?
        checkEnrollment,
    TResult? Function(List<double> embedding, Uint8List? faceImageBytes)?
        attemptFaceVerify,
    TResult? Function(String pin, String individualId)? pinFallback,
    TResult? Function()? skipToEnrollment,
    TResult? Function()? reset,
    TResult? Function()? goToPinEntry,
    TResult? Function()? registryCheckFailed,
  }) {
    return pinFallback?.call(pin, individualId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String individualId, bool skipWorkerCheck)?
        checkEnrollment,
    TResult Function(List<double> embedding, Uint8List? faceImageBytes)?
        attemptFaceVerify,
    TResult Function(String pin, String individualId)? pinFallback,
    TResult Function()? skipToEnrollment,
    TResult Function()? reset,
    TResult Function()? goToPinEntry,
    TResult Function()? registryCheckFailed,
    required TResult orElse(),
  }) {
    if (pinFallback != null) {
      return pinFallback(pin, individualId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceGateCheckEnrollmentEvent value)
        checkEnrollment,
    required TResult Function(FaceGateAttemptFaceVerifyEvent value)
        attemptFaceVerify,
    required TResult Function(FaceGatePinFallbackEvent value) pinFallback,
    required TResult Function(FaceGateSkipToEnrollmentEvent value)
        skipToEnrollment,
    required TResult Function(FaceGateResetEvent value) reset,
    required TResult Function(FaceGateGoToPinEntryEvent value) goToPinEntry,
    required TResult Function(FaceGateRegistryCheckFailedEvent value)
        registryCheckFailed,
  }) {
    return pinFallback(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceGateCheckEnrollmentEvent value)? checkEnrollment,
    TResult? Function(FaceGateAttemptFaceVerifyEvent value)? attemptFaceVerify,
    TResult? Function(FaceGatePinFallbackEvent value)? pinFallback,
    TResult? Function(FaceGateSkipToEnrollmentEvent value)? skipToEnrollment,
    TResult? Function(FaceGateResetEvent value)? reset,
    TResult? Function(FaceGateGoToPinEntryEvent value)? goToPinEntry,
    TResult? Function(FaceGateRegistryCheckFailedEvent value)?
        registryCheckFailed,
  }) {
    return pinFallback?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceGateCheckEnrollmentEvent value)? checkEnrollment,
    TResult Function(FaceGateAttemptFaceVerifyEvent value)? attemptFaceVerify,
    TResult Function(FaceGatePinFallbackEvent value)? pinFallback,
    TResult Function(FaceGateSkipToEnrollmentEvent value)? skipToEnrollment,
    TResult Function(FaceGateResetEvent value)? reset,
    TResult Function(FaceGateGoToPinEntryEvent value)? goToPinEntry,
    TResult Function(FaceGateRegistryCheckFailedEvent value)?
        registryCheckFailed,
    required TResult orElse(),
  }) {
    if (pinFallback != null) {
      return pinFallback(this);
    }
    return orElse();
  }
}

abstract class FaceGatePinFallbackEvent implements FaceGateEvent {
  const factory FaceGatePinFallbackEvent(
      {required final String pin,
      required final String individualId}) = _$FaceGatePinFallbackEventImpl;

  String get pin;
  String get individualId;
  @JsonKey(ignore: true)
  _$$FaceGatePinFallbackEventImplCopyWith<_$FaceGatePinFallbackEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FaceGateSkipToEnrollmentEventImplCopyWith<$Res> {
  factory _$$FaceGateSkipToEnrollmentEventImplCopyWith(
          _$FaceGateSkipToEnrollmentEventImpl value,
          $Res Function(_$FaceGateSkipToEnrollmentEventImpl) then) =
      __$$FaceGateSkipToEnrollmentEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceGateSkipToEnrollmentEventImplCopyWithImpl<$Res>
    extends _$FaceGateEventCopyWithImpl<$Res,
        _$FaceGateSkipToEnrollmentEventImpl>
    implements _$$FaceGateSkipToEnrollmentEventImplCopyWith<$Res> {
  __$$FaceGateSkipToEnrollmentEventImplCopyWithImpl(
      _$FaceGateSkipToEnrollmentEventImpl _value,
      $Res Function(_$FaceGateSkipToEnrollmentEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceGateSkipToEnrollmentEventImpl
    with DiagnosticableTreeMixin
    implements FaceGateSkipToEnrollmentEvent {
  const _$FaceGateSkipToEnrollmentEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FaceGateEvent.skipToEnrollment()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'FaceGateEvent.skipToEnrollment'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceGateSkipToEnrollmentEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String individualId, bool skipWorkerCheck)
        checkEnrollment,
    required TResult Function(List<double> embedding, Uint8List? faceImageBytes)
        attemptFaceVerify,
    required TResult Function(String pin, String individualId) pinFallback,
    required TResult Function() skipToEnrollment,
    required TResult Function() reset,
    required TResult Function() goToPinEntry,
    required TResult Function() registryCheckFailed,
  }) {
    return skipToEnrollment();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String individualId, bool skipWorkerCheck)?
        checkEnrollment,
    TResult? Function(List<double> embedding, Uint8List? faceImageBytes)?
        attemptFaceVerify,
    TResult? Function(String pin, String individualId)? pinFallback,
    TResult? Function()? skipToEnrollment,
    TResult? Function()? reset,
    TResult? Function()? goToPinEntry,
    TResult? Function()? registryCheckFailed,
  }) {
    return skipToEnrollment?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String individualId, bool skipWorkerCheck)?
        checkEnrollment,
    TResult Function(List<double> embedding, Uint8List? faceImageBytes)?
        attemptFaceVerify,
    TResult Function(String pin, String individualId)? pinFallback,
    TResult Function()? skipToEnrollment,
    TResult Function()? reset,
    TResult Function()? goToPinEntry,
    TResult Function()? registryCheckFailed,
    required TResult orElse(),
  }) {
    if (skipToEnrollment != null) {
      return skipToEnrollment();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceGateCheckEnrollmentEvent value)
        checkEnrollment,
    required TResult Function(FaceGateAttemptFaceVerifyEvent value)
        attemptFaceVerify,
    required TResult Function(FaceGatePinFallbackEvent value) pinFallback,
    required TResult Function(FaceGateSkipToEnrollmentEvent value)
        skipToEnrollment,
    required TResult Function(FaceGateResetEvent value) reset,
    required TResult Function(FaceGateGoToPinEntryEvent value) goToPinEntry,
    required TResult Function(FaceGateRegistryCheckFailedEvent value)
        registryCheckFailed,
  }) {
    return skipToEnrollment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceGateCheckEnrollmentEvent value)? checkEnrollment,
    TResult? Function(FaceGateAttemptFaceVerifyEvent value)? attemptFaceVerify,
    TResult? Function(FaceGatePinFallbackEvent value)? pinFallback,
    TResult? Function(FaceGateSkipToEnrollmentEvent value)? skipToEnrollment,
    TResult? Function(FaceGateResetEvent value)? reset,
    TResult? Function(FaceGateGoToPinEntryEvent value)? goToPinEntry,
    TResult? Function(FaceGateRegistryCheckFailedEvent value)?
        registryCheckFailed,
  }) {
    return skipToEnrollment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceGateCheckEnrollmentEvent value)? checkEnrollment,
    TResult Function(FaceGateAttemptFaceVerifyEvent value)? attemptFaceVerify,
    TResult Function(FaceGatePinFallbackEvent value)? pinFallback,
    TResult Function(FaceGateSkipToEnrollmentEvent value)? skipToEnrollment,
    TResult Function(FaceGateResetEvent value)? reset,
    TResult Function(FaceGateGoToPinEntryEvent value)? goToPinEntry,
    TResult Function(FaceGateRegistryCheckFailedEvent value)?
        registryCheckFailed,
    required TResult orElse(),
  }) {
    if (skipToEnrollment != null) {
      return skipToEnrollment(this);
    }
    return orElse();
  }
}

abstract class FaceGateSkipToEnrollmentEvent implements FaceGateEvent {
  const factory FaceGateSkipToEnrollmentEvent() =
      _$FaceGateSkipToEnrollmentEventImpl;
}

/// @nodoc
abstract class _$$FaceGateResetEventImplCopyWith<$Res> {
  factory _$$FaceGateResetEventImplCopyWith(_$FaceGateResetEventImpl value,
          $Res Function(_$FaceGateResetEventImpl) then) =
      __$$FaceGateResetEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceGateResetEventImplCopyWithImpl<$Res>
    extends _$FaceGateEventCopyWithImpl<$Res, _$FaceGateResetEventImpl>
    implements _$$FaceGateResetEventImplCopyWith<$Res> {
  __$$FaceGateResetEventImplCopyWithImpl(_$FaceGateResetEventImpl _value,
      $Res Function(_$FaceGateResetEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceGateResetEventImpl
    with DiagnosticableTreeMixin
    implements FaceGateResetEvent {
  const _$FaceGateResetEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FaceGateEvent.reset()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'FaceGateEvent.reset'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FaceGateResetEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String individualId, bool skipWorkerCheck)
        checkEnrollment,
    required TResult Function(List<double> embedding, Uint8List? faceImageBytes)
        attemptFaceVerify,
    required TResult Function(String pin, String individualId) pinFallback,
    required TResult Function() skipToEnrollment,
    required TResult Function() reset,
    required TResult Function() goToPinEntry,
    required TResult Function() registryCheckFailed,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String individualId, bool skipWorkerCheck)?
        checkEnrollment,
    TResult? Function(List<double> embedding, Uint8List? faceImageBytes)?
        attemptFaceVerify,
    TResult? Function(String pin, String individualId)? pinFallback,
    TResult? Function()? skipToEnrollment,
    TResult? Function()? reset,
    TResult? Function()? goToPinEntry,
    TResult? Function()? registryCheckFailed,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String individualId, bool skipWorkerCheck)?
        checkEnrollment,
    TResult Function(List<double> embedding, Uint8List? faceImageBytes)?
        attemptFaceVerify,
    TResult Function(String pin, String individualId)? pinFallback,
    TResult Function()? skipToEnrollment,
    TResult Function()? reset,
    TResult Function()? goToPinEntry,
    TResult Function()? registryCheckFailed,
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
    required TResult Function(FaceGateCheckEnrollmentEvent value)
        checkEnrollment,
    required TResult Function(FaceGateAttemptFaceVerifyEvent value)
        attemptFaceVerify,
    required TResult Function(FaceGatePinFallbackEvent value) pinFallback,
    required TResult Function(FaceGateSkipToEnrollmentEvent value)
        skipToEnrollment,
    required TResult Function(FaceGateResetEvent value) reset,
    required TResult Function(FaceGateGoToPinEntryEvent value) goToPinEntry,
    required TResult Function(FaceGateRegistryCheckFailedEvent value)
        registryCheckFailed,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceGateCheckEnrollmentEvent value)? checkEnrollment,
    TResult? Function(FaceGateAttemptFaceVerifyEvent value)? attemptFaceVerify,
    TResult? Function(FaceGatePinFallbackEvent value)? pinFallback,
    TResult? Function(FaceGateSkipToEnrollmentEvent value)? skipToEnrollment,
    TResult? Function(FaceGateResetEvent value)? reset,
    TResult? Function(FaceGateGoToPinEntryEvent value)? goToPinEntry,
    TResult? Function(FaceGateRegistryCheckFailedEvent value)?
        registryCheckFailed,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceGateCheckEnrollmentEvent value)? checkEnrollment,
    TResult Function(FaceGateAttemptFaceVerifyEvent value)? attemptFaceVerify,
    TResult Function(FaceGatePinFallbackEvent value)? pinFallback,
    TResult Function(FaceGateSkipToEnrollmentEvent value)? skipToEnrollment,
    TResult Function(FaceGateResetEvent value)? reset,
    TResult Function(FaceGateGoToPinEntryEvent value)? goToPinEntry,
    TResult Function(FaceGateRegistryCheckFailedEvent value)?
        registryCheckFailed,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class FaceGateResetEvent implements FaceGateEvent {
  const factory FaceGateResetEvent() = _$FaceGateResetEventImpl;
}

/// @nodoc
abstract class _$$FaceGateGoToPinEntryEventImplCopyWith<$Res> {
  factory _$$FaceGateGoToPinEntryEventImplCopyWith(
          _$FaceGateGoToPinEntryEventImpl value,
          $Res Function(_$FaceGateGoToPinEntryEventImpl) then) =
      __$$FaceGateGoToPinEntryEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceGateGoToPinEntryEventImplCopyWithImpl<$Res>
    extends _$FaceGateEventCopyWithImpl<$Res, _$FaceGateGoToPinEntryEventImpl>
    implements _$$FaceGateGoToPinEntryEventImplCopyWith<$Res> {
  __$$FaceGateGoToPinEntryEventImplCopyWithImpl(
      _$FaceGateGoToPinEntryEventImpl _value,
      $Res Function(_$FaceGateGoToPinEntryEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceGateGoToPinEntryEventImpl
    with DiagnosticableTreeMixin
    implements FaceGateGoToPinEntryEvent {
  const _$FaceGateGoToPinEntryEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FaceGateEvent.goToPinEntry()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'FaceGateEvent.goToPinEntry'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceGateGoToPinEntryEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String individualId, bool skipWorkerCheck)
        checkEnrollment,
    required TResult Function(List<double> embedding, Uint8List? faceImageBytes)
        attemptFaceVerify,
    required TResult Function(String pin, String individualId) pinFallback,
    required TResult Function() skipToEnrollment,
    required TResult Function() reset,
    required TResult Function() goToPinEntry,
    required TResult Function() registryCheckFailed,
  }) {
    return goToPinEntry();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String individualId, bool skipWorkerCheck)?
        checkEnrollment,
    TResult? Function(List<double> embedding, Uint8List? faceImageBytes)?
        attemptFaceVerify,
    TResult? Function(String pin, String individualId)? pinFallback,
    TResult? Function()? skipToEnrollment,
    TResult? Function()? reset,
    TResult? Function()? goToPinEntry,
    TResult? Function()? registryCheckFailed,
  }) {
    return goToPinEntry?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String individualId, bool skipWorkerCheck)?
        checkEnrollment,
    TResult Function(List<double> embedding, Uint8List? faceImageBytes)?
        attemptFaceVerify,
    TResult Function(String pin, String individualId)? pinFallback,
    TResult Function()? skipToEnrollment,
    TResult Function()? reset,
    TResult Function()? goToPinEntry,
    TResult Function()? registryCheckFailed,
    required TResult orElse(),
  }) {
    if (goToPinEntry != null) {
      return goToPinEntry();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceGateCheckEnrollmentEvent value)
        checkEnrollment,
    required TResult Function(FaceGateAttemptFaceVerifyEvent value)
        attemptFaceVerify,
    required TResult Function(FaceGatePinFallbackEvent value) pinFallback,
    required TResult Function(FaceGateSkipToEnrollmentEvent value)
        skipToEnrollment,
    required TResult Function(FaceGateResetEvent value) reset,
    required TResult Function(FaceGateGoToPinEntryEvent value) goToPinEntry,
    required TResult Function(FaceGateRegistryCheckFailedEvent value)
        registryCheckFailed,
  }) {
    return goToPinEntry(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceGateCheckEnrollmentEvent value)? checkEnrollment,
    TResult? Function(FaceGateAttemptFaceVerifyEvent value)? attemptFaceVerify,
    TResult? Function(FaceGatePinFallbackEvent value)? pinFallback,
    TResult? Function(FaceGateSkipToEnrollmentEvent value)? skipToEnrollment,
    TResult? Function(FaceGateResetEvent value)? reset,
    TResult? Function(FaceGateGoToPinEntryEvent value)? goToPinEntry,
    TResult? Function(FaceGateRegistryCheckFailedEvent value)?
        registryCheckFailed,
  }) {
    return goToPinEntry?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceGateCheckEnrollmentEvent value)? checkEnrollment,
    TResult Function(FaceGateAttemptFaceVerifyEvent value)? attemptFaceVerify,
    TResult Function(FaceGatePinFallbackEvent value)? pinFallback,
    TResult Function(FaceGateSkipToEnrollmentEvent value)? skipToEnrollment,
    TResult Function(FaceGateResetEvent value)? reset,
    TResult Function(FaceGateGoToPinEntryEvent value)? goToPinEntry,
    TResult Function(FaceGateRegistryCheckFailedEvent value)?
        registryCheckFailed,
    required TResult orElse(),
  }) {
    if (goToPinEntry != null) {
      return goToPinEntry(this);
    }
    return orElse();
  }
}

abstract class FaceGateGoToPinEntryEvent implements FaceGateEvent {
  const factory FaceGateGoToPinEntryEvent() = _$FaceGateGoToPinEntryEventImpl;
}

/// @nodoc
abstract class _$$FaceGateRegistryCheckFailedEventImplCopyWith<$Res> {
  factory _$$FaceGateRegistryCheckFailedEventImplCopyWith(
          _$FaceGateRegistryCheckFailedEventImpl value,
          $Res Function(_$FaceGateRegistryCheckFailedEventImpl) then) =
      __$$FaceGateRegistryCheckFailedEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceGateRegistryCheckFailedEventImplCopyWithImpl<$Res>
    extends _$FaceGateEventCopyWithImpl<$Res,
        _$FaceGateRegistryCheckFailedEventImpl>
    implements _$$FaceGateRegistryCheckFailedEventImplCopyWith<$Res> {
  __$$FaceGateRegistryCheckFailedEventImplCopyWithImpl(
      _$FaceGateRegistryCheckFailedEventImpl _value,
      $Res Function(_$FaceGateRegistryCheckFailedEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceGateRegistryCheckFailedEventImpl
    with DiagnosticableTreeMixin
    implements FaceGateRegistryCheckFailedEvent {
  const _$FaceGateRegistryCheckFailedEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FaceGateEvent.registryCheckFailed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'FaceGateEvent.registryCheckFailed'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceGateRegistryCheckFailedEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String individualId, bool skipWorkerCheck)
        checkEnrollment,
    required TResult Function(List<double> embedding, Uint8List? faceImageBytes)
        attemptFaceVerify,
    required TResult Function(String pin, String individualId) pinFallback,
    required TResult Function() skipToEnrollment,
    required TResult Function() reset,
    required TResult Function() goToPinEntry,
    required TResult Function() registryCheckFailed,
  }) {
    return registryCheckFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String individualId, bool skipWorkerCheck)?
        checkEnrollment,
    TResult? Function(List<double> embedding, Uint8List? faceImageBytes)?
        attemptFaceVerify,
    TResult? Function(String pin, String individualId)? pinFallback,
    TResult? Function()? skipToEnrollment,
    TResult? Function()? reset,
    TResult? Function()? goToPinEntry,
    TResult? Function()? registryCheckFailed,
  }) {
    return registryCheckFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String individualId, bool skipWorkerCheck)?
        checkEnrollment,
    TResult Function(List<double> embedding, Uint8List? faceImageBytes)?
        attemptFaceVerify,
    TResult Function(String pin, String individualId)? pinFallback,
    TResult Function()? skipToEnrollment,
    TResult Function()? reset,
    TResult Function()? goToPinEntry,
    TResult Function()? registryCheckFailed,
    required TResult orElse(),
  }) {
    if (registryCheckFailed != null) {
      return registryCheckFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceGateCheckEnrollmentEvent value)
        checkEnrollment,
    required TResult Function(FaceGateAttemptFaceVerifyEvent value)
        attemptFaceVerify,
    required TResult Function(FaceGatePinFallbackEvent value) pinFallback,
    required TResult Function(FaceGateSkipToEnrollmentEvent value)
        skipToEnrollment,
    required TResult Function(FaceGateResetEvent value) reset,
    required TResult Function(FaceGateGoToPinEntryEvent value) goToPinEntry,
    required TResult Function(FaceGateRegistryCheckFailedEvent value)
        registryCheckFailed,
  }) {
    return registryCheckFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceGateCheckEnrollmentEvent value)? checkEnrollment,
    TResult? Function(FaceGateAttemptFaceVerifyEvent value)? attemptFaceVerify,
    TResult? Function(FaceGatePinFallbackEvent value)? pinFallback,
    TResult? Function(FaceGateSkipToEnrollmentEvent value)? skipToEnrollment,
    TResult? Function(FaceGateResetEvent value)? reset,
    TResult? Function(FaceGateGoToPinEntryEvent value)? goToPinEntry,
    TResult? Function(FaceGateRegistryCheckFailedEvent value)?
        registryCheckFailed,
  }) {
    return registryCheckFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceGateCheckEnrollmentEvent value)? checkEnrollment,
    TResult Function(FaceGateAttemptFaceVerifyEvent value)? attemptFaceVerify,
    TResult Function(FaceGatePinFallbackEvent value)? pinFallback,
    TResult Function(FaceGateSkipToEnrollmentEvent value)? skipToEnrollment,
    TResult Function(FaceGateResetEvent value)? reset,
    TResult Function(FaceGateGoToPinEntryEvent value)? goToPinEntry,
    TResult Function(FaceGateRegistryCheckFailedEvent value)?
        registryCheckFailed,
    required TResult orElse(),
  }) {
    if (registryCheckFailed != null) {
      return registryCheckFailed(this);
    }
    return orElse();
  }
}

abstract class FaceGateRegistryCheckFailedEvent implements FaceGateEvent {
  const factory FaceGateRegistryCheckFailedEvent() =
      _$FaceGateRegistryCheckFailedEventImpl;
}

/// @nodoc
mixin _$FaceGateState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() notEnrolled,
    required TResult Function() scanning,
    required TResult Function(
            int attemptNumber, int maxAttempts, double confidence)
        rejected,
    required TResult Function(String reason) fallbackRequired,
    required TResult Function() pinEntry,
    required TResult Function(String individualId, String method,
            double confidence, Uint8List? faceImageBytes)
        passed,
    required TResult Function(String message) error,
    required TResult Function() registryCheckFailed,
    required TResult Function() workerNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? notEnrolled,
    TResult? Function()? scanning,
    TResult? Function(int attemptNumber, int maxAttempts, double confidence)?
        rejected,
    TResult? Function(String reason)? fallbackRequired,
    TResult? Function()? pinEntry,
    TResult? Function(String individualId, String method, double confidence,
            Uint8List? faceImageBytes)?
        passed,
    TResult? Function(String message)? error,
    TResult? Function()? registryCheckFailed,
    TResult? Function()? workerNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? notEnrolled,
    TResult Function()? scanning,
    TResult Function(int attemptNumber, int maxAttempts, double confidence)?
        rejected,
    TResult Function(String reason)? fallbackRequired,
    TResult Function()? pinEntry,
    TResult Function(String individualId, String method, double confidence,
            Uint8List? faceImageBytes)?
        passed,
    TResult Function(String message)? error,
    TResult Function()? registryCheckFailed,
    TResult Function()? workerNotFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceGateInitialState value) initial,
    required TResult Function(FaceGateNotEnrolledState value) notEnrolled,
    required TResult Function(FaceGateScanningState value) scanning,
    required TResult Function(FaceGateRejectedState value) rejected,
    required TResult Function(FaceGateFallbackRequiredState value)
        fallbackRequired,
    required TResult Function(FaceGatePinEntryState value) pinEntry,
    required TResult Function(FaceGatePassedState value) passed,
    required TResult Function(FaceGateErrorState value) error,
    required TResult Function(FaceGateRegistryCheckFailedState value)
        registryCheckFailed,
    required TResult Function(FaceGateWorkerNotFoundState value) workerNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceGateInitialState value)? initial,
    TResult? Function(FaceGateNotEnrolledState value)? notEnrolled,
    TResult? Function(FaceGateScanningState value)? scanning,
    TResult? Function(FaceGateRejectedState value)? rejected,
    TResult? Function(FaceGateFallbackRequiredState value)? fallbackRequired,
    TResult? Function(FaceGatePinEntryState value)? pinEntry,
    TResult? Function(FaceGatePassedState value)? passed,
    TResult? Function(FaceGateErrorState value)? error,
    TResult? Function(FaceGateRegistryCheckFailedState value)?
        registryCheckFailed,
    TResult? Function(FaceGateWorkerNotFoundState value)? workerNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceGateInitialState value)? initial,
    TResult Function(FaceGateNotEnrolledState value)? notEnrolled,
    TResult Function(FaceGateScanningState value)? scanning,
    TResult Function(FaceGateRejectedState value)? rejected,
    TResult Function(FaceGateFallbackRequiredState value)? fallbackRequired,
    TResult Function(FaceGatePinEntryState value)? pinEntry,
    TResult Function(FaceGatePassedState value)? passed,
    TResult Function(FaceGateErrorState value)? error,
    TResult Function(FaceGateRegistryCheckFailedState value)?
        registryCheckFailed,
    TResult Function(FaceGateWorkerNotFoundState value)? workerNotFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaceGateStateCopyWith<$Res> {
  factory $FaceGateStateCopyWith(
          FaceGateState value, $Res Function(FaceGateState) then) =
      _$FaceGateStateCopyWithImpl<$Res, FaceGateState>;
}

/// @nodoc
class _$FaceGateStateCopyWithImpl<$Res, $Val extends FaceGateState>
    implements $FaceGateStateCopyWith<$Res> {
  _$FaceGateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FaceGateInitialStateImplCopyWith<$Res> {
  factory _$$FaceGateInitialStateImplCopyWith(_$FaceGateInitialStateImpl value,
          $Res Function(_$FaceGateInitialStateImpl) then) =
      __$$FaceGateInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceGateInitialStateImplCopyWithImpl<$Res>
    extends _$FaceGateStateCopyWithImpl<$Res, _$FaceGateInitialStateImpl>
    implements _$$FaceGateInitialStateImplCopyWith<$Res> {
  __$$FaceGateInitialStateImplCopyWithImpl(_$FaceGateInitialStateImpl _value,
      $Res Function(_$FaceGateInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceGateInitialStateImpl
    with DiagnosticableTreeMixin
    implements FaceGateInitialState {
  const _$FaceGateInitialStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FaceGateState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'FaceGateState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceGateInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() notEnrolled,
    required TResult Function() scanning,
    required TResult Function(
            int attemptNumber, int maxAttempts, double confidence)
        rejected,
    required TResult Function(String reason) fallbackRequired,
    required TResult Function() pinEntry,
    required TResult Function(String individualId, String method,
            double confidence, Uint8List? faceImageBytes)
        passed,
    required TResult Function(String message) error,
    required TResult Function() registryCheckFailed,
    required TResult Function() workerNotFound,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? notEnrolled,
    TResult? Function()? scanning,
    TResult? Function(int attemptNumber, int maxAttempts, double confidence)?
        rejected,
    TResult? Function(String reason)? fallbackRequired,
    TResult? Function()? pinEntry,
    TResult? Function(String individualId, String method, double confidence,
            Uint8List? faceImageBytes)?
        passed,
    TResult? Function(String message)? error,
    TResult? Function()? registryCheckFailed,
    TResult? Function()? workerNotFound,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? notEnrolled,
    TResult Function()? scanning,
    TResult Function(int attemptNumber, int maxAttempts, double confidence)?
        rejected,
    TResult Function(String reason)? fallbackRequired,
    TResult Function()? pinEntry,
    TResult Function(String individualId, String method, double confidence,
            Uint8List? faceImageBytes)?
        passed,
    TResult Function(String message)? error,
    TResult Function()? registryCheckFailed,
    TResult Function()? workerNotFound,
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
    required TResult Function(FaceGateInitialState value) initial,
    required TResult Function(FaceGateNotEnrolledState value) notEnrolled,
    required TResult Function(FaceGateScanningState value) scanning,
    required TResult Function(FaceGateRejectedState value) rejected,
    required TResult Function(FaceGateFallbackRequiredState value)
        fallbackRequired,
    required TResult Function(FaceGatePinEntryState value) pinEntry,
    required TResult Function(FaceGatePassedState value) passed,
    required TResult Function(FaceGateErrorState value) error,
    required TResult Function(FaceGateRegistryCheckFailedState value)
        registryCheckFailed,
    required TResult Function(FaceGateWorkerNotFoundState value) workerNotFound,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceGateInitialState value)? initial,
    TResult? Function(FaceGateNotEnrolledState value)? notEnrolled,
    TResult? Function(FaceGateScanningState value)? scanning,
    TResult? Function(FaceGateRejectedState value)? rejected,
    TResult? Function(FaceGateFallbackRequiredState value)? fallbackRequired,
    TResult? Function(FaceGatePinEntryState value)? pinEntry,
    TResult? Function(FaceGatePassedState value)? passed,
    TResult? Function(FaceGateErrorState value)? error,
    TResult? Function(FaceGateRegistryCheckFailedState value)?
        registryCheckFailed,
    TResult? Function(FaceGateWorkerNotFoundState value)? workerNotFound,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceGateInitialState value)? initial,
    TResult Function(FaceGateNotEnrolledState value)? notEnrolled,
    TResult Function(FaceGateScanningState value)? scanning,
    TResult Function(FaceGateRejectedState value)? rejected,
    TResult Function(FaceGateFallbackRequiredState value)? fallbackRequired,
    TResult Function(FaceGatePinEntryState value)? pinEntry,
    TResult Function(FaceGatePassedState value)? passed,
    TResult Function(FaceGateErrorState value)? error,
    TResult Function(FaceGateRegistryCheckFailedState value)?
        registryCheckFailed,
    TResult Function(FaceGateWorkerNotFoundState value)? workerNotFound,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class FaceGateInitialState implements FaceGateState {
  const factory FaceGateInitialState() = _$FaceGateInitialStateImpl;
}

/// @nodoc
abstract class _$$FaceGateNotEnrolledStateImplCopyWith<$Res> {
  factory _$$FaceGateNotEnrolledStateImplCopyWith(
          _$FaceGateNotEnrolledStateImpl value,
          $Res Function(_$FaceGateNotEnrolledStateImpl) then) =
      __$$FaceGateNotEnrolledStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceGateNotEnrolledStateImplCopyWithImpl<$Res>
    extends _$FaceGateStateCopyWithImpl<$Res, _$FaceGateNotEnrolledStateImpl>
    implements _$$FaceGateNotEnrolledStateImplCopyWith<$Res> {
  __$$FaceGateNotEnrolledStateImplCopyWithImpl(
      _$FaceGateNotEnrolledStateImpl _value,
      $Res Function(_$FaceGateNotEnrolledStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceGateNotEnrolledStateImpl
    with DiagnosticableTreeMixin
    implements FaceGateNotEnrolledState {
  const _$FaceGateNotEnrolledStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FaceGateState.notEnrolled()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'FaceGateState.notEnrolled'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceGateNotEnrolledStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() notEnrolled,
    required TResult Function() scanning,
    required TResult Function(
            int attemptNumber, int maxAttempts, double confidence)
        rejected,
    required TResult Function(String reason) fallbackRequired,
    required TResult Function() pinEntry,
    required TResult Function(String individualId, String method,
            double confidence, Uint8List? faceImageBytes)
        passed,
    required TResult Function(String message) error,
    required TResult Function() registryCheckFailed,
    required TResult Function() workerNotFound,
  }) {
    return notEnrolled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? notEnrolled,
    TResult? Function()? scanning,
    TResult? Function(int attemptNumber, int maxAttempts, double confidence)?
        rejected,
    TResult? Function(String reason)? fallbackRequired,
    TResult? Function()? pinEntry,
    TResult? Function(String individualId, String method, double confidence,
            Uint8List? faceImageBytes)?
        passed,
    TResult? Function(String message)? error,
    TResult? Function()? registryCheckFailed,
    TResult? Function()? workerNotFound,
  }) {
    return notEnrolled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? notEnrolled,
    TResult Function()? scanning,
    TResult Function(int attemptNumber, int maxAttempts, double confidence)?
        rejected,
    TResult Function(String reason)? fallbackRequired,
    TResult Function()? pinEntry,
    TResult Function(String individualId, String method, double confidence,
            Uint8List? faceImageBytes)?
        passed,
    TResult Function(String message)? error,
    TResult Function()? registryCheckFailed,
    TResult Function()? workerNotFound,
    required TResult orElse(),
  }) {
    if (notEnrolled != null) {
      return notEnrolled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceGateInitialState value) initial,
    required TResult Function(FaceGateNotEnrolledState value) notEnrolled,
    required TResult Function(FaceGateScanningState value) scanning,
    required TResult Function(FaceGateRejectedState value) rejected,
    required TResult Function(FaceGateFallbackRequiredState value)
        fallbackRequired,
    required TResult Function(FaceGatePinEntryState value) pinEntry,
    required TResult Function(FaceGatePassedState value) passed,
    required TResult Function(FaceGateErrorState value) error,
    required TResult Function(FaceGateRegistryCheckFailedState value)
        registryCheckFailed,
    required TResult Function(FaceGateWorkerNotFoundState value) workerNotFound,
  }) {
    return notEnrolled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceGateInitialState value)? initial,
    TResult? Function(FaceGateNotEnrolledState value)? notEnrolled,
    TResult? Function(FaceGateScanningState value)? scanning,
    TResult? Function(FaceGateRejectedState value)? rejected,
    TResult? Function(FaceGateFallbackRequiredState value)? fallbackRequired,
    TResult? Function(FaceGatePinEntryState value)? pinEntry,
    TResult? Function(FaceGatePassedState value)? passed,
    TResult? Function(FaceGateErrorState value)? error,
    TResult? Function(FaceGateRegistryCheckFailedState value)?
        registryCheckFailed,
    TResult? Function(FaceGateWorkerNotFoundState value)? workerNotFound,
  }) {
    return notEnrolled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceGateInitialState value)? initial,
    TResult Function(FaceGateNotEnrolledState value)? notEnrolled,
    TResult Function(FaceGateScanningState value)? scanning,
    TResult Function(FaceGateRejectedState value)? rejected,
    TResult Function(FaceGateFallbackRequiredState value)? fallbackRequired,
    TResult Function(FaceGatePinEntryState value)? pinEntry,
    TResult Function(FaceGatePassedState value)? passed,
    TResult Function(FaceGateErrorState value)? error,
    TResult Function(FaceGateRegistryCheckFailedState value)?
        registryCheckFailed,
    TResult Function(FaceGateWorkerNotFoundState value)? workerNotFound,
    required TResult orElse(),
  }) {
    if (notEnrolled != null) {
      return notEnrolled(this);
    }
    return orElse();
  }
}

abstract class FaceGateNotEnrolledState implements FaceGateState {
  const factory FaceGateNotEnrolledState() = _$FaceGateNotEnrolledStateImpl;
}

/// @nodoc
abstract class _$$FaceGateScanningStateImplCopyWith<$Res> {
  factory _$$FaceGateScanningStateImplCopyWith(
          _$FaceGateScanningStateImpl value,
          $Res Function(_$FaceGateScanningStateImpl) then) =
      __$$FaceGateScanningStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceGateScanningStateImplCopyWithImpl<$Res>
    extends _$FaceGateStateCopyWithImpl<$Res, _$FaceGateScanningStateImpl>
    implements _$$FaceGateScanningStateImplCopyWith<$Res> {
  __$$FaceGateScanningStateImplCopyWithImpl(_$FaceGateScanningStateImpl _value,
      $Res Function(_$FaceGateScanningStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceGateScanningStateImpl
    with DiagnosticableTreeMixin
    implements FaceGateScanningState {
  const _$FaceGateScanningStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FaceGateState.scanning()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'FaceGateState.scanning'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceGateScanningStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() notEnrolled,
    required TResult Function() scanning,
    required TResult Function(
            int attemptNumber, int maxAttempts, double confidence)
        rejected,
    required TResult Function(String reason) fallbackRequired,
    required TResult Function() pinEntry,
    required TResult Function(String individualId, String method,
            double confidence, Uint8List? faceImageBytes)
        passed,
    required TResult Function(String message) error,
    required TResult Function() registryCheckFailed,
    required TResult Function() workerNotFound,
  }) {
    return scanning();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? notEnrolled,
    TResult? Function()? scanning,
    TResult? Function(int attemptNumber, int maxAttempts, double confidence)?
        rejected,
    TResult? Function(String reason)? fallbackRequired,
    TResult? Function()? pinEntry,
    TResult? Function(String individualId, String method, double confidence,
            Uint8List? faceImageBytes)?
        passed,
    TResult? Function(String message)? error,
    TResult? Function()? registryCheckFailed,
    TResult? Function()? workerNotFound,
  }) {
    return scanning?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? notEnrolled,
    TResult Function()? scanning,
    TResult Function(int attemptNumber, int maxAttempts, double confidence)?
        rejected,
    TResult Function(String reason)? fallbackRequired,
    TResult Function()? pinEntry,
    TResult Function(String individualId, String method, double confidence,
            Uint8List? faceImageBytes)?
        passed,
    TResult Function(String message)? error,
    TResult Function()? registryCheckFailed,
    TResult Function()? workerNotFound,
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
    required TResult Function(FaceGateInitialState value) initial,
    required TResult Function(FaceGateNotEnrolledState value) notEnrolled,
    required TResult Function(FaceGateScanningState value) scanning,
    required TResult Function(FaceGateRejectedState value) rejected,
    required TResult Function(FaceGateFallbackRequiredState value)
        fallbackRequired,
    required TResult Function(FaceGatePinEntryState value) pinEntry,
    required TResult Function(FaceGatePassedState value) passed,
    required TResult Function(FaceGateErrorState value) error,
    required TResult Function(FaceGateRegistryCheckFailedState value)
        registryCheckFailed,
    required TResult Function(FaceGateWorkerNotFoundState value) workerNotFound,
  }) {
    return scanning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceGateInitialState value)? initial,
    TResult? Function(FaceGateNotEnrolledState value)? notEnrolled,
    TResult? Function(FaceGateScanningState value)? scanning,
    TResult? Function(FaceGateRejectedState value)? rejected,
    TResult? Function(FaceGateFallbackRequiredState value)? fallbackRequired,
    TResult? Function(FaceGatePinEntryState value)? pinEntry,
    TResult? Function(FaceGatePassedState value)? passed,
    TResult? Function(FaceGateErrorState value)? error,
    TResult? Function(FaceGateRegistryCheckFailedState value)?
        registryCheckFailed,
    TResult? Function(FaceGateWorkerNotFoundState value)? workerNotFound,
  }) {
    return scanning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceGateInitialState value)? initial,
    TResult Function(FaceGateNotEnrolledState value)? notEnrolled,
    TResult Function(FaceGateScanningState value)? scanning,
    TResult Function(FaceGateRejectedState value)? rejected,
    TResult Function(FaceGateFallbackRequiredState value)? fallbackRequired,
    TResult Function(FaceGatePinEntryState value)? pinEntry,
    TResult Function(FaceGatePassedState value)? passed,
    TResult Function(FaceGateErrorState value)? error,
    TResult Function(FaceGateRegistryCheckFailedState value)?
        registryCheckFailed,
    TResult Function(FaceGateWorkerNotFoundState value)? workerNotFound,
    required TResult orElse(),
  }) {
    if (scanning != null) {
      return scanning(this);
    }
    return orElse();
  }
}

abstract class FaceGateScanningState implements FaceGateState {
  const factory FaceGateScanningState() = _$FaceGateScanningStateImpl;
}

/// @nodoc
abstract class _$$FaceGateRejectedStateImplCopyWith<$Res> {
  factory _$$FaceGateRejectedStateImplCopyWith(
          _$FaceGateRejectedStateImpl value,
          $Res Function(_$FaceGateRejectedStateImpl) then) =
      __$$FaceGateRejectedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int attemptNumber, int maxAttempts, double confidence});
}

/// @nodoc
class __$$FaceGateRejectedStateImplCopyWithImpl<$Res>
    extends _$FaceGateStateCopyWithImpl<$Res, _$FaceGateRejectedStateImpl>
    implements _$$FaceGateRejectedStateImplCopyWith<$Res> {
  __$$FaceGateRejectedStateImplCopyWithImpl(_$FaceGateRejectedStateImpl _value,
      $Res Function(_$FaceGateRejectedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attemptNumber = null,
    Object? maxAttempts = null,
    Object? confidence = null,
  }) {
    return _then(_$FaceGateRejectedStateImpl(
      attemptNumber: null == attemptNumber
          ? _value.attemptNumber
          : attemptNumber // ignore: cast_nullable_to_non_nullable
              as int,
      maxAttempts: null == maxAttempts
          ? _value.maxAttempts
          : maxAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$FaceGateRejectedStateImpl
    with DiagnosticableTreeMixin
    implements FaceGateRejectedState {
  const _$FaceGateRejectedStateImpl(
      {required this.attemptNumber,
      required this.maxAttempts,
      this.confidence = 0.0});

  @override
  final int attemptNumber;
  @override
  final int maxAttempts;
  @override
  @JsonKey()
  final double confidence;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FaceGateState.rejected(attemptNumber: $attemptNumber, maxAttempts: $maxAttempts, confidence: $confidence)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FaceGateState.rejected'))
      ..add(DiagnosticsProperty('attemptNumber', attemptNumber))
      ..add(DiagnosticsProperty('maxAttempts', maxAttempts))
      ..add(DiagnosticsProperty('confidence', confidence));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceGateRejectedStateImpl &&
            (identical(other.attemptNumber, attemptNumber) ||
                other.attemptNumber == attemptNumber) &&
            (identical(other.maxAttempts, maxAttempts) ||
                other.maxAttempts == maxAttempts) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, attemptNumber, maxAttempts, confidence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceGateRejectedStateImplCopyWith<_$FaceGateRejectedStateImpl>
      get copyWith => __$$FaceGateRejectedStateImplCopyWithImpl<
          _$FaceGateRejectedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() notEnrolled,
    required TResult Function() scanning,
    required TResult Function(
            int attemptNumber, int maxAttempts, double confidence)
        rejected,
    required TResult Function(String reason) fallbackRequired,
    required TResult Function() pinEntry,
    required TResult Function(String individualId, String method,
            double confidence, Uint8List? faceImageBytes)
        passed,
    required TResult Function(String message) error,
    required TResult Function() registryCheckFailed,
    required TResult Function() workerNotFound,
  }) {
    return rejected(attemptNumber, maxAttempts, confidence);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? notEnrolled,
    TResult? Function()? scanning,
    TResult? Function(int attemptNumber, int maxAttempts, double confidence)?
        rejected,
    TResult? Function(String reason)? fallbackRequired,
    TResult? Function()? pinEntry,
    TResult? Function(String individualId, String method, double confidence,
            Uint8List? faceImageBytes)?
        passed,
    TResult? Function(String message)? error,
    TResult? Function()? registryCheckFailed,
    TResult? Function()? workerNotFound,
  }) {
    return rejected?.call(attemptNumber, maxAttempts, confidence);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? notEnrolled,
    TResult Function()? scanning,
    TResult Function(int attemptNumber, int maxAttempts, double confidence)?
        rejected,
    TResult Function(String reason)? fallbackRequired,
    TResult Function()? pinEntry,
    TResult Function(String individualId, String method, double confidence,
            Uint8List? faceImageBytes)?
        passed,
    TResult Function(String message)? error,
    TResult Function()? registryCheckFailed,
    TResult Function()? workerNotFound,
    required TResult orElse(),
  }) {
    if (rejected != null) {
      return rejected(attemptNumber, maxAttempts, confidence);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceGateInitialState value) initial,
    required TResult Function(FaceGateNotEnrolledState value) notEnrolled,
    required TResult Function(FaceGateScanningState value) scanning,
    required TResult Function(FaceGateRejectedState value) rejected,
    required TResult Function(FaceGateFallbackRequiredState value)
        fallbackRequired,
    required TResult Function(FaceGatePinEntryState value) pinEntry,
    required TResult Function(FaceGatePassedState value) passed,
    required TResult Function(FaceGateErrorState value) error,
    required TResult Function(FaceGateRegistryCheckFailedState value)
        registryCheckFailed,
    required TResult Function(FaceGateWorkerNotFoundState value) workerNotFound,
  }) {
    return rejected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceGateInitialState value)? initial,
    TResult? Function(FaceGateNotEnrolledState value)? notEnrolled,
    TResult? Function(FaceGateScanningState value)? scanning,
    TResult? Function(FaceGateRejectedState value)? rejected,
    TResult? Function(FaceGateFallbackRequiredState value)? fallbackRequired,
    TResult? Function(FaceGatePinEntryState value)? pinEntry,
    TResult? Function(FaceGatePassedState value)? passed,
    TResult? Function(FaceGateErrorState value)? error,
    TResult? Function(FaceGateRegistryCheckFailedState value)?
        registryCheckFailed,
    TResult? Function(FaceGateWorkerNotFoundState value)? workerNotFound,
  }) {
    return rejected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceGateInitialState value)? initial,
    TResult Function(FaceGateNotEnrolledState value)? notEnrolled,
    TResult Function(FaceGateScanningState value)? scanning,
    TResult Function(FaceGateRejectedState value)? rejected,
    TResult Function(FaceGateFallbackRequiredState value)? fallbackRequired,
    TResult Function(FaceGatePinEntryState value)? pinEntry,
    TResult Function(FaceGatePassedState value)? passed,
    TResult Function(FaceGateErrorState value)? error,
    TResult Function(FaceGateRegistryCheckFailedState value)?
        registryCheckFailed,
    TResult Function(FaceGateWorkerNotFoundState value)? workerNotFound,
    required TResult orElse(),
  }) {
    if (rejected != null) {
      return rejected(this);
    }
    return orElse();
  }
}

abstract class FaceGateRejectedState implements FaceGateState {
  const factory FaceGateRejectedState(
      {required final int attemptNumber,
      required final int maxAttempts,
      final double confidence}) = _$FaceGateRejectedStateImpl;

  int get attemptNumber;
  int get maxAttempts;
  double get confidence;
  @JsonKey(ignore: true)
  _$$FaceGateRejectedStateImplCopyWith<_$FaceGateRejectedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FaceGateFallbackRequiredStateImplCopyWith<$Res> {
  factory _$$FaceGateFallbackRequiredStateImplCopyWith(
          _$FaceGateFallbackRequiredStateImpl value,
          $Res Function(_$FaceGateFallbackRequiredStateImpl) then) =
      __$$FaceGateFallbackRequiredStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String reason});
}

/// @nodoc
class __$$FaceGateFallbackRequiredStateImplCopyWithImpl<$Res>
    extends _$FaceGateStateCopyWithImpl<$Res,
        _$FaceGateFallbackRequiredStateImpl>
    implements _$$FaceGateFallbackRequiredStateImplCopyWith<$Res> {
  __$$FaceGateFallbackRequiredStateImplCopyWithImpl(
      _$FaceGateFallbackRequiredStateImpl _value,
      $Res Function(_$FaceGateFallbackRequiredStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
  }) {
    return _then(_$FaceGateFallbackRequiredStateImpl(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FaceGateFallbackRequiredStateImpl
    with DiagnosticableTreeMixin
    implements FaceGateFallbackRequiredState {
  const _$FaceGateFallbackRequiredStateImpl({required this.reason});

  @override
  final String reason;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FaceGateState.fallbackRequired(reason: $reason)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FaceGateState.fallbackRequired'))
      ..add(DiagnosticsProperty('reason', reason));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceGateFallbackRequiredStateImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceGateFallbackRequiredStateImplCopyWith<
          _$FaceGateFallbackRequiredStateImpl>
      get copyWith => __$$FaceGateFallbackRequiredStateImplCopyWithImpl<
          _$FaceGateFallbackRequiredStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() notEnrolled,
    required TResult Function() scanning,
    required TResult Function(
            int attemptNumber, int maxAttempts, double confidence)
        rejected,
    required TResult Function(String reason) fallbackRequired,
    required TResult Function() pinEntry,
    required TResult Function(String individualId, String method,
            double confidence, Uint8List? faceImageBytes)
        passed,
    required TResult Function(String message) error,
    required TResult Function() registryCheckFailed,
    required TResult Function() workerNotFound,
  }) {
    return fallbackRequired(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? notEnrolled,
    TResult? Function()? scanning,
    TResult? Function(int attemptNumber, int maxAttempts, double confidence)?
        rejected,
    TResult? Function(String reason)? fallbackRequired,
    TResult? Function()? pinEntry,
    TResult? Function(String individualId, String method, double confidence,
            Uint8List? faceImageBytes)?
        passed,
    TResult? Function(String message)? error,
    TResult? Function()? registryCheckFailed,
    TResult? Function()? workerNotFound,
  }) {
    return fallbackRequired?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? notEnrolled,
    TResult Function()? scanning,
    TResult Function(int attemptNumber, int maxAttempts, double confidence)?
        rejected,
    TResult Function(String reason)? fallbackRequired,
    TResult Function()? pinEntry,
    TResult Function(String individualId, String method, double confidence,
            Uint8List? faceImageBytes)?
        passed,
    TResult Function(String message)? error,
    TResult Function()? registryCheckFailed,
    TResult Function()? workerNotFound,
    required TResult orElse(),
  }) {
    if (fallbackRequired != null) {
      return fallbackRequired(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceGateInitialState value) initial,
    required TResult Function(FaceGateNotEnrolledState value) notEnrolled,
    required TResult Function(FaceGateScanningState value) scanning,
    required TResult Function(FaceGateRejectedState value) rejected,
    required TResult Function(FaceGateFallbackRequiredState value)
        fallbackRequired,
    required TResult Function(FaceGatePinEntryState value) pinEntry,
    required TResult Function(FaceGatePassedState value) passed,
    required TResult Function(FaceGateErrorState value) error,
    required TResult Function(FaceGateRegistryCheckFailedState value)
        registryCheckFailed,
    required TResult Function(FaceGateWorkerNotFoundState value) workerNotFound,
  }) {
    return fallbackRequired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceGateInitialState value)? initial,
    TResult? Function(FaceGateNotEnrolledState value)? notEnrolled,
    TResult? Function(FaceGateScanningState value)? scanning,
    TResult? Function(FaceGateRejectedState value)? rejected,
    TResult? Function(FaceGateFallbackRequiredState value)? fallbackRequired,
    TResult? Function(FaceGatePinEntryState value)? pinEntry,
    TResult? Function(FaceGatePassedState value)? passed,
    TResult? Function(FaceGateErrorState value)? error,
    TResult? Function(FaceGateRegistryCheckFailedState value)?
        registryCheckFailed,
    TResult? Function(FaceGateWorkerNotFoundState value)? workerNotFound,
  }) {
    return fallbackRequired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceGateInitialState value)? initial,
    TResult Function(FaceGateNotEnrolledState value)? notEnrolled,
    TResult Function(FaceGateScanningState value)? scanning,
    TResult Function(FaceGateRejectedState value)? rejected,
    TResult Function(FaceGateFallbackRequiredState value)? fallbackRequired,
    TResult Function(FaceGatePinEntryState value)? pinEntry,
    TResult Function(FaceGatePassedState value)? passed,
    TResult Function(FaceGateErrorState value)? error,
    TResult Function(FaceGateRegistryCheckFailedState value)?
        registryCheckFailed,
    TResult Function(FaceGateWorkerNotFoundState value)? workerNotFound,
    required TResult orElse(),
  }) {
    if (fallbackRequired != null) {
      return fallbackRequired(this);
    }
    return orElse();
  }
}

abstract class FaceGateFallbackRequiredState implements FaceGateState {
  const factory FaceGateFallbackRequiredState({required final String reason}) =
      _$FaceGateFallbackRequiredStateImpl;

  String get reason;
  @JsonKey(ignore: true)
  _$$FaceGateFallbackRequiredStateImplCopyWith<
          _$FaceGateFallbackRequiredStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FaceGatePinEntryStateImplCopyWith<$Res> {
  factory _$$FaceGatePinEntryStateImplCopyWith(
          _$FaceGatePinEntryStateImpl value,
          $Res Function(_$FaceGatePinEntryStateImpl) then) =
      __$$FaceGatePinEntryStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceGatePinEntryStateImplCopyWithImpl<$Res>
    extends _$FaceGateStateCopyWithImpl<$Res, _$FaceGatePinEntryStateImpl>
    implements _$$FaceGatePinEntryStateImplCopyWith<$Res> {
  __$$FaceGatePinEntryStateImplCopyWithImpl(_$FaceGatePinEntryStateImpl _value,
      $Res Function(_$FaceGatePinEntryStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceGatePinEntryStateImpl
    with DiagnosticableTreeMixin
    implements FaceGatePinEntryState {
  const _$FaceGatePinEntryStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FaceGateState.pinEntry()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'FaceGateState.pinEntry'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceGatePinEntryStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() notEnrolled,
    required TResult Function() scanning,
    required TResult Function(
            int attemptNumber, int maxAttempts, double confidence)
        rejected,
    required TResult Function(String reason) fallbackRequired,
    required TResult Function() pinEntry,
    required TResult Function(String individualId, String method,
            double confidence, Uint8List? faceImageBytes)
        passed,
    required TResult Function(String message) error,
    required TResult Function() registryCheckFailed,
    required TResult Function() workerNotFound,
  }) {
    return pinEntry();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? notEnrolled,
    TResult? Function()? scanning,
    TResult? Function(int attemptNumber, int maxAttempts, double confidence)?
        rejected,
    TResult? Function(String reason)? fallbackRequired,
    TResult? Function()? pinEntry,
    TResult? Function(String individualId, String method, double confidence,
            Uint8List? faceImageBytes)?
        passed,
    TResult? Function(String message)? error,
    TResult? Function()? registryCheckFailed,
    TResult? Function()? workerNotFound,
  }) {
    return pinEntry?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? notEnrolled,
    TResult Function()? scanning,
    TResult Function(int attemptNumber, int maxAttempts, double confidence)?
        rejected,
    TResult Function(String reason)? fallbackRequired,
    TResult Function()? pinEntry,
    TResult Function(String individualId, String method, double confidence,
            Uint8List? faceImageBytes)?
        passed,
    TResult Function(String message)? error,
    TResult Function()? registryCheckFailed,
    TResult Function()? workerNotFound,
    required TResult orElse(),
  }) {
    if (pinEntry != null) {
      return pinEntry();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceGateInitialState value) initial,
    required TResult Function(FaceGateNotEnrolledState value) notEnrolled,
    required TResult Function(FaceGateScanningState value) scanning,
    required TResult Function(FaceGateRejectedState value) rejected,
    required TResult Function(FaceGateFallbackRequiredState value)
        fallbackRequired,
    required TResult Function(FaceGatePinEntryState value) pinEntry,
    required TResult Function(FaceGatePassedState value) passed,
    required TResult Function(FaceGateErrorState value) error,
    required TResult Function(FaceGateRegistryCheckFailedState value)
        registryCheckFailed,
    required TResult Function(FaceGateWorkerNotFoundState value) workerNotFound,
  }) {
    return pinEntry(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceGateInitialState value)? initial,
    TResult? Function(FaceGateNotEnrolledState value)? notEnrolled,
    TResult? Function(FaceGateScanningState value)? scanning,
    TResult? Function(FaceGateRejectedState value)? rejected,
    TResult? Function(FaceGateFallbackRequiredState value)? fallbackRequired,
    TResult? Function(FaceGatePinEntryState value)? pinEntry,
    TResult? Function(FaceGatePassedState value)? passed,
    TResult? Function(FaceGateErrorState value)? error,
    TResult? Function(FaceGateRegistryCheckFailedState value)?
        registryCheckFailed,
    TResult? Function(FaceGateWorkerNotFoundState value)? workerNotFound,
  }) {
    return pinEntry?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceGateInitialState value)? initial,
    TResult Function(FaceGateNotEnrolledState value)? notEnrolled,
    TResult Function(FaceGateScanningState value)? scanning,
    TResult Function(FaceGateRejectedState value)? rejected,
    TResult Function(FaceGateFallbackRequiredState value)? fallbackRequired,
    TResult Function(FaceGatePinEntryState value)? pinEntry,
    TResult Function(FaceGatePassedState value)? passed,
    TResult Function(FaceGateErrorState value)? error,
    TResult Function(FaceGateRegistryCheckFailedState value)?
        registryCheckFailed,
    TResult Function(FaceGateWorkerNotFoundState value)? workerNotFound,
    required TResult orElse(),
  }) {
    if (pinEntry != null) {
      return pinEntry(this);
    }
    return orElse();
  }
}

abstract class FaceGatePinEntryState implements FaceGateState {
  const factory FaceGatePinEntryState() = _$FaceGatePinEntryStateImpl;
}

/// @nodoc
abstract class _$$FaceGatePassedStateImplCopyWith<$Res> {
  factory _$$FaceGatePassedStateImplCopyWith(_$FaceGatePassedStateImpl value,
          $Res Function(_$FaceGatePassedStateImpl) then) =
      __$$FaceGatePassedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String individualId,
      String method,
      double confidence,
      Uint8List? faceImageBytes});
}

/// @nodoc
class __$$FaceGatePassedStateImplCopyWithImpl<$Res>
    extends _$FaceGateStateCopyWithImpl<$Res, _$FaceGatePassedStateImpl>
    implements _$$FaceGatePassedStateImplCopyWith<$Res> {
  __$$FaceGatePassedStateImplCopyWithImpl(_$FaceGatePassedStateImpl _value,
      $Res Function(_$FaceGatePassedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? individualId = null,
    Object? method = null,
    Object? confidence = null,
    Object? faceImageBytes = freezed,
  }) {
    return _then(_$FaceGatePassedStateImpl(
      individualId: null == individualId
          ? _value.individualId
          : individualId // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      faceImageBytes: freezed == faceImageBytes
          ? _value.faceImageBytes
          : faceImageBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$FaceGatePassedStateImpl
    with DiagnosticableTreeMixin
    implements FaceGatePassedState {
  const _$FaceGatePassedStateImpl(
      {required this.individualId,
      required this.method,
      this.confidence = 0.0,
      this.faceImageBytes});

  @override
  final String individualId;
  @override
  final String method;
  @override
  @JsonKey()
  final double confidence;
  @override
  final Uint8List? faceImageBytes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FaceGateState.passed(individualId: $individualId, method: $method, confidence: $confidence, faceImageBytes: $faceImageBytes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FaceGateState.passed'))
      ..add(DiagnosticsProperty('individualId', individualId))
      ..add(DiagnosticsProperty('method', method))
      ..add(DiagnosticsProperty('confidence', confidence))
      ..add(DiagnosticsProperty('faceImageBytes', faceImageBytes));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceGatePassedStateImpl &&
            (identical(other.individualId, individualId) ||
                other.individualId == individualId) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            const DeepCollectionEquality()
                .equals(other.faceImageBytes, faceImageBytes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, individualId, method, confidence,
      const DeepCollectionEquality().hash(faceImageBytes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceGatePassedStateImplCopyWith<_$FaceGatePassedStateImpl> get copyWith =>
      __$$FaceGatePassedStateImplCopyWithImpl<_$FaceGatePassedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() notEnrolled,
    required TResult Function() scanning,
    required TResult Function(
            int attemptNumber, int maxAttempts, double confidence)
        rejected,
    required TResult Function(String reason) fallbackRequired,
    required TResult Function() pinEntry,
    required TResult Function(String individualId, String method,
            double confidence, Uint8List? faceImageBytes)
        passed,
    required TResult Function(String message) error,
    required TResult Function() registryCheckFailed,
    required TResult Function() workerNotFound,
  }) {
    return passed(individualId, method, confidence, faceImageBytes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? notEnrolled,
    TResult? Function()? scanning,
    TResult? Function(int attemptNumber, int maxAttempts, double confidence)?
        rejected,
    TResult? Function(String reason)? fallbackRequired,
    TResult? Function()? pinEntry,
    TResult? Function(String individualId, String method, double confidence,
            Uint8List? faceImageBytes)?
        passed,
    TResult? Function(String message)? error,
    TResult? Function()? registryCheckFailed,
    TResult? Function()? workerNotFound,
  }) {
    return passed?.call(individualId, method, confidence, faceImageBytes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? notEnrolled,
    TResult Function()? scanning,
    TResult Function(int attemptNumber, int maxAttempts, double confidence)?
        rejected,
    TResult Function(String reason)? fallbackRequired,
    TResult Function()? pinEntry,
    TResult Function(String individualId, String method, double confidence,
            Uint8List? faceImageBytes)?
        passed,
    TResult Function(String message)? error,
    TResult Function()? registryCheckFailed,
    TResult Function()? workerNotFound,
    required TResult orElse(),
  }) {
    if (passed != null) {
      return passed(individualId, method, confidence, faceImageBytes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceGateInitialState value) initial,
    required TResult Function(FaceGateNotEnrolledState value) notEnrolled,
    required TResult Function(FaceGateScanningState value) scanning,
    required TResult Function(FaceGateRejectedState value) rejected,
    required TResult Function(FaceGateFallbackRequiredState value)
        fallbackRequired,
    required TResult Function(FaceGatePinEntryState value) pinEntry,
    required TResult Function(FaceGatePassedState value) passed,
    required TResult Function(FaceGateErrorState value) error,
    required TResult Function(FaceGateRegistryCheckFailedState value)
        registryCheckFailed,
    required TResult Function(FaceGateWorkerNotFoundState value) workerNotFound,
  }) {
    return passed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceGateInitialState value)? initial,
    TResult? Function(FaceGateNotEnrolledState value)? notEnrolled,
    TResult? Function(FaceGateScanningState value)? scanning,
    TResult? Function(FaceGateRejectedState value)? rejected,
    TResult? Function(FaceGateFallbackRequiredState value)? fallbackRequired,
    TResult? Function(FaceGatePinEntryState value)? pinEntry,
    TResult? Function(FaceGatePassedState value)? passed,
    TResult? Function(FaceGateErrorState value)? error,
    TResult? Function(FaceGateRegistryCheckFailedState value)?
        registryCheckFailed,
    TResult? Function(FaceGateWorkerNotFoundState value)? workerNotFound,
  }) {
    return passed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceGateInitialState value)? initial,
    TResult Function(FaceGateNotEnrolledState value)? notEnrolled,
    TResult Function(FaceGateScanningState value)? scanning,
    TResult Function(FaceGateRejectedState value)? rejected,
    TResult Function(FaceGateFallbackRequiredState value)? fallbackRequired,
    TResult Function(FaceGatePinEntryState value)? pinEntry,
    TResult Function(FaceGatePassedState value)? passed,
    TResult Function(FaceGateErrorState value)? error,
    TResult Function(FaceGateRegistryCheckFailedState value)?
        registryCheckFailed,
    TResult Function(FaceGateWorkerNotFoundState value)? workerNotFound,
    required TResult orElse(),
  }) {
    if (passed != null) {
      return passed(this);
    }
    return orElse();
  }
}

abstract class FaceGatePassedState implements FaceGateState {
  const factory FaceGatePassedState(
      {required final String individualId,
      required final String method,
      final double confidence,
      final Uint8List? faceImageBytes}) = _$FaceGatePassedStateImpl;

  String get individualId;
  String get method;
  double get confidence;
  Uint8List? get faceImageBytes;
  @JsonKey(ignore: true)
  _$$FaceGatePassedStateImplCopyWith<_$FaceGatePassedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FaceGateErrorStateImplCopyWith<$Res> {
  factory _$$FaceGateErrorStateImplCopyWith(_$FaceGateErrorStateImpl value,
          $Res Function(_$FaceGateErrorStateImpl) then) =
      __$$FaceGateErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FaceGateErrorStateImplCopyWithImpl<$Res>
    extends _$FaceGateStateCopyWithImpl<$Res, _$FaceGateErrorStateImpl>
    implements _$$FaceGateErrorStateImplCopyWith<$Res> {
  __$$FaceGateErrorStateImplCopyWithImpl(_$FaceGateErrorStateImpl _value,
      $Res Function(_$FaceGateErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FaceGateErrorStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FaceGateErrorStateImpl
    with DiagnosticableTreeMixin
    implements FaceGateErrorState {
  const _$FaceGateErrorStateImpl({required this.message});

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FaceGateState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FaceGateState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceGateErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceGateErrorStateImplCopyWith<_$FaceGateErrorStateImpl> get copyWith =>
      __$$FaceGateErrorStateImplCopyWithImpl<_$FaceGateErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() notEnrolled,
    required TResult Function() scanning,
    required TResult Function(
            int attemptNumber, int maxAttempts, double confidence)
        rejected,
    required TResult Function(String reason) fallbackRequired,
    required TResult Function() pinEntry,
    required TResult Function(String individualId, String method,
            double confidence, Uint8List? faceImageBytes)
        passed,
    required TResult Function(String message) error,
    required TResult Function() registryCheckFailed,
    required TResult Function() workerNotFound,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? notEnrolled,
    TResult? Function()? scanning,
    TResult? Function(int attemptNumber, int maxAttempts, double confidence)?
        rejected,
    TResult? Function(String reason)? fallbackRequired,
    TResult? Function()? pinEntry,
    TResult? Function(String individualId, String method, double confidence,
            Uint8List? faceImageBytes)?
        passed,
    TResult? Function(String message)? error,
    TResult? Function()? registryCheckFailed,
    TResult? Function()? workerNotFound,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? notEnrolled,
    TResult Function()? scanning,
    TResult Function(int attemptNumber, int maxAttempts, double confidence)?
        rejected,
    TResult Function(String reason)? fallbackRequired,
    TResult Function()? pinEntry,
    TResult Function(String individualId, String method, double confidence,
            Uint8List? faceImageBytes)?
        passed,
    TResult Function(String message)? error,
    TResult Function()? registryCheckFailed,
    TResult Function()? workerNotFound,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceGateInitialState value) initial,
    required TResult Function(FaceGateNotEnrolledState value) notEnrolled,
    required TResult Function(FaceGateScanningState value) scanning,
    required TResult Function(FaceGateRejectedState value) rejected,
    required TResult Function(FaceGateFallbackRequiredState value)
        fallbackRequired,
    required TResult Function(FaceGatePinEntryState value) pinEntry,
    required TResult Function(FaceGatePassedState value) passed,
    required TResult Function(FaceGateErrorState value) error,
    required TResult Function(FaceGateRegistryCheckFailedState value)
        registryCheckFailed,
    required TResult Function(FaceGateWorkerNotFoundState value) workerNotFound,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceGateInitialState value)? initial,
    TResult? Function(FaceGateNotEnrolledState value)? notEnrolled,
    TResult? Function(FaceGateScanningState value)? scanning,
    TResult? Function(FaceGateRejectedState value)? rejected,
    TResult? Function(FaceGateFallbackRequiredState value)? fallbackRequired,
    TResult? Function(FaceGatePinEntryState value)? pinEntry,
    TResult? Function(FaceGatePassedState value)? passed,
    TResult? Function(FaceGateErrorState value)? error,
    TResult? Function(FaceGateRegistryCheckFailedState value)?
        registryCheckFailed,
    TResult? Function(FaceGateWorkerNotFoundState value)? workerNotFound,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceGateInitialState value)? initial,
    TResult Function(FaceGateNotEnrolledState value)? notEnrolled,
    TResult Function(FaceGateScanningState value)? scanning,
    TResult Function(FaceGateRejectedState value)? rejected,
    TResult Function(FaceGateFallbackRequiredState value)? fallbackRequired,
    TResult Function(FaceGatePinEntryState value)? pinEntry,
    TResult Function(FaceGatePassedState value)? passed,
    TResult Function(FaceGateErrorState value)? error,
    TResult Function(FaceGateRegistryCheckFailedState value)?
        registryCheckFailed,
    TResult Function(FaceGateWorkerNotFoundState value)? workerNotFound,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FaceGateErrorState implements FaceGateState {
  const factory FaceGateErrorState({required final String message}) =
      _$FaceGateErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FaceGateErrorStateImplCopyWith<_$FaceGateErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FaceGateRegistryCheckFailedStateImplCopyWith<$Res> {
  factory _$$FaceGateRegistryCheckFailedStateImplCopyWith(
          _$FaceGateRegistryCheckFailedStateImpl value,
          $Res Function(_$FaceGateRegistryCheckFailedStateImpl) then) =
      __$$FaceGateRegistryCheckFailedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceGateRegistryCheckFailedStateImplCopyWithImpl<$Res>
    extends _$FaceGateStateCopyWithImpl<$Res,
        _$FaceGateRegistryCheckFailedStateImpl>
    implements _$$FaceGateRegistryCheckFailedStateImplCopyWith<$Res> {
  __$$FaceGateRegistryCheckFailedStateImplCopyWithImpl(
      _$FaceGateRegistryCheckFailedStateImpl _value,
      $Res Function(_$FaceGateRegistryCheckFailedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceGateRegistryCheckFailedStateImpl
    with DiagnosticableTreeMixin
    implements FaceGateRegistryCheckFailedState {
  const _$FaceGateRegistryCheckFailedStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FaceGateState.registryCheckFailed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'FaceGateState.registryCheckFailed'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceGateRegistryCheckFailedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() notEnrolled,
    required TResult Function() scanning,
    required TResult Function(
            int attemptNumber, int maxAttempts, double confidence)
        rejected,
    required TResult Function(String reason) fallbackRequired,
    required TResult Function() pinEntry,
    required TResult Function(String individualId, String method,
            double confidence, Uint8List? faceImageBytes)
        passed,
    required TResult Function(String message) error,
    required TResult Function() registryCheckFailed,
    required TResult Function() workerNotFound,
  }) {
    return registryCheckFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? notEnrolled,
    TResult? Function()? scanning,
    TResult? Function(int attemptNumber, int maxAttempts, double confidence)?
        rejected,
    TResult? Function(String reason)? fallbackRequired,
    TResult? Function()? pinEntry,
    TResult? Function(String individualId, String method, double confidence,
            Uint8List? faceImageBytes)?
        passed,
    TResult? Function(String message)? error,
    TResult? Function()? registryCheckFailed,
    TResult? Function()? workerNotFound,
  }) {
    return registryCheckFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? notEnrolled,
    TResult Function()? scanning,
    TResult Function(int attemptNumber, int maxAttempts, double confidence)?
        rejected,
    TResult Function(String reason)? fallbackRequired,
    TResult Function()? pinEntry,
    TResult Function(String individualId, String method, double confidence,
            Uint8List? faceImageBytes)?
        passed,
    TResult Function(String message)? error,
    TResult Function()? registryCheckFailed,
    TResult Function()? workerNotFound,
    required TResult orElse(),
  }) {
    if (registryCheckFailed != null) {
      return registryCheckFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceGateInitialState value) initial,
    required TResult Function(FaceGateNotEnrolledState value) notEnrolled,
    required TResult Function(FaceGateScanningState value) scanning,
    required TResult Function(FaceGateRejectedState value) rejected,
    required TResult Function(FaceGateFallbackRequiredState value)
        fallbackRequired,
    required TResult Function(FaceGatePinEntryState value) pinEntry,
    required TResult Function(FaceGatePassedState value) passed,
    required TResult Function(FaceGateErrorState value) error,
    required TResult Function(FaceGateRegistryCheckFailedState value)
        registryCheckFailed,
    required TResult Function(FaceGateWorkerNotFoundState value) workerNotFound,
  }) {
    return registryCheckFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceGateInitialState value)? initial,
    TResult? Function(FaceGateNotEnrolledState value)? notEnrolled,
    TResult? Function(FaceGateScanningState value)? scanning,
    TResult? Function(FaceGateRejectedState value)? rejected,
    TResult? Function(FaceGateFallbackRequiredState value)? fallbackRequired,
    TResult? Function(FaceGatePinEntryState value)? pinEntry,
    TResult? Function(FaceGatePassedState value)? passed,
    TResult? Function(FaceGateErrorState value)? error,
    TResult? Function(FaceGateRegistryCheckFailedState value)?
        registryCheckFailed,
    TResult? Function(FaceGateWorkerNotFoundState value)? workerNotFound,
  }) {
    return registryCheckFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceGateInitialState value)? initial,
    TResult Function(FaceGateNotEnrolledState value)? notEnrolled,
    TResult Function(FaceGateScanningState value)? scanning,
    TResult Function(FaceGateRejectedState value)? rejected,
    TResult Function(FaceGateFallbackRequiredState value)? fallbackRequired,
    TResult Function(FaceGatePinEntryState value)? pinEntry,
    TResult Function(FaceGatePassedState value)? passed,
    TResult Function(FaceGateErrorState value)? error,
    TResult Function(FaceGateRegistryCheckFailedState value)?
        registryCheckFailed,
    TResult Function(FaceGateWorkerNotFoundState value)? workerNotFound,
    required TResult orElse(),
  }) {
    if (registryCheckFailed != null) {
      return registryCheckFailed(this);
    }
    return orElse();
  }
}

abstract class FaceGateRegistryCheckFailedState implements FaceGateState {
  const factory FaceGateRegistryCheckFailedState() =
      _$FaceGateRegistryCheckFailedStateImpl;
}

/// @nodoc
abstract class _$$FaceGateWorkerNotFoundStateImplCopyWith<$Res> {
  factory _$$FaceGateWorkerNotFoundStateImplCopyWith(
          _$FaceGateWorkerNotFoundStateImpl value,
          $Res Function(_$FaceGateWorkerNotFoundStateImpl) then) =
      __$$FaceGateWorkerNotFoundStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceGateWorkerNotFoundStateImplCopyWithImpl<$Res>
    extends _$FaceGateStateCopyWithImpl<$Res, _$FaceGateWorkerNotFoundStateImpl>
    implements _$$FaceGateWorkerNotFoundStateImplCopyWith<$Res> {
  __$$FaceGateWorkerNotFoundStateImplCopyWithImpl(
      _$FaceGateWorkerNotFoundStateImpl _value,
      $Res Function(_$FaceGateWorkerNotFoundStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceGateWorkerNotFoundStateImpl
    with DiagnosticableTreeMixin
    implements FaceGateWorkerNotFoundState {
  const _$FaceGateWorkerNotFoundStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FaceGateState.workerNotFound()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'FaceGateState.workerNotFound'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceGateWorkerNotFoundStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() notEnrolled,
    required TResult Function() scanning,
    required TResult Function(
            int attemptNumber, int maxAttempts, double confidence)
        rejected,
    required TResult Function(String reason) fallbackRequired,
    required TResult Function() pinEntry,
    required TResult Function(String individualId, String method,
            double confidence, Uint8List? faceImageBytes)
        passed,
    required TResult Function(String message) error,
    required TResult Function() registryCheckFailed,
    required TResult Function() workerNotFound,
  }) {
    return workerNotFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? notEnrolled,
    TResult? Function()? scanning,
    TResult? Function(int attemptNumber, int maxAttempts, double confidence)?
        rejected,
    TResult? Function(String reason)? fallbackRequired,
    TResult? Function()? pinEntry,
    TResult? Function(String individualId, String method, double confidence,
            Uint8List? faceImageBytes)?
        passed,
    TResult? Function(String message)? error,
    TResult? Function()? registryCheckFailed,
    TResult? Function()? workerNotFound,
  }) {
    return workerNotFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? notEnrolled,
    TResult Function()? scanning,
    TResult Function(int attemptNumber, int maxAttempts, double confidence)?
        rejected,
    TResult Function(String reason)? fallbackRequired,
    TResult Function()? pinEntry,
    TResult Function(String individualId, String method, double confidence,
            Uint8List? faceImageBytes)?
        passed,
    TResult Function(String message)? error,
    TResult Function()? registryCheckFailed,
    TResult Function()? workerNotFound,
    required TResult orElse(),
  }) {
    if (workerNotFound != null) {
      return workerNotFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceGateInitialState value) initial,
    required TResult Function(FaceGateNotEnrolledState value) notEnrolled,
    required TResult Function(FaceGateScanningState value) scanning,
    required TResult Function(FaceGateRejectedState value) rejected,
    required TResult Function(FaceGateFallbackRequiredState value)
        fallbackRequired,
    required TResult Function(FaceGatePinEntryState value) pinEntry,
    required TResult Function(FaceGatePassedState value) passed,
    required TResult Function(FaceGateErrorState value) error,
    required TResult Function(FaceGateRegistryCheckFailedState value)
        registryCheckFailed,
    required TResult Function(FaceGateWorkerNotFoundState value) workerNotFound,
  }) {
    return workerNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceGateInitialState value)? initial,
    TResult? Function(FaceGateNotEnrolledState value)? notEnrolled,
    TResult? Function(FaceGateScanningState value)? scanning,
    TResult? Function(FaceGateRejectedState value)? rejected,
    TResult? Function(FaceGateFallbackRequiredState value)? fallbackRequired,
    TResult? Function(FaceGatePinEntryState value)? pinEntry,
    TResult? Function(FaceGatePassedState value)? passed,
    TResult? Function(FaceGateErrorState value)? error,
    TResult? Function(FaceGateRegistryCheckFailedState value)?
        registryCheckFailed,
    TResult? Function(FaceGateWorkerNotFoundState value)? workerNotFound,
  }) {
    return workerNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceGateInitialState value)? initial,
    TResult Function(FaceGateNotEnrolledState value)? notEnrolled,
    TResult Function(FaceGateScanningState value)? scanning,
    TResult Function(FaceGateRejectedState value)? rejected,
    TResult Function(FaceGateFallbackRequiredState value)? fallbackRequired,
    TResult Function(FaceGatePinEntryState value)? pinEntry,
    TResult Function(FaceGatePassedState value)? passed,
    TResult Function(FaceGateErrorState value)? error,
    TResult Function(FaceGateRegistryCheckFailedState value)?
        registryCheckFailed,
    TResult Function(FaceGateWorkerNotFoundState value)? workerNotFound,
    required TResult orElse(),
  }) {
    if (workerNotFound != null) {
      return workerNotFound(this);
    }
    return orElse();
  }
}

abstract class FaceGateWorkerNotFoundState implements FaceGateState {
  const factory FaceGateWorkerNotFoundState() =
      _$FaceGateWorkerNotFoundStateImpl;
}
