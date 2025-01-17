import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart'; // Import geolocator package
import 'package:latlong2/latlong.dart';

import '../bloc/map_path/map_path_bloc.dart';
import '../main.dart';
import '../models/geoJson/marker_details.dart';

@RoutePage()
class MapsHomePage extends StatefulWidget {
  final void Function(String id) onPressed; // Updated callback type
  final List<MarkerDetails>
      markerDetails; // Changed type to use HouseHold class

  MapsHomePage(
      {super.key, required this.markerDetails, required this.onPressed});

  @override
  State<MapsHomePage> createState() => _MapsHomePageState();
}

class _MapsHomePageState extends State<MapsHomePage> {
  final MapController _controller = MapController();
  LatLng? first;
  LatLng? second;
  Position? currentPosition;

  List<LatLng> get waypoints => [first, second].whereNotNull().toList();

  @override
  void initState() {
    super.initState();
    _controller.mapEventStream.listen((event) {
      // debugPrint('Source name: ${event.source.name}');
    });
    initializeMaps();
    _setInitialLocation(); // Set initial location
  }

  Future<void> _setInitialLocation() async {
    currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {});
    _controller.move(
        LatLng(currentPosition!.latitude, currentPosition!.longitude),
        18); // Move to user's location
  }

  void _onHouseMarkerTap(String id) {
    // Implement the function to handle marker tap
    print('House marker tapped with ID: $id');
    // You can add more functionality here, e.g., navigate to a detail page

    widget.onPressed!(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        mapController: _controller,
        options: const MapOptions(
            minZoom: 1,
            maxZoom: 25,
            initialCenter: LatLng(12.929059692687234, 77.62804588474884),
            applyPointerTranslucencyToLayers: false),
        children: [
          TileLayer(
            urlTemplate: tileTemplate,
            userAgentPackageName: 'com.example.app',
          ),
          currentPosition != null
              ? MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(
                        currentPosition!.latitude,
                        currentPosition!.longitude,
                      ),
                      height: 24,
                      width: 24,
                      child: const Icon(
                        Icons.my_location,
                        size: 24,
                      ),
                    )
                  ],
                )
              : const Offstage(),
          widget.markerDetails.isNotEmpty
              ? MarkerLayer(
                  markers: widget.markerDetails
                      .map((houseHold) => Marker(
                          point: LatLng(
                            houseHold.coordinates.first,
                            houseHold.coordinates.last,
                          ),
                          height: 24,
                          width: 24,
                          child: IconButton(
                            onPressed: () =>
                                _onHouseMarkerTap(houseHold.id), // Pass the ID
                            icon: const Icon(
                              Icons.location_on,
                              size: 24,
                            ),
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
            heroTag: 'current',
            onPressed: () {
              _setInitialLocation();
            },
            child: const Icon(Icons.my_location),
          ),
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
