import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:digit_location_tracker/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class LocationTrackerService {
  // Singleton instance
  static final LocationTrackerService _instance =
      LocationTrackerService._internal();

  // Factory constructor
  factory LocationTrackerService() {
    return _instance;
  }

  // Private constructor
  LocationTrackerService._internal();

  Timer? _timer;
  DateTime? lastModified;

  void processLocationData(
      {required int interval,
      required Isar isar,
      required String createdBy}) async {
    try {
      _timer ??= makePeriodicTimer(Duration(seconds: interval), (timer) async {
        final file = File(await readLocationFileInBackgroundService());
        if (file.existsSync()) {
          final currentModified = await file.lastModified();
          if (lastModified == null || currentModified.isAfter(lastModified!)) {
            lastModified = currentModified;
            final f = await file.readAsString();
            final logs = f.characters
                .toString()
                .split('\n')
                .where((line) => line.isNotEmpty)
                .toList();

            if (logs.isEmpty) {
              return;
            }

            List<UserActionModel> locationList = await parseLocationData(logs);

            for (var location in locationList) {
              final oplog = OpLogEntry(
                location,
                DataOperation.create,
                createdAt: DateTime.now(),
                createdBy: createdBy,
                clientReferenceId: IdGen.instance.identifier,
                type: DataModelType.userLocation,
              ).oplog;
              isar.writeTxnSync(() {
                isar.opLogs.putSync(oplog);
              });
            }
          }
          file.deleteSync();
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print('oplog entry error $e');
      }
    }
  }

  List<UserActionModel> convertLogsToUserActionModels(List<String> logs) {
    List<UserActionModel> userActionModels = [];

    for (var log in logs) {
      try {
        // Parse each log string into a Map using JSON decoding
        Map<String, dynamic> logMap = jsonDecode(log);

        // Use the generated mappers to create a UserActionModel from the log data
        UserActionModel model = UserActionModelMapper.fromMap(logMap);

        // Add the model to the list
        userActionModels.add(model);
      } catch (e) {
        if (kDebugMode) {
          print('Error parsing log: $log, error: $e');
        }
      }
    }

    return userActionModels;
  }
}
