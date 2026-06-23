import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/data/repositories/remote/mdms.dart';

/// Stub adapter that records every request body and replies with a
/// canned MDMS v2 response per schemaCode.
class _FakeMdmsV2Adapter implements HttpClientAdapter {
  final Map<String, List<Map<String, dynamic>>> responsesBySchemaCode;
  final List<Map<String, dynamic>> capturedRequests = [];

  _FakeMdmsV2Adapter(this.responsesBySchemaCode);

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final body = options.data is String
        ? json.decode(options.data as String) as Map<String, dynamic>
        : Map<String, dynamic>.from(options.data as Map);
    capturedRequests.add(body);

    final schemaCode = body['MdmsCriteria']?['schemaCode'] as String?;
    final mdms = responsesBySchemaCode[schemaCode] ?? [];

    return ResponseBody.fromString(
      json.encode({'mdms': mdms}),
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

// Sample records in the real v2 response shape shared from
// unified-dev (HCM-ADMIN-CONSOLE.targetConfigs).
Map<String, dynamic> _v2Record({
  required String schemaCode,
  required Map<String, dynamic> data,
  bool isActive = true,
}) =>
    {
      'id': '1de5e08b-2a77-4e33-ba8f-b5c54320380a',
      'tenantId': 'dev',
      'schemaCode': schemaCode,
      'uniqueIdentifier': 'x',
      'data': data,
      'isActive': isActive,
      'auditDetails': {'createdBy': 'u', 'createdTime': 1777464224724},
    };

void main() {
  group('MdmsRepository v2 adapter', () {
    test('reassembles flat v2 mdms list into v1 MdmsRes nesting', () async {
      final adapter = _FakeMdmsV2Adapter({
        'HCM-ADMIN-CONSOLE.targetConfigs': [
          _v2Record(
            schemaCode: 'HCM-ADMIN-CONSOLE.targetConfigs',
            data: {'campaignType': 'Co-delivery'},
          ),
          _v2Record(
            schemaCode: 'HCM-ADMIN-CONSOLE.targetConfigs',
            data: {'campaignType': 'Inactive-one'},
            isActive: false,
          ),
        ],
        'common-masters.GenderType': [
          _v2Record(
            schemaCode: 'common-masters.GenderType',
            data: {'code': 'MALE', 'name': 'Male'},
          ),
        ],
      });
      final dio = Dio()..httpClientAdapter = adapter;
      final repository = MdmsRepository(dio);

      final result = await repository.searchMDMS(
        'egov-mdms-service/v2/_search',
        {
          'MdmsCriteria': {
            'tenantId': 'mz',
            'moduleDetails': [
              {
                'moduleName': 'HCM-ADMIN-CONSOLE',
                'masterDetails': [
                  {'name': 'targetConfigs'},
                ],
              },
              {
                'moduleName': 'common-masters',
                'masterDetails': [
                  {'name': 'GenderType'},
                ],
              },
            ],
          },
        },
      );

      // One v2 call per module.master schemaCode.
      expect(adapter.capturedRequests, hasLength(2));
      expect(
        adapter.capturedRequests.first['MdmsCriteria'],
        equals({
          'tenantId': 'mz',
          'schemaCode': 'HCM-ADMIN-CONSOLE.targetConfigs',
          'limit': 2000,
        }),
      );

      // v1-shaped nesting, inactive records dropped.
      final targetConfigs = result['HCM-ADMIN-CONSOLE']['targetConfigs'];
      expect(targetConfigs, hasLength(1));
      expect(targetConfigs.first['campaignType'], 'Co-delivery');
      expect(
        result['common-masters']['GenderType'].first['code'],
        'MALE',
      );
    });

    test('applies v1 JSONPath filter client-side', () async {
      final adapter = _FakeMdmsV2Adapter({
        'HCM-ADMIN-CONSOLE.FormConfig': [
          _v2Record(
            schemaCode: 'HCM-ADMIN-CONSOLE.FormConfig',
            data: {'project': 'P-1', 'isSelected': true, 'name': 'match'},
          ),
          _v2Record(
            schemaCode: 'HCM-ADMIN-CONSOLE.FormConfig',
            data: {'project': 'P-1', 'isSelected': false, 'name': 'no-1'},
          ),
          _v2Record(
            schemaCode: 'HCM-ADMIN-CONSOLE.FormConfig',
            data: {'project': 'P-2', 'isSelected': true, 'name': 'no-2'},
          ),
        ],
      });
      final dio = Dio()..httpClientAdapter = adapter;
      final repository = MdmsRepository(dio);

      final result = await repository.searchMDMS(
        'egov-mdms-service/v2/_search',
        {
          'MdmsCriteria': {
            'tenantId': 'mz',
            'moduleDetails': [
              {
                'moduleName': 'HCM-ADMIN-CONSOLE',
                'masterDetails': [
                  {
                    'name': 'FormConfig',
                    'filter': "[?(@.project=='P-1' && @.isSelected==true)]",
                  },
                ],
              },
            ],
          },
        },
      );

      final formConfigs = result['HCM-ADMIN-CONSOLE']['FormConfig'];
      expect(formConfigs, hasLength(1));
      expect(formConfigs.first['name'], 'match');
    });

    test('parses service registry wrapper from reassembled response',
        () async {
      final adapter = _FakeMdmsV2Adapter({
        'HCM-SERVICE-REGISTRY.serviceRegistry': [
          _v2Record(
            schemaCode: 'HCM-SERVICE-REGISTRY.serviceRegistry',
            data: {
              'service': 'Project',
              'actions': [
                {
                  'entityName': 'Project',
                  'path': '/project/v1/_search',
                  'action': 'search',
                },
              ],
            },
          ),
        ],
      });
      final dio = Dio()..httpClientAdapter = adapter;
      final repository = MdmsRepository(dio);

      final result = await repository.searchServiceRegistry(
        'egov-mdms-service/v2/_search',
        {
          'MdmsCriteria': {
            'tenantId': 'mz',
            'moduleDetails': [
              {
                'moduleName': 'HCM-SERVICE-REGISTRY',
                'masterDetails': [
                  {'name': 'serviceRegistry'},
                ],
              },
            ],
          },
        },
      );

      final registry = result.serviceRegistry?.serviceRegistryList;
      expect(registry, hasLength(1));
      expect(registry!.first.service, 'Project');
      expect(registry.first.actions.first.path, '/project/v1/_search');
    });
  });
}
