// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_search_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GlobalSearchParametersImpl _$$GlobalSearchParametersImplFromJson(
        Map<String, dynamic> json) =>
    _$GlobalSearchParametersImpl(
      filters: (json['filters'] as List<dynamic>)
          .map((e) => SearchFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      select:
          (json['select'] as List<dynamic>).map((e) => e as String).toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginationParams.fromJson(
              json['pagination'] as Map<String, dynamic>),
      relationshipMap: (json['relationshipMap'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, RelationshipMapping.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$GlobalSearchParametersImplToJson(
        _$GlobalSearchParametersImpl instance) =>
    <String, dynamic>{
      'filters': instance.filters,
      'select': instance.select,
      'pagination': instance.pagination,
      'relationshipMap': instance.relationshipMap,
    };

_$SearchFilterImpl _$$SearchFilterImplFromJson(Map<String, dynamic> json) =>
    _$SearchFilterImpl(
      field: json['field'] as String,
      operator: json['operator'] as String,
      value: json['value'],
      root: json['root'] as String,
      coordinates: json['coordinates'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$SearchFilterImplToJson(_$SearchFilterImpl instance) =>
    <String, dynamic>{
      'field': instance.field,
      'operator': instance.operator,
      'value': instance.value,
      'root': instance.root,
      'coordinates': instance.coordinates,
    };

_$PaginationParamsImpl _$$PaginationParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginationParamsImpl(
      limit: (json['limit'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
    );

Map<String, dynamic> _$$PaginationParamsImplToJson(
        _$PaginationParamsImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
    };

_$RelationshipMappingImpl _$$RelationshipMappingImplFromJson(
        Map<String, dynamic> json) =>
    _$RelationshipMappingImpl(
      from: json['from'] as String,
      to: json['to'] as String,
      localKey: json['localKey'] as String,
      foreignKey: json['foreignKey'] as String,
    );

Map<String, dynamic> _$$RelationshipMappingImplToJson(
        _$RelationshipMappingImpl instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'localKey': instance.localKey,
      'foreignKey': instance.foreignKey,
    };
