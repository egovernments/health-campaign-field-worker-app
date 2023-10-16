// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tenant_boundary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TargetBoundaryWrapperModel _$TargetBoundaryWrapperModelFromJson(
    Map<String, dynamic> json) {
  return _TargetBoundaryWrapperModel.fromJson(json);
}

/// @nodoc
mixin _$TargetBoundaryWrapperModel {
  String get tenantId => throw _privateConstructorUsedError;
  String get moduleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TenantBoundary')
  List<TenantBoundaryModel>? get boundaries =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TargetBoundaryWrapperModelCopyWith<TargetBoundaryWrapperModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TargetBoundaryWrapperModelCopyWith<$Res> {
  factory $TargetBoundaryWrapperModelCopyWith(TargetBoundaryWrapperModel value,
          $Res Function(TargetBoundaryWrapperModel) then) =
      _$TargetBoundaryWrapperModelCopyWithImpl<$Res,
          TargetBoundaryWrapperModel>;
  @useResult
  $Res call(
      {String tenantId,
      String moduleName,
      @JsonKey(name: 'TenantBoundary') List<TenantBoundaryModel>? boundaries});
}

/// @nodoc
class _$TargetBoundaryWrapperModelCopyWithImpl<$Res,
        $Val extends TargetBoundaryWrapperModel>
    implements $TargetBoundaryWrapperModelCopyWith<$Res> {
  _$TargetBoundaryWrapperModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantId = null,
    Object? moduleName = null,
    Object? boundaries = freezed,
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
      boundaries: freezed == boundaries
          ? _value.boundaries
          : boundaries // ignore: cast_nullable_to_non_nullable
              as List<TenantBoundaryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TargetBoundaryWrapperModelCopyWith<$Res>
    implements $TargetBoundaryWrapperModelCopyWith<$Res> {
  factory _$$_TargetBoundaryWrapperModelCopyWith(
          _$_TargetBoundaryWrapperModel value,
          $Res Function(_$_TargetBoundaryWrapperModel) then) =
      __$$_TargetBoundaryWrapperModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String tenantId,
      String moduleName,
      @JsonKey(name: 'TenantBoundary') List<TenantBoundaryModel>? boundaries});
}

