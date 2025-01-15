// ignore_for_file: invalid_annotation_target

import 'package:digit_maps/data/repository/routing_repository.dart';
import 'package:digit_maps/models/geoJson/geoJson.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'map_path_bloc.freezed.dart';
part 'map_path_bloc.g.dart';

typedef MapPathEmitter = Emitter<MapPathState>;

/// This is a cubit that handles the map path
///   * [MapPathBloc] is a cubit that handles the map path
///   * [MapPathState] is the state of the cubit
///   * [MapAddPointsEvent] is an event that adds points to the map path
///   * [MapGetDirectionsEvent] is an event that gets the directions from the map path
///   * [MapDeletePathEvent] is an event that deletes the map path
///   * [MapPathState.coordinates] is a list of coordinates that represents the map path
///   * [MapPathState.directions] is a list of directions that represents the map path
///   * [MapPathState.error] is a string that contains the error message
class MapPathBloc extends HydratedBloc<MapPathEvent, MapPathState> {
  final RoutingRepository repository;

  MapPathBloc([RoutingRepository? repository])
      : repository = repository ?? RoutingRepository(),
        super(const MapPathState()) {
    on<MapAddPointsEvent>(_handleAddPoints);
    on<MapGetDirectionsEvent>(_handleGetDirectionsEvent);
    on<MapDeletePathEvent>(_handleDeletePathEvent);
  }

  @override
  MapPathState? fromJson(Map<String, dynamic> json) {
    return MapPathState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(MapPathState state) {
    return state.toJson();
  }

  void _handleAddPoints(MapAddPointsEvent event, MapPathEmitter emit) {
    final list = List.generate(
      state.coordinates.length,
      (index) => state.coordinates.elementAt(index),
      growable: true,
    );
    list.add(event.coordinatePair);
    emit(state.copyWith(coordinates: list.toSet().toList()));
  }

  void _handleGetDirectionsEvent(
    MapGetDirectionsEvent event,
    MapPathEmitter emit,
  ) async {
    final response = await repository.getRoute(event.coordinatePair);
    final list = state.coordinates.map((e) {
      if (e == event.coordinatePair) return e.copyWith(path: response);
      return e;
    }).toList();
    emit(state.copyWith(coordinates: list));
  }

  void _handleDeletePathEvent(
    MapDeletePathEvent event,
    MapPathEmitter emit,
  ) {
    final list = List.generate(
      state.coordinates.length,
      (index) => state.coordinates.elementAt(index),
      growable: true,
    );
    list.removeAt(event.index);
    emit(state.copyWith(coordinates: list));
  }
}

@freezed
class MapPathEvent with _$MapPathEvent {
  @JsonSerializable(explicitToJson: true)
  const factory MapPathEvent.addPoints({
    required CoordinatePair coordinatePair,
  }) = MapAddPointsEvent;

  const factory MapPathEvent.getDirections({
    required CoordinatePair coordinatePair,
  }) = MapGetDirectionsEvent;

  const factory MapPathEvent.deletePaht({
    required int index,
  }) = MapDeletePathEvent;

  factory MapPathEvent.fromJson(Map<String, dynamic> json) =>
      _$MapPathEventFromJson(json);
}

@freezed
class MapPathState with _$MapPathState {
  @JsonSerializable(explicitToJson: true)
  const factory MapPathState({
    @Default([]) List<CoordinatePair> coordinates,
  }) = _MapPathState;

  factory MapPathState.fromJson(Map<String, dynamic> json) =>
      _$MapPathStateFromJson(json);
}

@freezed
class MapCoordinates with _$MapCoordinates {
  const factory MapCoordinates(double lat, double lng) = _MapCoordinates;

  factory MapCoordinates.fromJson(Map<String, dynamic> json) =>
      _$MapCoordinatesFromJson(json);
}

@freezed
class CoordinatePair with _$CoordinatePair {
  @JsonSerializable(explicitToJson: true)
  const factory CoordinatePair({
    required MapCoordinates source,
    required MapCoordinates destination,
    GeoJsonModel? path,
  }) = _CoordinatePair;

  factory CoordinatePair.fromJson(Map<String, dynamic> json) =>
      _$CoordinatePairFromJson(json);
}
