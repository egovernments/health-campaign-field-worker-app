// T2 - RC-02: every bare-key write lands on whatever instance `_instanceIds`
// currently points to, and dispose never rewinds the pointer. LayoutRenderer
// now maps header and footer with the instance key (see T11), so the footer no
// longer reads through the bare key; this pins the registry behaviour itself.
import 'package:digit_flow_builder/blocs/flow_crud_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/unique_id_test_support.dart';

void main() {
  const bare = 'searchBeneficiary';
  const s1 = 'S1';
  const s2 = 'S2';

  setUpAll(setUpUniqueIdFlow);
  setUp(resetRegistry);
  tearDown(resetRegistry);

  test('T2: bare-key writes drift to the newest instance; dispose keeps it',
      () {
    final registry = FlowCrudStateRegistry();

    // Instance A (S1) registers and writes through the bare key.
    registry.registerInstance(bare, s1);
    final stateA = seededSearchState(searchBar: 'A', latestId: 'SMC-0001');
    registry.update(bare, stateA);
    expect(registry.getByCompositeKey('$bare::$s1')?.widgetData?['searchBar'],
        'A',
        reason: 'the bare write lands in searchBeneficiary::S1');

    // Instance B (S2) registers and writes through the bare key.
    registry.registerInstance(bare, s2);
    final stateB = seededSearchState(searchBar: 'B', latestId: 'SMC-0002');
    registry.update(bare, stateB);
    expect(registry.getByCompositeKey('$bare::$s2')?.widgetData?['searchBar'],
        'B');
    expect(registry.getByCompositeKey('$bare::$s1')?.widgetData?['searchBar'],
        'A',
        reason: 'S1 is untouched by the S2 write');

    // B is popped: FlowCrudBloc.close disposes by composite key only.
    registry.disposeByCompositeKey('$bare::$s2');

    expect(registry.getInstanceId(bare), s2,
        reason: 'dispose never rewinds _instanceIds to S1');
    expect(registry.get(bare), isNull,
        reason: 'the bare key now reads the disposed S2 slot, not S1');
    expect(registry.getByCompositeKey('$bare::$s1')?.widgetData?['searchBar'],
        'A',
        reason: 'S1 still holds its data but nobody reads it through the bare key');

    final bareNotifier = registry.listen(bare);
    expect(bareNotifier.value, isNull);
    expect(identical(bareNotifier, registry.listenByCompositeKey('$bare::$s2')),
        isTrue,
        reason: 'listen(bare) gives a fresh null notifier on the S2 slot');

    // A later bare write (e.g. the loader or the search bar on A, after
    // didPopNext) lands on the disposed S2 slot, never on S1.
    final stateC = seededSearchState(searchBar: 'C', latestId: 'SMC-0003');
    registry.update(bare, stateC);
    expect(registry.getByCompositeKey('$bare::$s2')?.widgetData?['searchBar'],
        'C');
    expect(registry.getByCompositeKey('$bare::$s1')?.widgetData?['searchBar'],
        'A');
  });

  test('T2 (doc): disposeIfOwner would rewind the owner, but has no callers',
      () {
    final registry = FlowCrudStateRegistry();
    registry.registerInstance(bare, s1);
    registry.update(bare, seededSearchState(searchBar: 'A'));
    registry.registerInstance(bare, s2);
    registry.update(bare, seededSearchState(searchBar: 'B'));

    // Not the owner: skipped.
    expect(registry.disposeIfOwner(bare, s1), isFalse);
    expect(registry.getInstanceId(bare), s2);

    // The owner: cleared. Production never calls this (grep: only the
    // definitions in flow_crud_bloc.dart and search_state_manager.dart).
    expect(registry.disposeIfOwner(bare, s2), isTrue);
    expect(registry.getInstanceId(bare), isNull);
    expect(registry.get(bare), isNull,
        reason: 'with no owner the bare key is the bare key itself (empty)');
    expect(registry.getByCompositeKey('$bare::$s1')?.widgetData?['searchBar'],
        'A',
        reason: 'even then S1 is not re-pointed; its state is only reachable by composite key');
  });

  test('T2 (doc): clearAll empties instanceIds but keeps the notifiers', () {
    final registry = FlowCrudStateRegistry();
    registry.registerInstance(bare, s1);
    registry.update(bare, seededSearchState(searchBar: 'A'));
    final notifier = registry.listenByCompositeKey('$bare::$s1');

    registry.clearAll();

    expect(registry.getInstanceId(bare), isNull);
    expect(notifier.value, isNull);
    expect(identical(registry.listenByCompositeKey('$bare::$s1'), notifier),
        isTrue,
        reason: 'clearAll nulls the values; it does not remove the entries');
  });
}
