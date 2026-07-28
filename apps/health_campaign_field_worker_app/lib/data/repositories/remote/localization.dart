import 'dart:async';
import 'dart:convert';
import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';

import '../../../models/localization/localization_model.dart';
import '../../local_store/no_sql/schema/localization.dart';
import '../local/localization.dart';

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
    } on DioException catch (_) {
      // Assuming there will be an errorMessage property in the JSON object
      rethrow;
    }
  }

  /// Approximate cap for the `codes` query parameter, in characters. Kept
  /// well under the ~8 KB request-line ceiling most reverse proxies impose
  /// on HTTP/1.1 URLs so a large boundary set doesn't 414-out before
  /// reaching the localization service.
  static const int _maxCodesQueryLength = 2000;

  Future loadLocalization({
    required String path,
    required String locale,
    required String module,
    required String tenantId,
    String? codes,
  }) async {
    // No codes filter → single unfiltered request, unchanged behaviour.
    if (codes == null || codes.isEmpty) {
      final results = await search(
        url: path,
        queryParameters: {
          "module": module,
          "locale": locale,
          "tenantId": tenantId,
        },
      );
      return _companionsFrom(results.messages);
    }

    // Chunk the codes so no single URL exceeds the request-line ceiling.
    // Boundary syncs can join thousands of comma-separated codes here.
    final chunks = _chunkCodes(codes, _maxCodesQueryLength);
    final aggregated = <dynamic>[];
    for (final chunk in chunks) {
      final results = await search(
        url: path,
        queryParameters: {
          "module": module,
          "locale": locale,
          "tenantId": tenantId,
          "codes": chunk,
        },
      );
      aggregated.addAll(results.messages);
    }
    return _companionsFrom(aggregated);
  }

  static List<String> _chunkCodes(String codes, int maxLength) {
    if (codes.length <= maxLength) return [codes];
    final parts = codes.split(',').where((s) => s.isNotEmpty).toList();
    if (parts.isEmpty) return [codes];
    final chunks = <String>[];
    final buf = StringBuffer();
    for (final code in parts) {
      // +1 accounts for the joining comma; when adding the first token to
      // an empty buffer no comma is prepended so the +1 is a safe cushion.
      final projected = buf.isEmpty ? code.length : buf.length + 1 + code.length;
      if (projected > maxLength && buf.isNotEmpty) {
        chunks.add(buf.toString());
        buf.clear();
      }
      if (buf.isNotEmpty) buf.write(',');
      buf.write(code);
    }
    if (buf.isNotEmpty) chunks.add(buf.toString());
    return chunks;
  }

  static List<LocalizationCompanion> _companionsFrom(Iterable messages) {
    return messages
        .map<LocalizationCompanion>((e) => LocalizationCompanion(
              code: Value(e.code),
              locale: Value(e.locale),
              message: Value(e.message),
              module: Value(e.module),
            ))
        .toList();
  }
}
