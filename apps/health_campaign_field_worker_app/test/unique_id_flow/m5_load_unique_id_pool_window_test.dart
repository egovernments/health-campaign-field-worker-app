// T5 - RC-04 (fire-and-forget init action) and RC-08 (ruled out: the loader
// write is NOT dropped once a state exists).
import 'dart:async';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_flow_builder/action_handler/action_config.dart';
import 'package:digit_flow_builder/blocs/flow_crud_bloc.dart';
import 'package:digit_flow_builder/utils/flow_widget_state.dart';
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
    setSingleton(userUuid: 'U1');
    repo = MockUniqueIdPoolRepo();
  });
  tearDown(() {
    resetRegistry();
    resetSingleton();
  });

  testWidgets('T5 (a): the window, then the write merges into the seeded state',
      (tester) async {
    final completer = Completer<List<UniqueIdPoolModel>>();
    when(() => repo.search(any())).thenAnswer((_) => completer.future);
    final context = await pumpContext(tester, repo: repo);

    // Fire-and-forget, as ScreenBuilder does (no await).
    final pending = LoadUniqueIdPoolExecutor()
        .execute(action, context, {'wrappers': const [], '_compositeKey': key});
    await tester.pump();

    final query =
        verify(() => repo.search(captureAny())).captured.single
            as UniqueIdPoolSearchModel;
    expect(query.status, unAssigned);
    expect(query.userUuid, 'U1');
    expect(query.id, isNull);

    // The window: the query is in flight, nothing is in the registry, so
    // hasMinimumBeneficiaryId(min, null) is false and the popup variant shows.
    expect(FlowCrudStateRegistry().getByCompositeKey(key), isNull);

    // The user types a name: the search bar writes through the production
    // path (WidgetStateContext.updateWidgetData) and creates the state.
    WidgetStateContext(compositeKey: key).updateWidgetData('searchBar', 'John');
    expect(FlowCrudStateRegistry().getByCompositeKey(key)?.widgetData,
        {'searchBar': 'John'});

    completer.complete([
      poolRow('SMC-2000', createdTime: 2000),
      poolRow('SMC-1000', createdTime: 1000),
    ]);
    final out = await pending;

    final state = FlowCrudStateRegistry().getByCompositeKey(key)!;
    expect(state.widgetData?['uniqueIdPoolCount'], 2);
    expect(state.widgetData?['latestBeneficiaryId'], 'SMC-1000',
        reason: '"latest" is the OLDEST row by auditDetails.createdTime');
    expect(state.widgetData?['latestBeneficiaryIdModel'],
        isA<UniqueIdPoolModel>());
    expect(state.widgetData?['searchBar'], 'John',
        reason: 'the seeded key is kept (RC-08 ruled out)');
    expect(out['uniqueIdPoolCount'], 2);
    expect(out['latestBeneficiaryId'], 'SMC-1000');
  });

  testWidgets('T5 (b): with no state at all the write is dropped silently',
      (tester) async {
    when(() => repo.search(any())).thenAnswer(
        (_) async => [poolRow('SMC-2000', createdTime: 2000)]);
    final context = await pumpContext(tester, repo: repo);

    final out = await LoadUniqueIdPoolExecutor()
        .execute(action, context, {'wrappers': const [], '_compositeKey': key});

    expect(FlowCrudStateRegistry().getByCompositeKey(key), isNull,
        reason: 'currentState null -> updatedState null -> no registry write');
    expect(out['uniqueIdPoolCount'], 1,
        reason: 'the returned map carries the count, but init actions discard it');
    expect(out['latestBeneficiaryId'], 'SMC-2000');
  });

  testWidgets('T5 (c): without a repository provider the input is returned unchanged',
      (tester) async {
    final context = await pumpContext(tester);
    final input = {'wrappers': const [], '_compositeKey': key};

    final out =
        await LoadUniqueIdPoolExecutor().execute(action, context, input);

    expect(identical(out, input), isTrue,
        reason: 'context.read throws, the catch returns contextData');
    expect(FlowCrudStateRegistry().getByCompositeKey(key), isNull);
  });

  testWidgets('T5 (d): without a composite key nothing is queried',
      (tester) async {
    when(() => repo.search(any())).thenAnswer((_) async => []);
    final context = await pumpContext(tester, repo: repo);

    final input = {'wrappers': const []};
    final out =
        await LoadUniqueIdPoolExecutor().execute(action, context, input);

    expect(identical(out, input), isTrue);
    verifyNever(() => repo.search(any()));
  });
}