/// @nodoc
class __$$_TargetBoundaryWrapperModelCopyWithImpl<$Res>
    extends _$TargetBoundaryWrapperModelCopyWithImpl<$Res,
        _$_TargetBoundaryWrapperModel>
    implements _$$_TargetBoundaryWrapperModelCopyWith<$Res> {
  __$$_TargetBoundaryWrapperModelCopyWithImpl(
      _$_TargetBoundaryWrapperModel _value,
      $Res Function(_$_TargetBoundaryWrapperModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantId = null,
    Object? moduleName = null,
    Object? boundaries = freezed,
  }) {
    return _then(_$_TargetBoundaryWrapperModel(
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      moduleName: null == moduleName
          ? _value.moduleName
          : moduleName // ignore: cast_nullable_to_non_nullable
              as String,
      boundaries: freezed == boundaries
          ? _value._boundaries
          : boundaries // ignore: cast_nullable_to_non_nullable
              as List<TenantBoundaryModel>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_TargetBoundaryWrapperModel implements _TargetBoundaryWrapperModel {
  const _$_TargetBoundaryWrapperModel(
      {required this.tenantId,
      required this.moduleName,
      @JsonKey(name: 'TenantBoundary')
          final List<TenantBoundaryModel>? boundaries})
      : _boundaries = boundaries;

  factory _$_TargetBoundaryWrapperModel.fromJson(Map<String, dynamic> json) =>
      _$$_TargetBoundaryWrapperModelFromJson(json);

  @override
  final String tenantId;
  @override
  final String moduleName;
  final List<TenantBoundaryModel>? _boundaries;
  @override
  @JsonKey(name: 'TenantBoundary')
  List<TenantBoundaryModel>? get boundaries {
    final value = _boundaries;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TargetBoundaryWrapperModel(tenantId: $tenantId, moduleName: $moduleName, boundaries: $boundaries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TargetBoundaryWrapperModel &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.moduleName, moduleName) ||
                other.moduleName == moduleName) &&
            const DeepCollectionEquality()
                .equals(other._boundaries, _boundaries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tenantId, moduleName,
      const DeepCollectionEquality().hash(_boundaries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TargetBoundaryWrapperModelCopyWith<_$_TargetBoundaryWrapperModel>
      get copyWith => __$$_TargetBoundaryWrapperModelCopyWithImpl<
          _$_TargetBoundaryWrapperModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TargetBoundaryWrapperModelToJson(
      this,
    );
  }
}

abstract class _TargetBoundaryWrapperModel
    implements TargetBoundaryWrapperModel {
  const factory _TargetBoundaryWrapperModel(
          {required final String tenantId,
          required final String moduleName,
          @JsonKey(name: 'TenantBoundary')
              final List<TenantBoundaryModel>? boundaries}) =
      _$_TargetBoundaryWrapperModel;

  factory _TargetBoundaryWrapperModel.fromJson(Map<String, dynamic> json) =
      _$_TargetBoundaryWrapperModel.fromJson;

  @override
  String get tenantId;
  @override
  String get moduleName;
  @override
  @JsonKey(name: 'TenantBoundary')
  List<TenantBoundaryModel>? get boundaries;
  @override
  @JsonKey(ignore: true)
  _$$_TargetBoundaryWrapperModelCopyWith<_$_TargetBoundaryWrapperModel>
      get copyWith => throw _privateConstructorUsedError;
}

TenantBoundaryModel _$TenantBoundaryModelFromJson(Map<String, dynamic> json) {
  return _TenantBoundaryModel.fromJson(json);
}

/// @nodoc
mixin _$TenantBoundaryModel {
  HierarchyTypeModel get hierarchyType => throw _privateConstructorUsedError;
  BoundaryModel get boundary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TenantBoundaryModelCopyWith<TenantBoundaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TenantBoundaryModelCopyWith<$Res> {
  factory $TenantBoundaryModelCopyWith(
          TenantBoundaryModel value, $Res Function(TenantBoundaryModel) then) =
      _$TenantBoundaryModelCopyWithImpl<$Res, TenantBoundaryModel>;
  @useResult
  $Res call({HierarchyTypeModel hierarchyType, BoundaryModel boundary});

  $HierarchyTypeModelCopyWith<$Res> get hierarchyType;
  $BoundaryModelCopyWith<$Res> get boundary;
}

/// @nodoc
class _$TenantBoundaryModelCopyWithImpl<$Res, $Val extends TenantBoundaryModel>
    implements $TenantBoundaryModelCopyWith<$Res> {
  _$TenantBoundaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hierarchyType = null,
    Object? boundary = null,
  }) {
    return _then(_value.copyWith(
      hierarchyType: null == hierarchyType
          ? _value.hierarchyType
          : hierarchyType // ignore: cast_nullable_to_non_nullable
              as HierarchyTypeModel,
      boundary: null == boundary
          ? _value.boundary
          : boundary // ignore: cast_nullable_to_non_nullable
              as BoundaryModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HierarchyTypeModelCopyWith<$Res> get hierarchyType {
    return $HierarchyTypeModelCopyWith<$Res>(_value.hierarchyType, (value) {
      return _then(_value.copyWith(hierarchyType: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BoundaryModelCopyWith<$Res> get boundary {
    return $BoundaryModelCopyWith<$Res>(_value.boundary, (value) {
      return _then(_value.copyWith(boundary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TenantBoundaryModelCopyWith<$Res>
    implements $TenantBoundaryModelCopyWith<$Res> {
  factory _$$_TenantBoundaryModelCopyWith(_$_TenantBoundaryModel value,
          $Res Function(_$_TenantBoundaryModel) then) =
      __$$_TenantBoundaryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HierarchyTypeModel hierarchyType, BoundaryModel boundary});

  @override
  $HierarchyTypeModelCopyWith<$Res> get hierarchyType;
  @override
  $BoundaryModelCopyWith<$Res> get boundary;
}

/// @nodoc
class __$$_TenantBoundaryModelCopyWithImpl<$Res>
    extends _$TenantBoundaryModelCopyWithImpl<$Res, _$_TenantBoundaryModel>
    implements _$$_TenantBoundaryModelCopyWith<$Res> {
  __$$_TenantBoundaryModelCopyWithImpl(_$_TenantBoundaryModel _value,
      $Res Function(_$_TenantBoundaryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hierarchyType = null,
    Object? boundary = null,
  }) {
    return _then(_$_TenantBoundaryModel(
      hierarchyType: null == hierarchyType
          ? _value.hierarchyType
          : hierarchyType // ignore: cast_nullable_to_non_nullable
              as HierarchyTypeModel,
      boundary: null == boundary
          ? _value.boundary
          : boundary // ignore: cast_nullable_to_non_nullable
              as BoundaryModel,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_TenantBoundaryModel implements _TenantBoundaryModel {
  const _$_TenantBoundaryModel(
      {required this.hierarchyType, required this.boundary});

  factory _$_TenantBoundaryModel.fromJson(Map<String, dynamic> json) =>
      _$$_TenantBoundaryModelFromJson(json);

  @override
  final HierarchyTypeModel hierarchyType;
  @override
  final BoundaryModel boundary;

  @override
  String toString() {
    return 'TenantBoundaryModel(hierarchyType: $hierarchyType, boundary: $boundary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TenantBoundaryModel &&
            (identical(other.hierarchyType, hierarchyType) ||
                other.hierarchyType == hierarchyType) &&
            (identical(other.boundary, boundary) ||
                other.boundary == boundary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hierarchyType, boundary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TenantBoundaryModelCopyWith<_$_TenantBoundaryModel> get copyWith =>
      __$$_TenantBoundaryModelCopyWithImpl<_$_TenantBoundaryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TenantBoundaryModelToJson(
      this,
    );
  }
}

abstract class _TenantBoundaryModel implements TenantBoundaryModel {
  const factory _TenantBoundaryModel(
      {required final HierarchyTypeModel hierarchyType,
      required final BoundaryModel boundary}) = _$_TenantBoundaryModel;

  factory _TenantBoundaryModel.fromJson(Map<String, dynamic> json) =
      _$_TenantBoundaryModel.fromJson;

  @override
  HierarchyTypeModel get hierarchyType;
  @override
  BoundaryModel get boundary;
  @override
  @JsonKey(ignore: true)
  _$$_TenantBoundaryModelCopyWith<_$_TenantBoundaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

HierarchyTypeModel _$HierarchyTypeModelFromJson(Map<String, dynamic> json) {
  return _HierarchyTypeModel.fromJson(json);
}

/// @nodoc
mixin _$HierarchyTypeModel {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HierarchyTypeModelCopyWith<HierarchyTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HierarchyTypeModelCopyWith<$Res> {
  factory $HierarchyTypeModelCopyWith(
          HierarchyTypeModel value, $Res Function(HierarchyTypeModel) then) =
      _$HierarchyTypeModelCopyWithImpl<$Res, HierarchyTypeModel>;
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class _$HierarchyTypeModelCopyWithImpl<$Res, $Val extends HierarchyTypeModel>
    implements $HierarchyTypeModelCopyWith<$Res> {
  _$HierarchyTypeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HierarchyTypeModelCopyWith<$Res>
    implements $HierarchyTypeModelCopyWith<$Res> {
  factory _$$_HierarchyTypeModelCopyWith(_$_HierarchyTypeModel value,
          $Res Function(_$_HierarchyTypeModel) then) =
      __$$_HierarchyTypeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$_HierarchyTypeModelCopyWithImpl<$Res>
    extends _$HierarchyTypeModelCopyWithImpl<$Res, _$_HierarchyTypeModel>
    implements _$$_HierarchyTypeModelCopyWith<$Res> {
  __$$_HierarchyTypeModelCopyWithImpl(
      _$_HierarchyTypeModel _value, $Res Function(_$_HierarchyTypeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$_HierarchyTypeModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_HierarchyTypeModel implements _HierarchyTypeModel {
  const _$_HierarchyTypeModel({required this.name, required this.code});

  factory _$_HierarchyTypeModel.fromJson(Map<String, dynamic> json) =>
      _$$_HierarchyTypeModelFromJson(json);

  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'HierarchyTypeModel(name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HierarchyTypeModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HierarchyTypeModelCopyWith<_$_HierarchyTypeModel> get copyWith =>
      __$$_HierarchyTypeModelCopyWithImpl<_$_HierarchyTypeModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HierarchyTypeModelToJson(
      this,
    );
  }
}

abstract class _HierarchyTypeModel implements HierarchyTypeModel {
  const factory _HierarchyTypeModel(
      {required final String name,
      required final String code}) = _$_HierarchyTypeModel;

  factory _HierarchyTypeModel.fromJson(Map<String, dynamic> json) =
      _$_HierarchyTypeModel.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$_HierarchyTypeModelCopyWith<_$_HierarchyTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

BoundaryModel _$BoundaryModelFromJson(Map<String, dynamic> json) {
  return _BoundaryModel.fromJson(json);
}

/// @nodoc
mixin _$BoundaryModel {
  String? get id => throw _privateConstructorUsedError;
  int get boundaryNum => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'localname')
  String get localName => throw _privateConstructorUsedError;
  String? get longitude => throw _privateConstructorUsedError;
  String? get latitude => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  List<BoundaryModel>? get children => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoundaryModelCopyWith<BoundaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoundaryModelCopyWith<$Res> {
  factory $BoundaryModelCopyWith(
          BoundaryModel value, $Res Function(BoundaryModel) then) =
      _$BoundaryModelCopyWithImpl<$Res, BoundaryModel>;
  @useResult
  $Res call(
      {String? id,
      int boundaryNum,
      String name,
      @JsonKey(name: 'localname') String localName,
      String? longitude,
      String? latitude,
      String label,
      String code,
      @JsonKey(includeIfNull: false) List<BoundaryModel>? children});
}

/// @nodoc
class _$BoundaryModelCopyWithImpl<$Res, $Val extends BoundaryModel>
    implements $BoundaryModelCopyWith<$Res> {
  _$BoundaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? boundaryNum = null,
    Object? name = null,
    Object? localName = null,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? label = null,
    Object? code = null,
    Object? children = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      boundaryNum: null == boundaryNum
          ? _value.boundaryNum
          : boundaryNum // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      localName: null == localName
          ? _value.localName
          : localName // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<BoundaryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BoundaryModelCopyWith<$Res>
    implements $BoundaryModelCopyWith<$Res> {
  factory _$$_BoundaryModelCopyWith(
          _$_BoundaryModel value, $Res Function(_$_BoundaryModel) then) =
      __$$_BoundaryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      int boundaryNum,
      String name,
      @JsonKey(name: 'localname') String localName,
      String? longitude,
      String? latitude,
      String label,
      String code,
      @JsonKey(includeIfNull: false) List<BoundaryModel>? children});
}

/// @nodoc
class __$$_BoundaryModelCopyWithImpl<$Res>
    extends _$BoundaryModelCopyWithImpl<$Res, _$_BoundaryModel>
    implements _$$_BoundaryModelCopyWith<$Res> {
  __$$_BoundaryModelCopyWithImpl(
      _$_BoundaryModel _value, $Res Function(_$_BoundaryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? boundaryNum = null,
    Object? name = null,
    Object? localName = null,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? label = null,
    Object? code = null,
    Object? children = freezed,
  }) {
    return _then(_$_BoundaryModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      boundaryNum: null == boundaryNum
          ? _value.boundaryNum
          : boundaryNum // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      localName: null == localName
          ? _value.localName
          : localName // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<BoundaryModel>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_BoundaryModel implements _BoundaryModel {
  const _$_BoundaryModel(
      {this.id,
      required this.boundaryNum,
      required this.name,
      @JsonKey(name: 'localname') required this.localName,
      this.longitude,
      this.latitude,
      required this.label,
      required this.code,
      @JsonKey(includeIfNull: false) final List<BoundaryModel>? children})
      : _children = children;

  factory _$_BoundaryModel.fromJson(Map<String, dynamic> json) =>
      _$$_BoundaryModelFromJson(json);

  @override
  final String? id;
  @override
  final int boundaryNum;
  @override
  final String name;
  @override
  @JsonKey(name: 'localname')
  final String localName;
  @override
  final String? longitude;
  @override
  final String? latitude;
  @override
  final String label;
  @override
  final String code;
  final List<BoundaryModel>? _children;
  @override
  @JsonKey(includeIfNull: false)
  List<BoundaryModel>? get children {
    final value = _children;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BoundaryModel(id: $id, boundaryNum: $boundaryNum, name: $name, localName: $localName, longitude: $longitude, latitude: $latitude, label: $label, code: $code, children: $children)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BoundaryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.boundaryNum, boundaryNum) ||
                other.boundaryNum == boundaryNum) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.localName, localName) ||
                other.localName == localName) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      boundaryNum,
      name,
      localName,
      longitude,
      latitude,
      label,
      code,
      const DeepCollectionEquality().hash(_children));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BoundaryModelCopyWith<_$_BoundaryModel> get copyWith =>
      __$$_BoundaryModelCopyWithImpl<_$_BoundaryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BoundaryModelToJson(
      this,
    );
  }
}

abstract class _BoundaryModel implements BoundaryModel {
  const factory _BoundaryModel(
          {final String? id,
          required final int boundaryNum,
          required final String name,
          @JsonKey(name: 'localname') required final String localName,
          final String? longitude,
          final String? latitude,
          required final String label,
          required final String code,
          @JsonKey(includeIfNull: false) final List<BoundaryModel>? children}) =
      _$_BoundaryModel;

  factory _BoundaryModel.fromJson(Map<String, dynamic> json) =
      _$_BoundaryModel.fromJson;

  @override
  String? get id;
  @override
  int get boundaryNum;
  @override
  String get name;
  @override
  @JsonKey(name: 'localname')
  String get localName;
  @override
  String? get longitude;
  @override
  String? get latitude;
  @override
  String get label;
  @override
  String get code;
  @override
  @JsonKey(includeIfNull: false)
  List<BoundaryModel>? get children;
  @override
  @JsonKey(ignore: true)
  _$$_BoundaryModelCopyWith<_$_BoundaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
