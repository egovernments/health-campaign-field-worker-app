// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'geoJson.freezed.dart';
part 'geoJson.g.dart';

@freezed
class GeoJsonModel with _$GeoJsonModel {
  @JsonSerializable(explicitToJson: true)
  const factory GeoJsonModel(
    String type,
    List<GeoJsonFeatures> features,
    List<num> bbox,
  ) = _GeoJsonModel;

  factory GeoJsonModel.fromJson(Map<String, dynamic> json) =>
      _$GeoJsonModelFromJson(json);
}

@freezed
class GeoJsonFeatures with _$GeoJsonFeatures {
  const factory GeoJsonFeatures(
    List<num> bbox,
    String type,
    GeoJsonProperties properties,
    GeoJsonCoordinates geometry,
  ) = _GeoJsonFeatures;

  factory GeoJsonFeatures.fromJson(Map<String, dynamic> json) =>
      _$GeoJsonFeaturesFromJson(json);
}

@freezed
class GeoJsonProperties with _$GeoJsonProperties {
  const factory GeoJsonProperties(
    List<GeoJsonSegment> segments,
    GeoJsonSummary summary,
    @JsonKey(name: 'way_points') List<num> wayPoints,
  ) = _GeoJsonProperties;

  factory GeoJsonProperties.fromJson(Map<String, dynamic> json) =>
      _$GeoJsonPropertiesFromJson(json);
}

@freezed
class GeoJsonSegment with _$GeoJsonSegment {
  const factory GeoJsonSegment(
    num distance,
    num duration,
    List<GeoJsonSteps> steps,
  ) = _GeoJsonSegment;

  factory GeoJsonSegment.fromJson(Map<String, dynamic> json) =>
      _$GeoJsonSegmentFromJson(json);
}

@freezed
class GeoJsonSummary with _$GeoJsonSummary {
  const factory GeoJsonSummary(
    num distance,
    num duration,
  ) = _GeoJsonSummary;

  factory GeoJsonSummary.fromJson(Map<String, dynamic> json) =>
      _$GeoJsonSummaryFromJson(json);
}

@freezed
class GeoJsonSteps with _$GeoJsonSteps {
  const factory GeoJsonSteps(
    num distance,
    num duration,
    num type,
    String instruction,
    String name,
    @JsonKey(name: 'way_points') List<num> wayPoints,
  ) = _GeoJsonSteps;

  factory GeoJsonSteps.fromJson(Map<String, dynamic> json) =>
      _$GeoJsonStepsFromJson(json);
}

@freezed
class GeoJsonCoordinates with _$GeoJsonCoordinates {
  const factory GeoJsonCoordinates(
    List<List<num>> coordinates,
  ) = _GeoJsonCoordinates;

  factory GeoJsonCoordinates.fromJson(Map<String, dynamic> json) =>
      _$GeoJsonCoordinatesFromJson(json);
}
