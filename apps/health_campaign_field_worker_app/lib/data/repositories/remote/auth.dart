import 'dart:async';

import 'package:dio/dio.dart';

import '../../../models/auth/auth_model.dart';
import '../../../utils/environment_config.dart';
import '../../remote_client.dart';

class AuthRepository {
  final Dio _client;
  final String loginPath;

  AuthRepository({
    required this.loginPath,
    Dio? client,
  }) : _client = client ?? DioClient().dio;

  Future<AuthModel> fetchAuthToken({
    required LoginModel loginModel,
  }) async {
    final headers = <String, String>{
      "Content-Type": 'application/x-www-form-urlencoded',
      "Access-Control-Allow-Origin": "*",
      "Authorization": envConfig.variables.basicAuthToken,
    };

    final formData = FormData.fromMap(loginModel.toJson());
    final response = await _client.post(
      loginPath,
      data: formData,
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
