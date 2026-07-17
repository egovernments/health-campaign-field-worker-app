// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_enrollment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FaceEnrollmentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String individualId, bool isSystemUser, String enrolledBy)
        start,
    required TResult Function(List<double> embedding, double quality)
        captureAngle,
    required TResult Function() livenessCompleted,
    required TResult Function() retryAngle,
    required TResult Function() confirmPin,
    required TResult Function() complete,
    required TResult Function() cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String individualId, bool isSystemUser, String enrolledBy)?
        start,
    TResult? Function(List<double> embedding, double quality)? captureAngle,
    TResult? Function()? livenessCompleted,
    TResult? Function()? retryAngle,
    TResult? Function()? confirmPin,
    TResult? Function()? complete,
    TResult? Function()? cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String individualId, bool isSystemUser, String enrolledBy)?
        start,
    TResult Function(List<double> embedding, double quality)? captureAngle,
    TResult Function()? livenessCompleted,
    TResult Function()? retryAngle,
    TResult Function()? confirmPin,
    TResult Function()? complete,
    TResult Function()? cancel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceEnrollmentStartEvent value) start,
    required TResult Function(FaceEnrollmentCaptureAngleEvent value)
        captureAngle,
    required TResult Function(FaceEnrollmentLivenessCompletedEvent value)
        livenessCompleted,
    required TResult Function(FaceEnrollmentRetryAngleEvent value) retryAngle,
    required TResult Function(FaceEnrollmentConfirmPinEvent value) confirmPin,
    required TResult Function(FaceEnrollmentCompleteEvent value) complete,
    required TResult Function(FaceEnrollmentCancelEvent value) cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceEnrollmentStartEvent value)? start,
    TResult? Function(FaceEnrollmentCaptureAngleEvent value)? captureAngle,
    TResult? Function(FaceEnrollmentLivenessCompletedEvent value)?
        livenessCompleted,
    TResult? Function(FaceEnrollmentRetryAngleEvent value)? retryAngle,
    TResult? Function(FaceEnrollmentConfirmPinEvent value)? confirmPin,
    TResult? Function(FaceEnrollmentCompleteEvent value)? complete,
    TResult? Function(FaceEnrollmentCancelEvent value)? cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceEnrollmentStartEvent value)? start,
    TResult Function(FaceEnrollmentCaptureAngleEvent value)? captureAngle,
    TResult Function(FaceEnrollmentLivenessCompletedEvent value)?
        livenessCompleted,
    TResult Function(FaceEnrollmentRetryAngleEvent value)? retryAngle,
    TResult Function(FaceEnrollmentConfirmPinEvent value)? confirmPin,
    TResult Function(FaceEnrollmentCompleteEvent value)? complete,
    TResult Function(FaceEnrollmentCancelEvent value)? cancel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaceEnrollmentEventCopyWith<$Res> {
  factory $FaceEnrollmentEventCopyWith(
          FaceEnrollmentEvent value, $Res Function(FaceEnrollmentEvent) then) =
      _$FaceEnrollmentEventCopyWithImpl<$Res, FaceEnrollmentEvent>;
}

/// @nodoc
class _$FaceEnrollmentEventCopyWithImpl<$Res, $Val extends FaceEnrollmentEvent>
    implements $FaceEnrollmentEventCopyWith<$Res> {
  _$FaceEnrollmentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FaceEnrollmentStartEventImplCopyWith<$Res> {
  factory _$$FaceEnrollmentStartEventImplCopyWith(
          _$FaceEnrollmentStartEventImpl value,
          $Res Function(_$FaceEnrollmentStartEventImpl) then) =
      __$$FaceEnrollmentStartEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String individualId, bool isSystemUser, String enrolledBy});
}

/// @nodoc
class __$$FaceEnrollmentStartEventImplCopyWithImpl<$Res>
    extends _$FaceEnrollmentEventCopyWithImpl<$Res,
        _$FaceEnrollmentStartEventImpl>
    implements _$$FaceEnrollmentStartEventImplCopyWith<$Res> {
  __$$FaceEnrollmentStartEventImplCopyWithImpl(
      _$FaceEnrollmentStartEventImpl _value,
      $Res Function(_$FaceEnrollmentStartEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? individualId = null,
    Object? isSystemUser = null,
    Object? enrolledBy = null,
  }) {
    return _then(_$FaceEnrollmentStartEventImpl(
      individualId: null == individualId
          ? _value.individualId
          : individualId // ignore: cast_nullable_to_non_nullable
              as String,
      isSystemUser: null == isSystemUser
          ? _value.isSystemUser
          : isSystemUser // ignore: cast_nullable_to_non_nullable
              as bool,
      enrolledBy: null == enrolledBy
          ? _value.enrolledBy
          : enrolledBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FaceEnrollmentStartEventImpl implements FaceEnrollmentStartEvent {
  const _$FaceEnrollmentStartEventImpl(
      {required this.individualId,
      required this.isSystemUser,
      required this.enrolledBy});

  @override
  final String individualId;
  @override
  final bool isSystemUser;
  @override
  final String enrolledBy;

  @override
  String toString() {
    return 'FaceEnrollmentEvent.start(individualId: $individualId, isSystemUser: $isSystemUser, enrolledBy: $enrolledBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceEnrollmentStartEventImpl &&
            (identical(other.individualId, individualId) ||
                other.individualId == individualId) &&
            (identical(other.isSystemUser, isSystemUser) ||
                other.isSystemUser == isSystemUser) &&
            (identical(other.enrolledBy, enrolledBy) ||
                other.enrolledBy == enrolledBy));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, individualId, isSystemUser, enrolledBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceEnrollmentStartEventImplCopyWith<_$FaceEnrollmentStartEventImpl>
      get copyWith => __$$FaceEnrollmentStartEventImplCopyWithImpl<
          _$FaceEnrollmentStartEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String individualId, bool isSystemUser, String enrolledBy)
        start,
    required TResult Function(List<double> embedding, double quality)
        captureAngle,
    required TResult Function() livenessCompleted,
    required TResult Function() retryAngle,
    required TResult Function() confirmPin,
    required TResult Function() complete,
    required TResult Function() cancel,
  }) {
    return start(individualId, isSystemUser, enrolledBy);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String individualId, bool isSystemUser, String enrolledBy)?
        start,
    TResult? Function(List<double> embedding, double quality)? captureAngle,
    TResult? Function()? livenessCompleted,
    TResult? Function()? retryAngle,
    TResult? Function()? confirmPin,
    TResult? Function()? complete,
    TResult? Function()? cancel,
  }) {
    return start?.call(individualId, isSystemUser, enrolledBy);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String individualId, bool isSystemUser, String enrolledBy)?
        start,
    TResult Function(List<double> embedding, double quality)? captureAngle,
    TResult Function()? livenessCompleted,
    TResult Function()? retryAngle,
    TResult Function()? confirmPin,
    TResult Function()? complete,
    TResult Function()? cancel,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(individualId, isSystemUser, enrolledBy);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceEnrollmentStartEvent value) start,
    required TResult Function(FaceEnrollmentCaptureAngleEvent value)
        captureAngle,
    required TResult Function(FaceEnrollmentLivenessCompletedEvent value)
        livenessCompleted,
    required TResult Function(FaceEnrollmentRetryAngleEvent value) retryAngle,
    required TResult Function(FaceEnrollmentConfirmPinEvent value) confirmPin,
    required TResult Function(FaceEnrollmentCompleteEvent value) complete,
    required TResult Function(FaceEnrollmentCancelEvent value) cancel,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceEnrollmentStartEvent value)? start,
    TResult? Function(FaceEnrollmentCaptureAngleEvent value)? captureAngle,
    TResult? Function(FaceEnrollmentLivenessCompletedEvent value)?
        livenessCompleted,
    TResult? Function(FaceEnrollmentRetryAngleEvent value)? retryAngle,
    TResult? Function(FaceEnrollmentConfirmPinEvent value)? confirmPin,
    TResult? Function(FaceEnrollmentCompleteEvent value)? complete,
    TResult? Function(FaceEnrollmentCancelEvent value)? cancel,
  }) {
    return start?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceEnrollmentStartEvent value)? start,
    TResult Function(FaceEnrollmentCaptureAngleEvent value)? captureAngle,
    TResult Function(FaceEnrollmentLivenessCompletedEvent value)?
        livenessCompleted,
    TResult Function(FaceEnrollmentRetryAngleEvent value)? retryAngle,
    TResult Function(FaceEnrollmentConfirmPinEvent value)? confirmPin,
    TResult Function(FaceEnrollmentCompleteEvent value)? complete,
    TResult Function(FaceEnrollmentCancelEvent value)? cancel,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class FaceEnrollmentStartEvent implements FaceEnrollmentEvent {
  const factory FaceEnrollmentStartEvent(
      {required final String individualId,
      required final bool isSystemUser,
      required final String enrolledBy}) = _$FaceEnrollmentStartEventImpl;

  String get individualId;
  bool get isSystemUser;
  String get enrolledBy;
  @JsonKey(ignore: true)
  _$$FaceEnrollmentStartEventImplCopyWith<_$FaceEnrollmentStartEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FaceEnrollmentCaptureAngleEventImplCopyWith<$Res> {
  factory _$$FaceEnrollmentCaptureAngleEventImplCopyWith(
          _$FaceEnrollmentCaptureAngleEventImpl value,
          $Res Function(_$FaceEnrollmentCaptureAngleEventImpl) then) =
      __$$FaceEnrollmentCaptureAngleEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<double> embedding, double quality});
}

/// @nodoc
class __$$FaceEnrollmentCaptureAngleEventImplCopyWithImpl<$Res>
    extends _$FaceEnrollmentEventCopyWithImpl<$Res,
        _$FaceEnrollmentCaptureAngleEventImpl>
    implements _$$FaceEnrollmentCaptureAngleEventImplCopyWith<$Res> {
  __$$FaceEnrollmentCaptureAngleEventImplCopyWithImpl(
      _$FaceEnrollmentCaptureAngleEventImpl _value,
      $Res Function(_$FaceEnrollmentCaptureAngleEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? embedding = null,
    Object? quality = null,
  }) {
    return _then(_$FaceEnrollmentCaptureAngleEventImpl(
      embedding: null == embedding
          ? _value._embedding
          : embedding // ignore: cast_nullable_to_non_nullable
              as List<double>,
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$FaceEnrollmentCaptureAngleEventImpl
    implements FaceEnrollmentCaptureAngleEvent {
  const _$FaceEnrollmentCaptureAngleEventImpl(
      {required final List<double> embedding, required this.quality})
      : _embedding = embedding;

  final List<double> _embedding;
  @override
  List<double> get embedding {
    if (_embedding is EqualUnmodifiableListView) return _embedding;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_embedding);
  }

  @override
  final double quality;

  @override
  String toString() {
    return 'FaceEnrollmentEvent.captureAngle(embedding: $embedding, quality: $quality)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceEnrollmentCaptureAngleEventImpl &&
            const DeepCollectionEquality()
                .equals(other._embedding, _embedding) &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_embedding), quality);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceEnrollmentCaptureAngleEventImplCopyWith<
          _$FaceEnrollmentCaptureAngleEventImpl>
      get copyWith => __$$FaceEnrollmentCaptureAngleEventImplCopyWithImpl<
          _$FaceEnrollmentCaptureAngleEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String individualId, bool isSystemUser, String enrolledBy)
        start,
    required TResult Function(List<double> embedding, double quality)
        captureAngle,
    required TResult Function() livenessCompleted,
    required TResult Function() retryAngle,
    required TResult Function() confirmPin,
    required TResult Function() complete,
    required TResult Function() cancel,
  }) {
    return captureAngle(embedding, quality);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String individualId, bool isSystemUser, String enrolledBy)?
        start,
    TResult? Function(List<double> embedding, double quality)? captureAngle,
    TResult? Function()? livenessCompleted,
    TResult? Function()? retryAngle,
    TResult? Function()? confirmPin,
    TResult? Function()? complete,
    TResult? Function()? cancel,
  }) {
    return captureAngle?.call(embedding, quality);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String individualId, bool isSystemUser, String enrolledBy)?
        start,
    TResult Function(List<double> embedding, double quality)? captureAngle,
    TResult Function()? livenessCompleted,
    TResult Function()? retryAngle,
    TResult Function()? confirmPin,
    TResult Function()? complete,
    TResult Function()? cancel,
    required TResult orElse(),
  }) {
    if (captureAngle != null) {
      return captureAngle(embedding, quality);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceEnrollmentStartEvent value) start,
    required TResult Function(FaceEnrollmentCaptureAngleEvent value)
        captureAngle,
    required TResult Function(FaceEnrollmentLivenessCompletedEvent value)
        livenessCompleted,
    required TResult Function(FaceEnrollmentRetryAngleEvent value) retryAngle,
    required TResult Function(FaceEnrollmentConfirmPinEvent value) confirmPin,
    required TResult Function(FaceEnrollmentCompleteEvent value) complete,
    required TResult Function(FaceEnrollmentCancelEvent value) cancel,
  }) {
    return captureAngle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceEnrollmentStartEvent value)? start,
    TResult? Function(FaceEnrollmentCaptureAngleEvent value)? captureAngle,
    TResult? Function(FaceEnrollmentLivenessCompletedEvent value)?
        livenessCompleted,
    TResult? Function(FaceEnrollmentRetryAngleEvent value)? retryAngle,
    TResult? Function(FaceEnrollmentConfirmPinEvent value)? confirmPin,
    TResult? Function(FaceEnrollmentCompleteEvent value)? complete,
    TResult? Function(FaceEnrollmentCancelEvent value)? cancel,
  }) {
    return captureAngle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceEnrollmentStartEvent value)? start,
    TResult Function(FaceEnrollmentCaptureAngleEvent value)? captureAngle,
    TResult Function(FaceEnrollmentLivenessCompletedEvent value)?
        livenessCompleted,
    TResult Function(FaceEnrollmentRetryAngleEvent value)? retryAngle,
    TResult Function(FaceEnrollmentConfirmPinEvent value)? confirmPin,
    TResult Function(FaceEnrollmentCompleteEvent value)? complete,
    TResult Function(FaceEnrollmentCancelEvent value)? cancel,
    required TResult orElse(),
  }) {
    if (captureAngle != null) {
      return captureAngle(this);
    }
    return orElse();
  }
}

