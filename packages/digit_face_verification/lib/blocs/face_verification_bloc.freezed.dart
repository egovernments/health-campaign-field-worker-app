// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_verification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FaceVerificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            String individualId, List<double> embedding, double quality)
        registerFace,
    required TResult Function(String individualId, List<double> embedding)
        verifyFace,
    required TResult Function(String individualId) deleteRegistration,
    required TResult Function(int faceCount, double quality) faceDetected,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            String individualId, List<double> embedding, double quality)?
        registerFace,
    TResult? Function(String individualId, List<double> embedding)? verifyFace,
    TResult? Function(String individualId)? deleteRegistration,
    TResult? Function(int faceCount, double quality)? faceDetected,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            String individualId, List<double> embedding, double quality)?
        registerFace,
    TResult Function(String individualId, List<double> embedding)? verifyFace,
    TResult Function(String individualId)? deleteRegistration,
    TResult Function(int faceCount, double quality)? faceDetected,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceVerificationInitializeEvent value) initialize,
    required TResult Function(FaceVerificationRegisterEvent value) registerFace,
    required TResult Function(FaceVerificationVerifyEvent value) verifyFace,
    required TResult Function(FaceVerificationDeleteEvent value)
        deleteRegistration,
    required TResult Function(FaceVerificationFaceDetectedEvent value)
        faceDetected,
    required TResult Function(FaceVerificationResetEvent value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceVerificationInitializeEvent value)? initialize,
    TResult? Function(FaceVerificationRegisterEvent value)? registerFace,
    TResult? Function(FaceVerificationVerifyEvent value)? verifyFace,
    TResult? Function(FaceVerificationDeleteEvent value)? deleteRegistration,
    TResult? Function(FaceVerificationFaceDetectedEvent value)? faceDetected,
    TResult? Function(FaceVerificationResetEvent value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceVerificationInitializeEvent value)? initialize,
    TResult Function(FaceVerificationRegisterEvent value)? registerFace,
    TResult Function(FaceVerificationVerifyEvent value)? verifyFace,
    TResult Function(FaceVerificationDeleteEvent value)? deleteRegistration,
    TResult Function(FaceVerificationFaceDetectedEvent value)? faceDetected,
    TResult Function(FaceVerificationResetEvent value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaceVerificationEventCopyWith<$Res> {
  factory $FaceVerificationEventCopyWith(FaceVerificationEvent value,
          $Res Function(FaceVerificationEvent) then) =
      _$FaceVerificationEventCopyWithImpl<$Res, FaceVerificationEvent>;
}

/// @nodoc
class _$FaceVerificationEventCopyWithImpl<$Res,
        $Val extends FaceVerificationEvent>
    implements $FaceVerificationEventCopyWith<$Res> {
  _$FaceVerificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FaceVerificationInitializeEventImplCopyWith<$Res> {
  factory _$$FaceVerificationInitializeEventImplCopyWith(
          _$FaceVerificationInitializeEventImpl value,
          $Res Function(_$FaceVerificationInitializeEventImpl) then) =
      __$$FaceVerificationInitializeEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceVerificationInitializeEventImplCopyWithImpl<$Res>
    extends _$FaceVerificationEventCopyWithImpl<$Res,
        _$FaceVerificationInitializeEventImpl>
    implements _$$FaceVerificationInitializeEventImplCopyWith<$Res> {
  __$$FaceVerificationInitializeEventImplCopyWithImpl(
      _$FaceVerificationInitializeEventImpl _value,
      $Res Function(_$FaceVerificationInitializeEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceVerificationInitializeEventImpl
    implements FaceVerificationInitializeEvent {
  const _$FaceVerificationInitializeEventImpl();

  @override
  String toString() {
    return 'FaceVerificationEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceVerificationInitializeEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            String individualId, List<double> embedding, double quality)
        registerFace,
    required TResult Function(String individualId, List<double> embedding)
        verifyFace,
    required TResult Function(String individualId) deleteRegistration,
    required TResult Function(int faceCount, double quality) faceDetected,
    required TResult Function() reset,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            String individualId, List<double> embedding, double quality)?
        registerFace,
    TResult? Function(String individualId, List<double> embedding)? verifyFace,
    TResult? Function(String individualId)? deleteRegistration,
    TResult? Function(int faceCount, double quality)? faceDetected,
    TResult? Function()? reset,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            String individualId, List<double> embedding, double quality)?
        registerFace,
    TResult Function(String individualId, List<double> embedding)? verifyFace,
    TResult Function(String individualId)? deleteRegistration,
    TResult Function(int faceCount, double quality)? faceDetected,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceVerificationInitializeEvent value) initialize,
    required TResult Function(FaceVerificationRegisterEvent value) registerFace,
    required TResult Function(FaceVerificationVerifyEvent value) verifyFace,
    required TResult Function(FaceVerificationDeleteEvent value)
        deleteRegistration,
    required TResult Function(FaceVerificationFaceDetectedEvent value)
        faceDetected,
    required TResult Function(FaceVerificationResetEvent value) reset,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceVerificationInitializeEvent value)? initialize,
    TResult? Function(FaceVerificationRegisterEvent value)? registerFace,
    TResult? Function(FaceVerificationVerifyEvent value)? verifyFace,
    TResult? Function(FaceVerificationDeleteEvent value)? deleteRegistration,
    TResult? Function(FaceVerificationFaceDetectedEvent value)? faceDetected,
    TResult? Function(FaceVerificationResetEvent value)? reset,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceVerificationInitializeEvent value)? initialize,
    TResult Function(FaceVerificationRegisterEvent value)? registerFace,
    TResult Function(FaceVerificationVerifyEvent value)? verifyFace,
    TResult Function(FaceVerificationDeleteEvent value)? deleteRegistration,
    TResult Function(FaceVerificationFaceDetectedEvent value)? faceDetected,
    TResult Function(FaceVerificationResetEvent value)? reset,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class FaceVerificationInitializeEvent
    implements FaceVerificationEvent {
  const factory FaceVerificationInitializeEvent() =
      _$FaceVerificationInitializeEventImpl;
}

/// @nodoc
abstract class _$$FaceVerificationRegisterEventImplCopyWith<$Res> {
  factory _$$FaceVerificationRegisterEventImplCopyWith(
          _$FaceVerificationRegisterEventImpl value,
          $Res Function(_$FaceVerificationRegisterEventImpl) then) =
      __$$FaceVerificationRegisterEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String individualId, List<double> embedding, double quality});
}

/// @nodoc
class __$$FaceVerificationRegisterEventImplCopyWithImpl<$Res>
    extends _$FaceVerificationEventCopyWithImpl<$Res,
        _$FaceVerificationRegisterEventImpl>
    implements _$$FaceVerificationRegisterEventImplCopyWith<$Res> {
  __$$FaceVerificationRegisterEventImplCopyWithImpl(
      _$FaceVerificationRegisterEventImpl _value,
      $Res Function(_$FaceVerificationRegisterEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? individualId = null,
    Object? embedding = null,
    Object? quality = null,
  }) {
    return _then(_$FaceVerificationRegisterEventImpl(
      individualId: null == individualId
          ? _value.individualId
          : individualId // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$FaceVerificationRegisterEventImpl
    implements FaceVerificationRegisterEvent {
  const _$FaceVerificationRegisterEventImpl(
      {required this.individualId,
      required final List<double> embedding,
      this.quality = 1.0})
      : _embedding = embedding;

  @override
  final String individualId;
  final List<double> _embedding;
  @override
  List<double> get embedding {
    if (_embedding is EqualUnmodifiableListView) return _embedding;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_embedding);
  }

  @override
  @JsonKey()
  final double quality;

  @override
  String toString() {
    return 'FaceVerificationEvent.registerFace(individualId: $individualId, embedding: $embedding, quality: $quality)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceVerificationRegisterEventImpl &&
            (identical(other.individualId, individualId) ||
                other.individualId == individualId) &&
            const DeepCollectionEquality()
                .equals(other._embedding, _embedding) &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @override
  int get hashCode => Object.hash(runtimeType, individualId,
      const DeepCollectionEquality().hash(_embedding), quality);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceVerificationRegisterEventImplCopyWith<
          _$FaceVerificationRegisterEventImpl>
      get copyWith => __$$FaceVerificationRegisterEventImplCopyWithImpl<
          _$FaceVerificationRegisterEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            String individualId, List<double> embedding, double quality)
        registerFace,
    required TResult Function(String individualId, List<double> embedding)
        verifyFace,
    required TResult Function(String individualId) deleteRegistration,
    required TResult Function(int faceCount, double quality) faceDetected,
    required TResult Function() reset,
  }) {
    return registerFace(individualId, embedding, quality);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            String individualId, List<double> embedding, double quality)?
        registerFace,
    TResult? Function(String individualId, List<double> embedding)? verifyFace,
    TResult? Function(String individualId)? deleteRegistration,
    TResult? Function(int faceCount, double quality)? faceDetected,
    TResult? Function()? reset,
  }) {
    return registerFace?.call(individualId, embedding, quality);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            String individualId, List<double> embedding, double quality)?
        registerFace,
    TResult Function(String individualId, List<double> embedding)? verifyFace,
    TResult Function(String individualId)? deleteRegistration,
    TResult Function(int faceCount, double quality)? faceDetected,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (registerFace != null) {
      return registerFace(individualId, embedding, quality);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceVerificationInitializeEvent value) initialize,
    required TResult Function(FaceVerificationRegisterEvent value) registerFace,
    required TResult Function(FaceVerificationVerifyEvent value) verifyFace,
    required TResult Function(FaceVerificationDeleteEvent value)
        deleteRegistration,
    required TResult Function(FaceVerificationFaceDetectedEvent value)
        faceDetected,
    required TResult Function(FaceVerificationResetEvent value) reset,
  }) {
    return registerFace(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceVerificationInitializeEvent value)? initialize,
    TResult? Function(FaceVerificationRegisterEvent value)? registerFace,
    TResult? Function(FaceVerificationVerifyEvent value)? verifyFace,
    TResult? Function(FaceVerificationDeleteEvent value)? deleteRegistration,
    TResult? Function(FaceVerificationFaceDetectedEvent value)? faceDetected,
    TResult? Function(FaceVerificationResetEvent value)? reset,
  }) {
    return registerFace?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceVerificationInitializeEvent value)? initialize,
    TResult Function(FaceVerificationRegisterEvent value)? registerFace,
    TResult Function(FaceVerificationVerifyEvent value)? verifyFace,
    TResult Function(FaceVerificationDeleteEvent value)? deleteRegistration,
    TResult Function(FaceVerificationFaceDetectedEvent value)? faceDetected,
    TResult Function(FaceVerificationResetEvent value)? reset,
    required TResult orElse(),
  }) {
    if (registerFace != null) {
      return registerFace(this);
    }
    return orElse();
  }
}

