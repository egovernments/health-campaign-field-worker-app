import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/models/tenant_boundary/tenant_boundary_model.dart';

const _targetModel = r'''
{
  "tenantId": "mz",
  "moduleName": "egov-location",
  "TenantBoundary": [
    {
      "hierarchyType": {
        "code": "ADMINISTRATIVE",
        "name": "ADMINISTRATIVE"
      },
      "boundary": {
        "id": "6e4751cd-3da0-44bb-9b17-cc9e3ae2b6df",
        "boundaryNum": 1,
        "name": "Mozambique",
        "localname": "Moçambique",
        "longitude": null,
        "latitude": null,
        "label": "Country",
        "code": "mz",
        "children": [
          {
            "id": "03fecd81-7184-4dd8-adb4-56014f2adb9d",
            "boundaryNum": 1,
            "name": "Nampula",
            "localname": "Nampula",
            "longitude": null,
            "latitude": null,
            "label": "Nampula Province",
            "code": "mz.nampula",
            "children": [
              {
                "id": "10680eb5-10e7-4701-b891-a5223410fece",
                "boundaryNum": 1,
                "name": "Memba",
                "localname": "Memba",
                "longitude": null,
                "latitude": null,
                "label": "Memba District",
                "code": "mz.nampula.memba",
                "children": [
                  {
                    "id": "1eddefc3-1c21-4921-bb20-56728d8421de",
                    "boundaryNum": 1,
                    "name": "Mazua",
                    "localname": "Mazua",
                    "longitude": null,
                    "latitude": null,
                    "label": "Mazua Administrative Post",
                    "code": "mz.nampula.memba.mazua",
                    "children": [
                      {
                        "id": "392f8465-5e9b-41ee-bbaa-65ef9414dc52",
                        "boundaryNum": 1,
                        "name": "Cava",
                        "localname": "Cava",
                        "longitude": null,
                        "latitude": null,
                        "label": "Cava Locality",
                        "code": "mz.nampula.memba.mazua.cava",
                        "children": [
                          {
                            "id": "1f5a6691-c86e-40a3-a0ba-420e7117f597",
                            "boundaryNum": 1,
                            "name": "Napita",
                            "localname": "Napita",
                            "longitude": null,
                            "latitude": null,
                            "label": "Napita Village",
                            "code": "mz.nampula.memba.mazua.cava.napita"
                          }
                        ]
                      }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      }
    }
  ]
}
''';

void main() {
  group('Tenant boundary', () {
    Map<String, dynamic>? parsedJson;
    TargetBoundaryWrapperModel? parsedModel;

    setUpAll(() {
      parsedJson = jsonDecode(_targetModel);
      if (parsedJson is! Map<String, dynamic>) {
        throw Exception('Expected model not found');
      }

      parsedModel = TargetBoundaryWrapperModel.fromJson(parsedJson!);
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
    final parsedModel = TargetBoundaryWrapperModel.fromJson(
      jsonDecode(_targetModel),
    );

    for (var element in ['tenantId', 'moduleName', 'TenantBoundary']) {
      test('Boundary wrapper contains $element', () {
        expect(parsedModel.toJson().keys.contains(element), true);
      });
    }

    final boundaryModel = parsedModel.boundaries;
    boundaryModel?.forEach((b) {
      for (var element in ['hierarchyType', 'boundary']) {
        test('Boundary model contains $element', () {
          expect(b.toJson().keys.contains(element), true);
        });
      }

      final boundary = b.boundary;
      final hierarchy = b.hierarchyType;

      for (var element in [
        'boundaryNum',
        'name',
        'label',
        'code',
        'localname',
      ]) {
        test('boundaryModelContains $element', () {
          expect(boundary.toJson().keys.contains(element), true);
        });
      }

      for (var element in [
        'name',
        'code',
      ]) {
        test('hierarchy Model Contains $element', () {
          expect(hierarchy.toJson().keys.contains(element), true);
        });
      }
    });
  });
}
