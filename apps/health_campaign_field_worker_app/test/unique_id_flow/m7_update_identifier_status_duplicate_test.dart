// T7 - RC-03: UPDATE_IDENTIFIER_STATUS must never hand out a pool ID twice.
//
// Before the fix the executor searched the pool by id only and set the row to
// ASSIGNED again even when it already was, so a stale ID from the search
// screen was saved on a second beneficiary (reproduced on a device on
// 2026-10-30: two heads with 237163841167). These tests pin the fixed
// behaviour: the ID is re-checked at save time and replaced when stale.
import 'package:digit_data_model/data_model.dart';
import 'package:digit_flow_builder/action_handler/action_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/executors/update_identifier_status_executor.dart';
import 'package:mocktail/mocktail.dart';

import 'support/unique_id_test_support.dart';

/// Answers pool searches like the local repository: by id, or by status+user.
void stubPool(MockUniqueIdPoolRepo repo, List<UniqueIdPoolModel> rows) {
  when(() => repo.search(any())).thenAnswer((invocation) async {
    final q = invocation.positionalArguments.first as UniqueIdPoolSearchModel;
    return rows
        .where((r) =>
            (q.id == null || r.id == q.id) &&
            (q.status == null || r.status == q.status) &&
            (q.userUuid == null || r.userUuid == q.userUuid))
        .toList();
  });
}

List<IdentifierModel> savedIdentifiers(Map<String, dynamic> result) =>
    (result['entities'] as List)
        .whereType<IndividualModel>()
        .expand((i) => i.identifiers ?? <IdentifierModel>[])
        .toList();

