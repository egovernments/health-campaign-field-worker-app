import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

const _targetModel = r'''{
  "apiMode": "CREATE",
  "campaignId": "ID-1",
  "numberOfIndividuals": 4,
  "address": {
    "addressText": "STAR GARAGE",
    "addressId": "AD 01"
  },
  "clientReferenceId": "GUID",
  "dateOfRegistration": 1663654179,
  "location": {
    "latitude": 18.22,
    "longitude": 71,
    "accuracy": 8
  },
  "administrativeUnit": "SOLIMBO",
  "individuals": [
    {
      "givenName": "John",
      "dateOfBirth": "YYYYMMDD",
      "gender": "MALE",
      "isHead": true,
      "mode": "CREATE,UPDATE,DELETE",
      "identifiers": [
        {
          "type": "NATIONAL_ID",
          "identifierId": "A-1212"
        }
      ],
      "additionalFields": "{\"schema\":\"INDIVIDUAL\",\"version\":2,\"fields\":[{\"key\":\"height\",\"value\":\"180\"}]}"
    }
  ],
  "additionalFields": "{\"schema\":\"HOUSEHOLD\",\"version\":2,\"fields\":[{\"key\":\"height\",\"value\":\"180\"}]}",
  "tenantId": "tenantA",
  "type": "REGISTRATION"
}''';

const requiredProperties = [
  'campaignId',
  'tenantId',
  'numberOfIndividuals',
  'address',
  'clientReferenceId',
  'dateOfRegistration',
  'location',
  'administrativeUnit',
  'individuals',
  'apiMode',
];

void main() {
  group('Registration model', () {
    // CampaignRegistrationModel? parsedModel;

    setUpAll(() {
      final parsed = jsonDecode(_targetModel);
      if (parsed is! Map<String, dynamic>) {
        throw Exception('Expected model not found');
      }

      // parsedModel = CampaignRegistrationModel.fromJson(parsed);
    });

    // test('is parsed successfully', () {
    //   expect(parsedModel, isNot(null));
    // });
    //
    // group('has required field', () {
    //   late Map<String, dynamic> jsonMap;
    //
    //   setUpAll(() {
    //     jsonMap = parsedModel!.toJson();
    //   });
    //
    //   for (final key in _requiredProperties) {
    //     test(key, () {
    //       expect(jsonMap.keys.contains(key), true);
    //     });
    //   }
    // });
  });
}
