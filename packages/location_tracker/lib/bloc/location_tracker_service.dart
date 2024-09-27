import 'dart:async';
// import 'package:digit_data_model/data/data_repository.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:location/location.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:location_tracker/utils/utils.dart';

class LocationTrackerService {
  FutureOr trackLocation({
    // required LocalRepository<EntityModel, EntitySearchModel> local,
    ServiceInstance? service,
    required Location location,
  }) async {
    // final PermissionStatus permissionStatus = await location.hasPermission();
    // if (permissionStatus == PermissionStatus.granted) {
      final LocationData locationData = await location.getLocation();
      print(locationData.latitude);
      print(locationData.longitude);
      print("__Location_Captured__");
    // }
// local.opLogManager.isar.writeTxn(() => null);

    // final configuration =
    //     LocationTrackerServiceSingleton().persistenceConfiguration;

    return null;
  }
}
