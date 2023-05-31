// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'role_actions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoleActionsWrapperModel _$RoleActionsWrapperModelFromJson(
    Map<String, dynamic> json) {
  return _RoleActionsWrapperModel.fromJson(json);
}

/// @nodoc
mixin _$RoleActionsWrapperModel {
  String get tenantId => throw _privateConstructorUsedError;
  String get moduleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'roleactions')
  List<RoleActionsModel> get roleActions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoleActionsWrapperModelCopyWith<RoleActionsWrapperModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleActionsWrapperModelCopyWith<$Res> {
  factory $RoleActionsWrapperModelCopyWith(RoleActionsWrapperModel value,
          $Res Function(RoleActionsWrapperModel) then) =
      _$RoleActionsWrapperModelCopyWithImpl<$Res, RoleActionsWrapperModel>;
  @useResult
  $Res call(
      {String tenantId,
      String moduleName,
      @JsonKey(name: 'roleactions') List<RoleActionsModel> roleActions});
}

/// @nodoc
class _$RoleActionsWrapperModelCopyWithImpl<$Res,
        $Val extends RoleActionsWrapperModel>
    implements $RoleActionsWrapperModelCopyWith<$Res> {
  _$RoleActionsWrapperModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantId = null,
    Object? moduleName = null,
    Object? roleActions = null,
  }) {
    return _then(_value.copyWith(
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      moduleName: null == moduleName
          ? _value.moduleName
          : moduleName // ignore: cast_nullable_to_non_nullable
              as String,
      roleActions: null == roleActions
          ? _value.roleActions
          : roleActions // ignore: cast_nullable_to_non_nullable
              as List<RoleActionsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RoleActionsWrapperModelCopyWith<$Res>
    implements $RoleActionsWrapperModelCopyWith<$Res> {
  factory _$$_RoleActionsWrapperModelCopyWith(_$_RoleActionsWrapperModel value,
          $Res Function(_$_RoleActionsWrapperModel) then) =
      __$$_RoleActionsWrapperModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String tenantId,
      String moduleName,
      @JsonKey(name: 'roleactions') List<RoleActionsModel> roleActions});
}

/// @nodoc
class __$$_RoleActionsWrapperModelCopyWithImpl<$Res>
    extends _$RoleActionsWrapperModelCopyWithImpl<$Res,
        _$_RoleActionsWrapperModel>
    implements _$$_RoleActionsWrapperModelCopyWith<$Res> {
  __$$_RoleActionsWrapperModelCopyWithImpl(_$_RoleActionsWrapperModel _value,
      $Res Function(_$_RoleActionsWrapperModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantId = null,
    Object? moduleName = null,
    Object? roleActions = null,
  }) {
    return _then(_$_RoleActionsWrapperModel(
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      moduleName: null == moduleName
          ? _value.moduleName
          : moduleName // ignore: cast_nullable_to_non_nullable
              as String,
      roleActions: null == roleActions
          ? _value._roleActions
          : roleActions // ignore: cast_nullable_to_non_nullable
              as List<RoleActionsModel>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_RoleActionsWrapperModel implements _RoleActionsWrapperModel {
  const _$_RoleActionsWrapperModel(
      {required this.tenantId,
      required this.moduleName,
      @JsonKey(name: 'roleactions')
          final List<RoleActionsModel> roleActions = const []})
      : _roleActions = roleActions;

  factory _$_RoleActionsWrapperModel.fromJson(Map<String, dynamic> json) =>
      _$$_RoleActionsWrapperModelFromJson(json);

  @override
  final String tenantId;
  @override
  final String moduleName;
  final List<RoleActionsModel> _roleActions;
  @override
  @JsonKey(name: 'roleactions')
  List<RoleActionsModel> get roleActions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roleActions);
  }

  @override
  String toString() {
    return 'RoleActionsWrapperModel(tenantId: $tenantId, moduleName: $moduleName, roleActions: $roleActions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoleActionsWrapperModel &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.moduleName, moduleName) ||
                other.moduleName == moduleName) &&
            const DeepCollectionEquality()
                .equals(other._roleActions, _roleActions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tenantId, moduleName,
      const DeepCollectionEquality().hash(_roleActions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoleActionsWrapperModelCopyWith<_$_RoleActionsWrapperModel>
      get copyWith =>
          __$$_RoleActionsWrapperModelCopyWithImpl<_$_RoleActionsWrapperModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoleActionsWrapperModelToJson(
      this,
    );
  }
}

abstract class _RoleActionsWrapperModel implements RoleActionsWrapperModel {
  const factory _RoleActionsWrapperModel(
          {required final String tenantId,
          required final String moduleName,
          @JsonKey(name: 'roleactions')
              final List<RoleActionsModel> roleActions}) =
      _$_RoleActionsWrapperModel;

  factory _RoleActionsWrapperModel.fromJson(Map<String, dynamic> json) =
      _$_RoleActionsWrapperModel.fromJson;

  @override
  String get tenantId;
  @override
  String get moduleName;
  @override
  @JsonKey(name: 'roleactions')
  List<RoleActionsModel> get roleActions;
  @override
  @JsonKey(ignore: true)
  _$$_RoleActionsWrapperModelCopyWith<_$_RoleActionsWrapperModel>
      get copyWith => throw _privateConstructorUsedError;
}

RoleActionsModel _$RoleActionsModelFromJson(Map<String, dynamic> json) {
  return _RoleActionsModel.fromJson(json);
}

/// @nodoc
mixin _$RoleActionsModel {
  @JsonKey(name: 'rolecode')
  RoleCode get roleCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'actioncode')
  String get actionCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'actionid')
  int get actionId => throw _privateConstructorUsedError;
  String get tenantId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoleActionsModelCopyWith<RoleActionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleActionsModelCopyWith<$Res> {
  factory $RoleActionsModelCopyWith(
          RoleActionsModel value, $Res Function(RoleActionsModel) then) =
      _$RoleActionsModelCopyWithImpl<$Res, RoleActionsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'rolecode') RoleCode roleCode,
      @JsonKey(name: 'actioncode') String actionCode,
      @JsonKey(name: 'actionid') int actionId,
      String tenantId});
}