abstract class FaceVerificationRegisterEvent implements FaceVerificationEvent {
  const factory FaceVerificationRegisterEvent(
      {required final String individualId,
      required final List<double> embedding,
      final double quality}) = _$FaceVerificationRegisterEventImpl;

  String get individualId;
  List<double> get embedding;
  double get quality;
  @JsonKey(ignore: true)
  _$$FaceVerificationRegisterEventImplCopyWith<
          _$FaceVerificationRegisterEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FaceVerificationVerifyEventImplCopyWith<$Res> {
  factory _$$FaceVerificationVerifyEventImplCopyWith(
          _$FaceVerificationVerifyEventImpl value,
          $Res Function(_$FaceVerificationVerifyEventImpl) then) =
      __$$FaceVerificationVerifyEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String individualId, List<double> embedding});
}

/// @nodoc
class __$$FaceVerificationVerifyEventImplCopyWithImpl<$Res>
    extends _$FaceVerificationEventCopyWithImpl<$Res,
        _$FaceVerificationVerifyEventImpl>
    implements _$$FaceVerificationVerifyEventImplCopyWith<$Res> {
  __$$FaceVerificationVerifyEventImplCopyWithImpl(
      _$FaceVerificationVerifyEventImpl _value,
      $Res Function(_$FaceVerificationVerifyEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? individualId = null,
    Object? embedding = null,
  }) {
    return _then(_$FaceVerificationVerifyEventImpl(
      individualId: null == individualId
          ? _value.individualId
          : individualId // ignore: cast_nullable_to_non_nullable
              as String,
      embedding: null == embedding
          ? _value._embedding
          : embedding // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc

class _$FaceVerificationVerifyEventImpl implements FaceVerificationVerifyEvent {
  const _$FaceVerificationVerifyEventImpl(
      {required this.individualId, required final List<double> embedding})
      : _embedding = embedding;

  @override
  final String individualId;
  final List<double> _embedding;
  @override
  List<double> get embedding {
    if (_embedding is EqualUnmodifiableListView) return _embedding;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_embedding);
  }

  @override
  String toString() {
    return 'FaceVerificationEvent.verifyFace(individualId: $individualId, embedding: $embedding)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceVerificationVerifyEventImpl &&
            (identical(other.individualId, individualId) ||
                other.individualId == individualId) &&
            const DeepCollectionEquality()
                .equals(other._embedding, _embedding));
  }

  @override
  int get hashCode => Object.hash(runtimeType, individualId,
      const DeepCollectionEquality().hash(_embedding));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceVerificationVerifyEventImplCopyWith<_$FaceVerificationVerifyEventImpl>
      get copyWith => __$$FaceVerificationVerifyEventImplCopyWithImpl<
          _$FaceVerificationVerifyEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            String individualId, List<double> embedding, double quality)
        registerFace,
    required TResult Function(String individualId, List<double> embedding)
        verifyFace,
    required TResult Function(String individualId) deleteRegistration,
    required TResult Function(int faceCount, double quality) faceDetected,
    required TResult Function() reset,
  }) {
    return verifyFace(individualId, embedding);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            String individualId, List<double> embedding, double quality)?
        registerFace,
    TResult? Function(String individualId, List<double> embedding)? verifyFace,
    TResult? Function(String individualId)? deleteRegistration,
    TResult? Function(int faceCount, double quality)? faceDetected,
    TResult? Function()? reset,
  }) {
    return verifyFace?.call(individualId, embedding);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            String individualId, List<double> embedding, double quality)?
        registerFace,
    TResult Function(String individualId, List<double> embedding)? verifyFace,
    TResult Function(String individualId)? deleteRegistration,
    TResult Function(int faceCount, double quality)? faceDetected,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (verifyFace != null) {
      return verifyFace(individualId, embedding);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceVerificationInitializeEvent value) initialize,
    required TResult Function(FaceVerificationRegisterEvent value) registerFace,
    required TResult Function(FaceVerificationVerifyEvent value) verifyFace,
    required TResult Function(FaceVerificationDeleteEvent value)
        deleteRegistration,
    required TResult Function(FaceVerificationFaceDetectedEvent value)
        faceDetected,
    required TResult Function(FaceVerificationResetEvent value) reset,
  }) {
    return verifyFace(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceVerificationInitializeEvent value)? initialize,
    TResult? Function(FaceVerificationRegisterEvent value)? registerFace,
    TResult? Function(FaceVerificationVerifyEvent value)? verifyFace,
    TResult? Function(FaceVerificationDeleteEvent value)? deleteRegistration,
    TResult? Function(FaceVerificationFaceDetectedEvent value)? faceDetected,
    TResult? Function(FaceVerificationResetEvent value)? reset,
  }) {
    return verifyFace?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceVerificationInitializeEvent value)? initialize,
    TResult Function(FaceVerificationRegisterEvent value)? registerFace,
    TResult Function(FaceVerificationVerifyEvent value)? verifyFace,
    TResult Function(FaceVerificationDeleteEvent value)? deleteRegistration,
    TResult Function(FaceVerificationFaceDetectedEvent value)? faceDetected,
    TResult Function(FaceVerificationResetEvent value)? reset,
    required TResult orElse(),
  }) {
    if (verifyFace != null) {
      return verifyFace(this);
    }
    return orElse();
  }
}

abstract class FaceVerificationVerifyEvent implements FaceVerificationEvent {
  const factory FaceVerificationVerifyEvent(
          {required final String individualId,
          required final List<double> embedding}) =
      _$FaceVerificationVerifyEventImpl;

  String get individualId;
  List<double> get embedding;
  @JsonKey(ignore: true)
  _$$FaceVerificationVerifyEventImplCopyWith<_$FaceVerificationVerifyEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FaceVerificationDeleteEventImplCopyWith<$Res> {
  factory _$$FaceVerificationDeleteEventImplCopyWith(
          _$FaceVerificationDeleteEventImpl value,
          $Res Function(_$FaceVerificationDeleteEventImpl) then) =
      __$$FaceVerificationDeleteEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String individualId});
}

