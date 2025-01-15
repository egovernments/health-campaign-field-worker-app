import 'package:geolocator/geolocator.dart';

class GeolocatorRepository {
  const GeolocatorRepository();

  Future<bool> getPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error(PermissionError(('Location services are disabled.')));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error(
            PermissionError(('Location permissions are denied')));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        PermissionError(
            'Location permissions are permanently denied, we cannot request permissions.'),
      );
    }
    return true;
  }
}

class PermissionError implements Exception {
  final String? message;

  PermissionError([this.message]);
}
