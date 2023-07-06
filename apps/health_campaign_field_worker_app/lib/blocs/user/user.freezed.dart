// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uuid) searchUser,
    required TResult Function(UserModel user, UserModel oldUser) updateUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uuid)? searchUser,
    TResult? Function(UserModel user, UserModel oldUser)? updateUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uuid)? searchUser,
    TResult Function(UserModel user, UserModel oldUser)? updateUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserSearchUserEvent value) searchUser,
    required TResult Function(UserUpdateUserEvent value) updateUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserSearchUserEvent value)? searchUser,
    TResult? Function(UserUpdateUserEvent value)? updateUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserSearchUserEvent value)? searchUser,
    TResult Function(UserUpdateUserEvent value)? updateUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserSearchUserEventCopyWith<$Res> {
  factory _$$UserSearchUserEventCopyWith(_$UserSearchUserEvent value,
          $Res Function(_$UserSearchUserEvent) then) =
      __$$UserSearchUserEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid});
}

/// @nodoc
class __$$UserSearchUserEventCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserSearchUserEvent>
    implements _$$UserSearchUserEventCopyWith<$Res> {
  __$$UserSearchUserEventCopyWithImpl(
      _$UserSearchUserEvent _value, $Res Function(_$UserSearchUserEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
  }) {
    return _then(_$UserSearchUserEvent(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserSearchUserEvent implements UserSearchUserEvent {
  const _$UserSearchUserEvent({required this.uuid});

  @override
  final String uuid;

  @override
  String toString() {
    return 'UserEvent.searchUser(uuid: $uuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSearchUserEvent &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSearchUserEventCopyWith<_$UserSearchUserEvent> get copyWith =>
      __$$UserSearchUserEventCopyWithImpl<_$UserSearchUserEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uuid) searchUser,
    required TResult Function(UserModel user, UserModel oldUser) updateUser,
  }) {
    return searchUser(uuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uuid)? searchUser,
    TResult? Function(UserModel user, UserModel oldUser)? updateUser,
  }) {
    return searchUser?.call(uuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uuid)? searchUser,
    TResult Function(UserModel user, UserModel oldUser)? updateUser,
    required TResult orElse(),
  }) {
    if (searchUser != null) {
      return searchUser(uuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserSearchUserEvent value) searchUser,
    required TResult Function(UserUpdateUserEvent value) updateUser,
  }) {
    return searchUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserSearchUserEvent value)? searchUser,
    TResult? Function(UserUpdateUserEvent value)? updateUser,
  }) {
    return searchUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserSearchUserEvent value)? searchUser,
    TResult Function(UserUpdateUserEvent value)? updateUser,
    required TResult orElse(),
  }) {
    if (searchUser != null) {
      return searchUser(this);
    }
    return orElse();
  }
}

abstract class UserSearchUserEvent implements UserEvent {
  const factory UserSearchUserEvent({required final String uuid}) =
      _$UserSearchUserEvent;

  String get uuid;
  @JsonKey(ignore: true)
  _$$UserSearchUserEventCopyWith<_$UserSearchUserEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserUpdateUserEventCopyWith<$Res> {
  factory _$$UserUpdateUserEventCopyWith(_$UserUpdateUserEvent value,
          $Res Function(_$UserUpdateUserEvent) then) =
      __$$UserUpdateUserEventCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user, UserModel oldUser});
}

