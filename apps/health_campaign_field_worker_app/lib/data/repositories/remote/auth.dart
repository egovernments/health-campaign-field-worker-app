import 'dart:async';

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
}
