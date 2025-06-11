// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_search_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GlobalSearchParametersImpl _$$GlobalSearchParametersImplFromJson(
        Map<String, dynamic> json) =>
    _$GlobalSearchParametersImpl(
      householdClientReferenceId: json['householdClientReferenceId'] as String?,
      isProximityEnabled: json['isProximityEnabled'] as bool?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      maxRadius: (json['maxRadius'] as num?)?.toDouble(),
      projectId: json['projectId'] as String?,
      nameSearch: json['nameSearch'] as String?,
      offset: (json['offset'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      filter:
          (json['filter'] as List<dynamic>?)?.map((e) => e as String).toList(),
      totalCount: (json['totalCount'] as num?)?.toInt(),
      householdType:
          $enumDecodeNullable(_$HouseholdTypeEnumMap, json['householdType']),
    );

Map<String, dynamic> _$$GlobalSearchParametersImplToJson(
        _$GlobalSearchParametersImpl instance) =>
    <String, dynamic>{
      'householdClientReferenceId': instance.householdClientReferenceId,
      'isProximityEnabled': instance.isProximityEnabled,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'maxRadius': instance.maxRadius,
      'projectId': instance.projectId,
      'nameSearch': instance.nameSearch,
      'offset': instance.offset,
      'limit': instance.limit,
      'filter': instance.filter,
      'totalCount': instance.totalCount,
      'householdType': _$HouseholdTypeEnumMap[instance.householdType],
    };

const _$HouseholdTypeEnumMap = {
  HouseholdType.family: 'family',
  HouseholdType.community: 'community',
  HouseholdType.other: 'other',
};
