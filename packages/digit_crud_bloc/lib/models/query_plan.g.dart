// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QueryPlanImpl _$$QueryPlanImplFromJson(Map<String, dynamic> json) =>
    _$QueryPlanImpl(
      rootTable: json['rootTable'] as String,
      joins: (json['joins'] as List<dynamic>)
          .map((e) => QueryJoin.fromJson(e as Map<String, dynamic>))
          .toList(),
      selects: (json['selects'] as List<dynamic>)
          .map((e) => QuerySelect.fromJson(e as Map<String, dynamic>))
          .toList(),
      filters: (json['filters'] as List<dynamic>)
          .map((e) => SearchFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginationParams.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$QueryPlanImplToJson(_$QueryPlanImpl instance) =>
    <String, dynamic>{
      'rootTable': instance.rootTable,
      'joins': instance.joins,
      'selects': instance.selects,
      'filters': instance.filters,
      'pagination': instance.pagination,
    };

_$QueryJoinImpl _$$QueryJoinImplFromJson(Map<String, dynamic> json) =>
    _$QueryJoinImpl(
      fromTable: json['fromTable'] as String,
      toTable: json['toTable'] as String,
      localKey: json['localKey'] as String,
      foreignKey: json['foreignKey'] as String,
      joinType: $enumDecodeNullable(_$JoinTypeEnumMap, json['joinType']) ??
          JoinType.left,
    );

Map<String, dynamic> _$$QueryJoinImplToJson(_$QueryJoinImpl instance) =>
    <String, dynamic>{
      'fromTable': instance.fromTable,
      'toTable': instance.toTable,
      'localKey': instance.localKey,
      'foreignKey': instance.foreignKey,
      'joinType': _$JoinTypeEnumMap[instance.joinType]!,
    };

const _$JoinTypeEnumMap = {
  JoinType.inner: 'inner',
  JoinType.left: 'left',
  JoinType.right: 'right',
};

_$QuerySelectImpl _$$QuerySelectImplFromJson(Map<String, dynamic> json) =>
    _$QuerySelectImpl(
      table: json['table'] as String,
      column: json['column'] as String,
      alias: json['alias'] as String?,
    );

Map<String, dynamic> _$$QuerySelectImplToJson(_$QuerySelectImpl instance) =>
    <String, dynamic>{
      'table': instance.table,
      'column': instance.column,
      'alias': instance.alias,
    };
