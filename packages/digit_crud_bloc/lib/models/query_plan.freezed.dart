// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QueryPlan _$QueryPlanFromJson(Map<String, dynamic> json) {
  return _QueryPlan.fromJson(json);
}

/// @nodoc
mixin _$QueryPlan {
  String get rootTable => throw _privateConstructorUsedError;
  List<QueryJoin> get joins => throw _privateConstructorUsedError;
  List<QuerySelect> get selects => throw _privateConstructorUsedError;
  List<SearchFilter> get filters => throw _privateConstructorUsedError;
  PaginationParams? get pagination => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QueryPlanCopyWith<QueryPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryPlanCopyWith<$Res> {
  factory $QueryPlanCopyWith(QueryPlan value, $Res Function(QueryPlan) then) =
      _$QueryPlanCopyWithImpl<$Res, QueryPlan>;
  @useResult
  $Res call(
      {String rootTable,
      List<QueryJoin> joins,
      List<QuerySelect> selects,
      List<SearchFilter> filters,
      PaginationParams? pagination});

  $PaginationParamsCopyWith<$Res>? get pagination;
}

/// @nodoc
class _$QueryPlanCopyWithImpl<$Res, $Val extends QueryPlan>
    implements $QueryPlanCopyWith<$Res> {
  _$QueryPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rootTable = null,
    Object? joins = null,
    Object? selects = null,
    Object? filters = null,
    Object? pagination = freezed,
  }) {
    return _then(_value.copyWith(
      rootTable: null == rootTable
          ? _value.rootTable
          : rootTable // ignore: cast_nullable_to_non_nullable
              as String,
      joins: null == joins
          ? _value.joins
          : joins // ignore: cast_nullable_to_non_nullable
              as List<QueryJoin>,
      selects: null == selects
          ? _value.selects
          : selects // ignore: cast_nullable_to_non_nullable
              as List<QuerySelect>,
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<SearchFilter>,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationParams?,
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
abstract class _$$QueryPlanImplCopyWith<$Res>
    implements $QueryPlanCopyWith<$Res> {
  factory _$$QueryPlanImplCopyWith(
          _$QueryPlanImpl value, $Res Function(_$QueryPlanImpl) then) =
      __$$QueryPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String rootTable,
      List<QueryJoin> joins,
      List<QuerySelect> selects,
      List<SearchFilter> filters,
      PaginationParams? pagination});

  @override
  $PaginationParamsCopyWith<$Res>? get pagination;
}

/// @nodoc
class __$$QueryPlanImplCopyWithImpl<$Res>
    extends _$QueryPlanCopyWithImpl<$Res, _$QueryPlanImpl>
    implements _$$QueryPlanImplCopyWith<$Res> {
  __$$QueryPlanImplCopyWithImpl(
      _$QueryPlanImpl _value, $Res Function(_$QueryPlanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rootTable = null,
    Object? joins = null,
    Object? selects = null,
    Object? filters = null,
    Object? pagination = freezed,
  }) {
    return _then(_$QueryPlanImpl(
      rootTable: null == rootTable
          ? _value.rootTable
          : rootTable // ignore: cast_nullable_to_non_nullable
              as String,
      joins: null == joins
          ? _value._joins
          : joins // ignore: cast_nullable_to_non_nullable
              as List<QueryJoin>,
      selects: null == selects
          ? _value._selects
          : selects // ignore: cast_nullable_to_non_nullable
              as List<QuerySelect>,
      filters: null == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<SearchFilter>,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationParams?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QueryPlanImpl implements _QueryPlan {
  const _$QueryPlanImpl(
      {required this.rootTable,
      required final List<QueryJoin> joins,
      required final List<QuerySelect> selects,
      required final List<SearchFilter> filters,
      this.pagination})
      : _joins = joins,
        _selects = selects,
        _filters = filters;

  factory _$QueryPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$QueryPlanImplFromJson(json);

  @override
  final String rootTable;
  final List<QueryJoin> _joins;
  @override
  List<QueryJoin> get joins {
    if (_joins is EqualUnmodifiableListView) return _joins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_joins);
  }

  final List<QuerySelect> _selects;
  @override
  List<QuerySelect> get selects {
    if (_selects is EqualUnmodifiableListView) return _selects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selects);
  }

  final List<SearchFilter> _filters;
  @override
  List<SearchFilter> get filters {
    if (_filters is EqualUnmodifiableListView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filters);
  }

  @override
  final PaginationParams? pagination;

  @override
  String toString() {
    return 'QueryPlan(rootTable: $rootTable, joins: $joins, selects: $selects, filters: $filters, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueryPlanImpl &&
            (identical(other.rootTable, rootTable) ||
                other.rootTable == rootTable) &&
            const DeepCollectionEquality().equals(other._joins, _joins) &&
            const DeepCollectionEquality().equals(other._selects, _selects) &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      rootTable,
      const DeepCollectionEquality().hash(_joins),
      const DeepCollectionEquality().hash(_selects),
      const DeepCollectionEquality().hash(_filters),
      pagination);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QueryPlanImplCopyWith<_$QueryPlanImpl> get copyWith =>
      __$$QueryPlanImplCopyWithImpl<_$QueryPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QueryPlanImplToJson(
      this,
    );
  }
}

abstract class _QueryPlan implements QueryPlan {
  const factory _QueryPlan(
      {required final String rootTable,
      required final List<QueryJoin> joins,
      required final List<QuerySelect> selects,
      required final List<SearchFilter> filters,
      final PaginationParams? pagination}) = _$QueryPlanImpl;

  factory _QueryPlan.fromJson(Map<String, dynamic> json) =
      _$QueryPlanImpl.fromJson;

  @override
  String get rootTable;
  @override
  List<QueryJoin> get joins;
  @override
  List<QuerySelect> get selects;
  @override
  List<SearchFilter> get filters;
  @override
  PaginationParams? get pagination;
  @override
  @JsonKey(ignore: true)
  _$$QueryPlanImplCopyWith<_$QueryPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QueryJoin _$QueryJoinFromJson(Map<String, dynamic> json) {
  return _QueryJoin.fromJson(json);
}

/// @nodoc
mixin _$QueryJoin {
  String get fromTable => throw _privateConstructorUsedError;
  String get toTable => throw _privateConstructorUsedError;
  String get localKey => throw _privateConstructorUsedError;
  String get foreignKey => throw _privateConstructorUsedError;
  JoinType get joinType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QueryJoinCopyWith<QueryJoin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryJoinCopyWith<$Res> {
  factory $QueryJoinCopyWith(QueryJoin value, $Res Function(QueryJoin) then) =
      _$QueryJoinCopyWithImpl<$Res, QueryJoin>;
  @useResult
  $Res call(
      {String fromTable,
      String toTable,
      String localKey,
      String foreignKey,
      JoinType joinType});
}

/// @nodoc
class _$QueryJoinCopyWithImpl<$Res, $Val extends QueryJoin>
    implements $QueryJoinCopyWith<$Res> {
  _$QueryJoinCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromTable = null,
    Object? toTable = null,
    Object? localKey = null,
    Object? foreignKey = null,
    Object? joinType = null,
  }) {
    return _then(_value.copyWith(
      fromTable: null == fromTable
          ? _value.fromTable
          : fromTable // ignore: cast_nullable_to_non_nullable
              as String,
      toTable: null == toTable
          ? _value.toTable
          : toTable // ignore: cast_nullable_to_non_nullable
              as String,
      localKey: null == localKey
          ? _value.localKey
          : localKey // ignore: cast_nullable_to_non_nullable
              as String,
      foreignKey: null == foreignKey
          ? _value.foreignKey
          : foreignKey // ignore: cast_nullable_to_non_nullable
              as String,
      joinType: null == joinType
          ? _value.joinType
          : joinType // ignore: cast_nullable_to_non_nullable
              as JoinType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QueryJoinImplCopyWith<$Res>
    implements $QueryJoinCopyWith<$Res> {
  factory _$$QueryJoinImplCopyWith(
          _$QueryJoinImpl value, $Res Function(_$QueryJoinImpl) then) =
      __$$QueryJoinImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fromTable,
      String toTable,
      String localKey,
      String foreignKey,
      JoinType joinType});
}

/// @nodoc
class __$$QueryJoinImplCopyWithImpl<$Res>
    extends _$QueryJoinCopyWithImpl<$Res, _$QueryJoinImpl>
    implements _$$QueryJoinImplCopyWith<$Res> {
  __$$QueryJoinImplCopyWithImpl(
      _$QueryJoinImpl _value, $Res Function(_$QueryJoinImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromTable = null,
    Object? toTable = null,
    Object? localKey = null,
    Object? foreignKey = null,
    Object? joinType = null,
  }) {
    return _then(_$QueryJoinImpl(
      fromTable: null == fromTable
          ? _value.fromTable
          : fromTable // ignore: cast_nullable_to_non_nullable
              as String,
      toTable: null == toTable
          ? _value.toTable
          : toTable // ignore: cast_nullable_to_non_nullable
              as String,
      localKey: null == localKey
          ? _value.localKey
          : localKey // ignore: cast_nullable_to_non_nullable
              as String,
      foreignKey: null == foreignKey
          ? _value.foreignKey
          : foreignKey // ignore: cast_nullable_to_non_nullable
              as String,
      joinType: null == joinType
          ? _value.joinType
          : joinType // ignore: cast_nullable_to_non_nullable
              as JoinType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QueryJoinImpl implements _QueryJoin {
  const _$QueryJoinImpl(
      {required this.fromTable,
      required this.toTable,
      required this.localKey,
      required this.foreignKey,
      this.joinType = JoinType.left});

  factory _$QueryJoinImpl.fromJson(Map<String, dynamic> json) =>
      _$$QueryJoinImplFromJson(json);

  @override
  final String fromTable;
  @override
  final String toTable;
  @override
  final String localKey;
  @override
  final String foreignKey;
  @override
  @JsonKey()
  final JoinType joinType;

  @override
  String toString() {
    return 'QueryJoin(fromTable: $fromTable, toTable: $toTable, localKey: $localKey, foreignKey: $foreignKey, joinType: $joinType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueryJoinImpl &&
            (identical(other.fromTable, fromTable) ||
                other.fromTable == fromTable) &&
            (identical(other.toTable, toTable) || other.toTable == toTable) &&
            (identical(other.localKey, localKey) ||
                other.localKey == localKey) &&
            (identical(other.foreignKey, foreignKey) ||
                other.foreignKey == foreignKey) &&
            (identical(other.joinType, joinType) ||
                other.joinType == joinType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, fromTable, toTable, localKey, foreignKey, joinType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QueryJoinImplCopyWith<_$QueryJoinImpl> get copyWith =>
      __$$QueryJoinImplCopyWithImpl<_$QueryJoinImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QueryJoinImplToJson(
      this,
    );
  }
}

abstract class _QueryJoin implements QueryJoin {
  const factory _QueryJoin(
      {required final String fromTable,
      required final String toTable,
      required final String localKey,
      required final String foreignKey,
      final JoinType joinType}) = _$QueryJoinImpl;

  factory _QueryJoin.fromJson(Map<String, dynamic> json) =
      _$QueryJoinImpl.fromJson;

  @override
  String get fromTable;
  @override
  String get toTable;
  @override
  String get localKey;
  @override
  String get foreignKey;
  @override
  JoinType get joinType;
  @override
  @JsonKey(ignore: true)
  _$$QueryJoinImplCopyWith<_$QueryJoinImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuerySelect _$QuerySelectFromJson(Map<String, dynamic> json) {
  return _QuerySelect.fromJson(json);
}

/// @nodoc
mixin _$QuerySelect {
  String get table => throw _privateConstructorUsedError;
  String get column => throw _privateConstructorUsedError;
  String? get alias => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuerySelectCopyWith<QuerySelect> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuerySelectCopyWith<$Res> {
  factory $QuerySelectCopyWith(
          QuerySelect value, $Res Function(QuerySelect) then) =
      _$QuerySelectCopyWithImpl<$Res, QuerySelect>;
  @useResult
  $Res call({String table, String column, String? alias});
}

/// @nodoc
class _$QuerySelectCopyWithImpl<$Res, $Val extends QuerySelect>
    implements $QuerySelectCopyWith<$Res> {
  _$QuerySelectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? table = null,
    Object? column = null,
    Object? alias = freezed,
  }) {
    return _then(_value.copyWith(
      table: null == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as String,
      column: null == column
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as String,
      alias: freezed == alias
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuerySelectImplCopyWith<$Res>
    implements $QuerySelectCopyWith<$Res> {
  factory _$$QuerySelectImplCopyWith(
          _$QuerySelectImpl value, $Res Function(_$QuerySelectImpl) then) =
      __$$QuerySelectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String table, String column, String? alias});
}

/// @nodoc
class __$$QuerySelectImplCopyWithImpl<$Res>
    extends _$QuerySelectCopyWithImpl<$Res, _$QuerySelectImpl>
    implements _$$QuerySelectImplCopyWith<$Res> {
  __$$QuerySelectImplCopyWithImpl(
      _$QuerySelectImpl _value, $Res Function(_$QuerySelectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? table = null,
    Object? column = null,
    Object? alias = freezed,
  }) {
    return _then(_$QuerySelectImpl(
      table: null == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as String,
      column: null == column
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as String,
      alias: freezed == alias
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuerySelectImpl implements _QuerySelect {
  const _$QuerySelectImpl(
      {required this.table, required this.column, this.alias});

  factory _$QuerySelectImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuerySelectImplFromJson(json);

  @override
  final String table;
  @override
  final String column;
  @override
  final String? alias;

  @override
  String toString() {
    return 'QuerySelect(table: $table, column: $column, alias: $alias)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuerySelectImpl &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.column, column) || other.column == column) &&
            (identical(other.alias, alias) || other.alias == alias));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, table, column, alias);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuerySelectImplCopyWith<_$QuerySelectImpl> get copyWith =>
      __$$QuerySelectImplCopyWithImpl<_$QuerySelectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuerySelectImplToJson(
      this,
    );
  }
}

abstract class _QuerySelect implements QuerySelect {
  const factory _QuerySelect(
      {required final String table,
      required final String column,
      final String? alias}) = _$QuerySelectImpl;

  factory _QuerySelect.fromJson(Map<String, dynamic> json) =
      _$QuerySelectImpl.fromJson;

  @override
  String get table;
  @override
  String get column;
  @override
  String? get alias;
  @override
  @JsonKey(ignore: true)
  _$$QuerySelectImplCopyWith<_$QuerySelectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