abstract class FaceEnrollmentCaptureAngleEvent implements FaceEnrollmentEvent {
  const factory FaceEnrollmentCaptureAngleEvent(
      {required final List<double> embedding,
      required final double quality}) = _$FaceEnrollmentCaptureAngleEventImpl;

  List<double> get embedding;
  double get quality;
  @JsonKey(ignore: true)
  _$$FaceEnrollmentCaptureAngleEventImplCopyWith<
          _$FaceEnrollmentCaptureAngleEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FaceEnrollmentLivenessCompletedEventImplCopyWith<$Res> {
  factory _$$FaceEnrollmentLivenessCompletedEventImplCopyWith(
          _$FaceEnrollmentLivenessCompletedEventImpl value,
          $Res Function(_$FaceEnrollmentLivenessCompletedEventImpl) then) =
      __$$FaceEnrollmentLivenessCompletedEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceEnrollmentLivenessCompletedEventImplCopyWithImpl<$Res>
    extends _$FaceEnrollmentEventCopyWithImpl<$Res,
        _$FaceEnrollmentLivenessCompletedEventImpl>
    implements _$$FaceEnrollmentLivenessCompletedEventImplCopyWith<$Res> {
  __$$FaceEnrollmentLivenessCompletedEventImplCopyWithImpl(
      _$FaceEnrollmentLivenessCompletedEventImpl _value,
      $Res Function(_$FaceEnrollmentLivenessCompletedEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceEnrollmentLivenessCompletedEventImpl
    implements FaceEnrollmentLivenessCompletedEvent {
  const _$FaceEnrollmentLivenessCompletedEventImpl();

  @override
  String toString() {
    return 'FaceEnrollmentEvent.livenessCompleted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceEnrollmentLivenessCompletedEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String individualId, bool isSystemUser, String enrolledBy)
        start,
    required TResult Function(List<double> embedding, double quality)
        captureAngle,
    required TResult Function() livenessCompleted,
    required TResult Function() retryAngle,
    required TResult Function() confirmPin,
    required TResult Function() complete,
    required TResult Function() cancel,
  }) {
    return livenessCompleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String individualId, bool isSystemUser, String enrolledBy)?
        start,
    TResult? Function(List<double> embedding, double quality)? captureAngle,
    TResult? Function()? livenessCompleted,
    TResult? Function()? retryAngle,
    TResult? Function()? confirmPin,
    TResult? Function()? complete,
    TResult? Function()? cancel,
  }) {
    return livenessCompleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String individualId, bool isSystemUser, String enrolledBy)?
        start,
    TResult Function(List<double> embedding, double quality)? captureAngle,
    TResult Function()? livenessCompleted,
    TResult Function()? retryAngle,
    TResult Function()? confirmPin,
    TResult Function()? complete,
    TResult Function()? cancel,
    required TResult orElse(),
  }) {
    if (livenessCompleted != null) {
      return livenessCompleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceEnrollmentStartEvent value) start,
    required TResult Function(FaceEnrollmentCaptureAngleEvent value)
        captureAngle,
    required TResult Function(FaceEnrollmentLivenessCompletedEvent value)
        livenessCompleted,
    required TResult Function(FaceEnrollmentRetryAngleEvent value) retryAngle,
    required TResult Function(FaceEnrollmentConfirmPinEvent value) confirmPin,
    required TResult Function(FaceEnrollmentCompleteEvent value) complete,
    required TResult Function(FaceEnrollmentCancelEvent value) cancel,
  }) {
    return livenessCompleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceEnrollmentStartEvent value)? start,
    TResult? Function(FaceEnrollmentCaptureAngleEvent value)? captureAngle,
    TResult? Function(FaceEnrollmentLivenessCompletedEvent value)?
        livenessCompleted,
    TResult? Function(FaceEnrollmentRetryAngleEvent value)? retryAngle,
    TResult? Function(FaceEnrollmentConfirmPinEvent value)? confirmPin,
    TResult? Function(FaceEnrollmentCompleteEvent value)? complete,
    TResult? Function(FaceEnrollmentCancelEvent value)? cancel,
  }) {
    return livenessCompleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceEnrollmentStartEvent value)? start,
    TResult Function(FaceEnrollmentCaptureAngleEvent value)? captureAngle,
    TResult Function(FaceEnrollmentLivenessCompletedEvent value)?
        livenessCompleted,
    TResult Function(FaceEnrollmentRetryAngleEvent value)? retryAngle,
    TResult Function(FaceEnrollmentConfirmPinEvent value)? confirmPin,
    TResult Function(FaceEnrollmentCompleteEvent value)? complete,
    TResult Function(FaceEnrollmentCancelEvent value)? cancel,
    required TResult orElse(),
  }) {
    if (livenessCompleted != null) {
      return livenessCompleted(this);
    }
    return orElse();
  }
}

abstract class FaceEnrollmentLivenessCompletedEvent
    implements FaceEnrollmentEvent {
  const factory FaceEnrollmentLivenessCompletedEvent() =
      _$FaceEnrollmentLivenessCompletedEventImpl;
}

/// @nodoc
abstract class _$$FaceEnrollmentRetryAngleEventImplCopyWith<$Res> {
  factory _$$FaceEnrollmentRetryAngleEventImplCopyWith(
          _$FaceEnrollmentRetryAngleEventImpl value,
          $Res Function(_$FaceEnrollmentRetryAngleEventImpl) then) =
      __$$FaceEnrollmentRetryAngleEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceEnrollmentRetryAngleEventImplCopyWithImpl<$Res>
    extends _$FaceEnrollmentEventCopyWithImpl<$Res,
        _$FaceEnrollmentRetryAngleEventImpl>
    implements _$$FaceEnrollmentRetryAngleEventImplCopyWith<$Res> {
  __$$FaceEnrollmentRetryAngleEventImplCopyWithImpl(
      _$FaceEnrollmentRetryAngleEventImpl _value,
      $Res Function(_$FaceEnrollmentRetryAngleEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceEnrollmentRetryAngleEventImpl
    implements FaceEnrollmentRetryAngleEvent {
  const _$FaceEnrollmentRetryAngleEventImpl();

  @override
  String toString() {
    return 'FaceEnrollmentEvent.retryAngle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceEnrollmentRetryAngleEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String individualId, bool isSystemUser, String enrolledBy)
        start,
    required TResult Function(List<double> embedding, double quality)
        captureAngle,
    required TResult Function() livenessCompleted,
    required TResult Function() retryAngle,
    required TResult Function() confirmPin,
    required TResult Function() complete,
    required TResult Function() cancel,
  }) {
    return retryAngle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String individualId, bool isSystemUser, String enrolledBy)?
        start,
    TResult? Function(List<double> embedding, double quality)? captureAngle,
    TResult? Function()? livenessCompleted,
    TResult? Function()? retryAngle,
    TResult? Function()? confirmPin,
    TResult? Function()? complete,
    TResult? Function()? cancel,
  }) {
    return retryAngle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String individualId, bool isSystemUser, String enrolledBy)?
        start,
    TResult Function(List<double> embedding, double quality)? captureAngle,
    TResult Function()? livenessCompleted,
    TResult Function()? retryAngle,
    TResult Function()? confirmPin,
    TResult Function()? complete,
    TResult Function()? cancel,
    required TResult orElse(),
  }) {
    if (retryAngle != null) {
      return retryAngle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceEnrollmentStartEvent value) start,
    required TResult Function(FaceEnrollmentCaptureAngleEvent value)
        captureAngle,
    required TResult Function(FaceEnrollmentLivenessCompletedEvent value)
        livenessCompleted,
    required TResult Function(FaceEnrollmentRetryAngleEvent value) retryAngle,
    required TResult Function(FaceEnrollmentConfirmPinEvent value) confirmPin,
    required TResult Function(FaceEnrollmentCompleteEvent value) complete,
    required TResult Function(FaceEnrollmentCancelEvent value) cancel,
  }) {
    return retryAngle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceEnrollmentStartEvent value)? start,
    TResult? Function(FaceEnrollmentCaptureAngleEvent value)? captureAngle,
    TResult? Function(FaceEnrollmentLivenessCompletedEvent value)?
        livenessCompleted,
    TResult? Function(FaceEnrollmentRetryAngleEvent value)? retryAngle,
    TResult? Function(FaceEnrollmentConfirmPinEvent value)? confirmPin,
    TResult? Function(FaceEnrollmentCompleteEvent value)? complete,
    TResult? Function(FaceEnrollmentCancelEvent value)? cancel,
  }) {
    return retryAngle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceEnrollmentStartEvent value)? start,
    TResult Function(FaceEnrollmentCaptureAngleEvent value)? captureAngle,
    TResult Function(FaceEnrollmentLivenessCompletedEvent value)?
        livenessCompleted,
    TResult Function(FaceEnrollmentRetryAngleEvent value)? retryAngle,
    TResult Function(FaceEnrollmentConfirmPinEvent value)? confirmPin,
    TResult Function(FaceEnrollmentCompleteEvent value)? complete,
    TResult Function(FaceEnrollmentCancelEvent value)? cancel,
    required TResult orElse(),
  }) {
    if (retryAngle != null) {
      return retryAngle(this);
    }
    return orElse();
  }
}

abstract class FaceEnrollmentRetryAngleEvent implements FaceEnrollmentEvent {
  const factory FaceEnrollmentRetryAngleEvent() =
      _$FaceEnrollmentRetryAngleEventImpl;
}

