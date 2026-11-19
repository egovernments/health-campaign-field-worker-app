import 'package:dio/dio.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/data_model.init.dart' as data_model_mappers;
import 'package:digit_data_model/models/entities/hf_referral.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/data/aefi_downsync.dart';
import 'package:mocktail/mocktail.dart';

class _MockDio extends Mock implements Dio {}

class _MockRemote extends Mock
    implements RemoteRepository<HFReferralModel, HFReferralSearchModel> {}

class _MockLocal extends Mock
    implements LocalRepository<HFReferralModel, HFReferralSearchModel> {}

const _me = 'user-me';
const _other = 'user-other';
const _project = 'project-1';

Map<String, dynamic> _referral(
  String clientReferenceId, {
  String createdBy = _me,
  String? formType = 'AEFI',
}) =>
    {
      'clientReferenceId': clientReferenceId,
      'projectId': _project,
      'symptom': 'AEFI',
      'clientAuditDetails': {'createdBy': createdBy, 'createdTime': 1},
      'additionalFields': {
        'schema': 'HFReferral',
        'version': 1,
        'fields': [
          if (formType != null) {'key': 'formType', 'value': formType},
        ],
      },
    };

void main() {
  late _MockDio dio;
  late _MockRemote remote;
  late _MockLocal local;

  /// Server pages, keyed by request offset.
  late Map<int, Map<String, dynamic>> pages;
  final requests = <Map<String, dynamic>>[];

  setUpAll(() {
    // As at app start (utils.dart), so nested models like
    // HFReferralAdditionalFields can be decoded.
    data_model_mappers.initializeMappers();
    registerFallbackValue(HFReferralSearchModel());
    registerFallbackValue(<HFReferralModel>[]);
  });

  setUp(() {
    dio = _MockDio();
    remote = _MockRemote();
    local = _MockLocal();
    requests.clear();

    when(() => remote.dio).thenReturn(dio);
    when(() => remote.searchPath).thenReturn('/hf-referral/v1/_search');
    when(() => remote.entityName).thenReturn('HFReferral');
    when(() => remote.entityNamePlural).thenReturn('HFReferrals');

    when(() => dio.post(
          any(),
          queryParameters: any(named: 'queryParameters'),
          data: any(named: 'data'),
        )).thenAnswer((invocation) async {
      final query = invocation.namedArguments[#queryParameters]
          as Map<String, dynamic>;
      requests.add({
        'query': query,
        'data': invocation.namedArguments[#data],
      });
      return Response(
        requestOptions: RequestOptions(path: '/hf-referral/v1/_search'),
        data: pages[query['offset']] ??
            {'HFReferrals': <dynamic>[], 'TotalCount': 0},
      );
    });

    when(() => local.search(any())).thenAnswer((_) async => []);
    when(() => local.bulkCreate(any())).thenAnswer((_) async {});
  });

  AefiDownsync downsync() => AefiDownsync(remote: remote, local: local);

  test('asks the server for this project\'s AEFI cases', () async {
    pages = {
      0: {'HFReferrals': <dynamic>[], 'TotalCount': 0},
    };

    await downsync().run(projectId: _project, userUuid: _me);

    final criteria = (requests.single['data'] as Map)['HFReferral'] as Map;
    expect(criteria['projectId'], _project);
    expect(criteria['symptom'], ['AEFI']);
    verifyNever(() => local.bulkCreate(any()));
  });

  test('stores only my own AEFI cases', () async {
    pages = {
      0: {
        'HFReferrals': [
          _referral('mine'),
          _referral('someone-else', createdBy: _other),
          _referral('not-aefi', formType: 'HF_REFERRAL'),
          _referral('no-form-type', formType: null),
        ],
        'TotalCount': 4,
      },
    };

    await downsync().run(projectId: _project, userUuid: _me);

    final stored = verify(() => local.bulkCreate(captureAny()))
        .captured
        .single as List<HFReferralModel>;
    expect(stored.map((e) => e.clientReferenceId), ['mine']);
  });

  test('skips cases that are already on the device', () async {
    pages = {
      0: {
        'HFReferrals': [_referral('a'), _referral('b')],
        'TotalCount': 2,
      },
    };
    when(() => local.search(any())).thenAnswer(
      (_) async => [HFReferralModel(clientReferenceId: 'a')],
    );

    await downsync().run(projectId: _project, userUuid: _me);

    final stored = verify(() => local.bulkCreate(captureAny()))
        .captured
        .single as List<HFReferralModel>;
    expect(stored.map((e) => e.clientReferenceId), ['b']);
  });

  test('reads every page', () async {
    pages = {
      0: {
        'HFReferrals': [for (var i = 0; i < 100; i++) _referral('p1-$i')],
        'TotalCount': 150,
      },
      100: {
        'HFReferrals': [for (var i = 0; i < 50; i++) _referral('p2-$i')],
        'TotalCount': 150,
      },
    };
    final progress = <int>[];

    await AefiDownsync(
      remote: remote,
      local: local,
      onProgress: progress.add,
    ).run(projectId: _project, userUuid: _me);

    expect(requests.map((r) => (r['query'] as Map)['offset']), [0, 100]);
    expect(progress, [100, 150]);
  });

  test('stops when the server does not advance with offset', () async {
    final samePage = {
      'HFReferrals': [for (var i = 0; i < 100; i++) _referral('r-$i')],
    };
    pages = {0: samePage, 100: samePage, 200: samePage};

    await downsync().run(projectId: _project, userUuid: _me);

    expect(requests.length, 2);
  });

  test('throws when the response has no HFReferrals list', () async {
    pages = {
      0: {'Errors': <dynamic>[]},
    };

    expect(
      () => downsync().run(projectId: _project, userUuid: _me),
      throwsA(isA<InvalidApiResponseException>()),
    );
  });
}
