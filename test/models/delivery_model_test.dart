import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaigns_flutter/models/delivery/delivery_model.dart';

const _targetModel = r'''{
    "campaignId": "ID-1",
    "registrationId": "R-ID-1",
    "resources": [
        {
            "resourceId": "GUID",
            "quantityToBeDelivered": 4,
            "quantityDelivered": 2,
            "reasonIfNotDelivered": "",
            "isDelivered":true 
        }
    ],
    "deliveryDate": 1663654179,
    "deliveredBy": "UUID",
    "status":"DELIVERED",
    "clientReferenceId":"GUID",
    "tenantId":"tenantA",
    "additionalFields": "{\"schema\":\"DELIVERY\",\"version\":2,\"fields\":[{\"key\":\"height\",\"value\":\"180\"}]}",
    "type": "DELIVERY",
    "apiMode": "CREATE"
}''';

const _requiredProperties = [
  'campaignId',
  'registrationId',
  'resources',
  'deliveryDate',
  'deliveredBy',
  'status',
  'clientReferenceId',
  'tenantId',
  'apiMode',
];

void main() {
  group('Delivery model', () {
    DeliveryModel? parsedModel;

    setUpAll(() {
      final parsed = jsonDecode(_targetModel);
      if (parsed is! Map<String, dynamic>) {
        throw Exception('Expected model not found');
      }

      parsedModel = DeliveryModel.fromJson(parsed);
    });

    test('is parsed successfully', () {
      expect(parsedModel, isNot(null));
    });

    group('has required field', () {
      late Map<String, dynamic> jsonMap;

      setUpAll(() {
        jsonMap = parsedModel!.toJson();
      });

      for (final key in _requiredProperties) {
        test(key, () {
          expect(jsonMap.keys.contains(key), true);
        });
      }
    });
  });
}