/// @nodoc
class __$$FaceVerificationDeleteEventImplCopyWithImpl<$Res>
    extends _$FaceVerificationEventCopyWithImpl<$Res,
        _$FaceVerificationDeleteEventImpl>
    implements _$$FaceVerificationDeleteEventImplCopyWith<$Res> {
  __$$FaceVerificationDeleteEventImplCopyWithImpl(
      _$FaceVerificationDeleteEventImpl _value,
      $Res Function(_$FaceVerificationDeleteEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? individualId = null,
  }) {
    return _then(_$FaceVerificationDeleteEventImpl(
      individualId: null == individualId
          ? _value.individualId
          : individualId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FaceVerificationDeleteEventImpl implements FaceVerificationDeleteEvent {
  const _$FaceVerificationDeleteEventImpl({required this.individualId});

  @override
  final String individualId;

  @override
  String toString() {
    return 'FaceVerificationEvent.deleteRegistration(individualId: $individualId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceVerificationDeleteEventImpl &&
            (identical(other.individualId, individualId) ||
                other.individualId == individualId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, individualId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceVerificationDeleteEventImplCopyWith<_$FaceVerificationDeleteEventImpl>
      get copyWith => __$$FaceVerificationDeleteEventImplCopyWithImpl<
          _$FaceVerificationDeleteEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            String individualId, List<double> embedding, double quality)
        registerFace,
    required TResult Function(String individualId, List<double> embedding)
        verifyFace,
    required TResult Function(String individualId) deleteRegistration,
    required TResult Function(int faceCount, double quality) faceDetected,
    required TResult Function() reset,
  }) {
    return deleteRegistration(individualId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            String individualId, List<double> embedding, double quality)?
        registerFace,
    TResult? Function(String individualId, List<double> embedding)? verifyFace,
    TResult? Function(String individualId)? deleteRegistration,
    TResult? Function(int faceCount, double quality)? faceDetected,
    TResult? Function()? reset,
  }) {
    return deleteRegistration?.call(individualId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            String individualId, List<double> embedding, double quality)?
        registerFace,
    TResult Function(String individualId, List<double> embedding)? verifyFace,
    TResult Function(String individualId)? deleteRegistration,
    TResult Function(int faceCount, double quality)? faceDetected,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (deleteRegistration != null) {
      return deleteRegistration(individualId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceVerificationInitializeEvent value) initialize,
    required TResult Function(FaceVerificationRegisterEvent value) registerFace,
    required TResult Function(FaceVerificationVerifyEvent value) verifyFace,
    required TResult Function(FaceVerificationDeleteEvent value)
        deleteRegistration,
    required TResult Function(FaceVerificationFaceDetectedEvent value)
        faceDetected,
    required TResult Function(FaceVerificationResetEvent value) reset,
  }) {
    return deleteRegistration(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceVerificationInitializeEvent value)? initialize,
    TResult? Function(FaceVerificationRegisterEvent value)? registerFace,
    TResult? Function(FaceVerificationVerifyEvent value)? verifyFace,
    TResult? Function(FaceVerificationDeleteEvent value)? deleteRegistration,
    TResult? Function(FaceVerificationFaceDetectedEvent value)? faceDetected,
    TResult? Function(FaceVerificationResetEvent value)? reset,
  }) {
    return deleteRegistration?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceVerificationInitializeEvent value)? initialize,
    TResult Function(FaceVerificationRegisterEvent value)? registerFace,
    TResult Function(FaceVerificationVerifyEvent value)? verifyFace,
    TResult Function(FaceVerificationDeleteEvent value)? deleteRegistration,
    TResult Function(FaceVerificationFaceDetectedEvent value)? faceDetected,
    TResult Function(FaceVerificationResetEvent value)? reset,
    required TResult orElse(),
  }) {
    if (deleteRegistration != null) {
      return deleteRegistration(this);
    }
    return orElse();
  }
}

abstract class FaceVerificationDeleteEvent implements FaceVerificationEvent {
  const factory FaceVerificationDeleteEvent(
      {required final String individualId}) = _$FaceVerificationDeleteEventImpl;

  String get individualId;
  @JsonKey(ignore: true)
  _$$FaceVerificationDeleteEventImplCopyWith<_$FaceVerificationDeleteEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FaceVerificationFaceDetectedEventImplCopyWith<$Res> {
  factory _$$FaceVerificationFaceDetectedEventImplCopyWith(
          _$FaceVerificationFaceDetectedEventImpl value,
          $Res Function(_$FaceVerificationFaceDetectedEventImpl) then) =
      __$$FaceVerificationFaceDetectedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int faceCount, double quality});
}

/// @nodoc
class __$$FaceVerificationFaceDetectedEventImplCopyWithImpl<$Res>
    extends _$FaceVerificationEventCopyWithImpl<$Res,
        _$FaceVerificationFaceDetectedEventImpl>
    implements _$$FaceVerificationFaceDetectedEventImplCopyWith<$Res> {
  __$$FaceVerificationFaceDetectedEventImplCopyWithImpl(
      _$FaceVerificationFaceDetectedEventImpl _value,
      $Res Function(_$FaceVerificationFaceDetectedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faceCount = null,
    Object? quality = null,
  }) {
    return _then(_$FaceVerificationFaceDetectedEventImpl(
      faceCount: null == faceCount
          ? _value.faceCount
          : faceCount // ignore: cast_nullable_to_non_nullable
              as int,
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$FaceVerificationFaceDetectedEventImpl
    implements FaceVerificationFaceDetectedEvent {
  const _$FaceVerificationFaceDetectedEventImpl(
      {required this.faceCount, this.quality = 0.0});

  @override
  final int faceCount;
  @override
  @JsonKey()
  final double quality;

  @override
  String toString() {
    return 'FaceVerificationEvent.faceDetected(faceCount: $faceCount, quality: $quality)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceVerificationFaceDetectedEventImpl &&
            (identical(other.faceCount, faceCount) ||
                other.faceCount == faceCount) &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @override
  int get hashCode => Object.hash(runtimeType, faceCount, quality);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceVerificationFaceDetectedEventImplCopyWith<
          _$FaceVerificationFaceDetectedEventImpl>
      get copyWith => __$$FaceVerificationFaceDetectedEventImplCopyWithImpl<
          _$FaceVerificationFaceDetectedEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            String individualId, List<double> embedding, double quality)
        registerFace,
    required TResult Function(String individualId, List<double> embedding)
        verifyFace,
    required TResult Function(String individualId) deleteRegistration,
    required TResult Function(int faceCount, double quality) faceDetected,
    required TResult Function() reset,
  }) {
    return faceDetected(faceCount, quality);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            String individualId, List<double> embedding, double quality)?
        registerFace,
    TResult? Function(String individualId, List<double> embedding)? verifyFace,
    TResult? Function(String individualId)? deleteRegistration,
    TResult? Function(int faceCount, double quality)? faceDetected,
    TResult? Function()? reset,
  }) {
    return faceDetected?.call(faceCount, quality);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            String individualId, List<double> embedding, double quality)?
        registerFace,
    TResult Function(String individualId, List<double> embedding)? verifyFace,
    TResult Function(String individualId)? deleteRegistration,
    TResult Function(int faceCount, double quality)? faceDetected,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (faceDetected != null) {
      return faceDetected(faceCount, quality);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceVerificationInitializeEvent value) initialize,
    required TResult Function(FaceVerificationRegisterEvent value) registerFace,
    required TResult Function(FaceVerificationVerifyEvent value) verifyFace,
    required TResult Function(FaceVerificationDeleteEvent value)
        deleteRegistration,
    required TResult Function(FaceVerificationFaceDetectedEvent value)
        faceDetected,
    required TResult Function(FaceVerificationResetEvent value) reset,
  }) {
    return faceDetected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceVerificationInitializeEvent value)? initialize,
    TResult? Function(FaceVerificationRegisterEvent value)? registerFace,
    TResult? Function(FaceVerificationVerifyEvent value)? verifyFace,
    TResult? Function(FaceVerificationDeleteEvent value)? deleteRegistration,
    TResult? Function(FaceVerificationFaceDetectedEvent value)? faceDetected,
    TResult? Function(FaceVerificationResetEvent value)? reset,
  }) {
    return faceDetected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceVerificationInitializeEvent value)? initialize,
    TResult Function(FaceVerificationRegisterEvent value)? registerFace,
    TResult Function(FaceVerificationVerifyEvent value)? verifyFace,
    TResult Function(FaceVerificationDeleteEvent value)? deleteRegistration,
    TResult Function(FaceVerificationFaceDetectedEvent value)? faceDetected,
    TResult Function(FaceVerificationResetEvent value)? reset,
    required TResult orElse(),
  }) {
    if (faceDetected != null) {
      return faceDetected(this);
    }
    return orElse();
  }
}