/// @nodoc
abstract class _$$FaceEnrollmentConfirmPinEventImplCopyWith<$Res> {
  factory _$$FaceEnrollmentConfirmPinEventImplCopyWith(
          _$FaceEnrollmentConfirmPinEventImpl value,
          $Res Function(_$FaceEnrollmentConfirmPinEventImpl) then) =
      __$$FaceEnrollmentConfirmPinEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceEnrollmentConfirmPinEventImplCopyWithImpl<$Res>
    extends _$FaceEnrollmentEventCopyWithImpl<$Res,
        _$FaceEnrollmentConfirmPinEventImpl>
    implements _$$FaceEnrollmentConfirmPinEventImplCopyWith<$Res> {
  __$$FaceEnrollmentConfirmPinEventImplCopyWithImpl(
      _$FaceEnrollmentConfirmPinEventImpl _value,
      $Res Function(_$FaceEnrollmentConfirmPinEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceEnrollmentConfirmPinEventImpl
    implements FaceEnrollmentConfirmPinEvent {
  const _$FaceEnrollmentConfirmPinEventImpl();

  @override
  String toString() {
    return 'FaceEnrollmentEvent.confirmPin()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceEnrollmentConfirmPinEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String individualId, bool isSystemUser, String enrolledBy)
        start,
    required TResult Function(List<double> embedding, double quality)
        captureAngle,
    required TResult Function() livenessCompleted,
    required TResult Function() retryAngle,
    required TResult Function() confirmPin,
    required TResult Function() complete,
    required TResult Function() cancel,
  }) {
    return confirmPin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String individualId, bool isSystemUser, String enrolledBy)?
        start,
    TResult? Function(List<double> embedding, double quality)? captureAngle,
    TResult? Function()? livenessCompleted,
    TResult? Function()? retryAngle,
    TResult? Function()? confirmPin,
    TResult? Function()? complete,
    TResult? Function()? cancel,
  }) {
    return confirmPin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String individualId, bool isSystemUser, String enrolledBy)?
        start,
    TResult Function(List<double> embedding, double quality)? captureAngle,
    TResult Function()? livenessCompleted,
    TResult Function()? retryAngle,
    TResult Function()? confirmPin,
    TResult Function()? complete,
    TResult Function()? cancel,
    required TResult orElse(),
  }) {
    if (confirmPin != null) {
      return confirmPin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceEnrollmentStartEvent value) start,
    required TResult Function(FaceEnrollmentCaptureAngleEvent value)
        captureAngle,
    required TResult Function(FaceEnrollmentLivenessCompletedEvent value)
        livenessCompleted,
    required TResult Function(FaceEnrollmentRetryAngleEvent value) retryAngle,
    required TResult Function(FaceEnrollmentConfirmPinEvent value) confirmPin,
    required TResult Function(FaceEnrollmentCompleteEvent value) complete,
    required TResult Function(FaceEnrollmentCancelEvent value) cancel,
  }) {
    return confirmPin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceEnrollmentStartEvent value)? start,
    TResult? Function(FaceEnrollmentCaptureAngleEvent value)? captureAngle,
    TResult? Function(FaceEnrollmentLivenessCompletedEvent value)?
        livenessCompleted,
    TResult? Function(FaceEnrollmentRetryAngleEvent value)? retryAngle,
    TResult? Function(FaceEnrollmentConfirmPinEvent value)? confirmPin,
    TResult? Function(FaceEnrollmentCompleteEvent value)? complete,
    TResult? Function(FaceEnrollmentCancelEvent value)? cancel,
  }) {
    return confirmPin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceEnrollmentStartEvent value)? start,
    TResult Function(FaceEnrollmentCaptureAngleEvent value)? captureAngle,
    TResult Function(FaceEnrollmentLivenessCompletedEvent value)?
        livenessCompleted,
    TResult Function(FaceEnrollmentRetryAngleEvent value)? retryAngle,
    TResult Function(FaceEnrollmentConfirmPinEvent value)? confirmPin,
    TResult Function(FaceEnrollmentCompleteEvent value)? complete,
    TResult Function(FaceEnrollmentCancelEvent value)? cancel,
    required TResult orElse(),
  }) {
    if (confirmPin != null) {
      return confirmPin(this);
    }
    return orElse();
  }
}

abstract class FaceEnrollmentConfirmPinEvent implements FaceEnrollmentEvent {
  const factory FaceEnrollmentConfirmPinEvent() =
      _$FaceEnrollmentConfirmPinEventImpl;
}

/// @nodoc
abstract class _$$FaceEnrollmentCompleteEventImplCopyWith<$Res> {
  factory _$$FaceEnrollmentCompleteEventImplCopyWith(
          _$FaceEnrollmentCompleteEventImpl value,
          $Res Function(_$FaceEnrollmentCompleteEventImpl) then) =
      __$$FaceEnrollmentCompleteEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceEnrollmentCompleteEventImplCopyWithImpl<$Res>
    extends _$FaceEnrollmentEventCopyWithImpl<$Res,
        _$FaceEnrollmentCompleteEventImpl>
    implements _$$FaceEnrollmentCompleteEventImplCopyWith<$Res> {
  __$$FaceEnrollmentCompleteEventImplCopyWithImpl(
      _$FaceEnrollmentCompleteEventImpl _value,
      $Res Function(_$FaceEnrollmentCompleteEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceEnrollmentCompleteEventImpl implements FaceEnrollmentCompleteEvent {
  const _$FaceEnrollmentCompleteEventImpl();

  @override
  String toString() {
    return 'FaceEnrollmentEvent.complete()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceEnrollmentCompleteEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String individualId, bool isSystemUser, String enrolledBy)
        start,
    required TResult Function(List<double> embedding, double quality)
        captureAngle,
    required TResult Function() livenessCompleted,
    required TResult Function() retryAngle,
    required TResult Function() confirmPin,
    required TResult Function() complete,
    required TResult Function() cancel,
  }) {
    return complete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String individualId, bool isSystemUser, String enrolledBy)?
        start,
    TResult? Function(List<double> embedding, double quality)? captureAngle,
    TResult? Function()? livenessCompleted,
    TResult? Function()? retryAngle,
    TResult? Function()? confirmPin,
    TResult? Function()? complete,
    TResult? Function()? cancel,
  }) {
    return complete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String individualId, bool isSystemUser, String enrolledBy)?
        start,
    TResult Function(List<double> embedding, double quality)? captureAngle,
    TResult Function()? livenessCompleted,
    TResult Function()? retryAngle,
    TResult Function()? confirmPin,
    TResult Function()? complete,
    TResult Function()? cancel,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceEnrollmentStartEvent value) start,
    required TResult Function(FaceEnrollmentCaptureAngleEvent value)
        captureAngle,
    required TResult Function(FaceEnrollmentLivenessCompletedEvent value)
        livenessCompleted,
    required TResult Function(FaceEnrollmentRetryAngleEvent value) retryAngle,
    required TResult Function(FaceEnrollmentConfirmPinEvent value) confirmPin,
    required TResult Function(FaceEnrollmentCompleteEvent value) complete,
    required TResult Function(FaceEnrollmentCancelEvent value) cancel,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceEnrollmentStartEvent value)? start,
    TResult? Function(FaceEnrollmentCaptureAngleEvent value)? captureAngle,
    TResult? Function(FaceEnrollmentLivenessCompletedEvent value)?
        livenessCompleted,
    TResult? Function(FaceEnrollmentRetryAngleEvent value)? retryAngle,
    TResult? Function(FaceEnrollmentConfirmPinEvent value)? confirmPin,
    TResult? Function(FaceEnrollmentCompleteEvent value)? complete,
    TResult? Function(FaceEnrollmentCancelEvent value)? cancel,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceEnrollmentStartEvent value)? start,
    TResult Function(FaceEnrollmentCaptureAngleEvent value)? captureAngle,
    TResult Function(FaceEnrollmentLivenessCompletedEvent value)?
        livenessCompleted,
    TResult Function(FaceEnrollmentRetryAngleEvent value)? retryAngle,
    TResult Function(FaceEnrollmentConfirmPinEvent value)? confirmPin,
    TResult Function(FaceEnrollmentCompleteEvent value)? complete,
    TResult Function(FaceEnrollmentCancelEvent value)? cancel,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }
}

abstract class FaceEnrollmentCompleteEvent implements FaceEnrollmentEvent {
  const factory FaceEnrollmentCompleteEvent() =
      _$FaceEnrollmentCompleteEventImpl;
}

/// @nodoc
abstract class _$$FaceEnrollmentCancelEventImplCopyWith<$Res> {
  factory _$$FaceEnrollmentCancelEventImplCopyWith(
          _$FaceEnrollmentCancelEventImpl value,
          $Res Function(_$FaceEnrollmentCancelEventImpl) then) =
      __$$FaceEnrollmentCancelEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceEnrollmentCancelEventImplCopyWithImpl<$Res>
    extends _$FaceEnrollmentEventCopyWithImpl<$Res,
        _$FaceEnrollmentCancelEventImpl>
    implements _$$FaceEnrollmentCancelEventImplCopyWith<$Res> {
  __$$FaceEnrollmentCancelEventImplCopyWithImpl(
      _$FaceEnrollmentCancelEventImpl _value,
      $Res Function(_$FaceEnrollmentCancelEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceEnrollmentCancelEventImpl implements FaceEnrollmentCancelEvent {
  const _$FaceEnrollmentCancelEventImpl();

  @override
  String toString() {
    return 'FaceEnrollmentEvent.cancel()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceEnrollmentCancelEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String individualId, bool isSystemUser, String enrolledBy)
        start,
    required TResult Function(List<double> embedding, double quality)
        captureAngle,
    required TResult Function() livenessCompleted,
    required TResult Function() retryAngle,
    required TResult Function() confirmPin,
    required TResult Function() complete,
    required TResult Function() cancel,
  }) {
    return cancel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String individualId, bool isSystemUser, String enrolledBy)?
        start,
    TResult? Function(List<double> embedding, double quality)? captureAngle,
    TResult? Function()? livenessCompleted,
    TResult? Function()? retryAngle,
    TResult? Function()? confirmPin,
    TResult? Function()? complete,
    TResult? Function()? cancel,
  }) {
    return cancel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String individualId, bool isSystemUser, String enrolledBy)?
        start,
    TResult Function(List<double> embedding, double quality)? captureAngle,
    TResult Function()? livenessCompleted,
    TResult Function()? retryAngle,
    TResult Function()? confirmPin,
    TResult Function()? complete,
    TResult Function()? cancel,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceEnrollmentStartEvent value) start,
    required TResult Function(FaceEnrollmentCaptureAngleEvent value)
        captureAngle,
    required TResult Function(FaceEnrollmentLivenessCompletedEvent value)
        livenessCompleted,
    required TResult Function(FaceEnrollmentRetryAngleEvent value) retryAngle,
    required TResult Function(FaceEnrollmentConfirmPinEvent value) confirmPin,
    required TResult Function(FaceEnrollmentCompleteEvent value) complete,
    required TResult Function(FaceEnrollmentCancelEvent value) cancel,
  }) {
    return cancel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceEnrollmentStartEvent value)? start,
    TResult? Function(FaceEnrollmentCaptureAngleEvent value)? captureAngle,
    TResult? Function(FaceEnrollmentLivenessCompletedEvent value)?
        livenessCompleted,
    TResult? Function(FaceEnrollmentRetryAngleEvent value)? retryAngle,
    TResult? Function(FaceEnrollmentConfirmPinEvent value)? confirmPin,
    TResult? Function(FaceEnrollmentCompleteEvent value)? complete,
    TResult? Function(FaceEnrollmentCancelEvent value)? cancel,
  }) {
    return cancel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceEnrollmentStartEvent value)? start,
    TResult Function(FaceEnrollmentCaptureAngleEvent value)? captureAngle,
    TResult Function(FaceEnrollmentLivenessCompletedEvent value)?
        livenessCompleted,
    TResult Function(FaceEnrollmentRetryAngleEvent value)? retryAngle,
    TResult Function(FaceEnrollmentConfirmPinEvent value)? confirmPin,
    TResult Function(FaceEnrollmentCompleteEvent value)? complete,
    TResult Function(FaceEnrollmentCancelEvent value)? cancel,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel(this);
    }
    return orElse();
  }
}

