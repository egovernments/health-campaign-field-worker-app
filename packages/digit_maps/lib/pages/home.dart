import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../bloc/map_path/map_path_bloc.dart';
import '../main.dart';

@RoutePage()
class MapsHomePage extends StatefulWidget {
  final List<List<double>> houseHoldPoints;

  const MapsHomePage({super.key, required this.houseHoldPoints});

  @override
  State<MapsHomePage> createState() => _MapsHomePageState();
}

class _MapsHomePageState extends State<MapsHomePage> {
  final MapController _controller = MapController();
  LatLng? first;
  LatLng? second;

  List<LatLng> get waypoints => [first, second].whereNotNull().toList();

  List<LatLng> houseHolds = [];

  @override
  void initState() {
    _controller.mapEventStream.listen((event) {
      debugPrint('Source name: ${event.source.name}');
    });
    initializeMaps();
    widget.houseHoldPoints.forEach((e) {
      print('households $e');
      houseHolds.add(LatLng(e.first, e.last));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        mapController: _controller,
        options: MapOptions(
          minZoom: 1,
          maxZoom: 25,
          initialCenter: const LatLng(12.929059692687234, 77.62804588474884),
          onTap: (tapPosition, point) {
            // setState(() {
            //   if (first == null) {
            //     first = point;
            //   } else if (second == null) {
            //     second = point;
            //   } else {
            //     first = point;
            //     second = null;
            //   }
            // });
          },
        ),
        children: [
          TileLayer(
            urlTemplate: tileTemplate,
            userAgentPackageName: 'com.example.app',
          ),
          houseHolds.isNotEmpty
              ? MarkerLayer(
                  markers: houseHolds
                      .mapIndexed((index, point) => Marker(
                          point: point,
                          height: 15,
                          width: 15,
                          child: const Icon(
                            Icons.house,
                            size: 48,
                            color: Colors.red,
                          )))
                      .toList(),
                )
              : const Offstage(),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.small(
            heroTag: 'zoom_in',
            onPressed: () {
              if (_controller.camera.zoom < 25) {
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
          if (waypoints.length == 2)
            FloatingActionButton(
              heroTag: 'navigate',
              onPressed: () {
                final coordinatePair = CoordinatePair(
                  source: MapCoordinates(
                    first!.latitude,
                    first!.longitude,
                  ),
                  destination: MapCoordinates(
                    second!.latitude,
                    second!.longitude,
                  ),
                );

                context.read<MapPathBloc>().add(
                      MapAddPointsEvent(coordinatePair: coordinatePair),
                    );
                context.router.pop();
              },
              child: const Icon(Icons.map_outlined),
            )
        ],
      ),
    );
  }
}
