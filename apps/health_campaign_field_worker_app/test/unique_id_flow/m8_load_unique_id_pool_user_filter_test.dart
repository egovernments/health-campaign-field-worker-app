// T8 (extends T5) - DS-01 / RC-05: the loader filters by the logged-in
// user's uuid. On a shared device, rows downloaded by U1 are invisible to U2:
// the count is 0 and latestBeneficiaryId is null, which is what the popup
// reads.
import 'package:digit_data_model/data_model.dart';
import 'package:digit_flow_builder/action_handler/action_config.dart';
import 'package:digit_flow_builder/blocs/flow_crud_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_campaign_field_worker_app/executors/load_unique_id_pool_executor.dart';
import 'package:mocktail/mocktail.dart';

import 'support/unique_id_test_support.dart';

void main() {
  const key = 'searchBeneficiary::A';
  final action = ActionConfig(
      action: '', actionType: 'LOAD_UNIQUE_ID_POOL', properties: const {});

  late MockUniqueIdPoolRepo repo;

  setUpAll(setUpUniqueIdFlow);
  setUp(() {
    resetRegistry();
    repo = MockUniqueIdPoolRepo();
    // The device holds rows for U1 only (downloaded by U1); the stub answers
    // like the local repository: exact match on status and userUuid.
    final rows = [
      poolRow('SMC-0001', userUuid: 'U1', createdTime: 1000),
      poolRow('SMC-0002', userUuid: 'U1', createdTime: 2000),
    ];
    when(() => repo.search(any())).thenAnswer((invocation) async {
      final q = invocation.positionalArguments.single as UniqueIdPoolSearchModel;
      return rows
          .where((r) =>
              (q.status == null || r.status == q.status) &&
              (q.userUuid == null || r.userUuid == q.userUuid))
          .toList();
    });
  });
  tearDown(() {
    resetRegistry();
    resetSingleton();
  });

  Future<FlowCrudState> run(WidgetTester tester) async {
    final context = await pumpContext(tester, repo: repo);
    FlowCrudStateRegistry()
        .updateByCompositeKey(key, const FlowCrudState(widgetData: {}));
    await LoadUniqueIdPoolExecutor()
        .execute(action, context, {'wrappers': const [], '_compositeKey': key});
    return FlowCrudStateRegistry().getByCompositeKey(key)!;
  }

  testWidgets('T8: U2 logged in -> the query carries U2 and the pool is empty',
      (tester) async {
    setSingleton(userUuid: 'U2');

    final state = await run(tester);

    final query = verify(() => repo.search(captureAny())).captured.single
        as UniqueIdPoolSearchModel;
    expect(query.userUuid, 'U2');
    expect(query.status, unAssigned);
    expect(state.widgetData?['uniqueIdPoolCount'], 0);
    expect(state.widgetData?['latestBeneficiaryId'], isNull,
        reason: 'the popup "Skip and continue" then passes null -> DEFAULT uuid');
  });

  testWidgets('T8 (control): U1 logged in -> sees its own rows',
      (tester) async {
    setSingleton(userUuid: 'U1');

    final state = await run(tester);

    expect(state.widgetData?['uniqueIdPoolCount'], 2);
    expect(state.widgetData?['latestBeneficiaryId'], 'SMC-0001');
  });

  testWidgets('T8 (edge): no logged-in user -> the filter is dropped, everything counts',
      (tester) async {
    resetSingleton(); // loggedInUser null -> userUuid null -> no filter

    final state = await run(tester);

    final query = verify(() => repo.search(captureAny())).captured.single
        as UniqueIdPoolSearchModel;
    expect(query.userUuid, isNull);
    expect(state.widgetData?['uniqueIdPoolCount'], 2);
  });
}
