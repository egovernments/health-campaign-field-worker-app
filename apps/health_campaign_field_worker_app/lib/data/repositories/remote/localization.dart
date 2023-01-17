import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:isar/isar.dart';

import '../../../models/localization/localization_model.dart';
import '../../local_store/no_sql/schema/localization.dart';

class LocalizationRepository {
  final Dio _client;
  final Isar _isar;

  const LocalizationRepository(
    this._client,
    this._isar,
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
    } on DioError catch (ex) {
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
    final List<LocalizationWrapper> localizationList = await _isar
        .localizationWrappers
        .filter()
        .localeEqualTo(locale)
        .findAll();

    if (localizationList.isEmpty) {
      final result = await search(
        url: path,
        queryParameters: {
          "module": module,
          "locale": locale,
          "tenantId": tenantId,
        },
      );

      final List<Localization> newLocalizationList = result.messages
          .map((e) => Localization()
            ..message = e.message
            ..code = e.code
            ..locale = e.locale
            ..module = e.module)
          .toList();

      final localizationWrapper = LocalizationWrapper()
        ..locale = locale
        ..localization = newLocalizationList;

      await _isar.writeTxn(() async {
        await _isar.localizationWrappers.put(localizationWrapper);
        // insert & update
      });
    }
  }
}
