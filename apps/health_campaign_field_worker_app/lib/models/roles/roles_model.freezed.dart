// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'roles_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RolesWrapperModel _$RolesWrapperModelFromJson(Map<String, dynamic> json) {
  return _RolesWrapperModel.fromJson(json);
}

/// @nodoc
mixin _$RolesWrapperModel {
  String get tenantId => throw _privateConstructorUsedError;
  String get moduleName => throw _privateConstructorUsedError;
  List<RolesModel> get roles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RolesWrapperModelCopyWith<RolesWrapperModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RolesWrapperModelCopyWith<$Res> {
  factory $RolesWrapperModelCopyWith(
          RolesWrapperModel value, $Res Function(RolesWrapperModel) then) =
      _$RolesWrapperModelCopyWithImpl<$Res, RolesWrapperModel>;
  @useResult
  $Res call({String tenantId, String moduleName, List<RolesModel> roles});
}

/// @nodoc
class _$RolesWrapperModelCopyWithImpl<$Res, $Val extends RolesWrapperModel>
    implements $RolesWrapperModelCopyWith<$Res> {
  _$RolesWrapperModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantId = null,
    Object? moduleName = null,
    Object? roles = null,
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
      roles: null == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<RolesModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RolesWrapperModelCopyWith<$Res>
    implements $RolesWrapperModelCopyWith<$Res> {
  factory _$$_RolesWrapperModelCopyWith(_$_RolesWrapperModel value,
          $Res Function(_$_RolesWrapperModel) then) =
      __$$_RolesWrapperModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String tenantId, String moduleName, List<RolesModel> roles});
}

/// @nodoc
class __$$_RolesWrapperModelCopyWithImpl<$Res>
    extends _$RolesWrapperModelCopyWithImpl<$Res, _$_RolesWrapperModel>
    implements _$$_RolesWrapperModelCopyWith<$Res> {
  __$$_RolesWrapperModelCopyWithImpl(
      _$_RolesWrapperModel _value, $Res Function(_$_RolesWrapperModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantId = null,
    Object? moduleName = null,
    Object? roles = null,
  }) {
    return _then(_$_RolesWrapperModel(
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      moduleName: null == moduleName
          ? _value.moduleName
          : moduleName // ignore: cast_nullable_to_non_nullable
              as String,
      roles: null == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<RolesModel>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_RolesWrapperModel implements _RolesWrapperModel {
  const _$_RolesWrapperModel(
      {required this.tenantId,
      required this.moduleName,
      final List<RolesModel> roles = const []})
      : _roles = roles;

  factory _$_RolesWrapperModel.fromJson(Map<String, dynamic> json) =>
      _$$_RolesWrapperModelFromJson(json);

  @override
  final String tenantId;
  @override
  final String moduleName;
  final List<RolesModel> _roles;
  @override
  @JsonKey()
  List<RolesModel> get roles {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  String toString() {
    return 'RolesWrapperModel(tenantId: $tenantId, moduleName: $moduleName, roles: $roles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RolesWrapperModel &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.moduleName, moduleName) ||
                other.moduleName == moduleName) &&
            const DeepCollectionEquality().equals(other._roles, _roles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tenantId, moduleName,
      const DeepCollectionEquality().hash(_roles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RolesWrapperModelCopyWith<_$_RolesWrapperModel> get copyWith =>
      __$$_RolesWrapperModelCopyWithImpl<_$_RolesWrapperModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RolesWrapperModelToJson(
      this,
    );
  }
}

abstract class _RolesWrapperModel implements RolesWrapperModel {
  const factory _RolesWrapperModel(
      {required final String tenantId,
      required final String moduleName,
      final List<RolesModel> roles}) = _$_RolesWrapperModel;

  factory _RolesWrapperModel.fromJson(Map<String, dynamic> json) =
      _$_RolesWrapperModel.fromJson;

  @override
  String get tenantId;
  @override
  String get moduleName;
  @override
  List<RolesModel> get roles;
  @override
  @JsonKey(ignore: true)
  _$$_RolesWrapperModelCopyWith<_$_RolesWrapperModel> get copyWith =>
      throw _privateConstructorUsedError;
}

RolesModel _$RolesModelFromJson(Map<String, dynamic> json) {
  return _RolesModel.fromJson(json);
}

/// @nodoc
mixin _$RolesModel {
  Code get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RolesModelCopyWith<RolesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RolesModelCopyWith<$Res> {
  factory $RolesModelCopyWith(
          RolesModel value, $Res Function(RolesModel) then) =
      _$RolesModelCopyWithImpl<$Res, RolesModel>;
  @useResult
  $Res call({Code code, String name, String? description});
}

/// @nodoc
class _$RolesModelCopyWithImpl<$Res, $Val extends RolesModel>
    implements $RolesModelCopyWith<$Res> {
  _$RolesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as Code,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RolesModelCopyWith<$Res>
    implements $RolesModelCopyWith<$Res> {
  factory _$$_RolesModelCopyWith(
          _$_RolesModel value, $Res Function(_$_RolesModel) then) =
      __$$_RolesModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Code code, String name, String? description});
}

/// @nodoc
class __$$_RolesModelCopyWithImpl<$Res>
    extends _$RolesModelCopyWithImpl<$Res, _$_RolesModel>
    implements _$$_RolesModelCopyWith<$Res> {
  __$$_RolesModelCopyWithImpl(
      _$_RolesModel _value, $Res Function(_$_RolesModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_$_RolesModel(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as Code,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_RolesModel implements _RolesModel {
  const _$_RolesModel(
      {required this.code, required this.name, this.description});

  factory _$_RolesModel.fromJson(Map<String, dynamic> json) =>
      _$$_RolesModelFromJson(json);

  @override
  final Code code;
  @override
  final String name;
  @override
  final String? description;

  @override
  String toString() {
    return 'RolesModel(code: $code, name: $name, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RolesModel &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RolesModelCopyWith<_$_RolesModel> get copyWith =>
      __$$_RolesModelCopyWithImpl<_$_RolesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RolesModelToJson(
      this,
    );
  }
}

abstract class _RolesModel implements RolesModel {
  const factory _RolesModel(
      {required final Code code,
      required final String name,
      final String? description}) = _$_RolesModel;

  factory _RolesModel.fromJson(Map<String, dynamic> json) =
      _$_RolesModel.fromJson;

  @override
  Code get code;
  @override
  String get name;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_RolesModelCopyWith<_$_RolesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