/// @nodoc
class __$$UserUpdateUserEventCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserUpdateUserEvent>
    implements _$$UserUpdateUserEventCopyWith<$Res> {
  __$$UserUpdateUserEventCopyWithImpl(
      _$UserUpdateUserEvent _value, $Res Function(_$UserUpdateUserEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? oldUser = null,
  }) {
    return _then(_$UserUpdateUserEvent(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      oldUser: null == oldUser
          ? _value.oldUser
          : oldUser // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$UserUpdateUserEvent implements UserUpdateUserEvent {
  const _$UserUpdateUserEvent({required this.user, required this.oldUser});

  @override
  final UserModel user;
  @override
  final UserModel oldUser;

  @override
  String toString() {
    return 'UserEvent.updateUser(user: $user, oldUser: $oldUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserUpdateUserEvent &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.oldUser, oldUser) || other.oldUser == oldUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, oldUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserUpdateUserEventCopyWith<_$UserUpdateUserEvent> get copyWith =>
      __$$UserUpdateUserEventCopyWithImpl<_$UserUpdateUserEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uuid) searchUser,
    required TResult Function(UserModel user, UserModel oldUser) updateUser,
  }) {
    return updateUser(user, oldUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uuid)? searchUser,
    TResult? Function(UserModel user, UserModel oldUser)? updateUser,
  }) {
    return updateUser?.call(user, oldUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uuid)? searchUser,
    TResult Function(UserModel user, UserModel oldUser)? updateUser,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser(user, oldUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserSearchUserEvent value) searchUser,
    required TResult Function(UserUpdateUserEvent value) updateUser,
  }) {
    return updateUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserSearchUserEvent value)? searchUser,
    TResult? Function(UserUpdateUserEvent value)? updateUser,
  }) {
    return updateUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserSearchUserEvent value)? searchUser,
    TResult Function(UserUpdateUserEvent value)? updateUser,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser(this);
    }
    return orElse();
  }
}

abstract class UserUpdateUserEvent implements UserEvent {
  const factory UserUpdateUserEvent(
      {required final UserModel user,
      required final UserModel oldUser}) = _$UserUpdateUserEvent;

