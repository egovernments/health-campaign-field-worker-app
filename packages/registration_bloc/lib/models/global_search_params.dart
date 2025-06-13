import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_search_params.freezed.dart';
part 'global_search_params.g.dart';


@freezed
class GlobalSearchParameters with _$GlobalSearchParameters {
  const factory GlobalSearchParameters({
    required List<SearchFilter> filters,
    required List<String> select,
    PaginationParams? pagination,
    @Default({}) Map<String, RelationshipMapping> relationshipMap,
  }) = _GlobalSearchParameters;

  factory GlobalSearchParameters.fromJson(Map<String, dynamic> json) =>
      _$GlobalSearchParametersFromJson(json);
}

@freezed
class SearchFilter with _$SearchFilter {
  const factory SearchFilter({
    required String field,
    required String operator,
    required dynamic value,
    required String root,
    Map<String, dynamic>? coordinates,
  }) = _SearchFilter;

  factory SearchFilter.fromJson(Map<String, dynamic> json) =>
      _$SearchFilterFromJson(json);
}

@freezed
class PaginationParams with _$PaginationParams {
  const factory PaginationParams({
    required int limit,
    required int offset,
  }) = _PaginationParams;

  factory PaginationParams.fromJson(Map<String, dynamic> json) =>
      _$PaginationParamsFromJson(json);
}

@freezed
class RelationshipMapping with _$RelationshipMapping {
  const factory RelationshipMapping({
    required String from,
    required String to,
    required String localKey,
    required String foreignKey,
  }) = _RelationshipMapping;

  factory RelationshipMapping.fromJson(Map<String, dynamic> json) =>
      _$RelationshipMappingFromJson(json);
}