abstract class FaceVerificationFaceDetectedEvent
    implements FaceVerificationEvent {
  const factory FaceVerificationFaceDetectedEvent(
      {required final int faceCount,
      final double quality}) = _$FaceVerificationFaceDetectedEventImpl;

  int get faceCount;
  double get quality;
  @JsonKey(ignore: true)
  _$$FaceVerificationFaceDetectedEventImplCopyWith<
          _$FaceVerificationFaceDetectedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FaceVerificationResetEventImplCopyWith<$Res> {
  factory _$$FaceVerificationResetEventImplCopyWith(
          _$FaceVerificationResetEventImpl value,
          $Res Function(_$FaceVerificationResetEventImpl) then) =
      __$$FaceVerificationResetEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceVerificationResetEventImplCopyWithImpl<$Res>
    extends _$FaceVerificationEventCopyWithImpl<$Res,
        _$FaceVerificationResetEventImpl>
    implements _$$FaceVerificationResetEventImplCopyWith<$Res> {
  __$$FaceVerificationResetEventImplCopyWithImpl(
      _$FaceVerificationResetEventImpl _value,
      $Res Function(_$FaceVerificationResetEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceVerificationResetEventImpl implements FaceVerificationResetEvent {
  const _$FaceVerificationResetEventImpl();

  @override
  String toString() {
    return 'FaceVerificationEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceVerificationResetEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            String individualId, List<double> embedding, double quality)
        registerFace,
    required TResult Function(String individualId, List<double> embedding)
        verifyFace,
    required TResult Function(String individualId) deleteRegistration,
    required TResult Function(int faceCount, double quality) faceDetected,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            String individualId, List<double> embedding, double quality)?
        registerFace,
    TResult? Function(String individualId, List<double> embedding)? verifyFace,
    TResult? Function(String individualId)? deleteRegistration,
    TResult? Function(int faceCount, double quality)? faceDetected,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            String individualId, List<double> embedding, double quality)?
        registerFace,
    TResult Function(String individualId, List<double> embedding)? verifyFace,
    TResult Function(String individualId)? deleteRegistration,
    TResult Function(int faceCount, double quality)? faceDetected,
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
    required TResult Function(FaceVerificationInitializeEvent value) initialize,
    required TResult Function(FaceVerificationRegisterEvent value) registerFace,
    required TResult Function(FaceVerificationVerifyEvent value) verifyFace,
    required TResult Function(FaceVerificationDeleteEvent value)
        deleteRegistration,
    required TResult Function(FaceVerificationFaceDetectedEvent value)
        faceDetected,
    required TResult Function(FaceVerificationResetEvent value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceVerificationInitializeEvent value)? initialize,
    TResult? Function(FaceVerificationRegisterEvent value)? registerFace,
    TResult? Function(FaceVerificationVerifyEvent value)? verifyFace,
    TResult? Function(FaceVerificationDeleteEvent value)? deleteRegistration,
    TResult? Function(FaceVerificationFaceDetectedEvent value)? faceDetected,
    TResult? Function(FaceVerificationResetEvent value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceVerificationInitializeEvent value)? initialize,
    TResult Function(FaceVerificationRegisterEvent value)? registerFace,
    TResult Function(FaceVerificationVerifyEvent value)? verifyFace,
    TResult Function(FaceVerificationDeleteEvent value)? deleteRegistration,
    TResult Function(FaceVerificationFaceDetectedEvent value)? faceDetected,
    TResult Function(FaceVerificationResetEvent value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class FaceVerificationResetEvent implements FaceVerificationEvent {
  const factory FaceVerificationResetEvent() = _$FaceVerificationResetEventImpl;
}

/// @nodoc
mixin _$FaceVerificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double quality) detecting,
    required TResult Function(String message) processing,
    required TResult Function(String individualId, double confidence)
        registered,
    required TResult Function(double confidence) verified,
    required TResult Function(double confidence) rejected,
    required TResult Function() noFaceDetected,
    required TResult Function() multipleFacesDetected,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double quality)? detecting,
    TResult? Function(String message)? processing,
    TResult? Function(String individualId, double confidence)? registered,
    TResult? Function(double confidence)? verified,
    TResult? Function(double confidence)? rejected,
    TResult? Function()? noFaceDetected,
    TResult? Function()? multipleFacesDetected,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double quality)? detecting,
    TResult Function(String message)? processing,
    TResult Function(String individualId, double confidence)? registered,
    TResult Function(double confidence)? verified,
    TResult Function(double confidence)? rejected,
    TResult Function()? noFaceDetected,
    TResult Function()? multipleFacesDetected,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceVerificationIdleState value) idle,
    required TResult Function(FaceVerificationDetectingState value) detecting,
    required TResult Function(FaceVerificationProcessingState value) processing,
    required TResult Function(FaceVerificationRegisteredState value) registered,
    required TResult Function(FaceVerificationVerifiedState value) verified,
    required TResult Function(FaceVerificationRejectedState value) rejected,
    required TResult Function(FaceVerificationNoFaceState value) noFaceDetected,
    required TResult Function(FaceVerificationMultipleFacesState value)
        multipleFacesDetected,
    required TResult Function(FaceVerificationErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceVerificationIdleState value)? idle,
    TResult? Function(FaceVerificationDetectingState value)? detecting,
    TResult? Function(FaceVerificationProcessingState value)? processing,
    TResult? Function(FaceVerificationRegisteredState value)? registered,
    TResult? Function(FaceVerificationVerifiedState value)? verified,
    TResult? Function(FaceVerificationRejectedState value)? rejected,
    TResult? Function(FaceVerificationNoFaceState value)? noFaceDetected,
    TResult? Function(FaceVerificationMultipleFacesState value)?
        multipleFacesDetected,
    TResult? Function(FaceVerificationErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceVerificationIdleState value)? idle,
    TResult Function(FaceVerificationDetectingState value)? detecting,
    TResult Function(FaceVerificationProcessingState value)? processing,
    TResult Function(FaceVerificationRegisteredState value)? registered,
    TResult Function(FaceVerificationVerifiedState value)? verified,
    TResult Function(FaceVerificationRejectedState value)? rejected,
    TResult Function(FaceVerificationNoFaceState value)? noFaceDetected,
    TResult Function(FaceVerificationMultipleFacesState value)?
        multipleFacesDetected,
    TResult Function(FaceVerificationErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaceVerificationStateCopyWith<$Res> {
  factory $FaceVerificationStateCopyWith(FaceVerificationState value,
          $Res Function(FaceVerificationState) then) =
      _$FaceVerificationStateCopyWithImpl<$Res, FaceVerificationState>;
}

/// @nodoc
class _$FaceVerificationStateCopyWithImpl<$Res,
        $Val extends FaceVerificationState>
    implements $FaceVerificationStateCopyWith<$Res> {
  _$FaceVerificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FaceVerificationIdleStateImplCopyWith<$Res> {
  factory _$$FaceVerificationIdleStateImplCopyWith(
          _$FaceVerificationIdleStateImpl value,
          $Res Function(_$FaceVerificationIdleStateImpl) then) =
      __$$FaceVerificationIdleStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceVerificationIdleStateImplCopyWithImpl<$Res>
    extends _$FaceVerificationStateCopyWithImpl<$Res,
        _$FaceVerificationIdleStateImpl>
    implements _$$FaceVerificationIdleStateImplCopyWith<$Res> {
  __$$FaceVerificationIdleStateImplCopyWithImpl(
      _$FaceVerificationIdleStateImpl _value,
      $Res Function(_$FaceVerificationIdleStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceVerificationIdleStateImpl implements FaceVerificationIdleState {
  const _$FaceVerificationIdleStateImpl();

  @override
  String toString() {
    return 'FaceVerificationState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceVerificationIdleStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double quality) detecting,
    required TResult Function(String message) processing,
    required TResult Function(String individualId, double confidence)
        registered,
    required TResult Function(double confidence) verified,
    required TResult Function(double confidence) rejected,
    required TResult Function() noFaceDetected,
    required TResult Function() multipleFacesDetected,
    required TResult Function(String message) error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double quality)? detecting,
    TResult? Function(String message)? processing,
    TResult? Function(String individualId, double confidence)? registered,
    TResult? Function(double confidence)? verified,
    TResult? Function(double confidence)? rejected,
    TResult? Function()? noFaceDetected,
    TResult? Function()? multipleFacesDetected,
    TResult? Function(String message)? error,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double quality)? detecting,
    TResult Function(String message)? processing,
    TResult Function(String individualId, double confidence)? registered,
    TResult Function(double confidence)? verified,
    TResult Function(double confidence)? rejected,
    TResult Function()? noFaceDetected,
    TResult Function()? multipleFacesDetected,
    TResult Function(String message)? error,
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
    required TResult Function(FaceVerificationIdleState value) idle,
    required TResult Function(FaceVerificationDetectingState value) detecting,
    required TResult Function(FaceVerificationProcessingState value) processing,
    required TResult Function(FaceVerificationRegisteredState value) registered,
    required TResult Function(FaceVerificationVerifiedState value) verified,
    required TResult Function(FaceVerificationRejectedState value) rejected,
    required TResult Function(FaceVerificationNoFaceState value) noFaceDetected,
    required TResult Function(FaceVerificationMultipleFacesState value)
        multipleFacesDetected,
    required TResult Function(FaceVerificationErrorState value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceVerificationIdleState value)? idle,
    TResult? Function(FaceVerificationDetectingState value)? detecting,
    TResult? Function(FaceVerificationProcessingState value)? processing,
    TResult? Function(FaceVerificationRegisteredState value)? registered,
    TResult? Function(FaceVerificationVerifiedState value)? verified,
    TResult? Function(FaceVerificationRejectedState value)? rejected,
    TResult? Function(FaceVerificationNoFaceState value)? noFaceDetected,
    TResult? Function(FaceVerificationMultipleFacesState value)?
        multipleFacesDetected,
    TResult? Function(FaceVerificationErrorState value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceVerificationIdleState value)? idle,
    TResult Function(FaceVerificationDetectingState value)? detecting,
    TResult Function(FaceVerificationProcessingState value)? processing,
    TResult Function(FaceVerificationRegisteredState value)? registered,
    TResult Function(FaceVerificationVerifiedState value)? verified,
    TResult Function(FaceVerificationRejectedState value)? rejected,
    TResult Function(FaceVerificationNoFaceState value)? noFaceDetected,
    TResult Function(FaceVerificationMultipleFacesState value)?
        multipleFacesDetected,
    TResult Function(FaceVerificationErrorState value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class FaceVerificationIdleState implements FaceVerificationState {
  const factory FaceVerificationIdleState() = _$FaceVerificationIdleStateImpl;
}

/// @nodoc
abstract class _$$FaceVerificationDetectingStateImplCopyWith<$Res> {
  factory _$$FaceVerificationDetectingStateImplCopyWith(
          _$FaceVerificationDetectingStateImpl value,
          $Res Function(_$FaceVerificationDetectingStateImpl) then) =
      __$$FaceVerificationDetectingStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double quality});
}

/// @nodoc
class __$$FaceVerificationDetectingStateImplCopyWithImpl<$Res>
    extends _$FaceVerificationStateCopyWithImpl<$Res,
        _$FaceVerificationDetectingStateImpl>
    implements _$$FaceVerificationDetectingStateImplCopyWith<$Res> {
  __$$FaceVerificationDetectingStateImplCopyWithImpl(
      _$FaceVerificationDetectingStateImpl _value,
      $Res Function(_$FaceVerificationDetectingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quality = null,
  }) {
    return _then(_$FaceVerificationDetectingStateImpl(
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$FaceVerificationDetectingStateImpl
    implements FaceVerificationDetectingState {
  const _$FaceVerificationDetectingStateImpl({this.quality = 0.0});

  @override
  @JsonKey()
  final double quality;

  @override
  String toString() {
    return 'FaceVerificationState.detecting(quality: $quality)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceVerificationDetectingStateImpl &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quality);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceVerificationDetectingStateImplCopyWith<
          _$FaceVerificationDetectingStateImpl>
      get copyWith => __$$FaceVerificationDetectingStateImplCopyWithImpl<
          _$FaceVerificationDetectingStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double quality) detecting,
    required TResult Function(String message) processing,
    required TResult Function(String individualId, double confidence)
        registered,
    required TResult Function(double confidence) verified,
    required TResult Function(double confidence) rejected,
    required TResult Function() noFaceDetected,
    required TResult Function() multipleFacesDetected,
    required TResult Function(String message) error,
  }) {
    return detecting(quality);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double quality)? detecting,
    TResult? Function(String message)? processing,
    TResult? Function(String individualId, double confidence)? registered,
    TResult? Function(double confidence)? verified,
    TResult? Function(double confidence)? rejected,
    TResult? Function()? noFaceDetected,
    TResult? Function()? multipleFacesDetected,
    TResult? Function(String message)? error,
  }) {
    return detecting?.call(quality);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double quality)? detecting,
    TResult Function(String message)? processing,
    TResult Function(String individualId, double confidence)? registered,
    TResult Function(double confidence)? verified,
    TResult Function(double confidence)? rejected,
    TResult Function()? noFaceDetected,
    TResult Function()? multipleFacesDetected,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (detecting != null) {
      return detecting(quality);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceVerificationIdleState value) idle,
    required TResult Function(FaceVerificationDetectingState value) detecting,
    required TResult Function(FaceVerificationProcessingState value) processing,
    required TResult Function(FaceVerificationRegisteredState value) registered,
    required TResult Function(FaceVerificationVerifiedState value) verified,
    required TResult Function(FaceVerificationRejectedState value) rejected,
    required TResult Function(FaceVerificationNoFaceState value) noFaceDetected,
    required TResult Function(FaceVerificationMultipleFacesState value)
        multipleFacesDetected,
    required TResult Function(FaceVerificationErrorState value) error,
  }) {
    return detecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceVerificationIdleState value)? idle,
    TResult? Function(FaceVerificationDetectingState value)? detecting,
    TResult? Function(FaceVerificationProcessingState value)? processing,
    TResult? Function(FaceVerificationRegisteredState value)? registered,
    TResult? Function(FaceVerificationVerifiedState value)? verified,
    TResult? Function(FaceVerificationRejectedState value)? rejected,
    TResult? Function(FaceVerificationNoFaceState value)? noFaceDetected,
    TResult? Function(FaceVerificationMultipleFacesState value)?
        multipleFacesDetected,
    TResult? Function(FaceVerificationErrorState value)? error,
  }) {
    return detecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceVerificationIdleState value)? idle,
    TResult Function(FaceVerificationDetectingState value)? detecting,
    TResult Function(FaceVerificationProcessingState value)? processing,
    TResult Function(FaceVerificationRegisteredState value)? registered,
    TResult Function(FaceVerificationVerifiedState value)? verified,
    TResult Function(FaceVerificationRejectedState value)? rejected,
    TResult Function(FaceVerificationNoFaceState value)? noFaceDetected,
    TResult Function(FaceVerificationMultipleFacesState value)?
        multipleFacesDetected,
    TResult Function(FaceVerificationErrorState value)? error,
    required TResult orElse(),
  }) {
    if (detecting != null) {
      return detecting(this);
    }
    return orElse();
  }
}

abstract class FaceVerificationDetectingState implements FaceVerificationState {
  const factory FaceVerificationDetectingState({final double quality}) =
      _$FaceVerificationDetectingStateImpl;

  double get quality;
  @JsonKey(ignore: true)
  _$$FaceVerificationDetectingStateImplCopyWith<
          _$FaceVerificationDetectingStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FaceVerificationProcessingStateImplCopyWith<$Res> {
  factory _$$FaceVerificationProcessingStateImplCopyWith(
          _$FaceVerificationProcessingStateImpl value,
          $Res Function(_$FaceVerificationProcessingStateImpl) then) =
      __$$FaceVerificationProcessingStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FaceVerificationProcessingStateImplCopyWithImpl<$Res>
    extends _$FaceVerificationStateCopyWithImpl<$Res,
        _$FaceVerificationProcessingStateImpl>
    implements _$$FaceVerificationProcessingStateImplCopyWith<$Res> {
  __$$FaceVerificationProcessingStateImplCopyWithImpl(
      _$FaceVerificationProcessingStateImpl _value,
      $Res Function(_$FaceVerificationProcessingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FaceVerificationProcessingStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FaceVerificationProcessingStateImpl
    implements FaceVerificationProcessingState {
  const _$FaceVerificationProcessingStateImpl({this.message = ''});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'FaceVerificationState.processing(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceVerificationProcessingStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceVerificationProcessingStateImplCopyWith<
          _$FaceVerificationProcessingStateImpl>
      get copyWith => __$$FaceVerificationProcessingStateImplCopyWithImpl<
          _$FaceVerificationProcessingStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double quality) detecting,
    required TResult Function(String message) processing,
    required TResult Function(String individualId, double confidence)
        registered,
    required TResult Function(double confidence) verified,
    required TResult Function(double confidence) rejected,
    required TResult Function() noFaceDetected,
    required TResult Function() multipleFacesDetected,
    required TResult Function(String message) error,
  }) {
    return processing(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double quality)? detecting,
    TResult? Function(String message)? processing,
    TResult? Function(String individualId, double confidence)? registered,
    TResult? Function(double confidence)? verified,
    TResult? Function(double confidence)? rejected,
    TResult? Function()? noFaceDetected,
    TResult? Function()? multipleFacesDetected,
    TResult? Function(String message)? error,
  }) {
    return processing?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double quality)? detecting,
    TResult Function(String message)? processing,
    TResult Function(String individualId, double confidence)? registered,
    TResult Function(double confidence)? verified,
    TResult Function(double confidence)? rejected,
    TResult Function()? noFaceDetected,
    TResult Function()? multipleFacesDetected,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceVerificationIdleState value) idle,
    required TResult Function(FaceVerificationDetectingState value) detecting,
    required TResult Function(FaceVerificationProcessingState value) processing,
    required TResult Function(FaceVerificationRegisteredState value) registered,
    required TResult Function(FaceVerificationVerifiedState value) verified,
    required TResult Function(FaceVerificationRejectedState value) rejected,
    required TResult Function(FaceVerificationNoFaceState value) noFaceDetected,
    required TResult Function(FaceVerificationMultipleFacesState value)
        multipleFacesDetected,
    required TResult Function(FaceVerificationErrorState value) error,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceVerificationIdleState value)? idle,
    TResult? Function(FaceVerificationDetectingState value)? detecting,
    TResult? Function(FaceVerificationProcessingState value)? processing,
    TResult? Function(FaceVerificationRegisteredState value)? registered,
    TResult? Function(FaceVerificationVerifiedState value)? verified,
    TResult? Function(FaceVerificationRejectedState value)? rejected,
    TResult? Function(FaceVerificationNoFaceState value)? noFaceDetected,
    TResult? Function(FaceVerificationMultipleFacesState value)?
        multipleFacesDetected,
    TResult? Function(FaceVerificationErrorState value)? error,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceVerificationIdleState value)? idle,
    TResult Function(FaceVerificationDetectingState value)? detecting,
    TResult Function(FaceVerificationProcessingState value)? processing,
    TResult Function(FaceVerificationRegisteredState value)? registered,
    TResult Function(FaceVerificationVerifiedState value)? verified,
    TResult Function(FaceVerificationRejectedState value)? rejected,
    TResult Function(FaceVerificationNoFaceState value)? noFaceDetected,
    TResult Function(FaceVerificationMultipleFacesState value)?
        multipleFacesDetected,
    TResult Function(FaceVerificationErrorState value)? error,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class FaceVerificationProcessingState
    implements FaceVerificationState {
  const factory FaceVerificationProcessingState({final String message}) =
      _$FaceVerificationProcessingStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FaceVerificationProcessingStateImplCopyWith<
          _$FaceVerificationProcessingStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FaceVerificationRegisteredStateImplCopyWith<$Res> {
  factory _$$FaceVerificationRegisteredStateImplCopyWith(
          _$FaceVerificationRegisteredStateImpl value,
          $Res Function(_$FaceVerificationRegisteredStateImpl) then) =
      __$$FaceVerificationRegisteredStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String individualId, double confidence});
}

