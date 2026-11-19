// T9 - RC-15: UniqueIdPoolRemoteRepository.searchWithMetadata stamps every
// returned row with the query's userUuid/deviceUuid and keeps the server's
// status (anything not ASSIGNED becomes UN_ASSIGNED). A re-fetch therefore
// hands back, as UN_ASSIGNED, any ID the server still believes is free.
import 'dart:convert';
import 'dart:typed_data';

import 'package:digit_data_model/data/repositories/package_repository/remote/unique_id_pool.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/unique_id_test_support.dart';

/// Cheapest possible Dio adapter: answers every request with one JSON body.
class _FakeAdapter implements HttpClientAdapter {
  _FakeAdapter(this.body);

  final Map<String, dynamic> body;
  RequestOptions? lastRequest;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    lastRequest = options;
    return ResponseBody.fromString(
      jsonEncode(body),
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  setUpAll(setUpUniqueIdFlow);

  test('T9: the server status is kept, the query user is stamped on every row',
      () async {
    final adapter = _FakeAdapter({
      'UniqueBeneficiaryIds': [
        {
          'id': 'SMC-0001',
          'status': 'UN_ASSIGNED',
          'userUuid': 'server-user',
          'deviceUuid': 'server-device',
        },
        {
          'id': 'SMC-0002',
          'status': 'ASSIGNED',
          'userUuid': 'server-user',
          'deviceUuid': 'server-device',
        },
        {
          'id': 'SMC-0003',
          'status': 'DISPATCHED',
          'userUuid': 'server-user',
          'deviceUuid': 'server-device',
        },
      ],
      'FetchLimit': 3,
      'TotalLimit': 300,
    });
    final dio = Dio(BaseOptions(baseUrl: 'http://localhost'))
      ..httpClientAdapter = adapter;
    final repository = UniqueIdPoolRemoteRepository(
      dio,
      actionMap: const {ApiOperation.search: '/id-gen/id/id_pool/_dispatch'},
    );

    final response = await repository.searchWithMetadata(
      UniqueIdPoolSearchModel(
        userUuid: 'U1',
        deviceUuid: 'D1',
        count: 3,
        fetchAllocatedIds: true,
      ),
    );

    expect(response.fetchLimit, 3);
    expect(response.totalLimit, 300);
    expect(response.models.map((m) => m.id), ['SMC-0001', 'SMC-0002', 'SMC-0003']);
    expect(response.models.map((m) => m.userUuid), everyElement('U1'),
        reason: 'rows carry the downloader, not the server user');
    expect(response.models.map((m) => m.deviceUuid), everyElement('D1'));
    expect(response.models[0].status, unAssigned);
    expect(response.models[1].status, assigned,
        reason: 'ASSIGNED is the only status the client keeps verbatim');
    expect(response.models[2].status, unAssigned,
        reason: 'any other server status is downgraded to UN_ASSIGNED');
    expect(response.models.map((m) => m.additionalFields), everyElement(isNull));

    // The request carried the re-fetch flag the server rule is based on.
    final sent = adapter.lastRequest!;
    expect(sent.path, '/id-gen/id/id_pool/_dispatch');
    final payload = (sent.data as Map)['IdDispatchRequest'] as Map;
    expect(payload['fetchAllocatedIds'], isTrue);
    expect(payload['userUuid'], 'U1');
    expect(payload['count'], 3);
  });

  test('T9: a body without UniqueBeneficiaryIds is an InvalidApiResponseException',
      () async {
    final dio = Dio(BaseOptions(baseUrl: 'http://localhost'))
      ..httpClientAdapter = _FakeAdapter({'Errors': []});
    final repository = UniqueIdPoolRemoteRepository(
      dio,
      actionMap: const {ApiOperation.search: '/x'},
    );

    expect(
      () => repository.searchWithMetadata(UniqueIdPoolSearchModel(userUuid: 'U1')),
      throwsA(isA<InvalidApiResponseException>()),
    );
  });
}
