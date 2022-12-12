import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/models/roles/roles_model.dart';

const _targetModel = r'''{
  "tenantId": "mz",
  "moduleName": "ACCESSCONTROL-ROLES",
  "roles": [
    {
      "code": "EMPLOYEE",
      "name": "Field worker",
      "description": "Field worker who can register an entity"
    }
  ]
}''';

void main() {
  group('Roles Model', () {
    Map<String, dynamic>? parsedJson;
    RolesWrapperModel? parsedModel;
    setUpAll(() {
      parsedJson = jsonDecode(_targetModel);
      if (parsedJson is! Map<String, dynamic>) {
        throw Exception('Expected model not found');
      }

      parsedModel = RolesWrapperModel.fromJson(parsedJson!);
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
    final parsedModel = RolesWrapperModel.fromJson(
      jsonDecode(_targetModel),
    );

    for (var element in ['tenantId', 'moduleName', 'roles']) {
      test('Roles wrapper contains $element', () {
        expect(parsedModel.toJson().keys.contains(element), true);
      });
    }

    final rolesModel = parsedModel.roles;
    for (var b in rolesModel) {
      for (var element in ['code', 'name']) {
        test('Roles model contains $element', () {
          expect(b.toJson().keys.contains(element), true);
        });
      }
    }
  });
}
