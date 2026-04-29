import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../utils/environment_config.dart';

class NotificationTokenRepository {
  final Dio _client;

  const NotificationTokenRepository(this._client);

  Future<void> registerToken({
    required String apiEndPoint,
    required String token,
    required List<String> facilityIds,
  }) async {
    try {
      await _client.post(
        apiEndPoint,
        data: {
          "deviceTokens": [
            {
              'deviceToken': token,
              "deviceType": "ANDROID",
              "tenantId": envConfig.variables.tenantId,
              'facilityIds': facilityIds,
            }
          ]
        },
      );
    } catch (e) {
      debugPrint('NotificationTokenRepository: Failed to register token: $e');
      // Don't rethrow - token registration failure shouldn't block the flow
    }
  }

  Future<void> unregisterToken({
    required String apiEndPoint,
    required String token,
    required String userUuid,
    required String tenantId,
  }) async {
    try {
      await _client.post(
        apiEndPoint,
        data: {
          "deviceTokens": [
            {
              "deviceToken": token,
              "deviceType": "ANDROID",
              "userId": userUuid,
              "tenantId": tenantId,
            }
          ]
        },
      );
    } catch (e) {
      debugPrint('NotificationTokenRepository: Failed to unregister token: $e');
      // Don't rethrow - token unregistration failure shouldn't block the flow
    }
  }
}