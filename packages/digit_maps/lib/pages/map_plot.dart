import 'package:auto_route/auto_route.dart';
import 'package:digit_maps/bloc/check_permissions/check_permissions.dart';
import 'package:digit_maps/bloc/map_path/map_path_bloc.dart';
import 'package:digit_maps/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:latlong2/latlong.dart';

@RoutePage()
class MapPlotPage extends StatefulWidget {
  final CoordinatePair coordinatePair;

  const MapPlotPage({
    super.key,
    required this.coordinatePair,
  });

  @override
  State<MapPlotPage> createState() => _MapPlotPageState();
}

class _MapPlotPageState extends State<MapPlotPage> {
  final MapController _controller = MapController();

  @override
  Widget build(BuildContext context) {
    final coordinatePair = widget.coordinatePair;
    final feature = coordinatePair.path!.features.first;
    final bBox = feature.bbox;
    final corner1 = LatLng(bBox[1].toDouble(), bBox[0].toDouble());
    final corner2 = LatLng(bBox[3].toDouble(), bBox[2].toDouble());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Line'),
      ),
      body: BlocProvider(
        create: (_) => CheckPermissionCubit()..check(),
        child: BlocListener<CheckPermissionCubit, PermissionState>(
          listener: (ctx, state) {
            if (state.error == null) {
              ScaffoldMessenger.of(ctx).removeCurrentMaterialBanner();
            } else {
              ScaffoldMessenger.of(ctx).showMaterialBanner(
                MaterialBanner(
                  content: Text(state.error!),
                  actions: [
                    TextButton(
                      onPressed: () => ctx.read<CheckPermissionCubit>().check(),
                      child: const Text('Check Permissions'),
                    )
                  ],
                ),
              );
            }
          },
          child: FlutterMap(
            mapController: _controller,
            options: MapOptions(
                initialCameraFit: CameraFit.bounds(
                    bounds: LatLngBounds(corner1, corner2),
                    padding: const EdgeInsets.all(8))),
            children: [
              LocationMarkerLayer(
                position: LocationMarkerPosition(
                    latitude: coordinatePair.destination.lat,
                    longitude: coordinatePair.destination.lng,
                    accuracy: 0),
                heading: LocationMarkerHeading(accuracy: 0, heading: 0),
              ),
              TileLayer(
                  tileProvider: const FMTCStore('storeName').getTileProvider(
                    settings: FMTCTileProviderSettings(
                      behavior: CacheBehavior.cacheFirst,
                      cachedValidDuration: const Duration(days: 60),
                    ),
                  ),
                  urlTemplate: tileTemplate,
                  userAgentPackageName: 'com.example.app',
                  maxZoom: 17),
              PolylineLayer(
                polylines: [
                  Polyline(
                    strokeWidth: 4,
                    strokeCap: StrokeCap.round,
                    borderStrokeWidth: 0,
                    color: Colors.indigoAccent,
                    points: feature.geometry.coordinates
                        .map((e) => LatLng(e[1].toDouble(), e[0].toDouble()))
                        .toList(),
                  ),
                ],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    height: 10,
                    width: 10,
                    point: LatLng(
                      coordinatePair.source.lat,
                      coordinatePair.source.lng,
                    ),
                    child: Container(
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                        color: Colors.indigoAccent,
                      ),
                    ),
                  ),
                  Marker(
                    height: 10,
                    width: 10,
                    point: LatLng(
                      coordinatePair.destination.lat,
                      coordinatePair.destination.lng,
                    ),
                    child: Container(
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                        color: Colors.indigoAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.small(
            heroTag: 'zoom_in',
            onPressed: () {
              if (_controller.camera.zoom < 20) {
                _controller.move(
                    _controller.camera.center, _controller.camera.zoom + 1);
              }
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton.small(
            heroTag: 'zoom_out',
            onPressed: () {
              if (_controller.camera.zoom > 2) {
                _controller.move(
                    _controller.camera.center, _controller.camera.zoom - 1);
              }
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