abstract class FaceEnrollmentCancelEvent implements FaceEnrollmentEvent {
  const factory FaceEnrollmentCancelEvent() = _$FaceEnrollmentCancelEventImpl;
}

/// @nodoc
mixin _$FaceEnrollmentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int current, int total, String instruction)
        capturingAngle,
    required TResult Function() livenessCheck,
    required TResult Function() processing,
    required TResult Function(String pin) pinAssigned,
    required TResult Function() completed,
    required TResult Function() qualityInsufficient,
    required TResult Function(String matchedId, double similarity)
        duplicateDetected,
    required TResult Function() maxUsersReached,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int current, int total, String instruction)?
        capturingAngle,
    TResult? Function()? livenessCheck,
    TResult? Function()? processing,
    TResult? Function(String pin)? pinAssigned,
    TResult? Function()? completed,
    TResult? Function()? qualityInsufficient,
    TResult? Function(String matchedId, double similarity)? duplicateDetected,
    TResult? Function()? maxUsersReached,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int current, int total, String instruction)?
        capturingAngle,
    TResult Function()? livenessCheck,
    TResult Function()? processing,
    TResult Function(String pin)? pinAssigned,
    TResult Function()? completed,
    TResult Function()? qualityInsufficient,
    TResult Function(String matchedId, double similarity)? duplicateDetected,
    TResult Function()? maxUsersReached,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceEnrollmentInitialState value) initial,
    required TResult Function(FaceEnrollmentCapturingAngleState value)
        capturingAngle,
    required TResult Function(FaceEnrollmentLivenessCheckState value)
        livenessCheck,
    required TResult Function(FaceEnrollmentProcessingState value) processing,
    required TResult Function(FaceEnrollmentPinAssignedState value) pinAssigned,
    required TResult Function(FaceEnrollmentCompletedState value) completed,
    required TResult Function(FaceEnrollmentQualityInsufficientState value)
        qualityInsufficient,
    required TResult Function(FaceEnrollmentDuplicateDetectedState value)
        duplicateDetected,
    required TResult Function(FaceEnrollmentMaxUsersReachedState value)
        maxUsersReached,
    required TResult Function(FaceEnrollmentErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceEnrollmentInitialState value)? initial,
    TResult? Function(FaceEnrollmentCapturingAngleState value)? capturingAngle,
    TResult? Function(FaceEnrollmentLivenessCheckState value)? livenessCheck,
    TResult? Function(FaceEnrollmentProcessingState value)? processing,
    TResult? Function(FaceEnrollmentPinAssignedState value)? pinAssigned,
    TResult? Function(FaceEnrollmentCompletedState value)? completed,
    TResult? Function(FaceEnrollmentQualityInsufficientState value)?
        qualityInsufficient,
    TResult? Function(FaceEnrollmentDuplicateDetectedState value)?
        duplicateDetected,
    TResult? Function(FaceEnrollmentMaxUsersReachedState value)?
        maxUsersReached,
    TResult? Function(FaceEnrollmentErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceEnrollmentInitialState value)? initial,
    TResult Function(FaceEnrollmentCapturingAngleState value)? capturingAngle,
    TResult Function(FaceEnrollmentLivenessCheckState value)? livenessCheck,
    TResult Function(FaceEnrollmentProcessingState value)? processing,
    TResult Function(FaceEnrollmentPinAssignedState value)? pinAssigned,
    TResult Function(FaceEnrollmentCompletedState value)? completed,
    TResult Function(FaceEnrollmentQualityInsufficientState value)?
        qualityInsufficient,
    TResult Function(FaceEnrollmentDuplicateDetectedState value)?
        duplicateDetected,
    TResult Function(FaceEnrollmentMaxUsersReachedState value)? maxUsersReached,
    TResult Function(FaceEnrollmentErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaceEnrollmentStateCopyWith<$Res> {
  factory $FaceEnrollmentStateCopyWith(
          FaceEnrollmentState value, $Res Function(FaceEnrollmentState) then) =
      _$FaceEnrollmentStateCopyWithImpl<$Res, FaceEnrollmentState>;
}

/// @nodoc
class _$FaceEnrollmentStateCopyWithImpl<$Res, $Val extends FaceEnrollmentState>
    implements $FaceEnrollmentStateCopyWith<$Res> {
  _$FaceEnrollmentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FaceEnrollmentInitialStateImplCopyWith<$Res> {
  factory _$$FaceEnrollmentInitialStateImplCopyWith(
          _$FaceEnrollmentInitialStateImpl value,
          $Res Function(_$FaceEnrollmentInitialStateImpl) then) =
      __$$FaceEnrollmentInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceEnrollmentInitialStateImplCopyWithImpl<$Res>
    extends _$FaceEnrollmentStateCopyWithImpl<$Res,
        _$FaceEnrollmentInitialStateImpl>
    implements _$$FaceEnrollmentInitialStateImplCopyWith<$Res> {
  __$$FaceEnrollmentInitialStateImplCopyWithImpl(
      _$FaceEnrollmentInitialStateImpl _value,
      $Res Function(_$FaceEnrollmentInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceEnrollmentInitialStateImpl implements FaceEnrollmentInitialState {
  const _$FaceEnrollmentInitialStateImpl();

  @override
  String toString() {
    return 'FaceEnrollmentState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceEnrollmentInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int current, int total, String instruction)
        capturingAngle,
    required TResult Function() livenessCheck,
    required TResult Function() processing,
    required TResult Function(String pin) pinAssigned,
    required TResult Function() completed,
    required TResult Function() qualityInsufficient,
    required TResult Function(String matchedId, double similarity)
        duplicateDetected,
    required TResult Function() maxUsersReached,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int current, int total, String instruction)?
        capturingAngle,
    TResult? Function()? livenessCheck,
    TResult? Function()? processing,
    TResult? Function(String pin)? pinAssigned,
    TResult? Function()? completed,
    TResult? Function()? qualityInsufficient,
    TResult? Function(String matchedId, double similarity)? duplicateDetected,
    TResult? Function()? maxUsersReached,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int current, int total, String instruction)?
        capturingAngle,
    TResult Function()? livenessCheck,
    TResult Function()? processing,
    TResult Function(String pin)? pinAssigned,
    TResult Function()? completed,
    TResult Function()? qualityInsufficient,
    TResult Function(String matchedId, double similarity)? duplicateDetected,
    TResult Function()? maxUsersReached,
    TResult Function(String message)? error,
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
    required TResult Function(FaceEnrollmentInitialState value) initial,
    required TResult Function(FaceEnrollmentCapturingAngleState value)
        capturingAngle,
    required TResult Function(FaceEnrollmentLivenessCheckState value)
        livenessCheck,
    required TResult Function(FaceEnrollmentProcessingState value) processing,
    required TResult Function(FaceEnrollmentPinAssignedState value) pinAssigned,
    required TResult Function(FaceEnrollmentCompletedState value) completed,
    required TResult Function(FaceEnrollmentQualityInsufficientState value)
        qualityInsufficient,
    required TResult Function(FaceEnrollmentDuplicateDetectedState value)
        duplicateDetected,
    required TResult Function(FaceEnrollmentMaxUsersReachedState value)
        maxUsersReached,
    required TResult Function(FaceEnrollmentErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceEnrollmentInitialState value)? initial,
    TResult? Function(FaceEnrollmentCapturingAngleState value)? capturingAngle,
    TResult? Function(FaceEnrollmentLivenessCheckState value)? livenessCheck,
    TResult? Function(FaceEnrollmentProcessingState value)? processing,
    TResult? Function(FaceEnrollmentPinAssignedState value)? pinAssigned,
    TResult? Function(FaceEnrollmentCompletedState value)? completed,
    TResult? Function(FaceEnrollmentQualityInsufficientState value)?
        qualityInsufficient,
    TResult? Function(FaceEnrollmentDuplicateDetectedState value)?
        duplicateDetected,
    TResult? Function(FaceEnrollmentMaxUsersReachedState value)?
        maxUsersReached,
    TResult? Function(FaceEnrollmentErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceEnrollmentInitialState value)? initial,
    TResult Function(FaceEnrollmentCapturingAngleState value)? capturingAngle,
    TResult Function(FaceEnrollmentLivenessCheckState value)? livenessCheck,
    TResult Function(FaceEnrollmentProcessingState value)? processing,
    TResult Function(FaceEnrollmentPinAssignedState value)? pinAssigned,
    TResult Function(FaceEnrollmentCompletedState value)? completed,
    TResult Function(FaceEnrollmentQualityInsufficientState value)?
        qualityInsufficient,
    TResult Function(FaceEnrollmentDuplicateDetectedState value)?
        duplicateDetected,
    TResult Function(FaceEnrollmentMaxUsersReachedState value)? maxUsersReached,
    TResult Function(FaceEnrollmentErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class FaceEnrollmentInitialState implements FaceEnrollmentState {
  const factory FaceEnrollmentInitialState() = _$FaceEnrollmentInitialStateImpl;
}

/// @nodoc
abstract class _$$FaceEnrollmentCapturingAngleStateImplCopyWith<$Res> {
  factory _$$FaceEnrollmentCapturingAngleStateImplCopyWith(
          _$FaceEnrollmentCapturingAngleStateImpl value,
          $Res Function(_$FaceEnrollmentCapturingAngleStateImpl) then) =
      __$$FaceEnrollmentCapturingAngleStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int current, int total, String instruction});
}

/// @nodoc
class __$$FaceEnrollmentCapturingAngleStateImplCopyWithImpl<$Res>
    extends _$FaceEnrollmentStateCopyWithImpl<$Res,
        _$FaceEnrollmentCapturingAngleStateImpl>
    implements _$$FaceEnrollmentCapturingAngleStateImplCopyWith<$Res> {
  __$$FaceEnrollmentCapturingAngleStateImplCopyWithImpl(
      _$FaceEnrollmentCapturingAngleStateImpl _value,
      $Res Function(_$FaceEnrollmentCapturingAngleStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? total = null,
    Object? instruction = null,
  }) {
    return _then(_$FaceEnrollmentCapturingAngleStateImpl(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      instruction: null == instruction
          ? _value.instruction
          : instruction // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FaceEnrollmentCapturingAngleStateImpl
    implements FaceEnrollmentCapturingAngleState {
  const _$FaceEnrollmentCapturingAngleStateImpl(
      {required this.current, required this.total, required this.instruction});

  @override
  final int current;
  @override
  final int total;
  @override
  final String instruction;

  @override
  String toString() {
    return 'FaceEnrollmentState.capturingAngle(current: $current, total: $total, instruction: $instruction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceEnrollmentCapturingAngleStateImpl &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.instruction, instruction) ||
                other.instruction == instruction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, current, total, instruction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceEnrollmentCapturingAngleStateImplCopyWith<
          _$FaceEnrollmentCapturingAngleStateImpl>
      get copyWith => __$$FaceEnrollmentCapturingAngleStateImplCopyWithImpl<
          _$FaceEnrollmentCapturingAngleStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int current, int total, String instruction)
        capturingAngle,
    required TResult Function() livenessCheck,
    required TResult Function() processing,
    required TResult Function(String pin) pinAssigned,
    required TResult Function() completed,
    required TResult Function() qualityInsufficient,
    required TResult Function(String matchedId, double similarity)
        duplicateDetected,
    required TResult Function() maxUsersReached,
    required TResult Function(String message) error,
  }) {
    return capturingAngle(current, total, instruction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int current, int total, String instruction)?
        capturingAngle,
    TResult? Function()? livenessCheck,
    TResult? Function()? processing,
    TResult? Function(String pin)? pinAssigned,
    TResult? Function()? completed,
    TResult? Function()? qualityInsufficient,
    TResult? Function(String matchedId, double similarity)? duplicateDetected,
    TResult? Function()? maxUsersReached,
    TResult? Function(String message)? error,
  }) {
    return capturingAngle?.call(current, total, instruction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int current, int total, String instruction)?
        capturingAngle,
    TResult Function()? livenessCheck,
    TResult Function()? processing,
    TResult Function(String pin)? pinAssigned,
    TResult Function()? completed,
    TResult Function()? qualityInsufficient,
    TResult Function(String matchedId, double similarity)? duplicateDetected,
    TResult Function()? maxUsersReached,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (capturingAngle != null) {
      return capturingAngle(current, total, instruction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceEnrollmentInitialState value) initial,
    required TResult Function(FaceEnrollmentCapturingAngleState value)
        capturingAngle,
    required TResult Function(FaceEnrollmentLivenessCheckState value)
        livenessCheck,
    required TResult Function(FaceEnrollmentProcessingState value) processing,
    required TResult Function(FaceEnrollmentPinAssignedState value) pinAssigned,
    required TResult Function(FaceEnrollmentCompletedState value) completed,
    required TResult Function(FaceEnrollmentQualityInsufficientState value)
        qualityInsufficient,
    required TResult Function(FaceEnrollmentDuplicateDetectedState value)
        duplicateDetected,
    required TResult Function(FaceEnrollmentMaxUsersReachedState value)
        maxUsersReached,
    required TResult Function(FaceEnrollmentErrorState value) error,
  }) {
    return capturingAngle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceEnrollmentInitialState value)? initial,
    TResult? Function(FaceEnrollmentCapturingAngleState value)? capturingAngle,
    TResult? Function(FaceEnrollmentLivenessCheckState value)? livenessCheck,
    TResult? Function(FaceEnrollmentProcessingState value)? processing,
    TResult? Function(FaceEnrollmentPinAssignedState value)? pinAssigned,
    TResult? Function(FaceEnrollmentCompletedState value)? completed,
    TResult? Function(FaceEnrollmentQualityInsufficientState value)?
        qualityInsufficient,
    TResult? Function(FaceEnrollmentDuplicateDetectedState value)?
        duplicateDetected,
    TResult? Function(FaceEnrollmentMaxUsersReachedState value)?
        maxUsersReached,
    TResult? Function(FaceEnrollmentErrorState value)? error,
  }) {
    return capturingAngle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceEnrollmentInitialState value)? initial,
    TResult Function(FaceEnrollmentCapturingAngleState value)? capturingAngle,
    TResult Function(FaceEnrollmentLivenessCheckState value)? livenessCheck,
    TResult Function(FaceEnrollmentProcessingState value)? processing,
    TResult Function(FaceEnrollmentPinAssignedState value)? pinAssigned,
    TResult Function(FaceEnrollmentCompletedState value)? completed,
    TResult Function(FaceEnrollmentQualityInsufficientState value)?
        qualityInsufficient,
    TResult Function(FaceEnrollmentDuplicateDetectedState value)?
        duplicateDetected,
    TResult Function(FaceEnrollmentMaxUsersReachedState value)? maxUsersReached,
    TResult Function(FaceEnrollmentErrorState value)? error,
    required TResult orElse(),
  }) {
    if (capturingAngle != null) {
      return capturingAngle(this);
    }
    return orElse();
  }
}

abstract class FaceEnrollmentCapturingAngleState
    implements FaceEnrollmentState {
  const factory FaceEnrollmentCapturingAngleState(
          {required final int current,
          required final int total,
          required final String instruction}) =
      _$FaceEnrollmentCapturingAngleStateImpl;

  int get current;
  int get total;
  String get instruction;
  @JsonKey(ignore: true)
  _$$FaceEnrollmentCapturingAngleStateImplCopyWith<
          _$FaceEnrollmentCapturingAngleStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FaceEnrollmentLivenessCheckStateImplCopyWith<$Res> {
  factory _$$FaceEnrollmentLivenessCheckStateImplCopyWith(
          _$FaceEnrollmentLivenessCheckStateImpl value,
          $Res Function(_$FaceEnrollmentLivenessCheckStateImpl) then) =
      __$$FaceEnrollmentLivenessCheckStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceEnrollmentLivenessCheckStateImplCopyWithImpl<$Res>
    extends _$FaceEnrollmentStateCopyWithImpl<$Res,
        _$FaceEnrollmentLivenessCheckStateImpl>
    implements _$$FaceEnrollmentLivenessCheckStateImplCopyWith<$Res> {
  __$$FaceEnrollmentLivenessCheckStateImplCopyWithImpl(
      _$FaceEnrollmentLivenessCheckStateImpl _value,
      $Res Function(_$FaceEnrollmentLivenessCheckStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceEnrollmentLivenessCheckStateImpl
    implements FaceEnrollmentLivenessCheckState {
  const _$FaceEnrollmentLivenessCheckStateImpl();

  @override
  String toString() {
    return 'FaceEnrollmentState.livenessCheck()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceEnrollmentLivenessCheckStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int current, int total, String instruction)
        capturingAngle,
    required TResult Function() livenessCheck,
    required TResult Function() processing,
    required TResult Function(String pin) pinAssigned,
    required TResult Function() completed,
    required TResult Function() qualityInsufficient,
    required TResult Function(String matchedId, double similarity)
        duplicateDetected,
    required TResult Function() maxUsersReached,
    required TResult Function(String message) error,
  }) {
    return livenessCheck();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int current, int total, String instruction)?
        capturingAngle,
    TResult? Function()? livenessCheck,
    TResult? Function()? processing,
    TResult? Function(String pin)? pinAssigned,
    TResult? Function()? completed,
    TResult? Function()? qualityInsufficient,
    TResult? Function(String matchedId, double similarity)? duplicateDetected,
    TResult? Function()? maxUsersReached,
    TResult? Function(String message)? error,
  }) {
    return livenessCheck?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int current, int total, String instruction)?
        capturingAngle,
    TResult Function()? livenessCheck,
    TResult Function()? processing,
    TResult Function(String pin)? pinAssigned,
    TResult Function()? completed,
    TResult Function()? qualityInsufficient,
    TResult Function(String matchedId, double similarity)? duplicateDetected,
    TResult Function()? maxUsersReached,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (livenessCheck != null) {
      return livenessCheck();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceEnrollmentInitialState value) initial,
    required TResult Function(FaceEnrollmentCapturingAngleState value)
        capturingAngle,
    required TResult Function(FaceEnrollmentLivenessCheckState value)
        livenessCheck,
    required TResult Function(FaceEnrollmentProcessingState value) processing,
    required TResult Function(FaceEnrollmentPinAssignedState value) pinAssigned,
    required TResult Function(FaceEnrollmentCompletedState value) completed,
    required TResult Function(FaceEnrollmentQualityInsufficientState value)
        qualityInsufficient,
    required TResult Function(FaceEnrollmentDuplicateDetectedState value)
        duplicateDetected,
    required TResult Function(FaceEnrollmentMaxUsersReachedState value)
        maxUsersReached,
    required TResult Function(FaceEnrollmentErrorState value) error,
  }) {
    return livenessCheck(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceEnrollmentInitialState value)? initial,
    TResult? Function(FaceEnrollmentCapturingAngleState value)? capturingAngle,
    TResult? Function(FaceEnrollmentLivenessCheckState value)? livenessCheck,
    TResult? Function(FaceEnrollmentProcessingState value)? processing,
    TResult? Function(FaceEnrollmentPinAssignedState value)? pinAssigned,
    TResult? Function(FaceEnrollmentCompletedState value)? completed,
    TResult? Function(FaceEnrollmentQualityInsufficientState value)?
        qualityInsufficient,
    TResult? Function(FaceEnrollmentDuplicateDetectedState value)?
        duplicateDetected,
    TResult? Function(FaceEnrollmentMaxUsersReachedState value)?
        maxUsersReached,
    TResult? Function(FaceEnrollmentErrorState value)? error,
  }) {
    return livenessCheck?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceEnrollmentInitialState value)? initial,
    TResult Function(FaceEnrollmentCapturingAngleState value)? capturingAngle,
    TResult Function(FaceEnrollmentLivenessCheckState value)? livenessCheck,
    TResult Function(FaceEnrollmentProcessingState value)? processing,
    TResult Function(FaceEnrollmentPinAssignedState value)? pinAssigned,
    TResult Function(FaceEnrollmentCompletedState value)? completed,
    TResult Function(FaceEnrollmentQualityInsufficientState value)?
        qualityInsufficient,
    TResult Function(FaceEnrollmentDuplicateDetectedState value)?
        duplicateDetected,
    TResult Function(FaceEnrollmentMaxUsersReachedState value)? maxUsersReached,
    TResult Function(FaceEnrollmentErrorState value)? error,
    required TResult orElse(),
  }) {
    if (livenessCheck != null) {
      return livenessCheck(this);
    }
    return orElse();
  }
}

