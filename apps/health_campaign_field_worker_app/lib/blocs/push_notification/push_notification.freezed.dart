// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'push_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PushNotificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String userId) login,
    required TResult Function(String token) tokenRefreshed,
    required TResult Function(String apiEndPoint, List<String> facilityIds)
        registerToken,
    required TResult Function(Map<String, dynamic> data) notificationReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String userId)? login,
    TResult? Function(String token)? tokenRefreshed,
    TResult? Function(String apiEndPoint, List<String> facilityIds)?
        registerToken,
    TResult? Function(Map<String, dynamic> data)? notificationReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String userId)? login,
    TResult Function(String token)? tokenRefreshed,
    TResult Function(String apiEndPoint, List<String> facilityIds)?
        registerToken,
    TResult Function(Map<String, dynamic> data)? notificationReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PushNotificationInitializeEvent value) initialize,
    required TResult Function(PushNotificationLoginEvent value) login,
    required TResult Function(PushNotificationTokenRefreshedEvent value)
        tokenRefreshed,
    required TResult Function(PushNotificationRegisterTokenEvent value)
        registerToken,
    required TResult Function(PushNotificationNotificationReceivedEvent value)
        notificationReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PushNotificationInitializeEvent value)? initialize,
    TResult? Function(PushNotificationLoginEvent value)? login,
    TResult? Function(PushNotificationTokenRefreshedEvent value)?
        tokenRefreshed,
    TResult? Function(PushNotificationRegisterTokenEvent value)? registerToken,
    TResult? Function(PushNotificationNotificationReceivedEvent value)?
        notificationReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PushNotificationInitializeEvent value)? initialize,
    TResult Function(PushNotificationLoginEvent value)? login,
    TResult Function(PushNotificationTokenRefreshedEvent value)? tokenRefreshed,
    TResult Function(PushNotificationRegisterTokenEvent value)? registerToken,
    TResult Function(PushNotificationNotificationReceivedEvent value)?
        notificationReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushNotificationEventCopyWith<$Res> {
  factory $PushNotificationEventCopyWith(PushNotificationEvent value,
          $Res Function(PushNotificationEvent) then) =
      _$PushNotificationEventCopyWithImpl<$Res, PushNotificationEvent>;
}

