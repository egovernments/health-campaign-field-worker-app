import 'package:digit_maps/models/geoJson/geoJson.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'routing_client.g.dart';

///
@RestApi(baseUrl: 'https://api.openrouteservice.org/v2/')
abstract class RoutingClient {
  factory RoutingClient(Dio dio, {String baseUrl}) = _RoutingClient;

  @GET('directions/driving-car')
  Future<GeoJsonModel> getDirections({
    @Query('start') required String start,
    @Query('end') required String end,
    @Query('api_key') required String apiKey,
  });
}
