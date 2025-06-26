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
      relationshipMappings: (json['relationshipMappings'] as List<dynamic>?)
              ?.map((e) =>
                  RelationshipMapping.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nestedMappings: (json['nestedMappings'] as List<dynamic>?)
              ?.map(
                  (e) => NestedModelMapping.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      primaryModel: json['primaryModel'] as String?,
    );

Map<String, dynamic> _$$GlobalSearchParametersImplToJson(
        _$GlobalSearchParametersImpl instance) =>
    <String, dynamic>{
      'filters': instance.filters,
      'select': instance.select,
      'pagination': instance.pagination,
      'relationshipMappings': instance.relationshipMappings,
      'nestedMappings': instance.nestedMappings,
      'primaryModel': instance.primaryModel,
    };

_$SearchFilterImpl _$$SearchFilterImplFromJson(Map<String, dynamic> json) =>
    _$SearchFilterImpl(
      field: json['field'] as String,
      operator: json['operator'] as String,
      value: json['value'],
      root: json['root'] as String,
      coordinates: json['coordinates'] == null
          ? null
          : LatLng.fromJson(json['coordinates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SearchFilterImplToJson(_$SearchFilterImpl instance) =>
    <String, dynamic>{
      'field': instance.field,
      'operator': instance.operator,
      'value': instance.value,
      'root': instance.root,
      'coordinates': instance.coordinates,
    };

_$LatLngImpl _$$LatLngImplFromJson(Map<String, dynamic> json) => _$LatLngImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$LatLngImplToJson(_$LatLngImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
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

_$NestedFieldMappingImpl _$$NestedFieldMappingImplFromJson(
        Map<String, dynamic> json) =>
    _$NestedFieldMappingImpl(
      table: json['table'] as String,
      localKey: json['localKey'] as String,
      foreignKey: json['foreignKey'] as String,
      type: $enumDecode(_$NestedMappingTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$NestedFieldMappingImplToJson(
        _$NestedFieldMappingImpl instance) =>
    <String, dynamic>{
      'table': instance.table,
      'localKey': instance.localKey,
      'foreignKey': instance.foreignKey,
      'type': _$NestedMappingTypeEnumMap[instance.type]!,
    };

const _$NestedMappingTypeEnumMap = {
  NestedMappingType.one: 'one',
  NestedMappingType.many: 'many',
};

_$NestedModelMappingImpl _$$NestedModelMappingImplFromJson(
        Map<String, dynamic> json) =>
    _$NestedModelMappingImpl(
      rootModel: json['rootModel'] as String,
      fields: (json['fields'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, NestedFieldMapping.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$NestedModelMappingImplToJson(
        _$NestedModelMappingImpl instance) =>
    <String, dynamic>{
      'rootModel': instance.rootModel,
      'fields': instance.fields,
    };