/// @nodoc
class _$PushNotificationEventCopyWithImpl<$Res,
        $Val extends PushNotificationEvent>
    implements $PushNotificationEventCopyWith<$Res> {
  _$PushNotificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PushNotificationInitializeEventImplCopyWith<$Res> {
  factory _$$PushNotificationInitializeEventImplCopyWith(
          _$PushNotificationInitializeEventImpl value,
          $Res Function(_$PushNotificationInitializeEventImpl) then) =
      __$$PushNotificationInitializeEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PushNotificationInitializeEventImplCopyWithImpl<$Res>
    extends _$PushNotificationEventCopyWithImpl<$Res,
        _$PushNotificationInitializeEventImpl>
    implements _$$PushNotificationInitializeEventImplCopyWith<$Res> {
  __$$PushNotificationInitializeEventImplCopyWithImpl(
      _$PushNotificationInitializeEventImpl _value,
      $Res Function(_$PushNotificationInitializeEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PushNotificationInitializeEventImpl
    with DiagnosticableTreeMixin
    implements PushNotificationInitializeEvent {
  const _$PushNotificationInitializeEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PushNotificationEvent.initialize()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'PushNotificationEvent.initialize'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushNotificationInitializeEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String userId) login,
    required TResult Function(String token) tokenRefreshed,
    required TResult Function(String apiEndPoint, List<String> facilityIds)
        registerToken,
    required TResult Function(Map<String, dynamic> data) notificationReceived,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String userId)? login,
    TResult? Function(String token)? tokenRefreshed,
    TResult? Function(String apiEndPoint, List<String> facilityIds)?
        registerToken,
    TResult? Function(Map<String, dynamic> data)? notificationReceived,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String userId)? login,
    TResult Function(String token)? tokenRefreshed,
    TResult Function(String apiEndPoint, List<String> facilityIds)?
        registerToken,
    TResult Function(Map<String, dynamic> data)? notificationReceived,
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
    required TResult Function(PushNotificationInitializeEvent value) initialize,
    required TResult Function(PushNotificationLoginEvent value) login,
    required TResult Function(PushNotificationTokenRefreshedEvent value)
        tokenRefreshed,
    required TResult Function(PushNotificationRegisterTokenEvent value)
        registerToken,
    required TResult Function(PushNotificationNotificationReceivedEvent value)
        notificationReceived,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PushNotificationInitializeEvent value)? initialize,
    TResult? Function(PushNotificationLoginEvent value)? login,
    TResult? Function(PushNotificationTokenRefreshedEvent value)?
        tokenRefreshed,
    TResult? Function(PushNotificationRegisterTokenEvent value)? registerToken,
    TResult? Function(PushNotificationNotificationReceivedEvent value)?
        notificationReceived,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PushNotificationInitializeEvent value)? initialize,
    TResult Function(PushNotificationLoginEvent value)? login,
    TResult Function(PushNotificationTokenRefreshedEvent value)? tokenRefreshed,
    TResult Function(PushNotificationRegisterTokenEvent value)? registerToken,
    TResult Function(PushNotificationNotificationReceivedEvent value)?
        notificationReceived,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class PushNotificationInitializeEvent
    implements PushNotificationEvent {
  const factory PushNotificationInitializeEvent() =
      _$PushNotificationInitializeEventImpl;
}

/// @nodoc
abstract class _$$PushNotificationLoginEventImplCopyWith<$Res> {
  factory _$$PushNotificationLoginEventImplCopyWith(
          _$PushNotificationLoginEventImpl value,
          $Res Function(_$PushNotificationLoginEventImpl) then) =
      __$$PushNotificationLoginEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$PushNotificationLoginEventImplCopyWithImpl<$Res>
    extends _$PushNotificationEventCopyWithImpl<$Res,
        _$PushNotificationLoginEventImpl>
    implements _$$PushNotificationLoginEventImplCopyWith<$Res> {
  __$$PushNotificationLoginEventImplCopyWithImpl(
      _$PushNotificationLoginEventImpl _value,
      $Res Function(_$PushNotificationLoginEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$PushNotificationLoginEventImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PushNotificationLoginEventImpl
    with DiagnosticableTreeMixin
    implements PushNotificationLoginEvent {
  const _$PushNotificationLoginEventImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PushNotificationEvent.login(userId: $userId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PushNotificationEvent.login'))
      ..add(DiagnosticsProperty('userId', userId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushNotificationLoginEventImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PushNotificationLoginEventImplCopyWith<_$PushNotificationLoginEventImpl>
      get copyWith => __$$PushNotificationLoginEventImplCopyWithImpl<
          _$PushNotificationLoginEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String userId) login,
    required TResult Function(String token) tokenRefreshed,
    required TResult Function(String apiEndPoint, List<String> facilityIds)
        registerToken,
    required TResult Function(Map<String, dynamic> data) notificationReceived,
  }) {
    return login(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String userId)? login,
    TResult? Function(String token)? tokenRefreshed,
    TResult? Function(String apiEndPoint, List<String> facilityIds)?
        registerToken,
    TResult? Function(Map<String, dynamic> data)? notificationReceived,
  }) {
    return login?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String userId)? login,
    TResult Function(String token)? tokenRefreshed,
    TResult Function(String apiEndPoint, List<String> facilityIds)?
        registerToken,
    TResult Function(Map<String, dynamic> data)? notificationReceived,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PushNotificationInitializeEvent value) initialize,
    required TResult Function(PushNotificationLoginEvent value) login,
    required TResult Function(PushNotificationTokenRefreshedEvent value)
        tokenRefreshed,
    required TResult Function(PushNotificationRegisterTokenEvent value)
        registerToken,
    required TResult Function(PushNotificationNotificationReceivedEvent value)
        notificationReceived,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PushNotificationInitializeEvent value)? initialize,
    TResult? Function(PushNotificationLoginEvent value)? login,
    TResult? Function(PushNotificationTokenRefreshedEvent value)?
        tokenRefreshed,
    TResult? Function(PushNotificationRegisterTokenEvent value)? registerToken,
    TResult? Function(PushNotificationNotificationReceivedEvent value)?
        notificationReceived,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PushNotificationInitializeEvent value)? initialize,
    TResult Function(PushNotificationLoginEvent value)? login,
    TResult Function(PushNotificationTokenRefreshedEvent value)? tokenRefreshed,
    TResult Function(PushNotificationRegisterTokenEvent value)? registerToken,
    TResult Function(PushNotificationNotificationReceivedEvent value)?
        notificationReceived,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class PushNotificationLoginEvent implements PushNotificationEvent {
  const factory PushNotificationLoginEvent({required final String userId}) =
      _$PushNotificationLoginEventImpl;

  String get userId;
  @JsonKey(ignore: true)
  _$$PushNotificationLoginEventImplCopyWith<_$PushNotificationLoginEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PushNotificationTokenRefreshedEventImplCopyWith<$Res> {
  factory _$$PushNotificationTokenRefreshedEventImplCopyWith(
          _$PushNotificationTokenRefreshedEventImpl value,
          $Res Function(_$PushNotificationTokenRefreshedEventImpl) then) =
      __$$PushNotificationTokenRefreshedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$PushNotificationTokenRefreshedEventImplCopyWithImpl<$Res>
    extends _$PushNotificationEventCopyWithImpl<$Res,
        _$PushNotificationTokenRefreshedEventImpl>
    implements _$$PushNotificationTokenRefreshedEventImplCopyWith<$Res> {
  __$$PushNotificationTokenRefreshedEventImplCopyWithImpl(
      _$PushNotificationTokenRefreshedEventImpl _value,
      $Res Function(_$PushNotificationTokenRefreshedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$PushNotificationTokenRefreshedEventImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PushNotificationTokenRefreshedEventImpl
    with DiagnosticableTreeMixin
    implements PushNotificationTokenRefreshedEvent {
  const _$PushNotificationTokenRefreshedEventImpl({required this.token});

  @override
  final String token;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PushNotificationEvent.tokenRefreshed(token: $token)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PushNotificationEvent.tokenRefreshed'))
      ..add(DiagnosticsProperty('token', token));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushNotificationTokenRefreshedEventImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PushNotificationTokenRefreshedEventImplCopyWith<
          _$PushNotificationTokenRefreshedEventImpl>
      get copyWith => __$$PushNotificationTokenRefreshedEventImplCopyWithImpl<
          _$PushNotificationTokenRefreshedEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String userId) login,
    required TResult Function(String token) tokenRefreshed,
    required TResult Function(String apiEndPoint, List<String> facilityIds)
        registerToken,
    required TResult Function(Map<String, dynamic> data) notificationReceived,
  }) {
    return tokenRefreshed(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String userId)? login,
    TResult? Function(String token)? tokenRefreshed,
    TResult? Function(String apiEndPoint, List<String> facilityIds)?
        registerToken,
    TResult? Function(Map<String, dynamic> data)? notificationReceived,
  }) {
    return tokenRefreshed?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String userId)? login,
    TResult Function(String token)? tokenRefreshed,
    TResult Function(String apiEndPoint, List<String> facilityIds)?
        registerToken,
    TResult Function(Map<String, dynamic> data)? notificationReceived,
    required TResult orElse(),
  }) {
    if (tokenRefreshed != null) {
      return tokenRefreshed(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PushNotificationInitializeEvent value) initialize,
    required TResult Function(PushNotificationLoginEvent value) login,
    required TResult Function(PushNotificationTokenRefreshedEvent value)
        tokenRefreshed,
    required TResult Function(PushNotificationRegisterTokenEvent value)
        registerToken,
    required TResult Function(PushNotificationNotificationReceivedEvent value)
        notificationReceived,
  }) {
    return tokenRefreshed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PushNotificationInitializeEvent value)? initialize,
    TResult? Function(PushNotificationLoginEvent value)? login,
    TResult? Function(PushNotificationTokenRefreshedEvent value)?
        tokenRefreshed,
    TResult? Function(PushNotificationRegisterTokenEvent value)? registerToken,
    TResult? Function(PushNotificationNotificationReceivedEvent value)?
        notificationReceived,
  }) {
    return tokenRefreshed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PushNotificationInitializeEvent value)? initialize,
    TResult Function(PushNotificationLoginEvent value)? login,
    TResult Function(PushNotificationTokenRefreshedEvent value)? tokenRefreshed,
    TResult Function(PushNotificationRegisterTokenEvent value)? registerToken,
    TResult Function(PushNotificationNotificationReceivedEvent value)?
        notificationReceived,
    required TResult orElse(),
  }) {
    if (tokenRefreshed != null) {
      return tokenRefreshed(this);
    }
    return orElse();
  }
}

