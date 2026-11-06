import 'dart:async';

import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:dio/dio.dart';

import '../../../models/auth/auth_model.dart';

class AuthRepository {
  final Dio _client;
  final String loginPath;

  const AuthRepository(this._client, {required this.loginPath});

  Future<AuthModel> fetchAuthToken({required LoginModel loginModel}) async {
    final headers = <String, String>{
      "content-type": 'application/x-www-form-urlencoded',
      "Access-Control-Allow-Origin": "*",
      "authorization": "Basic ZWdvdi11c2VyLWNsaWVudDo=",
    };

    final formData = FormData.fromMap(loginModel.toJson());

    final encodedFormData = loginModel
        .toJson()
        .entries
        .map((e) =>
    '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value.toString())}')
        .join('&');

    final response = await _client.post(
      loginPath,
      data: encodedFormData,
      options: Options(headers: headers),
    );

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

  Future logOutUser({
    Map<String, String>? queryParameters,
    dynamic body,
    required String logoutPath,
  }) async {
    try {
      await _client.post(
        logoutPath,
        queryParameters: queryParameters,
        data: body ?? {},
      );
    } catch (error) {
      rethrow;
    }
  }

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

  Future<void> switchDeviceUserAction({
    required String endpoint,
    required UserActionModel userActionModel,
  }) async {
    if (userActionModel.tenantId == null) {
      throw ArgumentError('tenantId is required for switchDeviceUserAction');
    }
    try {
      await _client.post(
        endpoint,
        data: {
          "UserActions": [
            userActionModel.toMap(),
          ],
        },
        queryParameters: {
          "tenantId": userActionModel.tenantId!,
        },
        options: Options(headers: {
          "content-type": 'application/json',
        }),
      );
    } catch (error) {
      rethrow;
    }
  }
}
