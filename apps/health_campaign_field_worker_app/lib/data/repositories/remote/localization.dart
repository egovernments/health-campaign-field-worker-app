import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

class LocalizationRepository {
  final Dio _client;
  LocalizationRepository(this._client);
  Future<Map<String, dynamic>> search() async {
    try {
      final response = await _client.post('egov-mdms-service/v1/_search');
      print(response);

      return json.decode(response.toString());
    } on DioError catch (ex) {
      // Assuming there will be an errorMessage property in the JSON object
      throw Exception(ex);
    }
  }
}
