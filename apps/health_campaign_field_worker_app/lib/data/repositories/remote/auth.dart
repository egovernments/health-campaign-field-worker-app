import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert';
import '../../../models/auth/auth_model.dart';
import '../../../utils/environment_config.dart';

class AuthRepository {
  final Dio _client;

  const AuthRepository(this._client);

  Future<AuthModel> authToken(
    String apiEndPoint,
    Map<String, String>? queryParameters,
    dynamic body,
  ) async {
    try {
      var headers = {
        "content-type": 'application/x-www-form-urlencoded',
        "Access-Control-Allow-Origin": "*",
        "authorization": "Basic ZWdvdi11c2VyLWNsaWVudDo=",
      };
      print(
        envConfig.variables.baseUrl + apiEndPoint,
      );
      var formData = FormData.fromMap(body);
      final response = await _client.post(
        apiEndPoint,
        data: formData,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      print(response);

      return AuthModel.fromJson(
        json.decode(response.toString()),
      );
    } catch (_) {
      rethrow;
    }
  }
}
