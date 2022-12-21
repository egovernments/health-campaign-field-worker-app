// ignore_for_file: avoid_dynamic_calls

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../models/mdms/service_registry/service_registry_model.dart';

class LocalizationRepository {
  final Dio _client;
  LocalizationRepository(this._client);
  Future<void> search() async {
    try {
      final response = await _client.post(
        'egov-mdms-service/v1/_search',
      );

      json.decode(response.toString());
    } on DioError catch (ex) {
      // Assuming there will be an errorMessage property in the JSON object
      throw Exception(ex);
    }
  }
}
