// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geoJson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeoJsonModelImpl _$$GeoJsonModelImplFromJson(Map<String, dynamic> json) =>
    _$GeoJsonModelImpl(
      json['type'] as String,
      (json['features'] as List<dynamic>)
          .map((e) => GeoJsonFeatures.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['bbox'] as List<dynamic>).map((e) => e as num).toList(),
    );

Map<String, dynamic> _$$GeoJsonModelImplToJson(_$GeoJsonModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'features': instance.features.map((e) => e.toJson()).toList(),
      'bbox': instance.bbox,
    };

_$GeoJsonFeaturesImpl _$$GeoJsonFeaturesImplFromJson(
        Map<String, dynamic> json) =>
    _$GeoJsonFeaturesImpl(
      (json['bbox'] as List<dynamic>).map((e) => e as num).toList(),
      json['type'] as String,
      GeoJsonProperties.fromJson(json['properties'] as Map<String, dynamic>),
      GeoJsonCoordinates.fromJson(json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GeoJsonFeaturesImplToJson(
        _$GeoJsonFeaturesImpl instance) =>
    <String, dynamic>{
      'bbox': instance.bbox,
      'type': instance.type,
      'properties': instance.properties,
      'geometry': instance.geometry,
    };

_$GeoJsonPropertiesImpl _$$GeoJsonPropertiesImplFromJson(
        Map<String, dynamic> json) =>
    _$GeoJsonPropertiesImpl(
      (json['segments'] as List<dynamic>)
          .map((e) => GeoJsonSegment.fromJson(e as Map<String, dynamic>))
          .toList(),
      GeoJsonSummary.fromJson(json['summary'] as Map<String, dynamic>),
      (json['way_points'] as List<dynamic>).map((e) => e as num).toList(),
    );

Map<String, dynamic> _$$GeoJsonPropertiesImplToJson(
        _$GeoJsonPropertiesImpl instance) =>
    <String, dynamic>{
      'segments': instance.segments,
      'summary': instance.summary,
      'way_points': instance.wayPoints,
    };

_$GeoJsonSegmentImpl _$$GeoJsonSegmentImplFromJson(Map<String, dynamic> json) =>
    _$GeoJsonSegmentImpl(
      json['distance'] as num,
      json['duration'] as num,
      (json['steps'] as List<dynamic>)
          .map((e) => GeoJsonSteps.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GeoJsonSegmentImplToJson(
        _$GeoJsonSegmentImpl instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'duration': instance.duration,
      'steps': instance.steps,
    };

_$GeoJsonSummaryImpl _$$GeoJsonSummaryImplFromJson(Map<String, dynamic> json) =>
    _$GeoJsonSummaryImpl(
      json['distance'] as num,
      json['duration'] as num,
    );

Map<String, dynamic> _$$GeoJsonSummaryImplToJson(
        _$GeoJsonSummaryImpl instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'duration': instance.duration,
    };

_$GeoJsonStepsImpl _$$GeoJsonStepsImplFromJson(Map<String, dynamic> json) =>
    _$GeoJsonStepsImpl(
      json['distance'] as num,
      json['duration'] as num,
      json['type'] as num,
      json['instruction'] as String,
      json['name'] as String,
      (json['way_points'] as List<dynamic>).map((e) => e as num).toList(),
    );

Map<String, dynamic> _$$GeoJsonStepsImplToJson(_$GeoJsonStepsImpl instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'duration': instance.duration,
      'type': instance.type,
      'instruction': instance.instruction,
      'name': instance.name,
      'way_points': instance.wayPoints,
    };

_$GeoJsonCoordinatesImpl _$$GeoJsonCoordinatesImplFromJson(
        Map<String, dynamic> json) =>
    _$GeoJsonCoordinatesImpl(
      (json['coordinates'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as num).toList())
          .toList(),
    );

Map<String, dynamic> _$$GeoJsonCoordinatesImplToJson(
        _$GeoJsonCoordinatesImpl instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates,
    };
