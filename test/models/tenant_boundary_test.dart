import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaigns_flutter/models/tenant_boundary/tenant_boundary_model.dart';

const _targetModel = r'''{
  "TenantBoundary": [
    {
      "hierarchyType": {
        "id": null,
        "name": "REVENUE",
        "code": "REVENUE",
        "localName": null,
        "tenantId": null,
        "createdBy": null,
        "createdDate": null,
        "lastModifiedBy": null,
        "lastModifiedDate": null,
        "version": 0,
        "new": false
      },
      "boundary": [
        {
          "code": "WARD1",
          "name": "Lodhipur",
          "label": "Locality",
          "latitude": null,
          "longitude": null,
          "area": null,
          "pincode": null,
          "boundaryNum": 1,
          "children": []
        }
      ],
      "tenantId": "pb.lodhipur"
    }
  ]
}''';

const _requiredProperties = [];
void main() {
  group('Tenant Boundary model', () {
    TenantBoundaryModel? parsedModel;

    setUpAll(() {
      final parsed = jsonDecode(_targetModel);
      if (parsed is! Map<String, dynamic>) {
        throw Exception('Expected model not found');
      }

      parsedModel = TenantBoundaryModel.fromJson(parsed);
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
