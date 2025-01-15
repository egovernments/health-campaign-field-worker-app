import 'dart:developer';

import 'package:digit_maps/bloc/map_path/map_path_bloc.dart';
import 'package:digit_maps/data/client/routing_client.dart';
import 'package:digit_maps/data/dio_interceptors.dart';
import 'package:digit_maps/models/geoJson/geoJson.dart';
import 'package:dio/dio.dart';

const _token = '5b3ce3597851110001cf62487f10c42162c844c393eefb92718714e1';

class RoutingRepository {
  final RoutingClient _client;

  RoutingRepository([RoutingClient? client])
      : _client =
            client ?? RoutingClient(Dio()..interceptors.add(DioInterceptor()));

  /// Get route from [pair.source] to [pair.destination]
  Future<GeoJsonModel> getRoute(CoordinatePair pair) async {
    final start = '${pair.source.lng},${pair.source.lat}';
    final end = '${pair.destination.lng},${pair.destination.lat}';
    final response = await _client.getDirections(
      start: start,
      end: end,
      apiKey: _token,
    );

    log(response.toString());
    return response;
  }
}
