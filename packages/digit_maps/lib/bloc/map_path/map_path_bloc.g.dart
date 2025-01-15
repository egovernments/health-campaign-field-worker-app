// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_path_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MapAddPointsEventImpl _$$MapAddPointsEventImplFromJson(
        Map<String, dynamic> json) =>
    _$MapAddPointsEventImpl(
      coordinatePair: CoordinatePair.fromJson(
          json['coordinatePair'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MapAddPointsEventImplToJson(
        _$MapAddPointsEventImpl instance) =>
    <String, dynamic>{
      'coordinatePair': instance.coordinatePair.toJson(),
      'runtimeType': instance.$type,
    };

_$MapGetDirectionsEventImpl _$$MapGetDirectionsEventImplFromJson(
        Map<String, dynamic> json) =>
    _$MapGetDirectionsEventImpl(
      coordinatePair: CoordinatePair.fromJson(
          json['coordinatePair'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MapGetDirectionsEventImplToJson(
        _$MapGetDirectionsEventImpl instance) =>
    <String, dynamic>{
      'coordinatePair': instance.coordinatePair,
      'runtimeType': instance.$type,
    };

_$MapDeletePathEventImpl _$$MapDeletePathEventImplFromJson(
        Map<String, dynamic> json) =>
    _$MapDeletePathEventImpl(
      index: (json['index'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MapDeletePathEventImplToJson(
        _$MapDeletePathEventImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'runtimeType': instance.$type,
    };

_$MapPathStateImpl _$$MapPathStateImplFromJson(Map<String, dynamic> json) =>
    _$MapPathStateImpl(
      coordinates: (json['coordinates'] as List<dynamic>?)
              ?.map((e) => CoordinatePair.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MapPathStateImplToJson(_$MapPathStateImpl instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates.map((e) => e.toJson()).toList(),
    };

_$MapCoordinatesImpl _$$MapCoordinatesImplFromJson(Map<String, dynamic> json) =>
    _$MapCoordinatesImpl(
      (json['lat'] as num).toDouble(),
      (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$$MapCoordinatesImplToJson(
        _$MapCoordinatesImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

_$CoordinatePairImpl _$$CoordinatePairImplFromJson(Map<String, dynamic> json) =>
    _$CoordinatePairImpl(
      source: MapCoordinates.fromJson(json['source'] as Map<String, dynamic>),
      destination:
          MapCoordinates.fromJson(json['destination'] as Map<String, dynamic>),
      path: json['path'] == null
          ? null
          : GeoJsonModel.fromJson(json['path'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CoordinatePairImplToJson(
        _$CoordinatePairImpl instance) =>
    <String, dynamic>{
      'source': instance.source.toJson(),
      'destination': instance.destination.toJson(),
      'path': instance.path?.toJson(),
    };