abstract class FaceEnrollmentLivenessCheckState implements FaceEnrollmentState {
  const factory FaceEnrollmentLivenessCheckState() =
      _$FaceEnrollmentLivenessCheckStateImpl;
}

/// @nodoc
abstract class _$$FaceEnrollmentProcessingStateImplCopyWith<$Res> {
  factory _$$FaceEnrollmentProcessingStateImplCopyWith(
          _$FaceEnrollmentProcessingStateImpl value,
          $Res Function(_$FaceEnrollmentProcessingStateImpl) then) =
      __$$FaceEnrollmentProcessingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceEnrollmentProcessingStateImplCopyWithImpl<$Res>
    extends _$FaceEnrollmentStateCopyWithImpl<$Res,
        _$FaceEnrollmentProcessingStateImpl>
    implements _$$FaceEnrollmentProcessingStateImplCopyWith<$Res> {
  __$$FaceEnrollmentProcessingStateImplCopyWithImpl(
      _$FaceEnrollmentProcessingStateImpl _value,
      $Res Function(_$FaceEnrollmentProcessingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceEnrollmentProcessingStateImpl
    implements FaceEnrollmentProcessingState {
  const _$FaceEnrollmentProcessingStateImpl();

  @override
  String toString() {
    return 'FaceEnrollmentState.processing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceEnrollmentProcessingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int current, int total, String instruction)
        capturingAngle,
    required TResult Function() livenessCheck,
    required TResult Function() processing,
    required TResult Function(String pin) pinAssigned,
    required TResult Function() completed,
    required TResult Function() qualityInsufficient,
    required TResult Function(String matchedId, double similarity)
        duplicateDetected,
    required TResult Function() maxUsersReached,
    required TResult Function(String message) error,
  }) {
    return processing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int current, int total, String instruction)?
        capturingAngle,
    TResult? Function()? livenessCheck,
    TResult? Function()? processing,
    TResult? Function(String pin)? pinAssigned,
    TResult? Function()? completed,
    TResult? Function()? qualityInsufficient,
    TResult? Function(String matchedId, double similarity)? duplicateDetected,
    TResult? Function()? maxUsersReached,
    TResult? Function(String message)? error,
  }) {
    return processing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int current, int total, String instruction)?
        capturingAngle,
    TResult Function()? livenessCheck,
    TResult Function()? processing,
    TResult Function(String pin)? pinAssigned,
    TResult Function()? completed,
    TResult Function()? qualityInsufficient,
    TResult Function(String matchedId, double similarity)? duplicateDetected,
    TResult Function()? maxUsersReached,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceEnrollmentInitialState value) initial,
    required TResult Function(FaceEnrollmentCapturingAngleState value)
        capturingAngle,
    required TResult Function(FaceEnrollmentLivenessCheckState value)
        livenessCheck,
    required TResult Function(FaceEnrollmentProcessingState value) processing,
    required TResult Function(FaceEnrollmentPinAssignedState value) pinAssigned,
    required TResult Function(FaceEnrollmentCompletedState value) completed,
    required TResult Function(FaceEnrollmentQualityInsufficientState value)
        qualityInsufficient,
    required TResult Function(FaceEnrollmentDuplicateDetectedState value)
        duplicateDetected,
    required TResult Function(FaceEnrollmentMaxUsersReachedState value)
        maxUsersReached,
    required TResult Function(FaceEnrollmentErrorState value) error,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceEnrollmentInitialState value)? initial,
    TResult? Function(FaceEnrollmentCapturingAngleState value)? capturingAngle,
    TResult? Function(FaceEnrollmentLivenessCheckState value)? livenessCheck,
    TResult? Function(FaceEnrollmentProcessingState value)? processing,
    TResult? Function(FaceEnrollmentPinAssignedState value)? pinAssigned,
    TResult? Function(FaceEnrollmentCompletedState value)? completed,
    TResult? Function(FaceEnrollmentQualityInsufficientState value)?
        qualityInsufficient,
    TResult? Function(FaceEnrollmentDuplicateDetectedState value)?
        duplicateDetected,
    TResult? Function(FaceEnrollmentMaxUsersReachedState value)?
        maxUsersReached,
    TResult? Function(FaceEnrollmentErrorState value)? error,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceEnrollmentInitialState value)? initial,
    TResult Function(FaceEnrollmentCapturingAngleState value)? capturingAngle,
    TResult Function(FaceEnrollmentLivenessCheckState value)? livenessCheck,
    TResult Function(FaceEnrollmentProcessingState value)? processing,
    TResult Function(FaceEnrollmentPinAssignedState value)? pinAssigned,
    TResult Function(FaceEnrollmentCompletedState value)? completed,
    TResult Function(FaceEnrollmentQualityInsufficientState value)?
        qualityInsufficient,
    TResult Function(FaceEnrollmentDuplicateDetectedState value)?
        duplicateDetected,
    TResult Function(FaceEnrollmentMaxUsersReachedState value)? maxUsersReached,
    TResult Function(FaceEnrollmentErrorState value)? error,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class FaceEnrollmentProcessingState implements FaceEnrollmentState {
  const factory FaceEnrollmentProcessingState() =
      _$FaceEnrollmentProcessingStateImpl;
}

