// ignore_for_file: depend_on_referenced_packages,
import 'package:health_campaigns_flutter/data/remote/localization_client.dart';
import 'package:health_campaigns_flutter/models/localization/localization_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:health_campaigns_flutter/utils/env.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

// ignore: long-method
void main() {
  group('get localization messages', () {
    final dio = Dio();

    final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    final restClient = LocalizationClient(
      dio,
      baseUrl: '${EvnironmentVariables.baseUrl}localization/messages/v1',
    );

    setUpAll(() {
      dio.httpClientAdapter = dioAdapter;
    });
    test(
      'Mocks Retrofit client POST request as defined',
      () async {
        dioAdapter.onPost(
          '/_search?',
          (request) => request.reply(
            200,
            {
              "messages": [
                {
                  "code": " as ",
                  "message": " ਜਿਵੇਂ ",
                  "module": "egov-common",
                  "locale": "pn_IN",
                },
              ],
            },
          ),
          queryParameters: {
            'module': 'egov-common',
            'local': 'pn_IN',
            'tenantId': 'mz',
          },
          data: {},
        );

        final response = await restClient.search('egov-common', 'pn_IN', 'mz');
        expect(
          response,
          LocalizationModel.fromJson(
            {
              "messages": [
                {
                  "code": " as ",
                  "message": " ਜਿਵੇਂ ",
                  "module": "egov-common",
                  "locale": "pn_IN",
                },
              ],
            },
          ),
        );
      },
    );
  });
}
