import 'dart:async';
import 'dart:convert';
import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';

import '../../../models/localization/localization_model.dart';
import '../../local_store/no_sql/schema/localization.dart';

class LocalizationRepository {
  final Dio _client;
  final LocalSqlDataStore _sql;

  const LocalizationRepository(
    this._client,
    this._sql,
  );

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
    } on DioError catch (_) {
      // Assuming there will be an errorMessage property in the JSON object
      rethrow;
    }
  }

  Future loadLocalization({
    required String path,
    required String locale,
    required String module,
    required String tenantId,
  }) async {
    List<Localization> localizationList = [];

    final query = _sql.select(_sql.localization).join([])
      ..where(
        buildAnd([
          _sql.localization.locale.equals(locale),
        ]),
      );

    final results = await query.get();

    localizationList = results.map((e) {
      final data = e.readTableOrNull(_sql.localization);
      return Localization()
        ..code = data!.code
        ..locale = data.locale
        ..module = data.module
        ..message = data.message;
    }).toList();

    if (localizationList.isEmpty) {
      final result = await search(
        url: path,
        queryParameters: {
          "module": module,
          "locale": locale,
          "tenantId": tenantId,
        },
      );
      await _sql.batch((batch) {
        batch.insertAll(
            _sql.localization,
            result.messages
                .map((e) => LocalizationCompanion(
                      code: Value(e.code),
                      locale: Value(e.locale),
                      message: Value(e.message),
                      module: Value(e.module),
                    ))
                .toList());
      });
    }
  }
}