abstract class PushNotificationTokenRefreshedEvent
    implements PushNotificationEvent {
  const factory PushNotificationTokenRefreshedEvent(
          {required final String token}) =
      _$PushNotificationTokenRefreshedEventImpl;

  String get token;
  @JsonKey(ignore: true)
  _$$PushNotificationTokenRefreshedEventImplCopyWith<
          _$PushNotificationTokenRefreshedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PushNotificationRegisterTokenEventImplCopyWith<$Res> {
  factory _$$PushNotificationRegisterTokenEventImplCopyWith(
          _$PushNotificationRegisterTokenEventImpl value,
          $Res Function(_$PushNotificationRegisterTokenEventImpl) then) =
      __$$PushNotificationRegisterTokenEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String apiEndPoint, List<String> facilityIds});
}

/// @nodoc
class __$$PushNotificationRegisterTokenEventImplCopyWithImpl<$Res>
    extends _$PushNotificationEventCopyWithImpl<$Res,
        _$PushNotificationRegisterTokenEventImpl>
    implements _$$PushNotificationRegisterTokenEventImplCopyWith<$Res> {
  __$$PushNotificationRegisterTokenEventImplCopyWithImpl(
      _$PushNotificationRegisterTokenEventImpl _value,
      $Res Function(_$PushNotificationRegisterTokenEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiEndPoint = null,
    Object? facilityIds = null,
  }) {
    return _then(_$PushNotificationRegisterTokenEventImpl(
      apiEndPoint: null == apiEndPoint
          ? _value.apiEndPoint
          : apiEndPoint // ignore: cast_nullable_to_non_nullable
              as String,
      facilityIds: null == facilityIds
          ? _value._facilityIds
          : facilityIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$PushNotificationRegisterTokenEventImpl
    with DiagnosticableTreeMixin
    implements PushNotificationRegisterTokenEvent {
  const _$PushNotificationRegisterTokenEventImpl(
      {required this.apiEndPoint, required final List<String> facilityIds})
      : _facilityIds = facilityIds;

  @override
  final String apiEndPoint;
  final List<String> _facilityIds;
  @override
  List<String> get facilityIds {
    if (_facilityIds is EqualUnmodifiableListView) return _facilityIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_facilityIds);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PushNotificationEvent.registerToken(apiEndPoint: $apiEndPoint, facilityIds: $facilityIds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PushNotificationEvent.registerToken'))
      ..add(DiagnosticsProperty('apiEndPoint', apiEndPoint))
      ..add(DiagnosticsProperty('facilityIds', facilityIds));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushNotificationRegisterTokenEventImpl &&
            (identical(other.apiEndPoint, apiEndPoint) ||
                other.apiEndPoint == apiEndPoint) &&
            const DeepCollectionEquality()
                .equals(other._facilityIds, _facilityIds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiEndPoint,
      const DeepCollectionEquality().hash(_facilityIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PushNotificationRegisterTokenEventImplCopyWith<
          _$PushNotificationRegisterTokenEventImpl>
      get copyWith => __$$PushNotificationRegisterTokenEventImplCopyWithImpl<
          _$PushNotificationRegisterTokenEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String userId) login,
    required TResult Function(String token) tokenRefreshed,
    required TResult Function(String apiEndPoint, List<String> facilityIds)
        registerToken,
    required TResult Function(Map<String, dynamic> data) notificationReceived,
  }) {
    return registerToken(apiEndPoint, facilityIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String userId)? login,
    TResult? Function(String token)? tokenRefreshed,
    TResult? Function(String apiEndPoint, List<String> facilityIds)?
        registerToken,
    TResult? Function(Map<String, dynamic> data)? notificationReceived,
  }) {
    return registerToken?.call(apiEndPoint, facilityIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String userId)? login,
    TResult Function(String token)? tokenRefreshed,
    TResult Function(String apiEndPoint, List<String> facilityIds)?
        registerToken,
    TResult Function(Map<String, dynamic> data)? notificationReceived,
    required TResult orElse(),
  }) {
    if (registerToken != null) {
      return registerToken(apiEndPoint, facilityIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PushNotificationInitializeEvent value) initialize,
    required TResult Function(PushNotificationLoginEvent value) login,
    required TResult Function(PushNotificationTokenRefreshedEvent value)
        tokenRefreshed,
    required TResult Function(PushNotificationRegisterTokenEvent value)
        registerToken,
    required TResult Function(PushNotificationNotificationReceivedEvent value)
        notificationReceived,
  }) {
    return registerToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PushNotificationInitializeEvent value)? initialize,
    TResult? Function(PushNotificationLoginEvent value)? login,
    TResult? Function(PushNotificationTokenRefreshedEvent value)?
        tokenRefreshed,
    TResult? Function(PushNotificationRegisterTokenEvent value)? registerToken,
    TResult? Function(PushNotificationNotificationReceivedEvent value)?
        notificationReceived,
  }) {
    return registerToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PushNotificationInitializeEvent value)? initialize,
    TResult Function(PushNotificationLoginEvent value)? login,
    TResult Function(PushNotificationTokenRefreshedEvent value)? tokenRefreshed,
    TResult Function(PushNotificationRegisterTokenEvent value)? registerToken,
    TResult Function(PushNotificationNotificationReceivedEvent value)?
        notificationReceived,
    required TResult orElse(),
  }) {
    if (registerToken != null) {
      return registerToken(this);
    }
    return orElse();
  }
}

