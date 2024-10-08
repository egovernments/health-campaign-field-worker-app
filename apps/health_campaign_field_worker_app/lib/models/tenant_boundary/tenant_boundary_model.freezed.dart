// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tenant_boundary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$TargetBoundaryWrapperModelImplCopyWith<$Res>
    implements $TargetBoundaryWrapperModelCopyWith<$Res> {
  factory _$$TargetBoundaryWrapperModelImplCopyWith(
          _$TargetBoundaryWrapperModelImpl value,
          $Res Function(_$TargetBoundaryWrapperModelImpl) then) =
      __$$TargetBoundaryWrapperModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String tenantId,
      String moduleName,
      @JsonKey(name: 'TenantBoundary') List<TenantBoundaryModel>? boundaries});
}

/// @nodoc
class __$$TargetBoundaryWrapperModelImplCopyWithImpl<$Res>
    extends _$TargetBoundaryWrapperModelCopyWithImpl<$Res,
        _$TargetBoundaryWrapperModelImpl>
    implements _$$TargetBoundaryWrapperModelImplCopyWith<$Res> {
  __$$TargetBoundaryWrapperModelImplCopyWithImpl(
      _$TargetBoundaryWrapperModelImpl _value,
      $Res Function(_$TargetBoundaryWrapperModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantId = null,
    Object? moduleName = null,
    Object? boundaries = freezed,
  }) {
    return _then(_$TargetBoundaryWrapperModelImpl(
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
class _$TargetBoundaryWrapperModelImpl implements _TargetBoundaryWrapperModel {
  const _$TargetBoundaryWrapperModelImpl(
      {required this.tenantId,
      required this.moduleName,
      @JsonKey(name: 'TenantBoundary')
      final List<TenantBoundaryModel>? boundaries})
      : _boundaries = boundaries;

  factory _$TargetBoundaryWrapperModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TargetBoundaryWrapperModelImplFromJson(json);

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
    if (_boundaries is EqualUnmodifiableListView) return _boundaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TargetBoundaryWrapperModel(tenantId: $tenantId, moduleName: $moduleName, boundaries: $boundaries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TargetBoundaryWrapperModelImpl &&
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
  _$$TargetBoundaryWrapperModelImplCopyWith<_$TargetBoundaryWrapperModelImpl>
      get copyWith => __$$TargetBoundaryWrapperModelImplCopyWithImpl<
          _$TargetBoundaryWrapperModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TargetBoundaryWrapperModelImplToJson(
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
      _$TargetBoundaryWrapperModelImpl;

  factory _TargetBoundaryWrapperModel.fromJson(Map<String, dynamic> json) =
      _$TargetBoundaryWrapperModelImpl.fromJson;

  @override
  String get tenantId;
  @override
  String get moduleName;
  @override
  @JsonKey(name: 'TenantBoundary')
  List<TenantBoundaryModel>? get boundaries;
  @override
  @JsonKey(ignore: true)
  _$$TargetBoundaryWrapperModelImplCopyWith<_$TargetBoundaryWrapperModelImpl>
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
abstract class _$$TenantBoundaryModelImplCopyWith<$Res>
    implements $TenantBoundaryModelCopyWith<$Res> {
  factory _$$TenantBoundaryModelImplCopyWith(_$TenantBoundaryModelImpl value,
          $Res Function(_$TenantBoundaryModelImpl) then) =
      __$$TenantBoundaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HierarchyTypeModel hierarchyType, BoundaryModel boundary});

  @override
  $HierarchyTypeModelCopyWith<$Res> get hierarchyType;
  @override
  $BoundaryModelCopyWith<$Res> get boundary;
}

/// @nodoc
class __$$TenantBoundaryModelImplCopyWithImpl<$Res>
    extends _$TenantBoundaryModelCopyWithImpl<$Res, _$TenantBoundaryModelImpl>
    implements _$$TenantBoundaryModelImplCopyWith<$Res> {
  __$$TenantBoundaryModelImplCopyWithImpl(_$TenantBoundaryModelImpl _value,
      $Res Function(_$TenantBoundaryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hierarchyType = null,
    Object? boundary = null,
  }) {
    return _then(_$TenantBoundaryModelImpl(
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
class _$TenantBoundaryModelImpl implements _TenantBoundaryModel {
  const _$TenantBoundaryModelImpl(
      {required this.hierarchyType, required this.boundary});

  factory _$TenantBoundaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TenantBoundaryModelImplFromJson(json);

  @override
  final HierarchyTypeModel hierarchyType;
  @override
  final BoundaryModel boundary;

  @override
  String toString() {
    return 'TenantBoundaryModel(hierarchyType: $hierarchyType, boundary: $boundary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TenantBoundaryModelImpl &&
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
  _$$TenantBoundaryModelImplCopyWith<_$TenantBoundaryModelImpl> get copyWith =>
      __$$TenantBoundaryModelImplCopyWithImpl<_$TenantBoundaryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TenantBoundaryModelImplToJson(
      this,
    );
  }
}

abstract class _TenantBoundaryModel implements TenantBoundaryModel {
  const factory _TenantBoundaryModel(
      {required final HierarchyTypeModel hierarchyType,
      required final BoundaryModel boundary}) = _$TenantBoundaryModelImpl;

  factory _TenantBoundaryModel.fromJson(Map<String, dynamic> json) =
      _$TenantBoundaryModelImpl.fromJson;

  @override
  HierarchyTypeModel get hierarchyType;
  @override
  BoundaryModel get boundary;
  @override
  @JsonKey(ignore: true)
  _$$TenantBoundaryModelImplCopyWith<_$TenantBoundaryModelImpl> get copyWith =>
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
abstract class _$$HierarchyTypeModelImplCopyWith<$Res>
    implements $HierarchyTypeModelCopyWith<$Res> {
  factory _$$HierarchyTypeModelImplCopyWith(_$HierarchyTypeModelImpl value,
          $Res Function(_$HierarchyTypeModelImpl) then) =
      __$$HierarchyTypeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$HierarchyTypeModelImplCopyWithImpl<$Res>
    extends _$HierarchyTypeModelCopyWithImpl<$Res, _$HierarchyTypeModelImpl>
    implements _$$HierarchyTypeModelImplCopyWith<$Res> {
  __$$HierarchyTypeModelImplCopyWithImpl(_$HierarchyTypeModelImpl _value,
      $Res Function(_$HierarchyTypeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$HierarchyTypeModelImpl(
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
class _$HierarchyTypeModelImpl implements _HierarchyTypeModel {
  const _$HierarchyTypeModelImpl({required this.name, required this.code});

  factory _$HierarchyTypeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HierarchyTypeModelImplFromJson(json);

  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'HierarchyTypeModel(name: $name, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HierarchyTypeModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HierarchyTypeModelImplCopyWith<_$HierarchyTypeModelImpl> get copyWith =>
      __$$HierarchyTypeModelImplCopyWithImpl<_$HierarchyTypeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HierarchyTypeModelImplToJson(
      this,
    );
  }
}

abstract class _HierarchyTypeModel implements HierarchyTypeModel {
  const factory _HierarchyTypeModel(
      {required final String name,
      required final String code}) = _$HierarchyTypeModelImpl;

  factory _HierarchyTypeModel.fromJson(Map<String, dynamic> json) =
      _$HierarchyTypeModelImpl.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$HierarchyTypeModelImplCopyWith<_$HierarchyTypeModelImpl> get copyWith =>
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
  String? get area => throw _privateConstructorUsedError;
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
      String? area,
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
    Object? area = freezed,
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
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
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
abstract class _$$BoundaryModelImplCopyWith<$Res>
    implements $BoundaryModelCopyWith<$Res> {
  factory _$$BoundaryModelImplCopyWith(
          _$BoundaryModelImpl value, $Res Function(_$BoundaryModelImpl) then) =
      __$$BoundaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      int boundaryNum,
      String name,
      @JsonKey(name: 'localname') String localName,
      String? longitude,
      String? latitude,
      String? area,
      String label,
      String code,
      @JsonKey(includeIfNull: false) List<BoundaryModel>? children});
}

/// @nodoc
class __$$BoundaryModelImplCopyWithImpl<$Res>
    extends _$BoundaryModelCopyWithImpl<$Res, _$BoundaryModelImpl>
    implements _$$BoundaryModelImplCopyWith<$Res> {
  __$$BoundaryModelImplCopyWithImpl(
      _$BoundaryModelImpl _value, $Res Function(_$BoundaryModelImpl) _then)
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
    Object? area = freezed,
    Object? label = null,
    Object? code = null,
    Object? children = freezed,
  }) {
    return _then(_$BoundaryModelImpl(
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
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
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
class _$BoundaryModelImpl implements _BoundaryModel {
  const _$BoundaryModelImpl(
      {this.id,
      required this.boundaryNum,
      required this.name,
      @JsonKey(name: 'localname') required this.localName,
      this.longitude,
      this.latitude,
      this.area,
      required this.label,
      required this.code,
      @JsonKey(includeIfNull: false) final List<BoundaryModel>? children})
      : _children = children;

  factory _$BoundaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoundaryModelImplFromJson(json);

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
  final String? area;
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
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BoundaryModel(id: $id, boundaryNum: $boundaryNum, name: $name, localName: $localName, longitude: $longitude, latitude: $latitude, area: $area, label: $label, code: $code, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoundaryModelImpl &&
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
            (identical(other.area, area) || other.area == area) &&
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
      area,
      label,
      code,
      const DeepCollectionEquality().hash(_children));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoundaryModelImplCopyWith<_$BoundaryModelImpl> get copyWith =>
      __$$BoundaryModelImplCopyWithImpl<_$BoundaryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoundaryModelImplToJson(
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
          final String? area,
          required final String label,
          required final String code,
          @JsonKey(includeIfNull: false) final List<BoundaryModel>? children}) =
      _$BoundaryModelImpl;

  factory _BoundaryModel.fromJson(Map<String, dynamic> json) =
      _$BoundaryModelImpl.fromJson;

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
  String? get area;
  @override
  String get label;
  @override
  String get code;
  @override
  @JsonKey(includeIfNull: false)
  List<BoundaryModel>? get children;
  @override
  @JsonKey(ignore: true)
  _$$BoundaryModelImplCopyWith<_$BoundaryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
