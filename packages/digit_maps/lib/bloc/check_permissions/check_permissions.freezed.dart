// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_permissions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PermissionState {
  bool get hasPermissions => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PermissionStateCopyWith<PermissionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionStateCopyWith<$Res> {
  factory $PermissionStateCopyWith(
          PermissionState value, $Res Function(PermissionState) then) =
      _$PermissionStateCopyWithImpl<$Res, PermissionState>;
  @useResult
  $Res call({bool hasPermissions, String? error});
}

/// @nodoc
class _$PermissionStateCopyWithImpl<$Res, $Val extends PermissionState>
    implements $PermissionStateCopyWith<$Res> {
  _$PermissionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasPermissions = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      hasPermissions: null == hasPermissions
          ? _value.hasPermissions
          : hasPermissions // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PermissionStateImplCopyWith<$Res>
    implements $PermissionStateCopyWith<$Res> {
  factory _$$PermissionStateImplCopyWith(_$PermissionStateImpl value,
          $Res Function(_$PermissionStateImpl) then) =
      __$$PermissionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hasPermissions, String? error});
}

/// @nodoc
class __$$PermissionStateImplCopyWithImpl<$Res>
    extends _$PermissionStateCopyWithImpl<$Res, _$PermissionStateImpl>
    implements _$$PermissionStateImplCopyWith<$Res> {
  __$$PermissionStateImplCopyWithImpl(
      _$PermissionStateImpl _value, $Res Function(_$PermissionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasPermissions = null,
    Object? error = freezed,
  }) {
    return _then(_$PermissionStateImpl(
      hasPermissions: null == hasPermissions
          ? _value.hasPermissions
          : hasPermissions // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PermissionStateImpl implements _PermissionState {
  const _$PermissionStateImpl({this.hasPermissions = false, this.error});

  @override
  @JsonKey()
  final bool hasPermissions;
  @override
  final String? error;

  @override
  String toString() {
    return 'PermissionState(hasPermissions: $hasPermissions, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionStateImpl &&
            (identical(other.hasPermissions, hasPermissions) ||
                other.hasPermissions == hasPermissions) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hasPermissions, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionStateImplCopyWith<_$PermissionStateImpl> get copyWith =>
      __$$PermissionStateImplCopyWithImpl<_$PermissionStateImpl>(
          this, _$identity);
}

abstract class _PermissionState implements PermissionState {
  const factory _PermissionState(
      {final bool hasPermissions, final String? error}) = _$PermissionStateImpl;

  @override
  bool get hasPermissions;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$PermissionStateImplCopyWith<_$PermissionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