void main() {
  final action = ActionConfig(
      action: '', actionType: 'UPDATE_IDENTIFIER_STATUS', properties: const {});

  late MockUniqueIdPoolRepo repo;

  setUpAll(setUpUniqueIdFlow);
  setUp(() {
    resetRegistry();
    setSingleton(userUuid: 'U1');
    repo = MockUniqueIdPoolRepo();
    when(() => repo.update(any())).thenAnswer((_) async {});
  });
  tearDown(() {
    resetRegistry();
    resetSingleton();
  });

  List<UniqueIdPoolModel> updatedRows() => verify(() => repo.update(captureAny()))
      .captured
      .cast<UniqueIdPoolModel>()
      .toList();

  testWidgets('T7: a free ID owned by the user is kept and marked ASSIGNED',
      (tester) async {
    stubPool(repo, [poolRow('SMC-0001')]);
    final context = await pumpContext(tester, repo: repo);

    final result = await UpdateIdentifierStatusExecutor().execute(action, context,
        {'entities': [individualWith(identifierId: 'SMC-0001')]});

    expect(savedIdentifiers(result).single.identifierId, 'SMC-0001');
    final updated = updatedRows().single;
    expect(updated.id, 'SMC-0001');
    expect(updated.status, assigned);
    expect(updated.clientAuditDetails?.lastModifiedBy, 'U1');
  });

  testWidgets('T7: an already ASSIGNED ID is replaced by the next free ID',
      (tester) async {
    stubPool(repo, [
      poolRow('SMC-0001', status: assigned),
      poolRow('SMC-0003', createdTime: 3000),
      poolRow('SMC-0002', createdTime: 2000),
    ]);
    final context = await pumpContext(tester, repo: repo);

    final result = await UpdateIdentifierStatusExecutor().execute(action, context,
        {'entities': [individualWith(identifierId: 'SMC-0001')]});

    final saved = savedIdentifiers(result).single;
    expect(saved.identifierType, 'UNIQUE_BENEFICIARY_ID');
    expect(saved.identifierId, 'SMC-0002', reason: 'oldest free ID wins');
    expect(updatedRows().map((r) => r.id), ['SMC-0002'],
        reason: 'the used row is not touched again');
  });

  testWidgets('T7: an ID owned by another user is replaced', (tester) async {
    stubPool(repo, [
      poolRow('SMC-9001', userUuid: 'U9'),
      poolRow('SMC-0001'),
    ]);
    final context = await pumpContext(tester, repo: repo);

    final result = await UpdateIdentifierStatusExecutor().execute(action, context,
        {'entities': [individualWith(identifierId: 'SMC-9001')]});

    expect(savedIdentifiers(result).single.identifierId, 'SMC-0001');
    expect(updatedRows().single.userUuid, 'U1');
  });

  testWidgets('T7: a stale ID with an empty pool becomes DEFAULT, not a duplicate',
      (tester) async {
    stubPool(repo, [poolRow('SMC-0001', status: assigned)]);
    final context = await pumpContext(tester, repo: repo);

    final result = await UpdateIdentifierStatusExecutor().execute(action, context,
        {'entities': [individualWith(identifierId: 'SMC-0001')]});

    final saved = savedIdentifiers(result).single;
    expect(saved.identifierType, 'DEFAULT');
    expect(saved.identifierId, isNot('SMC-0001'));
    verifyNever(() => repo.update(any()));
  });

  testWidgets('T7: two individuals in one save never share an ID',
      (tester) async {
    stubPool(repo, [
      poolRow('SMC-0001', createdTime: 1000),
      poolRow('SMC-0002', createdTime: 2000),
    ]);
    final context = await pumpContext(tester, repo: repo);

    final result = await UpdateIdentifierStatusExecutor().execute(action, context, {
      'entities': [
        individualWith(identifierId: 'SMC-0001', clientReferenceId: 'ind-1'),
        individualWith(identifierId: 'SMC-0001', clientReferenceId: 'ind-2'),
      ],
    });

    expect(savedIdentifiers(result).map((i) => i.identifierId),
        ['SMC-0001', 'SMC-0002']);
    expect(updatedRows().map((r) => r.id).toSet(), {'SMC-0001', 'SMC-0002'});
  });

  testWidgets('T7: a DEFAULT identifier is upgraded when a free ID exists',
      (tester) async {
    stubPool(repo, [poolRow('SMC-0001')]);
    final context = await pumpContext(tester, repo: repo);

    final result = await UpdateIdentifierStatusExecutor().execute(action, context, {
      'entities': [
        individualWith(identifierType: 'DEFAULT', identifierId: 'some-uuid')
      ],
    });

    final saved = savedIdentifiers(result).single;
    expect(saved.identifierType, 'UNIQUE_BENEFICIARY_ID');
    expect(saved.identifierId, 'SMC-0001');
    expect(updatedRows().single.status, assigned);
  });

  testWidgets('T7: upgradeDefault false keeps a DEFAULT identifier',
      (tester) async {
    stubPool(repo, [poolRow('SMC-0001')]);
    final context = await pumpContext(tester, repo: repo);
    final noUpgrade = ActionConfig(
        action: '',
        actionType: 'UPDATE_IDENTIFIER_STATUS',
        properties: const {'upgradeDefault': false});

    final input = {
      'entities': [
        individualWith(identifierType: 'DEFAULT', identifierId: 'some-uuid')
      ],
    };
    final result =
        await UpdateIdentifierStatusExecutor().execute(noUpgrade, context, input);

    expect(identical(result, input), isTrue);
    verifyNever(() => repo.update(any()));
  });

  testWidgets('T7: a DEFAULT identifier with an empty pool is left alone',
      (tester) async {
    stubPool(repo, []);
    final context = await pumpContext(tester, repo: repo);

    final input = {
      'entities': [
        individualWith(identifierType: 'DEFAULT', identifierId: 'some-uuid')
      ],
    };
    final result =
        await UpdateIdentifierStatusExecutor().execute(action, context, input);

    expect(savedIdentifiers(result).single.identifierId, 'some-uuid');
    verifyNever(() => repo.update(any()));
  });

  testWidgets('T7: an ID not in the local pool is left alone', (tester) async {
    stubPool(repo, [poolRow('SMC-0001')]);
    final context = await pumpContext(tester, repo: repo);

    final result = await UpdateIdentifierStatusExecutor().execute(action, context,
        {'entities': [individualWith(identifierId: 'SMC-404')]});

    expect(savedIdentifiers(result).single.identifierId, 'SMC-404');
    verifyNever(() => repo.update(any()));
  });

  testWidgets('T7: an empty identifierId is skipped', (tester) async {
    stubPool(repo, []);
    final context = await pumpContext(tester, repo: repo);

    await UpdateIdentifierStatusExecutor().execute(action, context, {
      'entities': [individualWith(identifierId: '')],
    });

    verifyNever(() => repo.update(any()));
  });
}