/// @nodoc
class __$$FaceVerificationRegisteredStateImplCopyWithImpl<$Res>
    extends _$FaceVerificationStateCopyWithImpl<$Res,
        _$FaceVerificationRegisteredStateImpl>
    implements _$$FaceVerificationRegisteredStateImplCopyWith<$Res> {
  __$$FaceVerificationRegisteredStateImplCopyWithImpl(
      _$FaceVerificationRegisteredStateImpl _value,
      $Res Function(_$FaceVerificationRegisteredStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? individualId = null,
    Object? confidence = null,
  }) {
    return _then(_$FaceVerificationRegisteredStateImpl(
      individualId: null == individualId
          ? _value.individualId
          : individualId // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$FaceVerificationRegisteredStateImpl
    implements FaceVerificationRegisteredState {
  const _$FaceVerificationRegisteredStateImpl(
      {required this.individualId, required this.confidence});

  @override
  final String individualId;
  @override
  final double confidence;

  @override
  String toString() {
    return 'FaceVerificationState.registered(individualId: $individualId, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceVerificationRegisteredStateImpl &&
            (identical(other.individualId, individualId) ||
                other.individualId == individualId) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @override
  int get hashCode => Object.hash(runtimeType, individualId, confidence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceVerificationRegisteredStateImplCopyWith<
          _$FaceVerificationRegisteredStateImpl>
      get copyWith => __$$FaceVerificationRegisteredStateImplCopyWithImpl<
          _$FaceVerificationRegisteredStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double quality) detecting,
    required TResult Function(String message) processing,
    required TResult Function(String individualId, double confidence)
        registered,
    required TResult Function(double confidence) verified,
    required TResult Function(double confidence) rejected,
    required TResult Function() noFaceDetected,
    required TResult Function() multipleFacesDetected,
    required TResult Function(String message) error,
  }) {
    return registered(individualId, confidence);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double quality)? detecting,
    TResult? Function(String message)? processing,
    TResult? Function(String individualId, double confidence)? registered,
    TResult? Function(double confidence)? verified,
    TResult? Function(double confidence)? rejected,
    TResult? Function()? noFaceDetected,
    TResult? Function()? multipleFacesDetected,
    TResult? Function(String message)? error,
  }) {
    return registered?.call(individualId, confidence);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double quality)? detecting,
    TResult Function(String message)? processing,
    TResult Function(String individualId, double confidence)? registered,
    TResult Function(double confidence)? verified,
    TResult Function(double confidence)? rejected,
    TResult Function()? noFaceDetected,
    TResult Function()? multipleFacesDetected,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (registered != null) {
      return registered(individualId, confidence);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceVerificationIdleState value) idle,
    required TResult Function(FaceVerificationDetectingState value) detecting,
    required TResult Function(FaceVerificationProcessingState value) processing,
    required TResult Function(FaceVerificationRegisteredState value) registered,
    required TResult Function(FaceVerificationVerifiedState value) verified,
    required TResult Function(FaceVerificationRejectedState value) rejected,
    required TResult Function(FaceVerificationNoFaceState value) noFaceDetected,
    required TResult Function(FaceVerificationMultipleFacesState value)
        multipleFacesDetected,
    required TResult Function(FaceVerificationErrorState value) error,
  }) {
    return registered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceVerificationIdleState value)? idle,
    TResult? Function(FaceVerificationDetectingState value)? detecting,
    TResult? Function(FaceVerificationProcessingState value)? processing,
    TResult? Function(FaceVerificationRegisteredState value)? registered,
    TResult? Function(FaceVerificationVerifiedState value)? verified,
    TResult? Function(FaceVerificationRejectedState value)? rejected,
    TResult? Function(FaceVerificationNoFaceState value)? noFaceDetected,
    TResult? Function(FaceVerificationMultipleFacesState value)?
        multipleFacesDetected,
    TResult? Function(FaceVerificationErrorState value)? error,
  }) {
    return registered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceVerificationIdleState value)? idle,
    TResult Function(FaceVerificationDetectingState value)? detecting,
    TResult Function(FaceVerificationProcessingState value)? processing,
    TResult Function(FaceVerificationRegisteredState value)? registered,
    TResult Function(FaceVerificationVerifiedState value)? verified,
    TResult Function(FaceVerificationRejectedState value)? rejected,
    TResult Function(FaceVerificationNoFaceState value)? noFaceDetected,
    TResult Function(FaceVerificationMultipleFacesState value)?
        multipleFacesDetected,
    TResult Function(FaceVerificationErrorState value)? error,
    required TResult orElse(),
  }) {
    if (registered != null) {
      return registered(this);
    }
    return orElse();
  }
}

