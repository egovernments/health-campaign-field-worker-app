import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../models/localization/localization_model.dart';

class LocalizationRepository {
  final Dio _client;

  const LocalizationRepository(this._client);

  Future<LocalizationModel> search({
    required Map<String, String> queryParameters,
    required String url,
  }) async {
    try {
      final response = await _client.post(
        url,
        queryParameters: queryParameters,
        data: {},
      );

      return LocalizationModel.fromJson(
        json.decode(response.toString()),
      );
    } on DioError catch (ex) {
      // Assuming there will be an errorMessage property in the JSON object
      rethrow;
    }
  }
}
