import 'package:dio/dio.dart';

import '../../../models/auth/auth_model.dart';

class ValidateRepository {
  final Dio _client;

  ValidateRepository(this._client);

  Future<ValidateResponseModel> isLoggedInOnOtherDevice({
    required String endpoint,
    required Map<String, dynamic> payload,
  }) async {
    final response = await _client.post(endpoint, data: payload);
    final data = response.data;
    if (data is! Map<String, dynamic>) {
      throw Exception('Invalid response');
    }

    try {
      return ValidateResponseModel.fromJson(data);
    } catch (error) {
      rethrow;
    }
  }
}

// creata a Repository class for Switching Device with API call to switch device and pass reason for switching device
class DeviceSwitchRepository {
  final Dio _client;

  DeviceSwitchRepository(this._client);

  Future<AuthModel> switchDevice({
    required String endpoint,
    required Map<String, dynamic> payload,
  }) async {
    final response = await _client.post(endpoint, data: payload);

    final data = response.data;
    if (data is! Map<String, dynamic>) {
      throw Exception('Invalid response');
    }

    try {
      return AuthModel.fromJson(data);
    } catch (error) {
      rethrow;
    }
  }
}
