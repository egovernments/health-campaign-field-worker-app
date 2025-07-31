import 'package:freezed_annotation/freezed_annotation.dart';

import 'global_search_params.dart';

part 'query_plan.freezed.dart';
part 'query_plan.g.dart';

@freezed
class QueryPlan with _$QueryPlan {
  const factory QueryPlan({
    required String rootTable,
    required List<QueryJoin> joins,
    required List<QuerySelect> selects,
    required List<SearchFilter> filters,
    PaginationParams? pagination,
  }) = _QueryPlan;

  factory QueryPlan.fromJson(Map<String, dynamic> json) =>
      _$QueryPlanFromJson(json);
}

@freezed
class QueryJoin with _$QueryJoin {
  const factory QueryJoin({
    required String fromTable,
    required String toTable,
    required String localKey,
    required String foreignKey,
    @Default(JoinType.left) JoinType joinType,
  }) = _QueryJoin;

  factory QueryJoin.fromJson(Map<String, dynamic> json) =>
      _$QueryJoinFromJson(json);
}

enum JoinType {
  @JsonValue('inner')
  inner,
  @JsonValue('left')
  left,
  @JsonValue('right')
  right,
}

@freezed
class QuerySelect with _$QuerySelect {
  const factory QuerySelect({
    required String table,
    required String column,
    String? alias,
  }) = _QuerySelect;

  factory QuerySelect.fromJson(Map<String, dynamic> json) =>
      _$QuerySelectFromJson(json);
}
