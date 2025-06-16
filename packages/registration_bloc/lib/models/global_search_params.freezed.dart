// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_search_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GlobalSearchParameters _$GlobalSearchParametersFromJson(
    Map<String, dynamic> json) {
  return _GlobalSearchParameters.fromJson(json);
}

/// @nodoc
mixin _$GlobalSearchParameters {
  List<SearchFilter> get filters => throw _privateConstructorUsedError;
  List<String> get select => throw _privateConstructorUsedError;
  PaginationParams? get pagination => throw _privateConstructorUsedError;
  List<RelationshipMapping> get relationshipMappings =>
      throw _privateConstructorUsedError;
  List<NestedModelMapping> get nestedMappings =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GlobalSearchParametersCopyWith<GlobalSearchParameters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalSearchParametersCopyWith<$Res> {
  factory $GlobalSearchParametersCopyWith(GlobalSearchParameters value,
          $Res Function(GlobalSearchParameters) then) =
      _$GlobalSearchParametersCopyWithImpl<$Res, GlobalSearchParameters>;
  @useResult
  $Res call(
      {List<SearchFilter> filters,
      List<String> select,
      PaginationParams? pagination,
      List<RelationshipMapping> relationshipMappings,
      List<NestedModelMapping> nestedMappings});

  $PaginationParamsCopyWith<$Res>? get pagination;
}

/// @nodoc
class _$GlobalSearchParametersCopyWithImpl<$Res,
        $Val extends GlobalSearchParameters>
    implements $GlobalSearchParametersCopyWith<$Res> {
  _$GlobalSearchParametersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filters = null,
    Object? select = null,
    Object? pagination = freezed,
    Object? relationshipMappings = null,
    Object? nestedMappings = null,
  }) {
    return _then(_value.copyWith(
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<SearchFilter>,
      select: null == select
          ? _value.select
          : select // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationParams?,
      relationshipMappings: null == relationshipMappings
          ? _value.relationshipMappings
          : relationshipMappings // ignore: cast_nullable_to_non_nullable
              as List<RelationshipMapping>,
      nestedMappings: null == nestedMappings
          ? _value.nestedMappings
          : nestedMappings // ignore: cast_nullable_to_non_nullable
              as List<NestedModelMapping>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationParamsCopyWith<$Res>? get pagination {
    if (_value.pagination == null) {
      return null;
    }

    return $PaginationParamsCopyWith<$Res>(_value.pagination!, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GlobalSearchParametersImplCopyWith<$Res>
    implements $GlobalSearchParametersCopyWith<$Res> {
  factory _$$GlobalSearchParametersImplCopyWith(
          _$GlobalSearchParametersImpl value,
          $Res Function(_$GlobalSearchParametersImpl) then) =
      __$$GlobalSearchParametersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SearchFilter> filters,
      List<String> select,
      PaginationParams? pagination,
      List<RelationshipMapping> relationshipMappings,
      List<NestedModelMapping> nestedMappings});

  @override
  $PaginationParamsCopyWith<$Res>? get pagination;
}

/// @nodoc
class __$$GlobalSearchParametersImplCopyWithImpl<$Res>
    extends _$GlobalSearchParametersCopyWithImpl<$Res,
        _$GlobalSearchParametersImpl>
    implements _$$GlobalSearchParametersImplCopyWith<$Res> {
  __$$GlobalSearchParametersImplCopyWithImpl(
      _$GlobalSearchParametersImpl _value,
      $Res Function(_$GlobalSearchParametersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filters = null,
    Object? select = null,
    Object? pagination = freezed,
    Object? relationshipMappings = null,
    Object? nestedMappings = null,
  }) {
    return _then(_$GlobalSearchParametersImpl(
      filters: null == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<SearchFilter>,
      select: null == select
          ? _value._select
          : select // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationParams?,
      relationshipMappings: null == relationshipMappings
          ? _value._relationshipMappings
          : relationshipMappings // ignore: cast_nullable_to_non_nullable
              as List<RelationshipMapping>,
      nestedMappings: null == nestedMappings
          ? _value._nestedMappings
          : nestedMappings // ignore: cast_nullable_to_non_nullable
              as List<NestedModelMapping>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GlobalSearchParametersImpl implements _GlobalSearchParameters {
  const _$GlobalSearchParametersImpl(
      {required final List<SearchFilter> filters,
      required final List<String> select,
      this.pagination,
      final List<RelationshipMapping> relationshipMappings = const [],
      final List<NestedModelMapping> nestedMappings = const []})
      : _filters = filters,
        _select = select,
        _relationshipMappings = relationshipMappings,
        _nestedMappings = nestedMappings;

  factory _$GlobalSearchParametersImpl.fromJson(Map<String, dynamic> json) =>
      _$$GlobalSearchParametersImplFromJson(json);

  final List<SearchFilter> _filters;
  @override
  List<SearchFilter> get filters {
    if (_filters is EqualUnmodifiableListView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filters);
  }

  final List<String> _select;
  @override
  List<String> get select {
    if (_select is EqualUnmodifiableListView) return _select;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_select);
  }

  @override
  final PaginationParams? pagination;
  final List<RelationshipMapping> _relationshipMappings;
  @override
  @JsonKey()
  List<RelationshipMapping> get relationshipMappings {
    if (_relationshipMappings is EqualUnmodifiableListView)
      return _relationshipMappings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relationshipMappings);
  }

  final List<NestedModelMapping> _nestedMappings;
  @override
  @JsonKey()
  List<NestedModelMapping> get nestedMappings {
    if (_nestedMappings is EqualUnmodifiableListView) return _nestedMappings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nestedMappings);
  }

  @override
  String toString() {
    return 'GlobalSearchParameters(filters: $filters, select: $select, pagination: $pagination, relationshipMappings: $relationshipMappings, nestedMappings: $nestedMappings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalSearchParametersImpl &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            const DeepCollectionEquality().equals(other._select, _select) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            const DeepCollectionEquality()
                .equals(other._relationshipMappings, _relationshipMappings) &&
            const DeepCollectionEquality()
                .equals(other._nestedMappings, _nestedMappings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_filters),
      const DeepCollectionEquality().hash(_select),
      pagination,
      const DeepCollectionEquality().hash(_relationshipMappings),
      const DeepCollectionEquality().hash(_nestedMappings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalSearchParametersImplCopyWith<_$GlobalSearchParametersImpl>
      get copyWith => __$$GlobalSearchParametersImplCopyWithImpl<
          _$GlobalSearchParametersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GlobalSearchParametersImplToJson(
      this,
    );
  }
}

abstract class _GlobalSearchParameters implements GlobalSearchParameters {
  const factory _GlobalSearchParameters(
          {required final List<SearchFilter> filters,
          required final List<String> select,
          final PaginationParams? pagination,
          final List<RelationshipMapping> relationshipMappings,
          final List<NestedModelMapping> nestedMappings}) =
      _$GlobalSearchParametersImpl;

  factory _GlobalSearchParameters.fromJson(Map<String, dynamic> json) =
      _$GlobalSearchParametersImpl.fromJson;

  @override
  List<SearchFilter> get filters;
  @override
  List<String> get select;
  @override
  PaginationParams? get pagination;
  @override
  List<RelationshipMapping> get relationshipMappings;
  @override
  List<NestedModelMapping> get nestedMappings;
  @override
  @JsonKey(ignore: true)
  _$$GlobalSearchParametersImplCopyWith<_$GlobalSearchParametersImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SearchFilter _$SearchFilterFromJson(Map<String, dynamic> json) {
  return _SearchFilter.fromJson(json);
}

/// @nodoc
mixin _$SearchFilter {
  String get field => throw _privateConstructorUsedError;
  String get operator => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;
  String get root => throw _privateConstructorUsedError;
  Map<String, dynamic>? get coordinates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchFilterCopyWith<SearchFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchFilterCopyWith<$Res> {
  factory $SearchFilterCopyWith(
          SearchFilter value, $Res Function(SearchFilter) then) =
      _$SearchFilterCopyWithImpl<$Res, SearchFilter>;
  @useResult
  $Res call(
      {String field,
      String operator,
      dynamic value,
      String root,
      Map<String, dynamic>? coordinates});
}

/// @nodoc
class _$SearchFilterCopyWithImpl<$Res, $Val extends SearchFilter>
    implements $SearchFilterCopyWith<$Res> {
  _$SearchFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? operator = null,
    Object? value = freezed,
    Object? root = null,
    Object? coordinates = freezed,
  }) {
    return _then(_value.copyWith(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      root: null == root
          ? _value.root
          : root // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchFilterImplCopyWith<$Res>
    implements $SearchFilterCopyWith<$Res> {
  factory _$$SearchFilterImplCopyWith(
          _$SearchFilterImpl value, $Res Function(_$SearchFilterImpl) then) =
      __$$SearchFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String field,
      String operator,
      dynamic value,
      String root,
      Map<String, dynamic>? coordinates});
}

/// @nodoc
class __$$SearchFilterImplCopyWithImpl<$Res>
    extends _$SearchFilterCopyWithImpl<$Res, _$SearchFilterImpl>
    implements _$$SearchFilterImplCopyWith<$Res> {
  __$$SearchFilterImplCopyWithImpl(
      _$SearchFilterImpl _value, $Res Function(_$SearchFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? operator = null,
    Object? value = freezed,
    Object? root = null,
    Object? coordinates = freezed,
  }) {
    return _then(_$SearchFilterImpl(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      root: null == root
          ? _value.root
          : root // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: freezed == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchFilterImpl implements _SearchFilter {
  const _$SearchFilterImpl(
      {required this.field,
      required this.operator,
      required this.value,
      required this.root,
      final Map<String, dynamic>? coordinates})
      : _coordinates = coordinates;

  factory _$SearchFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchFilterImplFromJson(json);

  @override
  final String field;
  @override
  final String operator;
  @override
  final dynamic value;
  @override
  final String root;
  final Map<String, dynamic>? _coordinates;
  @override
  Map<String, dynamic>? get coordinates {
    final value = _coordinates;
    if (value == null) return null;
    if (_coordinates is EqualUnmodifiableMapView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'SearchFilter(field: $field, operator: $operator, value: $value, root: $root, coordinates: $coordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchFilterImpl &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.operator, operator) ||
                other.operator == operator) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.root, root) || other.root == root) &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      field,
      operator,
      const DeepCollectionEquality().hash(value),
      root,
      const DeepCollectionEquality().hash(_coordinates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchFilterImplCopyWith<_$SearchFilterImpl> get copyWith =>
      __$$SearchFilterImplCopyWithImpl<_$SearchFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchFilterImplToJson(
      this,
    );
  }
}

abstract class _SearchFilter implements SearchFilter {
  const factory _SearchFilter(
      {required final String field,
      required final String operator,
      required final dynamic value,
      required final String root,
      final Map<String, dynamic>? coordinates}) = _$SearchFilterImpl;

  factory _SearchFilter.fromJson(Map<String, dynamic> json) =
      _$SearchFilterImpl.fromJson;

  @override
  String get field;
  @override
  String get operator;
  @override
  dynamic get value;
  @override
  String get root;
  @override
  Map<String, dynamic>? get coordinates;
  @override
  @JsonKey(ignore: true)
  _$$SearchFilterImplCopyWith<_$SearchFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationParams _$PaginationParamsFromJson(Map<String, dynamic> json) {
  return _PaginationParams.fromJson(json);
}

/// @nodoc
mixin _$PaginationParams {
  int get limit => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationParamsCopyWith<PaginationParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationParamsCopyWith<$Res> {
  factory $PaginationParamsCopyWith(
          PaginationParams value, $Res Function(PaginationParams) then) =
      _$PaginationParamsCopyWithImpl<$Res, PaginationParams>;
  @useResult
  $Res call({int limit, int offset});
}

/// @nodoc
class _$PaginationParamsCopyWithImpl<$Res, $Val extends PaginationParams>
    implements $PaginationParamsCopyWith<$Res> {
  _$PaginationParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? offset = null,
  }) {
    return _then(_value.copyWith(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationParamsImplCopyWith<$Res>
    implements $PaginationParamsCopyWith<$Res> {
  factory _$$PaginationParamsImplCopyWith(_$PaginationParamsImpl value,
          $Res Function(_$PaginationParamsImpl) then) =
      __$$PaginationParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int limit, int offset});
}

/// @nodoc
class __$$PaginationParamsImplCopyWithImpl<$Res>
    extends _$PaginationParamsCopyWithImpl<$Res, _$PaginationParamsImpl>
    implements _$$PaginationParamsImplCopyWith<$Res> {
  __$$PaginationParamsImplCopyWithImpl(_$PaginationParamsImpl _value,
      $Res Function(_$PaginationParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? offset = null,
  }) {
    return _then(_$PaginationParamsImpl(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationParamsImpl implements _PaginationParams {
  const _$PaginationParamsImpl({required this.limit, required this.offset});

  factory _$PaginationParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationParamsImplFromJson(json);

  @override
  final int limit;
  @override
  final int offset;

  @override
  String toString() {
    return 'PaginationParams(limit: $limit, offset: $offset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationParamsImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, limit, offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationParamsImplCopyWith<_$PaginationParamsImpl> get copyWith =>
      __$$PaginationParamsImplCopyWithImpl<_$PaginationParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationParamsImplToJson(
      this,
    );
  }
}

abstract class _PaginationParams implements PaginationParams {
  const factory _PaginationParams(
      {required final int limit,
      required final int offset}) = _$PaginationParamsImpl;

  factory _PaginationParams.fromJson(Map<String, dynamic> json) =
      _$PaginationParamsImpl.fromJson;

  @override
  int get limit;
  @override
  int get offset;
  @override
  @JsonKey(ignore: true)
  _$$PaginationParamsImplCopyWith<_$PaginationParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RelationshipMapping _$RelationshipMappingFromJson(Map<String, dynamic> json) {
  return _RelationshipMapping.fromJson(json);
}

/// @nodoc
mixin _$RelationshipMapping {
  String get from => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;
  String get localKey => throw _privateConstructorUsedError;
  String get foreignKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RelationshipMappingCopyWith<RelationshipMapping> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelationshipMappingCopyWith<$Res> {
  factory $RelationshipMappingCopyWith(
          RelationshipMapping value, $Res Function(RelationshipMapping) then) =
      _$RelationshipMappingCopyWithImpl<$Res, RelationshipMapping>;
  @useResult
  $Res call({String from, String to, String localKey, String foreignKey});
}

/// @nodoc
class _$RelationshipMappingCopyWithImpl<$Res, $Val extends RelationshipMapping>
    implements $RelationshipMappingCopyWith<$Res> {
  _$RelationshipMappingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? localKey = null,
    Object? foreignKey = null,
  }) {
    return _then(_value.copyWith(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      localKey: null == localKey
          ? _value.localKey
          : localKey // ignore: cast_nullable_to_non_nullable
              as String,
      foreignKey: null == foreignKey
          ? _value.foreignKey
          : foreignKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RelationshipMappingImplCopyWith<$Res>
    implements $RelationshipMappingCopyWith<$Res> {
  factory _$$RelationshipMappingImplCopyWith(_$RelationshipMappingImpl value,
          $Res Function(_$RelationshipMappingImpl) then) =
      __$$RelationshipMappingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String from, String to, String localKey, String foreignKey});
}

/// @nodoc
class __$$RelationshipMappingImplCopyWithImpl<$Res>
    extends _$RelationshipMappingCopyWithImpl<$Res, _$RelationshipMappingImpl>
    implements _$$RelationshipMappingImplCopyWith<$Res> {
  __$$RelationshipMappingImplCopyWithImpl(_$RelationshipMappingImpl _value,
      $Res Function(_$RelationshipMappingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? localKey = null,
    Object? foreignKey = null,
  }) {
    return _then(_$RelationshipMappingImpl(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      localKey: null == localKey
          ? _value.localKey
          : localKey // ignore: cast_nullable_to_non_nullable
              as String,
      foreignKey: null == foreignKey
          ? _value.foreignKey
          : foreignKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RelationshipMappingImpl implements _RelationshipMapping {
  const _$RelationshipMappingImpl(
      {required this.from,
      required this.to,
      required this.localKey,
      required this.foreignKey});

  factory _$RelationshipMappingImpl.fromJson(Map<String, dynamic> json) =>
      _$$RelationshipMappingImplFromJson(json);

  @override
  final String from;
  @override
  final String to;
  @override
  final String localKey;
  @override
  final String foreignKey;

  @override
  String toString() {
    return 'RelationshipMapping(from: $from, to: $to, localKey: $localKey, foreignKey: $foreignKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelationshipMappingImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.localKey, localKey) ||
                other.localKey == localKey) &&
            (identical(other.foreignKey, foreignKey) ||
                other.foreignKey == foreignKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, from, to, localKey, foreignKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RelationshipMappingImplCopyWith<_$RelationshipMappingImpl> get copyWith =>
      __$$RelationshipMappingImplCopyWithImpl<_$RelationshipMappingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RelationshipMappingImplToJson(
      this,
    );
  }
}

abstract class _RelationshipMapping implements RelationshipMapping {
  const factory _RelationshipMapping(
      {required final String from,
      required final String to,
      required final String localKey,
      required final String foreignKey}) = _$RelationshipMappingImpl;

  factory _RelationshipMapping.fromJson(Map<String, dynamic> json) =
      _$RelationshipMappingImpl.fromJson;

  @override
  String get from;
  @override
  String get to;
  @override
  String get localKey;
  @override
  String get foreignKey;
  @override
  @JsonKey(ignore: true)
  _$$RelationshipMappingImplCopyWith<_$RelationshipMappingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NestedFieldMapping _$NestedFieldMappingFromJson(Map<String, dynamic> json) {
  return _NestedFieldMapping.fromJson(json);
}

/// @nodoc
mixin _$NestedFieldMapping {
  String get table =>
      throw _privateConstructorUsedError; // actual SQL table name
  String get localKey => throw _privateConstructorUsedError;
  String get foreignKey => throw _privateConstructorUsedError;
  NestedMappingType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NestedFieldMappingCopyWith<NestedFieldMapping> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NestedFieldMappingCopyWith<$Res> {
  factory $NestedFieldMappingCopyWith(
          NestedFieldMapping value, $Res Function(NestedFieldMapping) then) =
      _$NestedFieldMappingCopyWithImpl<$Res, NestedFieldMapping>;
  @useResult
  $Res call(
      {String table,
      String localKey,
      String foreignKey,
      NestedMappingType type});
}

/// @nodoc
class _$NestedFieldMappingCopyWithImpl<$Res, $Val extends NestedFieldMapping>
    implements $NestedFieldMappingCopyWith<$Res> {
  _$NestedFieldMappingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? table = null,
    Object? localKey = null,
    Object? foreignKey = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      table: null == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as String,
      localKey: null == localKey
          ? _value.localKey
          : localKey // ignore: cast_nullable_to_non_nullable
              as String,
      foreignKey: null == foreignKey
          ? _value.foreignKey
          : foreignKey // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NestedMappingType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NestedFieldMappingImplCopyWith<$Res>
    implements $NestedFieldMappingCopyWith<$Res> {
  factory _$$NestedFieldMappingImplCopyWith(_$NestedFieldMappingImpl value,
          $Res Function(_$NestedFieldMappingImpl) then) =
      __$$NestedFieldMappingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String table,
      String localKey,
      String foreignKey,
      NestedMappingType type});
}

/// @nodoc
class __$$NestedFieldMappingImplCopyWithImpl<$Res>
    extends _$NestedFieldMappingCopyWithImpl<$Res, _$NestedFieldMappingImpl>
    implements _$$NestedFieldMappingImplCopyWith<$Res> {
  __$$NestedFieldMappingImplCopyWithImpl(_$NestedFieldMappingImpl _value,
      $Res Function(_$NestedFieldMappingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? table = null,
    Object? localKey = null,
    Object? foreignKey = null,
    Object? type = null,
  }) {
    return _then(_$NestedFieldMappingImpl(
      table: null == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as String,
      localKey: null == localKey
          ? _value.localKey
          : localKey // ignore: cast_nullable_to_non_nullable
              as String,
      foreignKey: null == foreignKey
          ? _value.foreignKey
          : foreignKey // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NestedMappingType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NestedFieldMappingImpl implements _NestedFieldMapping {
  const _$NestedFieldMappingImpl(
      {required this.table,
      required this.localKey,
      required this.foreignKey,
      required this.type});

  factory _$NestedFieldMappingImpl.fromJson(Map<String, dynamic> json) =>
      _$$NestedFieldMappingImplFromJson(json);

  @override
  final String table;
// actual SQL table name
  @override
  final String localKey;
  @override
  final String foreignKey;
  @override
  final NestedMappingType type;

  @override
  String toString() {
    return 'NestedFieldMapping(table: $table, localKey: $localKey, foreignKey: $foreignKey, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NestedFieldMappingImpl &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.localKey, localKey) ||
                other.localKey == localKey) &&
            (identical(other.foreignKey, foreignKey) ||
                other.foreignKey == foreignKey) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, table, localKey, foreignKey, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NestedFieldMappingImplCopyWith<_$NestedFieldMappingImpl> get copyWith =>
      __$$NestedFieldMappingImplCopyWithImpl<_$NestedFieldMappingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NestedFieldMappingImplToJson(
      this,
    );
  }
}

abstract class _NestedFieldMapping implements NestedFieldMapping {
  const factory _NestedFieldMapping(
      {required final String table,
      required final String localKey,
      required final String foreignKey,
      required final NestedMappingType type}) = _$NestedFieldMappingImpl;

  factory _NestedFieldMapping.fromJson(Map<String, dynamic> json) =
      _$NestedFieldMappingImpl.fromJson;

  @override
  String get table;
  @override // actual SQL table name
  String get localKey;
  @override
  String get foreignKey;
  @override
  NestedMappingType get type;
  @override
  @JsonKey(ignore: true)
  _$$NestedFieldMappingImplCopyWith<_$NestedFieldMappingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NestedModelMapping _$NestedModelMappingFromJson(Map<String, dynamic> json) {
  return _NestedModelMapping.fromJson(json);
}

/// @nodoc
mixin _$NestedModelMapping {
  String get rootModel =>
      throw _privateConstructorUsedError; // e.g., 'Individual'
  Map<String, NestedFieldMapping> get fields =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NestedModelMappingCopyWith<NestedModelMapping> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NestedModelMappingCopyWith<$Res> {
  factory $NestedModelMappingCopyWith(
          NestedModelMapping value, $Res Function(NestedModelMapping) then) =
      _$NestedModelMappingCopyWithImpl<$Res, NestedModelMapping>;
  @useResult
  $Res call({String rootModel, Map<String, NestedFieldMapping> fields});
}

/// @nodoc
class _$NestedModelMappingCopyWithImpl<$Res, $Val extends NestedModelMapping>
    implements $NestedModelMappingCopyWith<$Res> {
  _$NestedModelMappingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rootModel = null,
    Object? fields = null,
  }) {
    return _then(_value.copyWith(
      rootModel: null == rootModel
          ? _value.rootModel
          : rootModel // ignore: cast_nullable_to_non_nullable
              as String,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as Map<String, NestedFieldMapping>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NestedModelMappingImplCopyWith<$Res>
    implements $NestedModelMappingCopyWith<$Res> {
  factory _$$NestedModelMappingImplCopyWith(_$NestedModelMappingImpl value,
          $Res Function(_$NestedModelMappingImpl) then) =
      __$$NestedModelMappingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String rootModel, Map<String, NestedFieldMapping> fields});
}

/// @nodoc
class __$$NestedModelMappingImplCopyWithImpl<$Res>
    extends _$NestedModelMappingCopyWithImpl<$Res, _$NestedModelMappingImpl>
    implements _$$NestedModelMappingImplCopyWith<$Res> {
  __$$NestedModelMappingImplCopyWithImpl(_$NestedModelMappingImpl _value,
      $Res Function(_$NestedModelMappingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rootModel = null,
    Object? fields = null,
  }) {
    return _then(_$NestedModelMappingImpl(
      rootModel: null == rootModel
          ? _value.rootModel
          : rootModel // ignore: cast_nullable_to_non_nullable
              as String,
      fields: null == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as Map<String, NestedFieldMapping>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NestedModelMappingImpl implements _NestedModelMapping {
  const _$NestedModelMappingImpl(
      {required this.rootModel,
      required final Map<String, NestedFieldMapping> fields})
      : _fields = fields;

  factory _$NestedModelMappingImpl.fromJson(Map<String, dynamic> json) =>
      _$$NestedModelMappingImplFromJson(json);

  @override
  final String rootModel;
// e.g., 'Individual'
  final Map<String, NestedFieldMapping> _fields;
// e.g., 'Individual'
  @override
  Map<String, NestedFieldMapping> get fields {
    if (_fields is EqualUnmodifiableMapView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_fields);
  }

  @override
  String toString() {
    return 'NestedModelMapping(rootModel: $rootModel, fields: $fields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NestedModelMappingImpl &&
            (identical(other.rootModel, rootModel) ||
                other.rootModel == rootModel) &&
            const DeepCollectionEquality().equals(other._fields, _fields));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, rootModel, const DeepCollectionEquality().hash(_fields));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NestedModelMappingImplCopyWith<_$NestedModelMappingImpl> get copyWith =>
      __$$NestedModelMappingImplCopyWithImpl<_$NestedModelMappingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NestedModelMappingImplToJson(
      this,
    );
  }
}

abstract class _NestedModelMapping implements NestedModelMapping {
  const factory _NestedModelMapping(
          {required final String rootModel,
          required final Map<String, NestedFieldMapping> fields}) =
      _$NestedModelMappingImpl;

  factory _NestedModelMapping.fromJson(Map<String, dynamic> json) =
      _$NestedModelMappingImpl.fromJson;

  @override
  String get rootModel;
  @override // e.g., 'Individual'
  Map<String, NestedFieldMapping> get fields;
  @override
  @JsonKey(ignore: true)
  _$$NestedModelMappingImplCopyWith<_$NestedModelMappingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
