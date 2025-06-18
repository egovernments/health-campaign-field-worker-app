import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_search_params.freezed.dart';
part 'global_search_params.g.dart';


@freezed
class GlobalSearchParameters with _$GlobalSearchParameters {
  const factory GlobalSearchParameters({
    required List<SearchFilter> filters,
    required List<String> select,
    PaginationParams? pagination,
    @Default([]) List<RelationshipMapping> relationshipMappings,
    @Default([]) List<NestedModelMapping> nestedMappings,
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
    LatLng? coordinates,
  }) = _SearchFilter;

  factory SearchFilter.fromJson(Map<String, dynamic> json) =>
      _$SearchFilterFromJson(json);
}

@freezed
class LatLng with _$LatLng {
  const factory LatLng({
    required double latitude,
    required double longitude,
  }) = _LatLng;

  factory LatLng.fromJson(Map<String, dynamic> json) =>
      _$LatLngFromJson(json);
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

enum NestedMappingType {
  @JsonValue('one') one,
  @JsonValue('many') many,
}

@freezed
class NestedFieldMapping with _$NestedFieldMapping {
  const factory NestedFieldMapping({
    required String table, // actual SQL table name
    required String localKey,
    required String foreignKey,
    required NestedMappingType type,
  }) = _NestedFieldMapping;

  factory NestedFieldMapping.fromJson(Map<String, dynamic> json) =>
      _$NestedFieldMappingFromJson(json);
}

@freezed
class NestedModelMapping with _$NestedModelMapping {
  const factory NestedModelMapping({
    required String rootModel, // e.g., 'Individual'
    required Map<String, NestedFieldMapping> fields, // e.g., 'name' → mapping
  }) = _NestedModelMapping;

  factory NestedModelMapping.fromJson(Map<String, dynamic> json) =>
      _$NestedModelMappingFromJson(json);
}

