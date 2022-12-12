import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/models/localization/localization_model.dart';

const _targetModel = r'''{
  "messages": [
    {
      "code": "AS",
      "message": "as",
      "module": "egov-common",
      "locale": "en_IN"
    },
    {
      "code": "NEW",
      "message": "New",
      "module": "egov-common",
      "locale": "en_IN"
    },
    {
      "code": "ACTIVE",
      "message": "Active",
      "module": "egov-common",
      "locale": "en_IN"
    }
  ]
}''';

void main() {
  group('Localization Model', () {
    Map<String, dynamic>? parsedJson;
    LocalizationModel? parsedModel;
    setUpAll(() {
      parsedJson = jsonDecode(_targetModel);
      if (parsedJson is! Map<String, dynamic>) {
        throw Exception('Expected model not found');
      }

      parsedModel = LocalizationModel.fromJson(parsedJson!);
    });

    test('is parsed successfully', () {
      expect(parsedModel, isNot(null));
    });
    test('all data from target is captured correctly', () {
      final data = parsedModel!.toJson();
      expect(data, parsedJson);
    });
  });

  group('all required fields are present', () {
    final parsedModel = LocalizationModel.fromJson(
      jsonDecode(_targetModel),
    );

    for (var element in ['messages']) {
      test('LocalizationModel contains $element', () {
        expect(parsedModel.toJson().keys.contains(element), true);
      });
    }

    final localizationMessageModel = parsedModel.messages;
    for (var b in localizationMessageModel) {
      for (var element in ['code', 'message', 'module', 'locale']) {
        test('localizationMessageModel contains $element', () {
          expect(b.toJson().keys.contains(element), true);
        });
      }
    }
  });
}
