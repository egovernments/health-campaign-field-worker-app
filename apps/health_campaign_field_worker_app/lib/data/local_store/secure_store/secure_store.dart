import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../models/auth/auth_model.dart';

class LocalSecureStore {
  static const accessTokenKey = 'accessTokenKey';
  static const refreshTokenKey = 'refreshTokenKey';
  static const userObjectKey = 'userObject';

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

  Future<void> setAuthCredentials(AuthModel model) async {
    await storage.write(key: accessTokenKey, value: model.accessToken);
    await storage.write(key: refreshTokenKey, value: model.refreshToken);
    await storage.write(
      key: userObjectKey,
      value: json.encode(model.userRequestModel),
    );
  }

  Future<void> deleteAll() async {
    await storage.deleteAll();
  }
}
