import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:isar/isar.dart';

import '../../../models/auth/auth_model.dart';
import '../../../models/data_model.dart';
import '../../../models/role_actions/role_actions_model.dart';

class LocalSecureStore {
  static const accessTokenKey = 'accessTokenKey';
  static const refreshTokenKey = 'refreshTokenKey';
  static const userObjectKey = 'userObject';
  static const selectedProjectKey = 'selectedProject';
  static const hasAppRunBeforeKey = 'hasAppRunBefore';
  static const backgroundServiceKey = 'backgroundServiceKey';
  static const boundaryRefetchInKey = 'boundaryRefetchInKey';
  static const actionsListkey = 'actionsListkey';

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

  Future<ProjectModel?> get selectedProject async {
    final projectString = await storage.read(key: selectedProjectKey);
    if (projectString == null) return null;

    try {
      final project = Mapper.fromMap<ProjectModel>(json.decode(projectString));

      return project;
    } catch (_) {
      return null;
    }
  }

  Future<RoleActionsWrapperModel?> get savedActions async {
    final actionsListString = await storage.read(key: actionsListkey);
    if (actionsListString == null) return null;

    try {
      final actions = Mapper.fromMap<RoleActionsWrapperModel>(json.decode(
        actionsListString,
      ));

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
      value: actions.toString(),
    );
  }

  Future<void> setBackgroundService(bool isRunning) async {
    await storage.write(key: backgroundServiceKey, value: isRunning.toString());
  }

  Future<void> setHasAppRunBefore(bool hasRunBefore) async {
    await storage.write(key: hasAppRunBeforeKey, value: '$hasRunBefore');
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
}
