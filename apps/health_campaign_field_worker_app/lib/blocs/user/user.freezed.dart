// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$UserSearchUserEventImplCopyWith<$Res> {
  factory _$$UserSearchUserEventImplCopyWith(_$UserSearchUserEventImpl value,
          $Res Function(_$UserSearchUserEventImpl) then) =
      __$$UserSearchUserEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid});
}

/// @nodoc
class __$$UserSearchUserEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserSearchUserEventImpl>
    implements _$$UserSearchUserEventImplCopyWith<$Res> {
  __$$UserSearchUserEventImplCopyWithImpl(_$UserSearchUserEventImpl _value,
      $Res Function(_$UserSearchUserEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
  }) {
    return _then(_$UserSearchUserEventImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserSearchUserEventImpl implements UserSearchUserEvent {
  const _$UserSearchUserEventImpl({required this.uuid});

  @override
  final String uuid;

  @override
  String toString() {
    return 'UserEvent.searchUser(uuid: $uuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSearchUserEventImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSearchUserEventImplCopyWith<_$UserSearchUserEventImpl> get copyWith =>
      __$$UserSearchUserEventImplCopyWithImpl<_$UserSearchUserEventImpl>(
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
      _$UserSearchUserEventImpl;

  String get uuid;
  @JsonKey(ignore: true)
  _$$UserSearchUserEventImplCopyWith<_$UserSearchUserEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserUpdateUserEventImplCopyWith<$Res> {
  factory _$$UserUpdateUserEventImplCopyWith(_$UserUpdateUserEventImpl value,
          $Res Function(_$UserUpdateUserEventImpl) then) =
      __$$UserUpdateUserEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user, UserModel oldUser});
}

/// @nodoc
class __$$UserUpdateUserEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserUpdateUserEventImpl>
    implements _$$UserUpdateUserEventImplCopyWith<$Res> {
  __$$UserUpdateUserEventImplCopyWithImpl(_$UserUpdateUserEventImpl _value,
      $Res Function(_$UserUpdateUserEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? oldUser = null,
  }) {
    return _then(_$UserUpdateUserEventImpl(
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

class _$UserUpdateUserEventImpl implements UserUpdateUserEvent {
  const _$UserUpdateUserEventImpl({required this.user, required this.oldUser});

  @override
  final UserModel user;
  @override
  final UserModel oldUser;

  @override
  String toString() {
    return 'UserEvent.updateUser(user: $user, oldUser: $oldUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserUpdateUserEventImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.oldUser, oldUser) || other.oldUser == oldUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, oldUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserUpdateUserEventImplCopyWith<_$UserUpdateUserEventImpl> get copyWith =>
      __$$UserUpdateUserEventImplCopyWithImpl<_$UserUpdateUserEventImpl>(
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
      required final UserModel oldUser}) = _$UserUpdateUserEventImpl;

  UserModel get user;
  UserModel get oldUser;
  @JsonKey(ignore: true)
  _$$UserUpdateUserEventImplCopyWith<_$UserUpdateUserEventImpl> get copyWith =>
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
abstract class _$$UserEmptyStateImplCopyWith<$Res> {
  factory _$$UserEmptyStateImplCopyWith(_$UserEmptyStateImpl value,
          $Res Function(_$UserEmptyStateImpl) then) =
      __$$UserEmptyStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserEmptyStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserEmptyStateImpl>
    implements _$$UserEmptyStateImplCopyWith<$Res> {
  __$$UserEmptyStateImplCopyWithImpl(
      _$UserEmptyStateImpl _value, $Res Function(_$UserEmptyStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserEmptyStateImpl implements UserEmptyState {
  const _$UserEmptyStateImpl();

  @override
  String toString() {
    return 'UserState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserEmptyStateImpl);
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
  const factory UserEmptyState() = _$UserEmptyStateImpl;
}

/// @nodoc
abstract class _$$UserLoadingStateImplCopyWith<$Res> {
  factory _$$UserLoadingStateImplCopyWith(_$UserLoadingStateImpl value,
          $Res Function(_$UserLoadingStateImpl) then) =
      __$$UserLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserLoadingStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserLoadingStateImpl>
    implements _$$UserLoadingStateImplCopyWith<$Res> {
  __$$UserLoadingStateImplCopyWithImpl(_$UserLoadingStateImpl _value,
      $Res Function(_$UserLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserLoadingStateImpl implements UserLoadingState {
  const _$UserLoadingStateImpl();

  @override
  String toString() {
    return 'UserState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserLoadingStateImpl);
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
  const factory UserLoadingState() = _$UserLoadingStateImpl;
}

/// @nodoc
abstract class _$$UserUserStateImplCopyWith<$Res> {
  factory _$$UserUserStateImplCopyWith(
          _$UserUserStateImpl value, $Res Function(_$UserUserStateImpl) then) =
      __$$UserUserStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel? userModel});
}

/// @nodoc
class __$$UserUserStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserUserStateImpl>
    implements _$$UserUserStateImplCopyWith<$Res> {
  __$$UserUserStateImplCopyWithImpl(
      _$UserUserStateImpl _value, $Res Function(_$UserUserStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userModel = freezed,
  }) {
    return _then(_$UserUserStateImpl(
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc

class _$UserUserStateImpl implements UserUserState {
  const _$UserUserStateImpl({this.userModel});

  @override
  final UserModel? userModel;

  @override
  String toString() {
    return 'UserState.user(userModel: $userModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserUserStateImpl &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserUserStateImplCopyWith<_$UserUserStateImpl> get copyWith =>
      __$$UserUserStateImplCopyWithImpl<_$UserUserStateImpl>(this, _$identity);

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
  const factory UserUserState({final UserModel? userModel}) =
      _$UserUserStateImpl;

  UserModel? get userModel;
  @JsonKey(ignore: true)
  _$$UserUserStateImplCopyWith<_$UserUserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserErrorStateImplCopyWith<$Res> {
  factory _$$UserErrorStateImplCopyWith(_$UserErrorStateImpl value,
          $Res Function(_$UserErrorStateImpl) then) =
      __$$UserErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$UserErrorStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserErrorStateImpl>
    implements _$$UserErrorStateImplCopyWith<$Res> {
  __$$UserErrorStateImplCopyWithImpl(
      _$UserErrorStateImpl _value, $Res Function(_$UserErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$UserErrorStateImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserErrorStateImpl implements UserErrorState {
  const _$UserErrorStateImpl([this.error]);

  @override
  final String? error;

  @override
  String toString() {
    return 'UserState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserErrorStateImplCopyWith<_$UserErrorStateImpl> get copyWith =>
      __$$UserErrorStateImplCopyWithImpl<_$UserErrorStateImpl>(
          this, _$identity);

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
  const factory UserErrorState([final String? error]) = _$UserErrorStateImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$UserErrorStateImplCopyWith<_$UserErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