  UserModel get user;
  UserModel get oldUser;
  @JsonKey(ignore: true)
  _$$UserUpdateUserEventCopyWith<_$UserUpdateUserEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(UserModel? userModel) user,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(UserModel? userModel)? user,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(UserModel? userModel)? user,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEmptyState value) empty,
    required TResult Function(UserLoadingState value) loading,
    required TResult Function(UserUserState value) user,
    required TResult Function(UserErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserEmptyState value)? empty,
    TResult? Function(UserLoadingState value)? loading,
    TResult? Function(UserUserState value)? user,
    TResult? Function(UserErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEmptyState value)? empty,
    TResult Function(UserLoadingState value)? loading,
    TResult Function(UserUserState value)? user,
    TResult Function(UserErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserEmptyStateCopyWith<$Res> {
  factory _$$UserEmptyStateCopyWith(
          _$UserEmptyState value, $Res Function(_$UserEmptyState) then) =
      __$$UserEmptyStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserEmptyStateCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserEmptyState>
    implements _$$UserEmptyStateCopyWith<$Res> {
  __$$UserEmptyStateCopyWithImpl(
      _$UserEmptyState _value, $Res Function(_$UserEmptyState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserEmptyState implements UserEmptyState {
  const _$UserEmptyState();

  @override
  String toString() {
    return 'UserState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserEmptyState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(UserModel? userModel) user,
    required TResult Function(String? error) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(UserModel? userModel)? user,
    TResult? Function(String? error)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(UserModel? userModel)? user,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEmptyState value) empty,
    required TResult Function(UserLoadingState value) loading,
    required TResult Function(UserUserState value) user,
    required TResult Function(UserErrorState value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserEmptyState value)? empty,
    TResult? Function(UserLoadingState value)? loading,
    TResult? Function(UserUserState value)? user,
    TResult? Function(UserErrorState value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEmptyState value)? empty,
    TResult Function(UserLoadingState value)? loading,
    TResult Function(UserUserState value)? user,
    TResult Function(UserErrorState value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class UserEmptyState implements UserState {
  const factory UserEmptyState() = _$UserEmptyState;
}

/// @nodoc
abstract class _$$UserLoadingStateCopyWith<$Res> {
  factory _$$UserLoadingStateCopyWith(
          _$UserLoadingState value, $Res Function(_$UserLoadingState) then) =
      __$$UserLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserLoadingStateCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserLoadingState>
    implements _$$UserLoadingStateCopyWith<$Res> {
  __$$UserLoadingStateCopyWithImpl(
      _$UserLoadingState _value, $Res Function(_$UserLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserLoadingState implements UserLoadingState {
  const _$UserLoadingState();

  @override
  String toString() {
    return 'UserState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(UserModel? userModel) user,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(UserModel? userModel)? user,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(UserModel? userModel)? user,
    TResult Function(String? error)? error,
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
    required TResult Function(UserEmptyState value) empty,
    required TResult Function(UserLoadingState value) loading,
    required TResult Function(UserUserState value) user,
    required TResult Function(UserErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserEmptyState value)? empty,
    TResult? Function(UserLoadingState value)? loading,
    TResult? Function(UserUserState value)? user,
    TResult? Function(UserErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEmptyState value)? empty,
    TResult Function(UserLoadingState value)? loading,
    TResult Function(UserUserState value)? user,
    TResult Function(UserErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UserLoadingState implements UserState {
  const factory UserLoadingState() = _$UserLoadingState;
}

/// @nodoc
abstract class _$$UserUserStateCopyWith<$Res> {
  factory _$$UserUserStateCopyWith(
          _$UserUserState value, $Res Function(_$UserUserState) then) =
      __$$UserUserStateCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel? userModel});
}

/// @nodoc
class __$$UserUserStateCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserUserState>
    implements _$$UserUserStateCopyWith<$Res> {
  __$$UserUserStateCopyWithImpl(
      _$UserUserState _value, $Res Function(_$UserUserState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userModel = freezed,
  }) {
    return _then(_$UserUserState(
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc

class _$UserUserState implements UserUserState {
  const _$UserUserState({this.userModel});

  @override
  final UserModel? userModel;

  @override
  String toString() {
    return 'UserState.user(userModel: $userModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserUserState &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserUserStateCopyWith<_$UserUserState> get copyWith =>
      __$$UserUserStateCopyWithImpl<_$UserUserState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(UserModel? userModel) user,
    required TResult Function(String? error) error,
  }) {
    return user(userModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(UserModel? userModel)? user,
    TResult? Function(String? error)? error,
  }) {
    return user?.call(userModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(UserModel? userModel)? user,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(userModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEmptyState value) empty,
    required TResult Function(UserLoadingState value) loading,
    required TResult Function(UserUserState value) user,
    required TResult Function(UserErrorState value) error,
  }) {
    return user(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserEmptyState value)? empty,
    TResult? Function(UserLoadingState value)? loading,
    TResult? Function(UserUserState value)? user,
    TResult? Function(UserErrorState value)? error,
  }) {
    return user?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEmptyState value)? empty,
    TResult Function(UserLoadingState value)? loading,
    TResult Function(UserUserState value)? user,
    TResult Function(UserErrorState value)? error,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(this);
    }
    return orElse();
  }
}

abstract class UserUserState implements UserState {
  const factory UserUserState({final UserModel? userModel}) = _$UserUserState;

  UserModel? get userModel;
  @JsonKey(ignore: true)
  _$$UserUserStateCopyWith<_$UserUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserErrorStateCopyWith<$Res> {
  factory _$$UserErrorStateCopyWith(
          _$UserErrorState value, $Res Function(_$UserErrorState) then) =
      __$$UserErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$UserErrorStateCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserErrorState>
    implements _$$UserErrorStateCopyWith<$Res> {
  __$$UserErrorStateCopyWithImpl(
      _$UserErrorState _value, $Res Function(_$UserErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$UserErrorState(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserErrorState implements UserErrorState {
  const _$UserErrorState([this.error]);

  @override
  final String? error;

  @override
  String toString() {
    return 'UserState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserErrorState &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserErrorStateCopyWith<_$UserErrorState> get copyWith =>
      __$$UserErrorStateCopyWithImpl<_$UserErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(UserModel? userModel) user,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(UserModel? userModel)? user,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(UserModel? userModel)? user,
    TResult Function(String? error)? error,
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
    required TResult Function(UserEmptyState value) empty,
    required TResult Function(UserLoadingState value) loading,
    required TResult Function(UserUserState value) user,
    required TResult Function(UserErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserEmptyState value)? empty,
    TResult? Function(UserLoadingState value)? loading,
    TResult? Function(UserUserState value)? user,
    TResult? Function(UserErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEmptyState value)? empty,
    TResult Function(UserLoadingState value)? loading,
    TResult Function(UserUserState value)? user,
    TResult Function(UserErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class UserErrorState implements UserState {
  const factory UserErrorState([final String? error]) = _$UserErrorState;

  String? get error;
  @JsonKey(ignore: true)
  _$$UserErrorStateCopyWith<_$UserErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
