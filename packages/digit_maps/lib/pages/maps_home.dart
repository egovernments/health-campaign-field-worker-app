import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart'; // Import geolocator package
import 'package:latlong2/latlong.dart';

import '../main.dart';
import '../models/geoJson/marker_details.dart';

@RoutePage()
class MapsHomePage extends StatefulWidget {
  final void Function(String id) onPressed; // Updated callback type
  final void Function(int offset, int limit)?
      onLoadPagination; // Updated callback type

  final List<MarkerDetails>
      markerDetails; // Changed type to use HouseHold class

  const MapsHomePage(
      {super.key,
      required this.markerDetails,
      required this.onPressed,
      this.onLoadPagination});

  @override
  State<MapsHomePage> createState() => _MapsHomePageState();
}

class _MapsHomePageState extends State<MapsHomePage> {
  final MapController _controller = MapController();
  Position? currentPosition;

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
        15); // Move to user's location
  }

  void _onMarkerTap(String id) {
    widget.onPressed(id);
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
                      .map((marker) => Marker(
                          point: LatLng(
                            marker.coordinates.first,
                            marker.coordinates.last,
                          ),
                          height: 24,
                          width: 24,
                          child: IconButton(
                            onPressed: () =>
                                _onMarkerTap(marker.id), // Pass the ID
                            icon: marker.icon ??
                                const Icon(
                                  Icons.location_on,
                                  size: 24,
                                  color: Colors.red,
                                ),
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
          FloatingActionButton(
            heroTag: 'navigate',
            onPressed: () {
              widget.onLoadPagination!(0, 10);
            },
            child: const Icon(Icons.refresh_outlined),
          )
        ],
      ),
    );
  }
}