/// @nodoc
abstract class _$$FaceEnrollmentPinAssignedStateImplCopyWith<$Res> {
  factory _$$FaceEnrollmentPinAssignedStateImplCopyWith(
          _$FaceEnrollmentPinAssignedStateImpl value,
          $Res Function(_$FaceEnrollmentPinAssignedStateImpl) then) =
      __$$FaceEnrollmentPinAssignedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String pin});
}

/// @nodoc
class __$$FaceEnrollmentPinAssignedStateImplCopyWithImpl<$Res>
    extends _$FaceEnrollmentStateCopyWithImpl<$Res,
        _$FaceEnrollmentPinAssignedStateImpl>
    implements _$$FaceEnrollmentPinAssignedStateImplCopyWith<$Res> {
  __$$FaceEnrollmentPinAssignedStateImplCopyWithImpl(
      _$FaceEnrollmentPinAssignedStateImpl _value,
      $Res Function(_$FaceEnrollmentPinAssignedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pin = null,
  }) {
    return _then(_$FaceEnrollmentPinAssignedStateImpl(
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FaceEnrollmentPinAssignedStateImpl
    implements FaceEnrollmentPinAssignedState {
  const _$FaceEnrollmentPinAssignedStateImpl({required this.pin});

  @override
  final String pin;

  @override
  String toString() {
    return 'FaceEnrollmentState.pinAssigned(pin: $pin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceEnrollmentPinAssignedStateImpl &&
            (identical(other.pin, pin) || other.pin == pin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceEnrollmentPinAssignedStateImplCopyWith<
          _$FaceEnrollmentPinAssignedStateImpl>
      get copyWith => __$$FaceEnrollmentPinAssignedStateImplCopyWithImpl<
          _$FaceEnrollmentPinAssignedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int current, int total, String instruction)
        capturingAngle,
    required TResult Function() livenessCheck,
    required TResult Function() processing,
    required TResult Function(String pin) pinAssigned,
    required TResult Function() completed,
    required TResult Function() qualityInsufficient,
    required TResult Function(String matchedId, double similarity)
        duplicateDetected,
    required TResult Function() maxUsersReached,
    required TResult Function(String message) error,
  }) {
    return pinAssigned(pin);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int current, int total, String instruction)?
        capturingAngle,
    TResult? Function()? livenessCheck,
    TResult? Function()? processing,
    TResult? Function(String pin)? pinAssigned,
    TResult? Function()? completed,
    TResult? Function()? qualityInsufficient,
    TResult? Function(String matchedId, double similarity)? duplicateDetected,
    TResult? Function()? maxUsersReached,
    TResult? Function(String message)? error,
  }) {
    return pinAssigned?.call(pin);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int current, int total, String instruction)?
        capturingAngle,
    TResult Function()? livenessCheck,
    TResult Function()? processing,
    TResult Function(String pin)? pinAssigned,
    TResult Function()? completed,
    TResult Function()? qualityInsufficient,
    TResult Function(String matchedId, double similarity)? duplicateDetected,
    TResult Function()? maxUsersReached,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (pinAssigned != null) {
      return pinAssigned(pin);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceEnrollmentInitialState value) initial,
    required TResult Function(FaceEnrollmentCapturingAngleState value)
        capturingAngle,
    required TResult Function(FaceEnrollmentLivenessCheckState value)
        livenessCheck,
    required TResult Function(FaceEnrollmentProcessingState value) processing,
    required TResult Function(FaceEnrollmentPinAssignedState value) pinAssigned,
    required TResult Function(FaceEnrollmentCompletedState value) completed,
    required TResult Function(FaceEnrollmentQualityInsufficientState value)
        qualityInsufficient,
    required TResult Function(FaceEnrollmentDuplicateDetectedState value)
        duplicateDetected,
    required TResult Function(FaceEnrollmentMaxUsersReachedState value)
        maxUsersReached,
    required TResult Function(FaceEnrollmentErrorState value) error,
  }) {
    return pinAssigned(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceEnrollmentInitialState value)? initial,
    TResult? Function(FaceEnrollmentCapturingAngleState value)? capturingAngle,
    TResult? Function(FaceEnrollmentLivenessCheckState value)? livenessCheck,
    TResult? Function(FaceEnrollmentProcessingState value)? processing,
    TResult? Function(FaceEnrollmentPinAssignedState value)? pinAssigned,
    TResult? Function(FaceEnrollmentCompletedState value)? completed,
    TResult? Function(FaceEnrollmentQualityInsufficientState value)?
        qualityInsufficient,
    TResult? Function(FaceEnrollmentDuplicateDetectedState value)?
        duplicateDetected,
    TResult? Function(FaceEnrollmentMaxUsersReachedState value)?
        maxUsersReached,
    TResult? Function(FaceEnrollmentErrorState value)? error,
  }) {
    return pinAssigned?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceEnrollmentInitialState value)? initial,
    TResult Function(FaceEnrollmentCapturingAngleState value)? capturingAngle,
    TResult Function(FaceEnrollmentLivenessCheckState value)? livenessCheck,
    TResult Function(FaceEnrollmentProcessingState value)? processing,
    TResult Function(FaceEnrollmentPinAssignedState value)? pinAssigned,
    TResult Function(FaceEnrollmentCompletedState value)? completed,
    TResult Function(FaceEnrollmentQualityInsufficientState value)?
        qualityInsufficient,
    TResult Function(FaceEnrollmentDuplicateDetectedState value)?
        duplicateDetected,
    TResult Function(FaceEnrollmentMaxUsersReachedState value)? maxUsersReached,
    TResult Function(FaceEnrollmentErrorState value)? error,
    required TResult orElse(),
  }) {
    if (pinAssigned != null) {
      return pinAssigned(this);
    }
    return orElse();
  }
}

abstract class FaceEnrollmentPinAssignedState implements FaceEnrollmentState {
  const factory FaceEnrollmentPinAssignedState({required final String pin}) =
      _$FaceEnrollmentPinAssignedStateImpl;

  String get pin;
  @JsonKey(ignore: true)
  _$$FaceEnrollmentPinAssignedStateImplCopyWith<
          _$FaceEnrollmentPinAssignedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FaceEnrollmentCompletedStateImplCopyWith<$Res> {
  factory _$$FaceEnrollmentCompletedStateImplCopyWith(
          _$FaceEnrollmentCompletedStateImpl value,
          $Res Function(_$FaceEnrollmentCompletedStateImpl) then) =
      __$$FaceEnrollmentCompletedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceEnrollmentCompletedStateImplCopyWithImpl<$Res>
    extends _$FaceEnrollmentStateCopyWithImpl<$Res,
        _$FaceEnrollmentCompletedStateImpl>
    implements _$$FaceEnrollmentCompletedStateImplCopyWith<$Res> {
  __$$FaceEnrollmentCompletedStateImplCopyWithImpl(
      _$FaceEnrollmentCompletedStateImpl _value,
      $Res Function(_$FaceEnrollmentCompletedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceEnrollmentCompletedStateImpl
    implements FaceEnrollmentCompletedState {
  const _$FaceEnrollmentCompletedStateImpl();

  @override
  String toString() {
    return 'FaceEnrollmentState.completed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceEnrollmentCompletedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int current, int total, String instruction)
        capturingAngle,
    required TResult Function() livenessCheck,
    required TResult Function() processing,
    required TResult Function(String pin) pinAssigned,
    required TResult Function() completed,
    required TResult Function() qualityInsufficient,
    required TResult Function(String matchedId, double similarity)
        duplicateDetected,
    required TResult Function() maxUsersReached,
    required TResult Function(String message) error,
  }) {
    return completed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int current, int total, String instruction)?
        capturingAngle,
    TResult? Function()? livenessCheck,
    TResult? Function()? processing,
    TResult? Function(String pin)? pinAssigned,
    TResult? Function()? completed,
    TResult? Function()? qualityInsufficient,
    TResult? Function(String matchedId, double similarity)? duplicateDetected,
    TResult? Function()? maxUsersReached,
    TResult? Function(String message)? error,
  }) {
    return completed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int current, int total, String instruction)?
        capturingAngle,
    TResult Function()? livenessCheck,
    TResult Function()? processing,
    TResult Function(String pin)? pinAssigned,
    TResult Function()? completed,
    TResult Function()? qualityInsufficient,
    TResult Function(String matchedId, double similarity)? duplicateDetected,
    TResult Function()? maxUsersReached,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceEnrollmentInitialState value) initial,
    required TResult Function(FaceEnrollmentCapturingAngleState value)
        capturingAngle,
    required TResult Function(FaceEnrollmentLivenessCheckState value)
        livenessCheck,
    required TResult Function(FaceEnrollmentProcessingState value) processing,
    required TResult Function(FaceEnrollmentPinAssignedState value) pinAssigned,
    required TResult Function(FaceEnrollmentCompletedState value) completed,
    required TResult Function(FaceEnrollmentQualityInsufficientState value)
        qualityInsufficient,
    required TResult Function(FaceEnrollmentDuplicateDetectedState value)
        duplicateDetected,
    required TResult Function(FaceEnrollmentMaxUsersReachedState value)
        maxUsersReached,
    required TResult Function(FaceEnrollmentErrorState value) error,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceEnrollmentInitialState value)? initial,
    TResult? Function(FaceEnrollmentCapturingAngleState value)? capturingAngle,
    TResult? Function(FaceEnrollmentLivenessCheckState value)? livenessCheck,
    TResult? Function(FaceEnrollmentProcessingState value)? processing,
    TResult? Function(FaceEnrollmentPinAssignedState value)? pinAssigned,
    TResult? Function(FaceEnrollmentCompletedState value)? completed,
    TResult? Function(FaceEnrollmentQualityInsufficientState value)?
        qualityInsufficient,
    TResult? Function(FaceEnrollmentDuplicateDetectedState value)?
        duplicateDetected,
    TResult? Function(FaceEnrollmentMaxUsersReachedState value)?
        maxUsersReached,
    TResult? Function(FaceEnrollmentErrorState value)? error,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceEnrollmentInitialState value)? initial,
    TResult Function(FaceEnrollmentCapturingAngleState value)? capturingAngle,
    TResult Function(FaceEnrollmentLivenessCheckState value)? livenessCheck,
    TResult Function(FaceEnrollmentProcessingState value)? processing,
    TResult Function(FaceEnrollmentPinAssignedState value)? pinAssigned,
    TResult Function(FaceEnrollmentCompletedState value)? completed,
    TResult Function(FaceEnrollmentQualityInsufficientState value)?
        qualityInsufficient,
    TResult Function(FaceEnrollmentDuplicateDetectedState value)?
        duplicateDetected,
    TResult Function(FaceEnrollmentMaxUsersReachedState value)? maxUsersReached,
    TResult Function(FaceEnrollmentErrorState value)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class FaceEnrollmentCompletedState implements FaceEnrollmentState {
  const factory FaceEnrollmentCompletedState() =
      _$FaceEnrollmentCompletedStateImpl;
}

