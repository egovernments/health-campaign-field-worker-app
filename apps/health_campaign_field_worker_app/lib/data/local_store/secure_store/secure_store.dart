import 'dart:convert';

import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../models/auth/auth_model.dart';
import '../../../models/role_actions/role_actions_model.dart';

class LocalSecureStore {
  static const accessTokenKey = 'accessTokenKey';
  static const refreshTokenKey = 'refreshTokenKey';
  static const userObjectKey = 'userObject';
  static const selectedProjectKey = 'selectedProject';
  static const selectedIndividualKey = 'selectedIndividual';
  static const hasAppRunBeforeKey = 'hasAppRunBefore';
  static const backgroundServiceKey = 'backgroundServiceKey';
  static const boundaryRefetchInKey = 'boundaryRefetchInKey';
  static const actionsListkey = 'actionsListkey';
  static const isAppInActiveKey = 'isAppInActiveKey';
  static const manualSyncKey = 'manualSyncKey';
  static const selectedProjectTypeKey = 'selectedProjectType';

  final storage = const FlutterSecureStorage();

  static LocalSecureStore get instance => _instance;
  static final LocalSecureStore _instance = LocalSecureStore._();

  LocalSecureStore._();

  Future<String?> get accessToken {
    return storage.read(key: accessTokenKey);
  }

  Future<String?> get refreshToken {
    return storage.read(key: refreshTokenKey);
  }

  Future<bool> get isBackgroundSerivceRunning async {
    final hasRun = await storage.read(key: backgroundServiceKey);

    switch (hasRun) {
      case 'true':
        return true;
      default:
        return false;
    }
  }

  Future<UserRequestModel?> get userRequestModel async {
    final userBody = await storage.read(key: userObjectKey);
    if (userBody == null) return null;

    try {
      final user = UserRequestModel.fromJson(json.decode(userBody));

      return user;
    } catch (_) {
      return null;
    }
  }

  Future<String?> get userIndividualId async {
    final individualId = await storage.read(key: selectedIndividualKey);
    if (individualId == null) return null;

    try {
      final user = individualId;

      return user;
    } catch (_) {
      return null;
    }
  }

  Future<ProjectModel?> get selectedProject async {
    final projectString = await storage.read(key: selectedProjectKey);
    if (projectString == null) return null;

    try {
      final project = ProjectModelMapper.fromMap(json.decode(projectString));

      return project;
    } catch (_) {
      return null;
    }
  }

  Future<bool> get isAppInActive async {
    final hasRun = await storage.read(key: isAppInActiveKey);

    switch (hasRun) {
      case 'true':
        return true;
      default:
        return false;
    }
  }

  Future<bool> get isManualSyncRunning async {
    final hasRun = await storage.read(key: manualSyncKey);

    switch (hasRun) {
      case 'true':
        return true;
      default:
        return false;
    }
  }

  Future<RoleActionsWrapperModel?> get savedActions async {
    final actionsListString = await storage.read(key: actionsListkey);
    if (actionsListString == null) return null;

    try {
      final actions =
          RoleActionsWrapperModel.fromJson(json.decode(actionsListString));

      return actions;
    } catch (_) {
      return null;
    }
  }

  Future<bool> get boundaryRefetched async {
    final isboundaryRefetchRequired =
        await storage.read(key: boundaryRefetchInKey);

    switch (isboundaryRefetchRequired) {
      case 'true':
        return false;
      default:
        return true;
    }
  }

  Future<void> setSelectedProject(ProjectModel projectModel) async {
    await storage.write(
      key: selectedProjectKey,
      value: projectModel.toJson(),
    );
  }

  Future<void> setSelectedIndividual(String? individualId) async {
    await storage.write(
      key: selectedIndividualKey,
      value: individualId,
    );
  }

  // Note TO the app  as Trigger Manual Sync or Not
  Future<void> setManualSyncTrigger(bool isManualSync) async {
    await storage.write(
      key: manualSyncKey,
      value: isManualSync.toString(),
    );
  }

  Future<void> setAuthCredentials(AuthModel model) async {
    await storage.write(key: accessTokenKey, value: model.accessToken);
    await storage.write(key: refreshTokenKey, value: model.refreshToken);
    await storage.write(
      key: userObjectKey,
      value: json.encode(model.userRequestModel),
    );
  }

