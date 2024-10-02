import 'dart:convert';
import 'dart:io';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:location_tracker/utils/utils.dart';

class LocationTrackerService {
  processLocationData(int? interval, Isar isar, String createdBy) async {
    var lastModified;
    try {
      if (interval != null) {
        makePeriodicTimer(Duration(seconds: interval), (timer) async {
          final file = File(await readLocationFileInBackgroundService());

          final currentModified = await file.lastModified();
          if (lastModified == null || currentModified.isAfter(lastModified)) {
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

            final oplog = OpLogEntry(
              locationList.first,
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
          await file.delete();
        });
      }
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
        print('Error parsing log: $log, error: $e');
      }
    }

    return userActionModels;
  }
}
