import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaigns_flutter/models/registration/registration_model.dart';

const _targetModel = '{"campaignId":"ID-1","noOfIndividuals":4,"address":{'
    '"address":"STAR GARAGE","id":"AD 01"},"clientReferenceId":"GUID",'
    '"dateOfRegistration":"TIMESTAMP","location":{"latitude":18.22,'
    '"longitude":71,"accuracy":8},"administrativeUnit":"SOLIMBO",'
    '"individuals":[{"name":"John Doe","dateOfBirth":"YYYYMMDD",'
    '"gender":"MALE","isHead":true,"mode":"CREATE,UPDATE,DELETE",'
    '"identifiers":[{"type":"NATIONAL_ID","identifierId":"ABCD-1212"}],'
    '"additionalFields":{"schema":"INDIVIDUAL","version":2,"fields":[{"key":'
    '"height","value":"180"}]}}],"additionalFields":{"schema":"HOUSEHOLD",'
    '"version":2,"fields":[{"key":"height","value":"180"}]},"auditDetails":{},'
    '"tenantId":"tenantA"}';

const _registrationModelKeys = [
  'campaignId',
  'tenantId',
  'noOfIndividuals',
  'address',
  'clientReferenceId',
  'dateOfRegistration',
  'location',
  'administrativeUnit',
  'individuals',
];

const _individualModelKeys = [
  'name',
  'dateOfBirth',
  'gender',
  'isHead',
  'identifiers',
];

void main() {
  group('Registration model tests:', () {
    RegistrationModel? parsedModel;

    setUpAll(() {
      final parsed = jsonDecode(_targetModel);
      if (parsed is! Map<String, dynamic>) {
        throw Exception('Expected model not found');
      }

      parsedModel = RegistrationModel.fromJson(parsed);
    });

    test('Parsed successfully', () {
      expect(parsedModel, isNot(null));
    });

    group('Has required field:', () {
      late Map<String, dynamic> jsonMap;

      setUpAll(() {
        jsonMap = parsedModel!.toJson();
      });

      for (final key in _registrationModelKeys) {
        test(key, () {
          expect(jsonMap.keys.contains(key), true);
        });
      }
    });
  });
}