/// @nodoc
class _$RoleActionsModelCopyWithImpl<$Res, $Val extends RoleActionsModel>
    implements $RoleActionsModelCopyWith<$Res> {
  _$RoleActionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleCode = null,
    Object? actionCode = null,
    Object? actionId = null,
    Object? tenantId = null,
  }) {
    return _then(_value.copyWith(
      roleCode: null == roleCode
          ? _value.roleCode
          : roleCode // ignore: cast_nullable_to_non_nullable
              as RoleCode,
      actionCode: null == actionCode
          ? _value.actionCode
          : actionCode // ignore: cast_nullable_to_non_nullable
              as String,
      actionId: null == actionId
          ? _value.actionId
          : actionId // ignore: cast_nullable_to_non_nullable
              as int,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RoleActionsModelCopyWith<$Res>
    implements $RoleActionsModelCopyWith<$Res> {
  factory _$$_RoleActionsModelCopyWith(
          _$_RoleActionsModel value, $Res Function(_$_RoleActionsModel) then) =
      __$$_RoleActionsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'rolecode') RoleCode roleCode,
      @JsonKey(name: 'actioncode') String actionCode,
      @JsonKey(name: 'actionid') int actionId,
      String tenantId});
}

/// @nodoc
class __$$_RoleActionsModelCopyWithImpl<$Res>
    extends _$RoleActionsModelCopyWithImpl<$Res, _$_RoleActionsModel>
    implements _$$_RoleActionsModelCopyWith<$Res> {
  __$$_RoleActionsModelCopyWithImpl(
      _$_RoleActionsModel _value, $Res Function(_$_RoleActionsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleCode = null,
    Object? actionCode = null,
    Object? actionId = null,
    Object? tenantId = null,
  }) {
    return _then(_$_RoleActionsModel(
      roleCode: null == roleCode
          ? _value.roleCode
          : roleCode // ignore: cast_nullable_to_non_nullable
              as RoleCode,
      actionCode: null == actionCode
          ? _value.actionCode
          : actionCode // ignore: cast_nullable_to_non_nullable
              as String,
      actionId: null == actionId
          ? _value.actionId
          : actionId // ignore: cast_nullable_to_non_nullable
              as int,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_RoleActionsModel implements _RoleActionsModel {
  const _$_RoleActionsModel(
      {@JsonKey(name: 'rolecode') required this.roleCode,
      @JsonKey(name: 'actioncode') required this.actionCode,
      @JsonKey(name: 'actionid') required this.actionId,
      required this.tenantId});

  factory _$_RoleActionsModel.fromJson(Map<String, dynamic> json) =>
      _$$_RoleActionsModelFromJson(json);

  @override
  @JsonKey(name: 'rolecode')
  final RoleCode roleCode;
  @override
  @JsonKey(name: 'actioncode')
  final String actionCode;
  @override
  @JsonKey(name: 'actionid')
  final int actionId;
  @override
  final String tenantId;

  @override
  String toString() {
    return 'RoleActionsModel(roleCode: $roleCode, actionCode: $actionCode, actionId: $actionId, tenantId: $tenantId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoleActionsModel &&
            (identical(other.roleCode, roleCode) ||
                other.roleCode == roleCode) &&
            (identical(other.actionCode, actionCode) ||
                other.actionCode == actionCode) &&
            (identical(other.actionId, actionId) ||
                other.actionId == actionId) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, roleCode, actionCode, actionId, tenantId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoleActionsModelCopyWith<_$_RoleActionsModel> get copyWith =>
      __$$_RoleActionsModelCopyWithImpl<_$_RoleActionsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoleActionsModelToJson(
      this,
    );
  }
}

abstract class _RoleActionsModel implements RoleActionsModel {
  const factory _RoleActionsModel(
      {@JsonKey(name: 'rolecode') required final RoleCode roleCode,
      @JsonKey(name: 'actioncode') required final String actionCode,
      @JsonKey(name: 'actionid') required final int actionId,
      required final String tenantId}) = _$_RoleActionsModel;

  factory _RoleActionsModel.fromJson(Map<String, dynamic> json) =
      _$_RoleActionsModel.fromJson;

  @override
  @JsonKey(name: 'rolecode')
  RoleCode get roleCode;
  @override
  @JsonKey(name: 'actioncode')
  String get actionCode;
  @override
  @JsonKey(name: 'actionid')
  int get actionId;
  @override
  String get tenantId;
  @override
  @JsonKey(ignore: true)
  _$$_RoleActionsModelCopyWith<_$_RoleActionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