abstract class FaceVerificationRegisteredState
    implements FaceVerificationState {
  const factory FaceVerificationRegisteredState(
          {required final String individualId,
          required final double confidence}) =
      _$FaceVerificationRegisteredStateImpl;

  String get individualId;
  double get confidence;
  @JsonKey(ignore: true)
  _$$FaceVerificationRegisteredStateImplCopyWith<
          _$FaceVerificationRegisteredStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FaceVerificationVerifiedStateImplCopyWith<$Res> {
  factory _$$FaceVerificationVerifiedStateImplCopyWith(
          _$FaceVerificationVerifiedStateImpl value,
          $Res Function(_$FaceVerificationVerifiedStateImpl) then) =
      __$$FaceVerificationVerifiedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double confidence});
}

/// @nodoc
class __$$FaceVerificationVerifiedStateImplCopyWithImpl<$Res>
    extends _$FaceVerificationStateCopyWithImpl<$Res,
        _$FaceVerificationVerifiedStateImpl>
    implements _$$FaceVerificationVerifiedStateImplCopyWith<$Res> {
  __$$FaceVerificationVerifiedStateImplCopyWithImpl(
      _$FaceVerificationVerifiedStateImpl _value,
      $Res Function(_$FaceVerificationVerifiedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confidence = null,
  }) {
    return _then(_$FaceVerificationVerifiedStateImpl(
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$FaceVerificationVerifiedStateImpl
    implements FaceVerificationVerifiedState {
  const _$FaceVerificationVerifiedStateImpl({required this.confidence});

  @override
  final double confidence;

  @override
  String toString() {
    return 'FaceVerificationState.verified(confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceVerificationVerifiedStateImpl &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @override
  int get hashCode => Object.hash(runtimeType, confidence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceVerificationVerifiedStateImplCopyWith<
          _$FaceVerificationVerifiedStateImpl>
      get copyWith => __$$FaceVerificationVerifiedStateImplCopyWithImpl<
          _$FaceVerificationVerifiedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double quality) detecting,
    required TResult Function(String message) processing,
    required TResult Function(String individualId, double confidence)
        registered,
    required TResult Function(double confidence) verified,
    required TResult Function(double confidence) rejected,
    required TResult Function() noFaceDetected,
    required TResult Function() multipleFacesDetected,
    required TResult Function(String message) error,
  }) {
    return verified(confidence);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double quality)? detecting,
    TResult? Function(String message)? processing,
    TResult? Function(String individualId, double confidence)? registered,
    TResult? Function(double confidence)? verified,
    TResult? Function(double confidence)? rejected,
    TResult? Function()? noFaceDetected,
    TResult? Function()? multipleFacesDetected,
    TResult? Function(String message)? error,
  }) {
    return verified?.call(confidence);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double quality)? detecting,
    TResult Function(String message)? processing,
    TResult Function(String individualId, double confidence)? registered,
    TResult Function(double confidence)? verified,
    TResult Function(double confidence)? rejected,
    TResult Function()? noFaceDetected,
    TResult Function()? multipleFacesDetected,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (verified != null) {
      return verified(confidence);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceVerificationIdleState value) idle,
    required TResult Function(FaceVerificationDetectingState value) detecting,
    required TResult Function(FaceVerificationProcessingState value) processing,
    required TResult Function(FaceVerificationRegisteredState value) registered,
    required TResult Function(FaceVerificationVerifiedState value) verified,
    required TResult Function(FaceVerificationRejectedState value) rejected,
    required TResult Function(FaceVerificationNoFaceState value) noFaceDetected,
    required TResult Function(FaceVerificationMultipleFacesState value)
        multipleFacesDetected,
    required TResult Function(FaceVerificationErrorState value) error,
  }) {
    return verified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceVerificationIdleState value)? idle,
    TResult? Function(FaceVerificationDetectingState value)? detecting,
    TResult? Function(FaceVerificationProcessingState value)? processing,
    TResult? Function(FaceVerificationRegisteredState value)? registered,
    TResult? Function(FaceVerificationVerifiedState value)? verified,
    TResult? Function(FaceVerificationRejectedState value)? rejected,
    TResult? Function(FaceVerificationNoFaceState value)? noFaceDetected,
    TResult? Function(FaceVerificationMultipleFacesState value)?
        multipleFacesDetected,
    TResult? Function(FaceVerificationErrorState value)? error,
  }) {
    return verified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceVerificationIdleState value)? idle,
    TResult Function(FaceVerificationDetectingState value)? detecting,
    TResult Function(FaceVerificationProcessingState value)? processing,
    TResult Function(FaceVerificationRegisteredState value)? registered,
    TResult Function(FaceVerificationVerifiedState value)? verified,
    TResult Function(FaceVerificationRejectedState value)? rejected,
    TResult Function(FaceVerificationNoFaceState value)? noFaceDetected,
    TResult Function(FaceVerificationMultipleFacesState value)?
        multipleFacesDetected,
    TResult Function(FaceVerificationErrorState value)? error,
    required TResult orElse(),
  }) {
    if (verified != null) {
      return verified(this);
    }
    return orElse();
  }
}

