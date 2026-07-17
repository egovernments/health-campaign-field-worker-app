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

// Sample records in the real v2 response shape.
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
  group('MdmsRepository v2 native', () {
    test('searchMDMS returns flat data list from v2 response', () async {
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
      });
      final dio = Dio()..httpClientAdapter = adapter;
      final repository = MdmsRepository(dio);

      final result = await repository.searchMDMS(
        'egov-mdms-service/v2/_search',
        tenantId: 'mz',
        schemaCode: 'HCM-ADMIN-CONSOLE.targetConfigs',
      );

      // One v2 call made.
      expect(adapter.capturedRequests, hasLength(1));
      expect(
        adapter.capturedRequests.first['MdmsCriteria']['schemaCode'],
        equals('HCM-ADMIN-CONSOLE.targetConfigs'),
      );

      // Returns flat list of data objects, inactive records dropped.
      expect(result, hasLength(1));
      expect(result.first['campaignType'], 'Co-delivery');
    });

    test('searchMDMS passes filters to v2 request', () async {
      final adapter = _FakeMdmsV2Adapter({
        'HCM-ADMIN-CONSOLE.FormConfig': [
          _v2Record(
            schemaCode: 'HCM-ADMIN-CONSOLE.FormConfig',
            data: {'project': 'P-1', 'isSelected': true, 'name': 'match'},
          ),
        ],
      });
      final dio = Dio()..httpClientAdapter = adapter;
      final repository = MdmsRepository(dio);

      final result = await repository.searchMDMS(
        'egov-mdms-service/v2/_search',
        tenantId: 'mz',
        schemaCode: 'HCM-ADMIN-CONSOLE.FormConfig',
        filters: {'project': 'P-1'},
      );

      // Verify filters were sent in the request.
      expect(
        adapter.capturedRequests.first['MdmsCriteria']['filters'],
        equals({'project': 'P-1'}),
      );

      expect(result, hasLength(1));
      expect(result.first['name'], 'match');
    });

    test('parses service registry wrapper from v2 response', () async {
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
        'mz',
      );

      final registry = result.serviceRegistry?.serviceRegistryList;
      expect(registry, hasLength(1));
      expect(registry!.first.service, 'Project');
      expect(registry.first.actions.first.path, '/project/v1/_search');
    });

    test('searchProjectType parses v2 response', () async {
      final adapter = _FakeMdmsV2Adapter({
        'HCM-PROJECT-TYPES.projectTypes': [
          _v2Record(
            schemaCode: 'HCM-PROJECT-TYPES.projectTypes',
            data: {
              'id': 'pt-1',
              'code': 'LLIN',
              'name': 'LLIN Distribution',
              'group': 'MALARIA',
              'beneficiaryType': 'HOUSEHOLD',
            },
          ),
        ],
      });
      final dio = Dio()..httpClientAdapter = adapter;
      final repository = MdmsRepository(dio);

      final result = await repository.searchProjectType(
        'egov-mdms-service/v2/_search',
        'mz',
      );

      final types = result.projectTypeWrapper?.projectTypes;
      expect(types, hasLength(1));
      expect(types!.first.code, 'LLIN');
    });
  });
}
