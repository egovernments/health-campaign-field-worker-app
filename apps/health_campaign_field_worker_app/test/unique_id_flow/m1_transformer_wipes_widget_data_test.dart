// T1 - RC-01: FETCH_TRANSFORMER_CONFIG must update only the form data of the
// screen's state. It used to replace the whole state with
// const FlowCrudState().copyWith(formData: ...), so a transformer run from a
// search result card wiped the results and the widget data (search bar, pool
// count, next beneficiary ID), and Register fell back to a DEFAULT ID.
import 'package:digit_flow_builder/action_handler/action_config.dart';
import 'package:digit_flow_builder/action_handler/executors/transformer_executor.dart';
import 'package:digit_flow_builder/blocs/flow_crud_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/unique_id_test_support.dart';

void main() {
  const key = 'searchBeneficiary::A';

  setUpAll(setUpUniqueIdFlow);
  setUp(() {
    resetRegistry();
    setSingleton();
  });
  tearDown(() {
    resetRegistry();
    resetSingleton();
  });

  ActionConfig fetchTransformer() => ActionConfig(
        action: '',
        actionType: 'FETCH_TRANSFORMER_CONFIG',
        properties: {'configName': 'bulkProjectBeneficiaryFromMembers'},
      );

  testWidgets('T1: the transformer keeps widget data and results',
      (tester) async {
    FlowCrudStateRegistry().updateByCompositeKey(key, seededSearchState());
    final before = FlowCrudStateRegistry().getByCompositeKey(key)!;
    expect(before.widgetData?['latestBeneficiaryId'], 'SMC-0001');
    expect(before.widgetData?['uniqueIdPoolCount'], 40);
    expect(before.widgetData?['searchBar'], 'John');
    expect(before.stateWrapper, isNotEmpty);
    expect(before.formData, isNotEmpty);

    final context = await pumpContext(tester);

    // The search-result card action (config :2529-2567) carries no formData;
    // the composite key is what the layout renderer injects.
    final out = await TransformerExecutor().execute(
      fetchTransformer(),
      context,
      {'wrappers': const [], '_compositeKey': key},
    );

    final after = FlowCrudStateRegistry().getByCompositeKey(key)!;
    expect(after.widgetData?['latestBeneficiaryId'], 'SMC-0001');
    expect(after.widgetData?['uniqueIdPoolCount'], 40);
    expect(after.widgetData?['searchBar'], 'John');
    expect(after.stateWrapper, before.stateWrapper, reason: 'results are kept');
    expect(after.formData, isNull,
        reason: 'form data is replaced exactly as before: none in the context');
    expect(out['entities'], isEmpty,
        reason: 'no individuals in context: nothing is mapped');
  });

  testWidgets('T1: with formData in the context only formData changes',
      (tester) async {
    FlowCrudStateRegistry().updateByCompositeKey(key, seededSearchState());
    final context = await pumpContext(tester);

    await TransformerExecutor().execute(
      fetchTransformer(),
      context,
      {
        'wrappers': const [],
        '_compositeKey': key,
        'formData': {'x': 1},
      },
    );

    final after = FlowCrudStateRegistry().getByCompositeKey(key)!;
    expect(after.formData, {'x': 1});
    expect(after.widgetData?['searchBar'], 'John');
    expect(after.stateWrapper, isNotEmpty);
  });

  testWidgets('T1: without a composite key the write lands on the bare config name',
      (tester) async {
    // Without `_compositeKey` and without route args, getEffectiveCompositeKey
    // falls back to contextData['parentScreenKey'] (no instanceId), i.e. the
    // bare screen key: the write never reaches the instance's composite key.
    FlowCrudStateRegistry().updateByCompositeKey(key, seededSearchState());
    final context = await pumpContext(tester);

    await TransformerExecutor().execute(
      fetchTransformer(),
      context,
      {'wrappers': const [], 'parentScreenKey': 'searchBeneficiary'},
    );

    expect(FlowCrudStateRegistry().getByCompositeKey(key)!.widgetData,
        isNotNull,
        reason: 'the instance state is untouched');
    final bare = FlowCrudStateRegistry().getByCompositeKey('searchBeneficiary');
    expect(bare, isNotNull, reason: 'the write went to the bare screen key');
    expect(bare!.widgetData, isNull);
  });
}