abstract class FaceVerificationVerifiedState implements FaceVerificationState {
  const factory FaceVerificationVerifiedState(
      {required final double confidence}) = _$FaceVerificationVerifiedStateImpl;

  double get confidence;
  @JsonKey(ignore: true)
  _$$FaceVerificationVerifiedStateImplCopyWith<
          _$FaceVerificationVerifiedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FaceVerificationRejectedStateImplCopyWith<$Res> {
  factory _$$FaceVerificationRejectedStateImplCopyWith(
          _$FaceVerificationRejectedStateImpl value,
          $Res Function(_$FaceVerificationRejectedStateImpl) then) =
      __$$FaceVerificationRejectedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double confidence});
}

/// @nodoc
class __$$FaceVerificationRejectedStateImplCopyWithImpl<$Res>
    extends _$FaceVerificationStateCopyWithImpl<$Res,
        _$FaceVerificationRejectedStateImpl>
    implements _$$FaceVerificationRejectedStateImplCopyWith<$Res> {
  __$$FaceVerificationRejectedStateImplCopyWithImpl(
      _$FaceVerificationRejectedStateImpl _value,
      $Res Function(_$FaceVerificationRejectedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confidence = null,
  }) {
    return _then(_$FaceVerificationRejectedStateImpl(
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$FaceVerificationRejectedStateImpl
    implements FaceVerificationRejectedState {
  const _$FaceVerificationRejectedStateImpl({required this.confidence});

  @override
  final double confidence;

  @override
  String toString() {
    return 'FaceVerificationState.rejected(confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceVerificationRejectedStateImpl &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @override
  int get hashCode => Object.hash(runtimeType, confidence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceVerificationRejectedStateImplCopyWith<
          _$FaceVerificationRejectedStateImpl>
      get copyWith => __$$FaceVerificationRejectedStateImplCopyWithImpl<
          _$FaceVerificationRejectedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double quality) detecting,
    required TResult Function(String message) processing,
    required TResult Function(String individualId, double confidence)
        registered,
    required TResult Function(double confidence) verified,
    required TResult Function(double confidence) rejected,
    required TResult Function() noFaceDetected,
    required TResult Function() multipleFacesDetected,
    required TResult Function(String message) error,
  }) {
    return rejected(confidence);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double quality)? detecting,
    TResult? Function(String message)? processing,
    TResult? Function(String individualId, double confidence)? registered,
    TResult? Function(double confidence)? verified,
    TResult? Function(double confidence)? rejected,
    TResult? Function()? noFaceDetected,
    TResult? Function()? multipleFacesDetected,
    TResult? Function(String message)? error,
  }) {
    return rejected?.call(confidence);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double quality)? detecting,
    TResult Function(String message)? processing,
    TResult Function(String individualId, double confidence)? registered,
    TResult Function(double confidence)? verified,
    TResult Function(double confidence)? rejected,
    TResult Function()? noFaceDetected,
    TResult Function()? multipleFacesDetected,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (rejected != null) {
      return rejected(confidence);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceVerificationIdleState value) idle,
    required TResult Function(FaceVerificationDetectingState value) detecting,
    required TResult Function(FaceVerificationProcessingState value) processing,
    required TResult Function(FaceVerificationRegisteredState value) registered,
    required TResult Function(FaceVerificationVerifiedState value) verified,
    required TResult Function(FaceVerificationRejectedState value) rejected,
    required TResult Function(FaceVerificationNoFaceState value) noFaceDetected,
    required TResult Function(FaceVerificationMultipleFacesState value)
        multipleFacesDetected,
    required TResult Function(FaceVerificationErrorState value) error,
  }) {
    return rejected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceVerificationIdleState value)? idle,
    TResult? Function(FaceVerificationDetectingState value)? detecting,
    TResult? Function(FaceVerificationProcessingState value)? processing,
    TResult? Function(FaceVerificationRegisteredState value)? registered,
    TResult? Function(FaceVerificationVerifiedState value)? verified,
    TResult? Function(FaceVerificationRejectedState value)? rejected,
    TResult? Function(FaceVerificationNoFaceState value)? noFaceDetected,
    TResult? Function(FaceVerificationMultipleFacesState value)?
        multipleFacesDetected,
    TResult? Function(FaceVerificationErrorState value)? error,
  }) {
    return rejected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceVerificationIdleState value)? idle,
    TResult Function(FaceVerificationDetectingState value)? detecting,
    TResult Function(FaceVerificationProcessingState value)? processing,
    TResult Function(FaceVerificationRegisteredState value)? registered,
    TResult Function(FaceVerificationVerifiedState value)? verified,
    TResult Function(FaceVerificationRejectedState value)? rejected,
    TResult Function(FaceVerificationNoFaceState value)? noFaceDetected,
    TResult Function(FaceVerificationMultipleFacesState value)?
        multipleFacesDetected,
    TResult Function(FaceVerificationErrorState value)? error,
    required TResult orElse(),
  }) {
    if (rejected != null) {
      return rejected(this);
    }
    return orElse();
  }
}

abstract class FaceVerificationRejectedState implements FaceVerificationState {
  const factory FaceVerificationRejectedState(
      {required final double confidence}) = _$FaceVerificationRejectedStateImpl;

  double get confidence;
  @JsonKey(ignore: true)
  _$$FaceVerificationRejectedStateImplCopyWith<
          _$FaceVerificationRejectedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FaceVerificationNoFaceStateImplCopyWith<$Res> {
  factory _$$FaceVerificationNoFaceStateImplCopyWith(
          _$FaceVerificationNoFaceStateImpl value,
          $Res Function(_$FaceVerificationNoFaceStateImpl) then) =
      __$$FaceVerificationNoFaceStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceVerificationNoFaceStateImplCopyWithImpl<$Res>
    extends _$FaceVerificationStateCopyWithImpl<$Res,
        _$FaceVerificationNoFaceStateImpl>
    implements _$$FaceVerificationNoFaceStateImplCopyWith<$Res> {
  __$$FaceVerificationNoFaceStateImplCopyWithImpl(
      _$FaceVerificationNoFaceStateImpl _value,
      $Res Function(_$FaceVerificationNoFaceStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceVerificationNoFaceStateImpl implements FaceVerificationNoFaceState {
  const _$FaceVerificationNoFaceStateImpl();

  @override
  String toString() {
    return 'FaceVerificationState.noFaceDetected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceVerificationNoFaceStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double quality) detecting,
    required TResult Function(String message) processing,
    required TResult Function(String individualId, double confidence)
        registered,
    required TResult Function(double confidence) verified,
    required TResult Function(double confidence) rejected,
    required TResult Function() noFaceDetected,
    required TResult Function() multipleFacesDetected,
    required TResult Function(String message) error,
  }) {
    return noFaceDetected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double quality)? detecting,
    TResult? Function(String message)? processing,
    TResult? Function(String individualId, double confidence)? registered,
    TResult? Function(double confidence)? verified,
    TResult? Function(double confidence)? rejected,
    TResult? Function()? noFaceDetected,
    TResult? Function()? multipleFacesDetected,
    TResult? Function(String message)? error,
  }) {
    return noFaceDetected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double quality)? detecting,
    TResult Function(String message)? processing,
    TResult Function(String individualId, double confidence)? registered,
    TResult Function(double confidence)? verified,
    TResult Function(double confidence)? rejected,
    TResult Function()? noFaceDetected,
    TResult Function()? multipleFacesDetected,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (noFaceDetected != null) {
      return noFaceDetected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceVerificationIdleState value) idle,
    required TResult Function(FaceVerificationDetectingState value) detecting,
    required TResult Function(FaceVerificationProcessingState value) processing,
    required TResult Function(FaceVerificationRegisteredState value) registered,
    required TResult Function(FaceVerificationVerifiedState value) verified,
    required TResult Function(FaceVerificationRejectedState value) rejected,
    required TResult Function(FaceVerificationNoFaceState value) noFaceDetected,
    required TResult Function(FaceVerificationMultipleFacesState value)
        multipleFacesDetected,
    required TResult Function(FaceVerificationErrorState value) error,
  }) {
    return noFaceDetected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceVerificationIdleState value)? idle,
    TResult? Function(FaceVerificationDetectingState value)? detecting,
    TResult? Function(FaceVerificationProcessingState value)? processing,
    TResult? Function(FaceVerificationRegisteredState value)? registered,
    TResult? Function(FaceVerificationVerifiedState value)? verified,
    TResult? Function(FaceVerificationRejectedState value)? rejected,
    TResult? Function(FaceVerificationNoFaceState value)? noFaceDetected,
    TResult? Function(FaceVerificationMultipleFacesState value)?
        multipleFacesDetected,
    TResult? Function(FaceVerificationErrorState value)? error,
  }) {
    return noFaceDetected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceVerificationIdleState value)? idle,
    TResult Function(FaceVerificationDetectingState value)? detecting,
    TResult Function(FaceVerificationProcessingState value)? processing,
    TResult Function(FaceVerificationRegisteredState value)? registered,
    TResult Function(FaceVerificationVerifiedState value)? verified,
    TResult Function(FaceVerificationRejectedState value)? rejected,
    TResult Function(FaceVerificationNoFaceState value)? noFaceDetected,
    TResult Function(FaceVerificationMultipleFacesState value)?
        multipleFacesDetected,
    TResult Function(FaceVerificationErrorState value)? error,
    required TResult orElse(),
  }) {
    if (noFaceDetected != null) {
      return noFaceDetected(this);
    }
    return orElse();
  }
}

