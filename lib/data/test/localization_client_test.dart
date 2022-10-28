// ignore_for_file: depend_on_referenced_packages
import 'package:health_campaigns_flutter/data/remote/localization_client.dart';
import 'package:health_campaigns_flutter/models/localization/localization_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockLocalizationClient extends Mock implements LocalizationClient {}

class FakeLocalization extends Fake implements LocalizationModel {}

void main() {
  group('get localization messages', () {
    MockLocalizationClient localizationClient = MockLocalizationClient();
    test('should perform a GET request on /search', () async {
      when(() => localizationClient.search('mgramseva-common', 'pn_IN', 'mz'))
          .thenAnswer((invocation) async => LocalizationModel.fromJson({
                "messages": [
                  {
                    "code": " as ",
                    "message": " ਜਿਵੇਂ ",
                    "module": "mgramseva-common",
                    "locale": "pn_IN",
                  },
                ],
              }));
      final res =
          await localizationClient.search('mgramseva-common', 'pn_IN', 'mz');
      expect(res, isA<LocalizationModel>());
    });

    test('test fetchData throws Exception', () {
      when(() => localizationClient.search('mgramseva-common', 'pn_IN', 'mz'))
          .thenAnswer((_) async {
        throw Exception();
      });

      final res = localizationClient.search('mgramseva-common', 'pn_IN', 'mz');
      expect(res, throwsException);
    });
  });
}

Future<LocalizationModel> async() async {
  return FakeLocalization();
}
