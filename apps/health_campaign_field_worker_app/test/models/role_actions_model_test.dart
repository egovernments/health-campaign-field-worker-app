import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/models/role_actions/role_actions_model.dart';

const _targetModel = r'''{
  "tenantId": "mz",
  "moduleName": "ACCESSCONTROL-ROLEACTIONS",
  "roleactions": [
    {
      "rolecode": "EMPLOYEE",
      "actionid": 8001,
      "actioncode": "",
      "tenantId": "mz"
    }
  ]
}''';

void main() {
  group('RoleActions Model', () {
    Map<String, dynamic>? parsedJson;
    RoleActionsWrapperModel? parsedModel;
    setUpAll(() {
      parsedJson = jsonDecode(_targetModel);
      if (parsedJson is! Map<String, dynamic>) {
        throw Exception('Expected model not found');
      }

      parsedModel = RoleActionsWrapperModel.fromJson(parsedJson!);
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
    final parsedModel = RoleActionsWrapperModel.fromJson(
      jsonDecode(_targetModel),
    );

    for (var element in ['tenantId', 'moduleName', 'roleactions']) {
      test('RoleActions wrapper contains $element', () {
        expect(parsedModel.toJson().keys.contains(element), true);
      });
    }

    final roleactionsModel = parsedModel.roleActions;
    for (var b in roleactionsModel) {
      for (var element in ['rolecode', 'actionid', 'actioncode', 'tenantId']) {
        test('RoleActions model contains $element', () {
          expect(b.toJson().keys.contains(element), true);
        });
      }
    }
  });
}