abstract class FaceVerificationNoFaceState implements FaceVerificationState {
  const factory FaceVerificationNoFaceState() =
      _$FaceVerificationNoFaceStateImpl;
}

/// @nodoc
abstract class _$$FaceVerificationMultipleFacesStateImplCopyWith<$Res> {
  factory _$$FaceVerificationMultipleFacesStateImplCopyWith(
          _$FaceVerificationMultipleFacesStateImpl value,
          $Res Function(_$FaceVerificationMultipleFacesStateImpl) then) =
      __$$FaceVerificationMultipleFacesStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceVerificationMultipleFacesStateImplCopyWithImpl<$Res>
    extends _$FaceVerificationStateCopyWithImpl<$Res,
        _$FaceVerificationMultipleFacesStateImpl>
    implements _$$FaceVerificationMultipleFacesStateImplCopyWith<$Res> {
  __$$FaceVerificationMultipleFacesStateImplCopyWithImpl(
      _$FaceVerificationMultipleFacesStateImpl _value,
      $Res Function(_$FaceVerificationMultipleFacesStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaceVerificationMultipleFacesStateImpl
    implements FaceVerificationMultipleFacesState {
  const _$FaceVerificationMultipleFacesStateImpl();

  @override
  String toString() {
    return 'FaceVerificationState.multipleFacesDetected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceVerificationMultipleFacesStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double quality) detecting,
    required TResult Function(String message) processing,
    required TResult Function(String individualId, double confidence)
        registered,
    required TResult Function(double confidence) verified,
    required TResult Function(double confidence) rejected,
    required TResult Function() noFaceDetected,
    required TResult Function() multipleFacesDetected,
    required TResult Function(String message) error,
  }) {
    return multipleFacesDetected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double quality)? detecting,
    TResult? Function(String message)? processing,
    TResult? Function(String individualId, double confidence)? registered,
    TResult? Function(double confidence)? verified,
    TResult? Function(double confidence)? rejected,
    TResult? Function()? noFaceDetected,
    TResult? Function()? multipleFacesDetected,
    TResult? Function(String message)? error,
  }) {
    return multipleFacesDetected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double quality)? detecting,
    TResult Function(String message)? processing,
    TResult Function(String individualId, double confidence)? registered,
    TResult Function(double confidence)? verified,
    TResult Function(double confidence)? rejected,
    TResult Function()? noFaceDetected,
    TResult Function()? multipleFacesDetected,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (multipleFacesDetected != null) {
      return multipleFacesDetected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceVerificationIdleState value) idle,
    required TResult Function(FaceVerificationDetectingState value) detecting,
    required TResult Function(FaceVerificationProcessingState value) processing,
    required TResult Function(FaceVerificationRegisteredState value) registered,
    required TResult Function(FaceVerificationVerifiedState value) verified,
    required TResult Function(FaceVerificationRejectedState value) rejected,
    required TResult Function(FaceVerificationNoFaceState value) noFaceDetected,
    required TResult Function(FaceVerificationMultipleFacesState value)
        multipleFacesDetected,
    required TResult Function(FaceVerificationErrorState value) error,
  }) {
    return multipleFacesDetected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceVerificationIdleState value)? idle,
    TResult? Function(FaceVerificationDetectingState value)? detecting,
    TResult? Function(FaceVerificationProcessingState value)? processing,
    TResult? Function(FaceVerificationRegisteredState value)? registered,
    TResult? Function(FaceVerificationVerifiedState value)? verified,
    TResult? Function(FaceVerificationRejectedState value)? rejected,
    TResult? Function(FaceVerificationNoFaceState value)? noFaceDetected,
    TResult? Function(FaceVerificationMultipleFacesState value)?
        multipleFacesDetected,
    TResult? Function(FaceVerificationErrorState value)? error,
  }) {
    return multipleFacesDetected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceVerificationIdleState value)? idle,
    TResult Function(FaceVerificationDetectingState value)? detecting,
    TResult Function(FaceVerificationProcessingState value)? processing,
    TResult Function(FaceVerificationRegisteredState value)? registered,
    TResult Function(FaceVerificationVerifiedState value)? verified,
    TResult Function(FaceVerificationRejectedState value)? rejected,
    TResult Function(FaceVerificationNoFaceState value)? noFaceDetected,
    TResult Function(FaceVerificationMultipleFacesState value)?
        multipleFacesDetected,
    TResult Function(FaceVerificationErrorState value)? error,
    required TResult orElse(),
  }) {
    if (multipleFacesDetected != null) {
      return multipleFacesDetected(this);
    }
    return orElse();
  }
}

abstract class FaceVerificationMultipleFacesState
    implements FaceVerificationState {
  const factory FaceVerificationMultipleFacesState() =
      _$FaceVerificationMultipleFacesStateImpl;
}

/// @nodoc
abstract class _$$FaceVerificationErrorStateImplCopyWith<$Res> {
  factory _$$FaceVerificationErrorStateImplCopyWith(
          _$FaceVerificationErrorStateImpl value,
          $Res Function(_$FaceVerificationErrorStateImpl) then) =
      __$$FaceVerificationErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FaceVerificationErrorStateImplCopyWithImpl<$Res>
    extends _$FaceVerificationStateCopyWithImpl<$Res,
        _$FaceVerificationErrorStateImpl>
    implements _$$FaceVerificationErrorStateImplCopyWith<$Res> {
  __$$FaceVerificationErrorStateImplCopyWithImpl(
      _$FaceVerificationErrorStateImpl _value,
      $Res Function(_$FaceVerificationErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FaceVerificationErrorStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FaceVerificationErrorStateImpl implements FaceVerificationErrorState {
  const _$FaceVerificationErrorStateImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'FaceVerificationState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceVerificationErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceVerificationErrorStateImplCopyWith<_$FaceVerificationErrorStateImpl>
      get copyWith => __$$FaceVerificationErrorStateImplCopyWithImpl<
          _$FaceVerificationErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double quality) detecting,
    required TResult Function(String message) processing,
    required TResult Function(String individualId, double confidence)
        registered,
    required TResult Function(double confidence) verified,
    required TResult Function(double confidence) rejected,
    required TResult Function() noFaceDetected,
    required TResult Function() multipleFacesDetected,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double quality)? detecting,
    TResult? Function(String message)? processing,
    TResult? Function(String individualId, double confidence)? registered,
    TResult? Function(double confidence)? verified,
    TResult? Function(double confidence)? rejected,
    TResult? Function()? noFaceDetected,
    TResult? Function()? multipleFacesDetected,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double quality)? detecting,
    TResult Function(String message)? processing,
    TResult Function(String individualId, double confidence)? registered,
    TResult Function(double confidence)? verified,
    TResult Function(double confidence)? rejected,
    TResult Function()? noFaceDetected,
    TResult Function()? multipleFacesDetected,
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
    required TResult Function(FaceVerificationIdleState value) idle,
    required TResult Function(FaceVerificationDetectingState value) detecting,
    required TResult Function(FaceVerificationProcessingState value) processing,
    required TResult Function(FaceVerificationRegisteredState value) registered,
    required TResult Function(FaceVerificationVerifiedState value) verified,
    required TResult Function(FaceVerificationRejectedState value) rejected,
    required TResult Function(FaceVerificationNoFaceState value) noFaceDetected,
    required TResult Function(FaceVerificationMultipleFacesState value)
        multipleFacesDetected,
    required TResult Function(FaceVerificationErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FaceVerificationIdleState value)? idle,
    TResult? Function(FaceVerificationDetectingState value)? detecting,
    TResult? Function(FaceVerificationProcessingState value)? processing,
    TResult? Function(FaceVerificationRegisteredState value)? registered,
    TResult? Function(FaceVerificationVerifiedState value)? verified,
    TResult? Function(FaceVerificationRejectedState value)? rejected,
    TResult? Function(FaceVerificationNoFaceState value)? noFaceDetected,
    TResult? Function(FaceVerificationMultipleFacesState value)?
        multipleFacesDetected,
    TResult? Function(FaceVerificationErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceVerificationIdleState value)? idle,
    TResult Function(FaceVerificationDetectingState value)? detecting,
    TResult Function(FaceVerificationProcessingState value)? processing,
    TResult Function(FaceVerificationRegisteredState value)? registered,
    TResult Function(FaceVerificationVerifiedState value)? verified,
    TResult Function(FaceVerificationRejectedState value)? rejected,
    TResult Function(FaceVerificationNoFaceState value)? noFaceDetected,
    TResult Function(FaceVerificationMultipleFacesState value)?
        multipleFacesDetected,
    TResult Function(FaceVerificationErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FaceVerificationErrorState implements FaceVerificationState {
  const factory FaceVerificationErrorState({required final String message}) =
      _$FaceVerificationErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FaceVerificationErrorStateImplCopyWith<_$FaceVerificationErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