/// @nodoc
abstract class _$$FaceEnrollmentQualityInsufficientStateImplCopyWith<$Res> {
  factory _$$FaceEnrollmentQualityInsufficientStateImplCopyWith(
          _$FaceEnrollmentQualityInsufficientStateImpl value,
          $Res Function(_$FaceEnrollmentQualityInsufficientStateImpl) then) =
      __$$FaceEnrollmentQualityInsufficientStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceEnrollmentQualityInsufficientStateImplCopyWithImpl<$Res>
    extends _$FaceEnrollmentStateCopyWithImpl<$Res,
        _$FaceEnrollmentQualityInsufficientStateImpl>
    implements _$$FaceEnrollmentQualityInsufficientStateImplCopyWith<$Res> {
  __$$FaceEnrollmentQualityInsufficientStateImplCopyWithImpl(
      _$FaceEnrollmentQualityInsufficientStateImpl _value,
      $Res Function(_$FaceEnrollmentQualityInsufficientStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceEnrollmentQualityInsufficientStateImpl
    implements FaceEnrollmentQualityInsufficientState {
  const _$FaceEnrollmentQualityInsufficientStateImpl();

  @override
  String toString() {
    return 'FaceEnrollmentState.qualityInsufficient()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceEnrollmentQualityInsufficientStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int current, int total, String instruction)
        capturingAngle,
    required TResult Function() livenessCheck,
    required TResult Function() processing,
    required TResult Function(String pin) pinAssigned,
    required TResult Function() completed,
    required TResult Function() qualityInsufficient,
    required TResult Function(String matchedId, double similarity)
        duplicateDetected,
    required TResult Function() maxUsersReached,
    required TResult Function(String message) error,
  }) {
    return qualityInsufficient();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int current, int total, String instruction)?
        capturingAngle,
    TResult? Function()? livenessCheck,
    TResult? Function()? processing,
    TResult? Function(String pin)? pinAssigned,
    TResult? Function()? completed,
    TResult? Function()? qualityInsufficient,
    TResult? Function(String matchedId, double similarity)? duplicateDetected,
    TResult? Function()? maxUsersReached,
    TResult? Function(String message)? error,
  }) {
    return qualityInsufficient?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int current, int total, String instruction)?
        capturingAngle,
    TResult Function()? livenessCheck,
    TResult Function()? processing,
    TResult Function(String pin)? pinAssigned,
    TResult Function()? completed,
    TResult Function()? qualityInsufficient,
    TResult Function(String matchedId, double similarity)? duplicateDetected,
    TResult Function()? maxUsersReached,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (qualityInsufficient != null) {
      return qualityInsufficient();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceEnrollmentInitialState value) initial,
    required TResult Function(FaceEnrollmentCapturingAngleState value)
        capturingAngle,
    required TResult Function(FaceEnrollmentLivenessCheckState value)
        livenessCheck,
    required TResult Function(FaceEnrollmentProcessingState value) processing,
    required TResult Function(FaceEnrollmentPinAssignedState value) pinAssigned,
    required TResult Function(FaceEnrollmentCompletedState value) completed,
    required TResult Function(FaceEnrollmentQualityInsufficientState value)
        qualityInsufficient,
    required TResult Function(FaceEnrollmentDuplicateDetectedState value)
        duplicateDetected,
    required TResult Function(FaceEnrollmentMaxUsersReachedState value)
        maxUsersReached,
    required TResult Function(FaceEnrollmentErrorState value) error,
  }) {
    return qualityInsufficient(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceEnrollmentInitialState value)? initial,
    TResult? Function(FaceEnrollmentCapturingAngleState value)? capturingAngle,
    TResult? Function(FaceEnrollmentLivenessCheckState value)? livenessCheck,
    TResult? Function(FaceEnrollmentProcessingState value)? processing,
    TResult? Function(FaceEnrollmentPinAssignedState value)? pinAssigned,
    TResult? Function(FaceEnrollmentCompletedState value)? completed,
    TResult? Function(FaceEnrollmentQualityInsufficientState value)?
        qualityInsufficient,
    TResult? Function(FaceEnrollmentDuplicateDetectedState value)?
        duplicateDetected,
    TResult? Function(FaceEnrollmentMaxUsersReachedState value)?
        maxUsersReached,
    TResult? Function(FaceEnrollmentErrorState value)? error,
  }) {
    return qualityInsufficient?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceEnrollmentInitialState value)? initial,
    TResult Function(FaceEnrollmentCapturingAngleState value)? capturingAngle,
    TResult Function(FaceEnrollmentLivenessCheckState value)? livenessCheck,
    TResult Function(FaceEnrollmentProcessingState value)? processing,
    TResult Function(FaceEnrollmentPinAssignedState value)? pinAssigned,
    TResult Function(FaceEnrollmentCompletedState value)? completed,
    TResult Function(FaceEnrollmentQualityInsufficientState value)?
        qualityInsufficient,
    TResult Function(FaceEnrollmentDuplicateDetectedState value)?
        duplicateDetected,
    TResult Function(FaceEnrollmentMaxUsersReachedState value)? maxUsersReached,
    TResult Function(FaceEnrollmentErrorState value)? error,
    required TResult orElse(),
  }) {
    if (qualityInsufficient != null) {
      return qualityInsufficient(this);
    }
    return orElse();
  }
}

abstract class FaceEnrollmentQualityInsufficientState
    implements FaceEnrollmentState {
  const factory FaceEnrollmentQualityInsufficientState() =
      _$FaceEnrollmentQualityInsufficientStateImpl;
}

/// @nodoc
abstract class _$$FaceEnrollmentDuplicateDetectedStateImplCopyWith<$Res> {
  factory _$$FaceEnrollmentDuplicateDetectedStateImplCopyWith(
          _$FaceEnrollmentDuplicateDetectedStateImpl value,
          $Res Function(_$FaceEnrollmentDuplicateDetectedStateImpl) then) =
      __$$FaceEnrollmentDuplicateDetectedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String matchedId, double similarity});
}

/// @nodoc
class __$$FaceEnrollmentDuplicateDetectedStateImplCopyWithImpl<$Res>
    extends _$FaceEnrollmentStateCopyWithImpl<$Res,
        _$FaceEnrollmentDuplicateDetectedStateImpl>
    implements _$$FaceEnrollmentDuplicateDetectedStateImplCopyWith<$Res> {
  __$$FaceEnrollmentDuplicateDetectedStateImplCopyWithImpl(
      _$FaceEnrollmentDuplicateDetectedStateImpl _value,
      $Res Function(_$FaceEnrollmentDuplicateDetectedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matchedId = null,
    Object? similarity = null,
  }) {
    return _then(_$FaceEnrollmentDuplicateDetectedStateImpl(
      matchedId: null == matchedId
          ? _value.matchedId
          : matchedId // ignore: cast_nullable_to_non_nullable
              as String,
      similarity: null == similarity
          ? _value.similarity
          : similarity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$FaceEnrollmentDuplicateDetectedStateImpl
    implements FaceEnrollmentDuplicateDetectedState {
  const _$FaceEnrollmentDuplicateDetectedStateImpl(
      {required this.matchedId, required this.similarity});

  @override
  final String matchedId;
  @override
  final double similarity;

  @override
  String toString() {
    return 'FaceEnrollmentState.duplicateDetected(matchedId: $matchedId, similarity: $similarity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceEnrollmentDuplicateDetectedStateImpl &&
            (identical(other.matchedId, matchedId) ||
                other.matchedId == matchedId) &&
            (identical(other.similarity, similarity) ||
                other.similarity == similarity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, matchedId, similarity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceEnrollmentDuplicateDetectedStateImplCopyWith<
          _$FaceEnrollmentDuplicateDetectedStateImpl>
      get copyWith => __$$FaceEnrollmentDuplicateDetectedStateImplCopyWithImpl<
          _$FaceEnrollmentDuplicateDetectedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int current, int total, String instruction)
        capturingAngle,
    required TResult Function() livenessCheck,
    required TResult Function() processing,
    required TResult Function(String pin) pinAssigned,
    required TResult Function() completed,
    required TResult Function() qualityInsufficient,
    required TResult Function(String matchedId, double similarity)
        duplicateDetected,
    required TResult Function() maxUsersReached,
    required TResult Function(String message) error,
  }) {
    return duplicateDetected(matchedId, similarity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int current, int total, String instruction)?
        capturingAngle,
    TResult? Function()? livenessCheck,
    TResult? Function()? processing,
    TResult? Function(String pin)? pinAssigned,
    TResult? Function()? completed,
    TResult? Function()? qualityInsufficient,
    TResult? Function(String matchedId, double similarity)? duplicateDetected,
    TResult? Function()? maxUsersReached,
    TResult? Function(String message)? error,
  }) {
    return duplicateDetected?.call(matchedId, similarity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int current, int total, String instruction)?
        capturingAngle,
    TResult Function()? livenessCheck,
    TResult Function()? processing,
    TResult Function(String pin)? pinAssigned,
    TResult Function()? completed,
    TResult Function()? qualityInsufficient,
    TResult Function(String matchedId, double similarity)? duplicateDetected,
    TResult Function()? maxUsersReached,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (duplicateDetected != null) {
      return duplicateDetected(matchedId, similarity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceEnrollmentInitialState value) initial,
    required TResult Function(FaceEnrollmentCapturingAngleState value)
        capturingAngle,
    required TResult Function(FaceEnrollmentLivenessCheckState value)
        livenessCheck,
    required TResult Function(FaceEnrollmentProcessingState value) processing,
    required TResult Function(FaceEnrollmentPinAssignedState value) pinAssigned,
    required TResult Function(FaceEnrollmentCompletedState value) completed,
    required TResult Function(FaceEnrollmentQualityInsufficientState value)
        qualityInsufficient,
    required TResult Function(FaceEnrollmentDuplicateDetectedState value)
        duplicateDetected,
    required TResult Function(FaceEnrollmentMaxUsersReachedState value)
        maxUsersReached,
    required TResult Function(FaceEnrollmentErrorState value) error,
  }) {
    return duplicateDetected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceEnrollmentInitialState value)? initial,
    TResult? Function(FaceEnrollmentCapturingAngleState value)? capturingAngle,
    TResult? Function(FaceEnrollmentLivenessCheckState value)? livenessCheck,
    TResult? Function(FaceEnrollmentProcessingState value)? processing,
    TResult? Function(FaceEnrollmentPinAssignedState value)? pinAssigned,
    TResult? Function(FaceEnrollmentCompletedState value)? completed,
    TResult? Function(FaceEnrollmentQualityInsufficientState value)?
        qualityInsufficient,
    TResult? Function(FaceEnrollmentDuplicateDetectedState value)?
        duplicateDetected,
    TResult? Function(FaceEnrollmentMaxUsersReachedState value)?
        maxUsersReached,
    TResult? Function(FaceEnrollmentErrorState value)? error,
  }) {
    return duplicateDetected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceEnrollmentInitialState value)? initial,
    TResult Function(FaceEnrollmentCapturingAngleState value)? capturingAngle,
    TResult Function(FaceEnrollmentLivenessCheckState value)? livenessCheck,
    TResult Function(FaceEnrollmentProcessingState value)? processing,
    TResult Function(FaceEnrollmentPinAssignedState value)? pinAssigned,
    TResult Function(FaceEnrollmentCompletedState value)? completed,
    TResult Function(FaceEnrollmentQualityInsufficientState value)?
        qualityInsufficient,
    TResult Function(FaceEnrollmentDuplicateDetectedState value)?
        duplicateDetected,
    TResult Function(FaceEnrollmentMaxUsersReachedState value)? maxUsersReached,
    TResult Function(FaceEnrollmentErrorState value)? error,
    required TResult orElse(),
  }) {
    if (duplicateDetected != null) {
      return duplicateDetected(this);
    }
    return orElse();
  }
}