abstract class PushNotificationRegisterTokenEvent
    implements PushNotificationEvent {
  const factory PushNotificationRegisterTokenEvent(
          {required final String apiEndPoint,
          required final List<String> facilityIds}) =
      _$PushNotificationRegisterTokenEventImpl;

  String get apiEndPoint;
  List<String> get facilityIds;
  @JsonKey(ignore: true)
  _$$PushNotificationRegisterTokenEventImplCopyWith<
          _$PushNotificationRegisterTokenEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PushNotificationNotificationReceivedEventImplCopyWith<$Res> {
  factory _$$PushNotificationNotificationReceivedEventImplCopyWith(
          _$PushNotificationNotificationReceivedEventImpl value,
          $Res Function(_$PushNotificationNotificationReceivedEventImpl) then) =
      __$$PushNotificationNotificationReceivedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$PushNotificationNotificationReceivedEventImplCopyWithImpl<$Res>
    extends _$PushNotificationEventCopyWithImpl<$Res,
        _$PushNotificationNotificationReceivedEventImpl>
    implements _$$PushNotificationNotificationReceivedEventImplCopyWith<$Res> {
  __$$PushNotificationNotificationReceivedEventImplCopyWithImpl(
      _$PushNotificationNotificationReceivedEventImpl _value,
      $Res Function(_$PushNotificationNotificationReceivedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$PushNotificationNotificationReceivedEventImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$PushNotificationNotificationReceivedEventImpl
    with DiagnosticableTreeMixin
    implements PushNotificationNotificationReceivedEvent {
  const _$PushNotificationNotificationReceivedEventImpl(
      {required final Map<String, dynamic> data})
      : _data = data;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PushNotificationEvent.notificationReceived(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'PushNotificationEvent.notificationReceived'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushNotificationNotificationReceivedEventImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PushNotificationNotificationReceivedEventImplCopyWith<
          _$PushNotificationNotificationReceivedEventImpl>
      get copyWith =>
          __$$PushNotificationNotificationReceivedEventImplCopyWithImpl<
                  _$PushNotificationNotificationReceivedEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String userId) login,
    required TResult Function(String token) tokenRefreshed,
    required TResult Function(String apiEndPoint, List<String> facilityIds)
        registerToken,
    required TResult Function(Map<String, dynamic> data) notificationReceived,
  }) {
    return notificationReceived(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String userId)? login,
    TResult? Function(String token)? tokenRefreshed,
    TResult? Function(String apiEndPoint, List<String> facilityIds)?
        registerToken,
    TResult? Function(Map<String, dynamic> data)? notificationReceived,
  }) {
    return notificationReceived?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String userId)? login,
    TResult Function(String token)? tokenRefreshed,
    TResult Function(String apiEndPoint, List<String> facilityIds)?
        registerToken,
    TResult Function(Map<String, dynamic> data)? notificationReceived,
    required TResult orElse(),
  }) {
    if (notificationReceived != null) {
      return notificationReceived(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PushNotificationInitializeEvent value) initialize,
    required TResult Function(PushNotificationLoginEvent value) login,
    required TResult Function(PushNotificationTokenRefreshedEvent value)
        tokenRefreshed,
    required TResult Function(PushNotificationRegisterTokenEvent value)
        registerToken,
    required TResult Function(PushNotificationNotificationReceivedEvent value)
        notificationReceived,
  }) {
    return notificationReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PushNotificationInitializeEvent value)? initialize,
    TResult? Function(PushNotificationLoginEvent value)? login,
    TResult? Function(PushNotificationTokenRefreshedEvent value)?
        tokenRefreshed,
    TResult? Function(PushNotificationRegisterTokenEvent value)? registerToken,
    TResult? Function(PushNotificationNotificationReceivedEvent value)?
        notificationReceived,
  }) {
    return notificationReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PushNotificationInitializeEvent value)? initialize,
    TResult Function(PushNotificationLoginEvent value)? login,
    TResult Function(PushNotificationTokenRefreshedEvent value)? tokenRefreshed,
    TResult Function(PushNotificationRegisterTokenEvent value)? registerToken,
    TResult Function(PushNotificationNotificationReceivedEvent value)?
        notificationReceived,
    required TResult orElse(),
  }) {
    if (notificationReceived != null) {
      return notificationReceived(this);
    }
    return orElse();
  }
}