  Future<void> setBoundaryRefetch(bool isboundaryRefetch) async {
    await storage.write(
      key: boundaryRefetchInKey,
      value: isboundaryRefetch.toString(),
    );
  }

  Future<void> setRoleActions(RoleActionsWrapperModel actions) async {
    await storage.write(
      key: actionsListkey,
      value: json.encode(actions),
    );
  }

  Future<void> setBackgroundService(bool isRunning) async {
    await storage.write(key: backgroundServiceKey, value: isRunning.toString());
  }

  Future<void> setHasAppRunBefore(bool hasRunBefore) async {
    await storage.write(key: hasAppRunBeforeKey, value: '$hasRunBefore');
  }

  // Note TO the app is in closed state or not
  Future<void> setAppInActive(bool isRunning) async {
    await storage.write(key: isAppInActiveKey, value: isRunning.toString());
  }

  Future<bool> get hasAppRunBefore async {
    final hasRun = await storage.read(key: hasAppRunBeforeKey);

    switch (hasRun) {
      case 'true':
        return true;
      default:
        return false;
    }
  }

  Future<void> deleteAll() async {
    await storage.deleteAll();
  }

  /*Sets the bool value of project setup as true once project data is downloaded*/
  Future<void> setProjectSetUpComplete(String key, bool value) async {
    await storage.write(
      key: key,
      value: value.toString(),
    );
  }

  /*Checks for project data loaded or not*/
  Future<bool> isProjectSetUpComplete(String projectId) async {
    final isProjectSetUpComplete = await storage.read(key: projectId);

    switch (isProjectSetUpComplete) {
      case 'true':
        return true;
      default:
        return false;
    }
  }

  Future<void> setStockCount(List<Map<String, int>> stockData) async {
    // Read the user object from secure storage
    final userBody = await storage.read(key: userObjectKey);
    if (userBody == null) return;

    try {
      // Parse the user object from JSON
      final user = UserRequestModel.fromJson(json.decode(userBody));

      // Iterate over the stock data list
      for (var stockItem in stockData) {
        // Extract the SKU and quantity from the stockItem map
        String sku = stockItem.keys.first; // SKU
        int deltaCount = stockItem.values.first; // Quantity to add or subtract

        // Read the current SKU data from secure storage
        final skuMapString = await storage.read(key: sku);
        Map<String, dynamic> skuQMap = {};
        int currentStockCount =
            0; // Initialize to zero if no current stock exists

        if (skuMapString != null) {
          try {
            skuQMap = jsonDecode(skuMapString);

            // Get the current stock count for the user if it exists
            currentStockCount =
                skuQMap.containsKey(user.uuid) ? skuQMap[user.uuid] as int : 0;
          } catch (e) {
            // Handle JSON decoding errors if necessary
            debugPrint('Error decoding SKU map: $e');
          }
        }

        // Update the stock count for the current user by adding the delta
        final newStockCount = currentStockCount + deltaCount;

        // Set the new stock count for the current user
        skuQMap[user.uuid] = newStockCount;

        // Write the updated SKU quantity map back to secure storage
        await storage.write(
          key: sku,
          value: json.encode(skuQMap),
        );
      }
    } catch (e) {
      // Handle exceptions during user parsing or stock processing
      debugPrint('Error setting stock counts: $e');
    }
  }

  Future<List<Map<String, int>>> getStockCount(List<String> skuList) async {
    // Read the user object from secure storage
    final userBody = await storage.read(key: userObjectKey);
    if (userBody == null) return [];

    try {
      // Parse the user object from JSON
      final user = UserRequestModel.fromJson(json.decode(userBody));
      final String userId = user.uuid;

      List<Map<String, int>> stockCounts = [];

      // Iterate over the SKU list
      for (String sku in skuList) {
        // Read the current SKU data from secure storage
        final skuMapString = await storage.read(key: sku);

        if (skuMapString != null) {
          try {
            // Decode the SKU map
            Map<String, dynamic> skuQMap = jsonDecode(skuMapString);

            // Check if there's an entry for the current user
            if (skuQMap.containsKey(userId)) {
              int userStockCount = skuQMap[userId];

              // Add the stock count for the SKU to the result list
              stockCounts.add({sku: userStockCount});
            }
          } catch (e) {
            debugPrint('Error decoding SKU map: $e');
          }
        }
      }
      return stockCounts;
    } catch (e) {
      // Handle any errors
      debugPrint('Error retrieving stock counts: $e');
      return [];
    }
  }
}
