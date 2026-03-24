import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

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
        data: [{
          'deviceToken': token,
          "deviceType": "ANDROID",
          "tenantId": "ba",
          'facilityId': facilityIds.first,
        }],
      );
    } catch (e) {
      debugPrint('NotificationTokenRepository: Failed to register token: $e');
      // Don't rethrow - token registration failure shouldn't block the flow
    }
  }
}