abstract class PushNotificationNotificationReceivedEvent
    implements PushNotificationEvent {
  const factory PushNotificationNotificationReceivedEvent(
          {required final Map<String, dynamic> data}) =
      _$PushNotificationNotificationReceivedEventImpl;

  Map<String, dynamic> get data;
  @JsonKey(ignore: true)
  _$$PushNotificationNotificationReceivedEventImplCopyWith<
          _$PushNotificationNotificationReceivedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PushNotificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? fcmToken) initialized,
    required TResult Function(Map<String, dynamic> data) notificationTapped,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? fcmToken)? initialized,
    TResult? Function(Map<String, dynamic> data)? notificationTapped,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? fcmToken)? initialized,
    TResult Function(Map<String, dynamic> data)? notificationTapped,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PushNotificationInitialState value) initial,
    required TResult Function(PushNotificationInitializedState value)
        initialized,
    required TResult Function(PushNotificationTappedState value)
        notificationTapped,
    required TResult Function(PushNotificationErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PushNotificationInitialState value)? initial,
    TResult? Function(PushNotificationInitializedState value)? initialized,
    TResult? Function(PushNotificationTappedState value)? notificationTapped,
    TResult? Function(PushNotificationErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PushNotificationInitialState value)? initial,
    TResult Function(PushNotificationInitializedState value)? initialized,
    TResult Function(PushNotificationTappedState value)? notificationTapped,
    TResult Function(PushNotificationErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushNotificationStateCopyWith<$Res> {
  factory $PushNotificationStateCopyWith(PushNotificationState value,
          $Res Function(PushNotificationState) then) =
      _$PushNotificationStateCopyWithImpl<$Res, PushNotificationState>;
}

/// @nodoc
class _$PushNotificationStateCopyWithImpl<$Res,
        $Val extends PushNotificationState>
    implements $PushNotificationStateCopyWith<$Res> {
  _$PushNotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PushNotificationInitialStateImplCopyWith<$Res> {
  factory _$$PushNotificationInitialStateImplCopyWith(
          _$PushNotificationInitialStateImpl value,
          $Res Function(_$PushNotificationInitialStateImpl) then) =
      __$$PushNotificationInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PushNotificationInitialStateImplCopyWithImpl<$Res>
    extends _$PushNotificationStateCopyWithImpl<$Res,
        _$PushNotificationInitialStateImpl>
    implements _$$PushNotificationInitialStateImplCopyWith<$Res> {
  __$$PushNotificationInitialStateImplCopyWithImpl(
      _$PushNotificationInitialStateImpl _value,
      $Res Function(_$PushNotificationInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PushNotificationInitialStateImpl
    with DiagnosticableTreeMixin
    implements PushNotificationInitialState {
  const _$PushNotificationInitialStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PushNotificationState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'PushNotificationState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushNotificationInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? fcmToken) initialized,
    required TResult Function(Map<String, dynamic> data) notificationTapped,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? fcmToken)? initialized,
    TResult? Function(Map<String, dynamic> data)? notificationTapped,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? fcmToken)? initialized,
    TResult Function(Map<String, dynamic> data)? notificationTapped,
    TResult Function(String error)? error,
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
    required TResult Function(PushNotificationInitialState value) initial,
    required TResult Function(PushNotificationInitializedState value)
        initialized,
    required TResult Function(PushNotificationTappedState value)
        notificationTapped,
    required TResult Function(PushNotificationErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PushNotificationInitialState value)? initial,
    TResult? Function(PushNotificationInitializedState value)? initialized,
    TResult? Function(PushNotificationTappedState value)? notificationTapped,
    TResult? Function(PushNotificationErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PushNotificationInitialState value)? initial,
    TResult Function(PushNotificationInitializedState value)? initialized,
    TResult Function(PushNotificationTappedState value)? notificationTapped,
    TResult Function(PushNotificationErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class PushNotificationInitialState implements PushNotificationState {
  const factory PushNotificationInitialState() =
      _$PushNotificationInitialStateImpl;
}

/// @nodoc
abstract class _$$PushNotificationInitializedStateImplCopyWith<$Res> {
  factory _$$PushNotificationInitializedStateImplCopyWith(
          _$PushNotificationInitializedStateImpl value,
          $Res Function(_$PushNotificationInitializedStateImpl) then) =
      __$$PushNotificationInitializedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? fcmToken});
}

/// @nodoc
class __$$PushNotificationInitializedStateImplCopyWithImpl<$Res>
    extends _$PushNotificationStateCopyWithImpl<$Res,
        _$PushNotificationInitializedStateImpl>
    implements _$$PushNotificationInitializedStateImplCopyWith<$Res> {
  __$$PushNotificationInitializedStateImplCopyWithImpl(
      _$PushNotificationInitializedStateImpl _value,
      $Res Function(_$PushNotificationInitializedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fcmToken = freezed,
  }) {
    return _then(_$PushNotificationInitializedStateImpl(
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PushNotificationInitializedStateImpl
    with DiagnosticableTreeMixin
    implements PushNotificationInitializedState {
  const _$PushNotificationInitializedStateImpl({this.fcmToken});

  @override
  final String? fcmToken;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PushNotificationState.initialized(fcmToken: $fcmToken)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PushNotificationState.initialized'))
      ..add(DiagnosticsProperty('fcmToken', fcmToken));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushNotificationInitializedStateImpl &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fcmToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PushNotificationInitializedStateImplCopyWith<
          _$PushNotificationInitializedStateImpl>
      get copyWith => __$$PushNotificationInitializedStateImplCopyWithImpl<
          _$PushNotificationInitializedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? fcmToken) initialized,
    required TResult Function(Map<String, dynamic> data) notificationTapped,
    required TResult Function(String error) error,
  }) {
    return initialized(fcmToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? fcmToken)? initialized,
    TResult? Function(Map<String, dynamic> data)? notificationTapped,
    TResult? Function(String error)? error,
  }) {
    return initialized?.call(fcmToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? fcmToken)? initialized,
    TResult Function(Map<String, dynamic> data)? notificationTapped,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(fcmToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PushNotificationInitialState value) initial,
    required TResult Function(PushNotificationInitializedState value)
        initialized,
    required TResult Function(PushNotificationTappedState value)
        notificationTapped,
    required TResult Function(PushNotificationErrorState value) error,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PushNotificationInitialState value)? initial,
    TResult? Function(PushNotificationInitializedState value)? initialized,
    TResult? Function(PushNotificationTappedState value)? notificationTapped,
    TResult? Function(PushNotificationErrorState value)? error,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PushNotificationInitialState value)? initial,
    TResult Function(PushNotificationInitializedState value)? initialized,
    TResult Function(PushNotificationTappedState value)? notificationTapped,
    TResult Function(PushNotificationErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class PushNotificationInitializedState
    implements PushNotificationState {
  const factory PushNotificationInitializedState({final String? fcmToken}) =
      _$PushNotificationInitializedStateImpl;

  String? get fcmToken;
  @JsonKey(ignore: true)
  _$$PushNotificationInitializedStateImplCopyWith<
          _$PushNotificationInitializedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PushNotificationTappedStateImplCopyWith<$Res> {
  factory _$$PushNotificationTappedStateImplCopyWith(
          _$PushNotificationTappedStateImpl value,
          $Res Function(_$PushNotificationTappedStateImpl) then) =
      __$$PushNotificationTappedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$PushNotificationTappedStateImplCopyWithImpl<$Res>
    extends _$PushNotificationStateCopyWithImpl<$Res,
        _$PushNotificationTappedStateImpl>
    implements _$$PushNotificationTappedStateImplCopyWith<$Res> {
  __$$PushNotificationTappedStateImplCopyWithImpl(
      _$PushNotificationTappedStateImpl _value,
      $Res Function(_$PushNotificationTappedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$PushNotificationTappedStateImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$PushNotificationTappedStateImpl
    with DiagnosticableTreeMixin
    implements PushNotificationTappedState {
  const _$PushNotificationTappedStateImpl(
      {required final Map<String, dynamic> data})
      : _data = data;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PushNotificationState.notificationTapped(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'PushNotificationState.notificationTapped'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushNotificationTappedStateImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PushNotificationTappedStateImplCopyWith<_$PushNotificationTappedStateImpl>
      get copyWith => __$$PushNotificationTappedStateImplCopyWithImpl<
          _$PushNotificationTappedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? fcmToken) initialized,
    required TResult Function(Map<String, dynamic> data) notificationTapped,
    required TResult Function(String error) error,
  }) {
    return notificationTapped(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? fcmToken)? initialized,
    TResult? Function(Map<String, dynamic> data)? notificationTapped,
    TResult? Function(String error)? error,
  }) {
    return notificationTapped?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? fcmToken)? initialized,
    TResult Function(Map<String, dynamic> data)? notificationTapped,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (notificationTapped != null) {
      return notificationTapped(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PushNotificationInitialState value) initial,
    required TResult Function(PushNotificationInitializedState value)
        initialized,
    required TResult Function(PushNotificationTappedState value)
        notificationTapped,
    required TResult Function(PushNotificationErrorState value) error,
  }) {
    return notificationTapped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PushNotificationInitialState value)? initial,
    TResult? Function(PushNotificationInitializedState value)? initialized,
    TResult? Function(PushNotificationTappedState value)? notificationTapped,
    TResult? Function(PushNotificationErrorState value)? error,
  }) {
    return notificationTapped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PushNotificationInitialState value)? initial,
    TResult Function(PushNotificationInitializedState value)? initialized,
    TResult Function(PushNotificationTappedState value)? notificationTapped,
    TResult Function(PushNotificationErrorState value)? error,
    required TResult orElse(),
  }) {
    if (notificationTapped != null) {
      return notificationTapped(this);
    }
    return orElse();
  }
}

abstract class PushNotificationTappedState implements PushNotificationState {
  const factory PushNotificationTappedState(
          {required final Map<String, dynamic> data}) =
      _$PushNotificationTappedStateImpl;

  Map<String, dynamic> get data;
  @JsonKey(ignore: true)
  _$$PushNotificationTappedStateImplCopyWith<_$PushNotificationTappedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PushNotificationErrorStateImplCopyWith<$Res> {
  factory _$$PushNotificationErrorStateImplCopyWith(
          _$PushNotificationErrorStateImpl value,
          $Res Function(_$PushNotificationErrorStateImpl) then) =
      __$$PushNotificationErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$PushNotificationErrorStateImplCopyWithImpl<$Res>
    extends _$PushNotificationStateCopyWithImpl<$Res,
        _$PushNotificationErrorStateImpl>
    implements _$$PushNotificationErrorStateImplCopyWith<$Res> {
  __$$PushNotificationErrorStateImplCopyWithImpl(
      _$PushNotificationErrorStateImpl _value,
      $Res Function(_$PushNotificationErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$PushNotificationErrorStateImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PushNotificationErrorStateImpl
    with DiagnosticableTreeMixin
    implements PushNotificationErrorState {
  const _$PushNotificationErrorStateImpl({required this.error});

  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PushNotificationState.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PushNotificationState.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushNotificationErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PushNotificationErrorStateImplCopyWith<_$PushNotificationErrorStateImpl>
      get copyWith => __$$PushNotificationErrorStateImplCopyWithImpl<
          _$PushNotificationErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? fcmToken) initialized,
    required TResult Function(Map<String, dynamic> data) notificationTapped,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? fcmToken)? initialized,
    TResult? Function(Map<String, dynamic> data)? notificationTapped,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? fcmToken)? initialized,
    TResult Function(Map<String, dynamic> data)? notificationTapped,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PushNotificationInitialState value) initial,
    required TResult Function(PushNotificationInitializedState value)
        initialized,
    required TResult Function(PushNotificationTappedState value)
        notificationTapped,
    required TResult Function(PushNotificationErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PushNotificationInitialState value)? initial,
    TResult? Function(PushNotificationInitializedState value)? initialized,
    TResult? Function(PushNotificationTappedState value)? notificationTapped,
    TResult? Function(PushNotificationErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PushNotificationInitialState value)? initial,
    TResult Function(PushNotificationInitializedState value)? initialized,
    TResult Function(PushNotificationTappedState value)? notificationTapped,
    TResult Function(PushNotificationErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PushNotificationErrorState implements PushNotificationState {
  const factory PushNotificationErrorState({required final String error}) =
      _$PushNotificationErrorStateImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$PushNotificationErrorStateImplCopyWith<_$PushNotificationErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