abstract class FaceEnrollmentDuplicateDetectedState
    implements FaceEnrollmentState {
  const factory FaceEnrollmentDuplicateDetectedState(
          {required final String matchedId, required final double similarity}) =
      _$FaceEnrollmentDuplicateDetectedStateImpl;

  String get matchedId;
  double get similarity;
  @JsonKey(ignore: true)
  _$$FaceEnrollmentDuplicateDetectedStateImplCopyWith<
          _$FaceEnrollmentDuplicateDetectedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FaceEnrollmentMaxUsersReachedStateImplCopyWith<$Res> {
  factory _$$FaceEnrollmentMaxUsersReachedStateImplCopyWith(
          _$FaceEnrollmentMaxUsersReachedStateImpl value,
          $Res Function(_$FaceEnrollmentMaxUsersReachedStateImpl) then) =
      __$$FaceEnrollmentMaxUsersReachedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceEnrollmentMaxUsersReachedStateImplCopyWithImpl<$Res>
    extends _$FaceEnrollmentStateCopyWithImpl<$Res,
        _$FaceEnrollmentMaxUsersReachedStateImpl>
    implements _$$FaceEnrollmentMaxUsersReachedStateImplCopyWith<$Res> {
  __$$FaceEnrollmentMaxUsersReachedStateImplCopyWithImpl(
      _$FaceEnrollmentMaxUsersReachedStateImpl _value,
      $Res Function(_$FaceEnrollmentMaxUsersReachedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceEnrollmentMaxUsersReachedStateImpl
    implements FaceEnrollmentMaxUsersReachedState {
  const _$FaceEnrollmentMaxUsersReachedStateImpl();

  @override
  String toString() {
    return 'FaceEnrollmentState.maxUsersReached()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceEnrollmentMaxUsersReachedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int current, int total, String instruction)
        capturingAngle,
    required TResult Function() livenessCheck,
    required TResult Function() processing,
    required TResult Function(String pin) pinAssigned,
    required TResult Function() completed,
    required TResult Function() qualityInsufficient,
    required TResult Function(String matchedId, double similarity)
        duplicateDetected,
    required TResult Function() maxUsersReached,
    required TResult Function(String message) error,
  }) {
    return maxUsersReached();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int current, int total, String instruction)?
        capturingAngle,
    TResult? Function()? livenessCheck,
    TResult? Function()? processing,
    TResult? Function(String pin)? pinAssigned,
    TResult? Function()? completed,
    TResult? Function()? qualityInsufficient,
    TResult? Function(String matchedId, double similarity)? duplicateDetected,
    TResult? Function()? maxUsersReached,
    TResult? Function(String message)? error,
  }) {
    return maxUsersReached?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int current, int total, String instruction)?
        capturingAngle,
    TResult Function()? livenessCheck,
    TResult Function()? processing,
    TResult Function(String pin)? pinAssigned,
    TResult Function()? completed,
    TResult Function()? qualityInsufficient,
    TResult Function(String matchedId, double similarity)? duplicateDetected,
    TResult Function()? maxUsersReached,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (maxUsersReached != null) {
      return maxUsersReached();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceEnrollmentInitialState value) initial,
    required TResult Function(FaceEnrollmentCapturingAngleState value)
        capturingAngle,
    required TResult Function(FaceEnrollmentLivenessCheckState value)
        livenessCheck,
    required TResult Function(FaceEnrollmentProcessingState value) processing,
    required TResult Function(FaceEnrollmentPinAssignedState value) pinAssigned,
    required TResult Function(FaceEnrollmentCompletedState value) completed,
    required TResult Function(FaceEnrollmentQualityInsufficientState value)
        qualityInsufficient,
    required TResult Function(FaceEnrollmentDuplicateDetectedState value)
        duplicateDetected,
    required TResult Function(FaceEnrollmentMaxUsersReachedState value)
        maxUsersReached,
    required TResult Function(FaceEnrollmentErrorState value) error,
  }) {
    return maxUsersReached(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceEnrollmentInitialState value)? initial,
    TResult? Function(FaceEnrollmentCapturingAngleState value)? capturingAngle,
    TResult? Function(FaceEnrollmentLivenessCheckState value)? livenessCheck,
    TResult? Function(FaceEnrollmentProcessingState value)? processing,
    TResult? Function(FaceEnrollmentPinAssignedState value)? pinAssigned,
    TResult? Function(FaceEnrollmentCompletedState value)? completed,
    TResult? Function(FaceEnrollmentQualityInsufficientState value)?
        qualityInsufficient,
    TResult? Function(FaceEnrollmentDuplicateDetectedState value)?
        duplicateDetected,
    TResult? Function(FaceEnrollmentMaxUsersReachedState value)?
        maxUsersReached,
    TResult? Function(FaceEnrollmentErrorState value)? error,
  }) {
    return maxUsersReached?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceEnrollmentInitialState value)? initial,
    TResult Function(FaceEnrollmentCapturingAngleState value)? capturingAngle,
    TResult Function(FaceEnrollmentLivenessCheckState value)? livenessCheck,
    TResult Function(FaceEnrollmentProcessingState value)? processing,
    TResult Function(FaceEnrollmentPinAssignedState value)? pinAssigned,
    TResult Function(FaceEnrollmentCompletedState value)? completed,
    TResult Function(FaceEnrollmentQualityInsufficientState value)?
        qualityInsufficient,
    TResult Function(FaceEnrollmentDuplicateDetectedState value)?
        duplicateDetected,
    TResult Function(FaceEnrollmentMaxUsersReachedState value)? maxUsersReached,
    TResult Function(FaceEnrollmentErrorState value)? error,
    required TResult orElse(),
  }) {
    if (maxUsersReached != null) {
      return maxUsersReached(this);
    }
    return orElse();
  }
}

abstract class FaceEnrollmentMaxUsersReachedState
    implements FaceEnrollmentState {
  const factory FaceEnrollmentMaxUsersReachedState() =
      _$FaceEnrollmentMaxUsersReachedStateImpl;
}

/// @nodoc
abstract class _$$FaceEnrollmentErrorStateImplCopyWith<$Res> {
  factory _$$FaceEnrollmentErrorStateImplCopyWith(
          _$FaceEnrollmentErrorStateImpl value,
          $Res Function(_$FaceEnrollmentErrorStateImpl) then) =
      __$$FaceEnrollmentErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FaceEnrollmentErrorStateImplCopyWithImpl<$Res>
    extends _$FaceEnrollmentStateCopyWithImpl<$Res,
        _$FaceEnrollmentErrorStateImpl>
    implements _$$FaceEnrollmentErrorStateImplCopyWith<$Res> {
  __$$FaceEnrollmentErrorStateImplCopyWithImpl(
      _$FaceEnrollmentErrorStateImpl _value,
      $Res Function(_$FaceEnrollmentErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FaceEnrollmentErrorStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FaceEnrollmentErrorStateImpl implements FaceEnrollmentErrorState {
  const _$FaceEnrollmentErrorStateImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'FaceEnrollmentState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceEnrollmentErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceEnrollmentErrorStateImplCopyWith<_$FaceEnrollmentErrorStateImpl>
      get copyWith => __$$FaceEnrollmentErrorStateImplCopyWithImpl<
          _$FaceEnrollmentErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int current, int total, String instruction)
        capturingAngle,
    required TResult Function() livenessCheck,
    required TResult Function() processing,
    required TResult Function(String pin) pinAssigned,
    required TResult Function() completed,
    required TResult Function() qualityInsufficient,
    required TResult Function(String matchedId, double similarity)
        duplicateDetected,
    required TResult Function() maxUsersReached,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int current, int total, String instruction)?
        capturingAngle,
    TResult? Function()? livenessCheck,
    TResult? Function()? processing,
    TResult? Function(String pin)? pinAssigned,
    TResult? Function()? completed,
    TResult? Function()? qualityInsufficient,
    TResult? Function(String matchedId, double similarity)? duplicateDetected,
    TResult? Function()? maxUsersReached,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int current, int total, String instruction)?
        capturingAngle,
    TResult Function()? livenessCheck,
    TResult Function()? processing,
    TResult Function(String pin)? pinAssigned,
    TResult Function()? completed,
    TResult Function()? qualityInsufficient,
    TResult Function(String matchedId, double similarity)? duplicateDetected,
    TResult Function()? maxUsersReached,
    TResult Function(String message)? error,
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
    required TResult Function(FaceEnrollmentInitialState value) initial,
    required TResult Function(FaceEnrollmentCapturingAngleState value)
        capturingAngle,
    required TResult Function(FaceEnrollmentLivenessCheckState value)
        livenessCheck,
    required TResult Function(FaceEnrollmentProcessingState value) processing,
    required TResult Function(FaceEnrollmentPinAssignedState value) pinAssigned,
    required TResult Function(FaceEnrollmentCompletedState value) completed,
    required TResult Function(FaceEnrollmentQualityInsufficientState value)
        qualityInsufficient,
    required TResult Function(FaceEnrollmentDuplicateDetectedState value)
        duplicateDetected,
    required TResult Function(FaceEnrollmentMaxUsersReachedState value)
        maxUsersReached,
    required TResult Function(FaceEnrollmentErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceEnrollmentInitialState value)? initial,
    TResult? Function(FaceEnrollmentCapturingAngleState value)? capturingAngle,
    TResult? Function(FaceEnrollmentLivenessCheckState value)? livenessCheck,
    TResult? Function(FaceEnrollmentProcessingState value)? processing,
    TResult? Function(FaceEnrollmentPinAssignedState value)? pinAssigned,
    TResult? Function(FaceEnrollmentCompletedState value)? completed,
    TResult? Function(FaceEnrollmentQualityInsufficientState value)?
        qualityInsufficient,
    TResult? Function(FaceEnrollmentDuplicateDetectedState value)?
        duplicateDetected,
    TResult? Function(FaceEnrollmentMaxUsersReachedState value)?
        maxUsersReached,
    TResult? Function(FaceEnrollmentErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceEnrollmentInitialState value)? initial,
    TResult Function(FaceEnrollmentCapturingAngleState value)? capturingAngle,
    TResult Function(FaceEnrollmentLivenessCheckState value)? livenessCheck,
    TResult Function(FaceEnrollmentProcessingState value)? processing,
    TResult Function(FaceEnrollmentPinAssignedState value)? pinAssigned,
    TResult Function(FaceEnrollmentCompletedState value)? completed,
    TResult Function(FaceEnrollmentQualityInsufficientState value)?
        qualityInsufficient,
    TResult Function(FaceEnrollmentDuplicateDetectedState value)?
        duplicateDetected,
    TResult Function(FaceEnrollmentMaxUsersReachedState value)? maxUsersReached,
    TResult Function(FaceEnrollmentErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FaceEnrollmentErrorState implements FaceEnrollmentState {
  const factory FaceEnrollmentErrorState({required final String message}) =
      _$FaceEnrollmentErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FaceEnrollmentErrorStateImplCopyWith<_$FaceEnrollmentErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
