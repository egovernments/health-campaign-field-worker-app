import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

Future<String> readLocationFileInBackgroundService() async {
  var directory = await getExternalStorageDirectory();
  directory ??= await getDownloadsDirectory();
  return '${directory?.path}/Download/location_data.txt';
}

Timer makePeriodicTimer(
  Duration duration,
  void Function(Timer timer) callback, {
  bool fireNow = false,
}) {
  var timer = Timer.periodic(duration, callback);
  if (fireNow) {
    callback(timer);
  }

  return timer;
}

Future<List<UserActionModel>> parseLocationData(List<String> logs) async {
  List<UserActionModel> locationDataList = [];

  for (var log in logs) {
    final pattern = RegExp(
        r'Latitude:\s*(-?\d+\.\d+),\s*Longitude:\s*(-?\d+\.\d+),\s*Accuracy:\s*(\d+\.\d+),\s*isSync:\s*(\w+),\s*timestamp:\s*(\d+)');

    final match = pattern.firstMatch(log);
    if (match != null) {
      final latitude = double.parse(match.group(1)!);
      final longitude = double.parse(match.group(2)!);
      final accuracy = double.parse(match.group(3)!);
      final isSync = match.group(4)!.toLowerCase() == 'true';
      final timestamp = int.parse(match.group(5)!);

      locationDataList.add(UserActionModel(
        latitude: latitude,
        longitude: longitude,
        locationAccuracy: accuracy,
        tenantId: LocationTrackerSingleton().tenantId,
        clientReferenceId: IdGen.instance.identifier,
        isSync: isSync,
        timestamp: timestamp,
        boundaryCode: LocationTrackerSingleton().boundaryName,
        action: 'LOCATION_CAPTURE',
        projectId: LocationTrackerSingleton().projectId,
        rowVersion: 1,
        auditDetails: AuditDetails(
          createdBy: LocationTrackerSingleton().loggedInUserUuid,
          createdTime: DateTime.now().millisecondsSinceEpoch,
          lastModifiedBy: LocationTrackerSingleton().loggedInUserUuid,
          lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
        ),
        clientAuditDetails: ClientAuditDetails(
          createdBy: LocationTrackerSingleton().loggedInUserUuid,
          createdTime: DateTime.now().millisecondsSinceEpoch,
          lastModifiedBy: LocationTrackerSingleton().loggedInUserUuid,
          lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
        ),
      ));
    }
  }

  return locationDataList;
}

triggerLocationTracker(String methodChannel,
    {required var startAfterTimestamp,
    required var locationUpdateInterval,
    required var stopAfterTimestamp}) async {
  var platform = MethodChannel(methodChannel);
  try {
    await platform.invokeMethod('startLocationUpdates', {
      "startAfterTimestamp": startAfterTimestamp,
      "interval": locationUpdateInterval,
      "stopAfterTimestamp": stopAfterTimestamp,
    });
  } on PlatformException catch (e) {
    if (kDebugMode) {
      print("Error: $e");
    }
  }
}

// This is a singleton class for inventory operations.
class LocationTrackerSingleton {
  static final LocationTrackerSingleton _singleton =
      LocationTrackerSingleton._internal();

  // Factory constructor that returns the singleton instance.
  factory LocationTrackerSingleton() {
    return _singleton;
  }

  // Private constructor for the singleton pattern.
  LocationTrackerSingleton._internal();

  // Instance of the InventoryListener.

  // Various properties related to the inventory.
  String _projectId = '';
  String? _loggedInUserUuid = '';
  String? _boundaryName = '';
  String? _tenantId = '';

  // Sets the initial data for the inventory.
  void setInitialData({
    String? loggedInUserUuid,
    required String projectId,
  }) {
    _projectId = projectId;
    _loggedInUserUuid = loggedInUserUuid;
  }

  void setBoundaryName({required String boundaryName}) {
    _boundaryName = boundaryName;
  }

  void setTenantId({required String tenantId}) {
    _tenantId = tenantId;
  }

  // Getters for the properties.
  get projectId => _projectId;
  get loggedInUserUuid => _loggedInUserUuid;
  get boundaryName => _boundaryName;
  get tenantId => _tenantId;
}
