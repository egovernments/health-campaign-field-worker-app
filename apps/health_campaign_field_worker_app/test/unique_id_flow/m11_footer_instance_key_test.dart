// T11 - RC-02 (a): a footer bound to its own instance key reads its own
// search bar.
//
// LayoutRenderer used to map the header and footer with the bare screen name
// only, so the footer's Register gate `{{searchBar}} == null` read the newest
// search screen instance. Reproduced on a device on 2026-10-30: after the
// overview's Back link opened a second search screen, the first one kept its
// text but its Register button stayed disabled. The renderer now passes the
// instance key to header and footer; this test pins the state lookup that
// makes that work.
import 'package:digit_flow_builder/blocs/flow_crud_bloc.dart';
import 'package:digit_flow_builder/utils/flow_widget_state.dart';
import 'package:digit_flow_builder/widget_registry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/unique_id_test_support.dart';

void main() {
  const bare = 'searchBeneficiary';
  const keyA = '$bare::S1';
  const keyB = '$bare::S2';

  setUpAll(setUpUniqueIdFlow);
  setUp(() {
    resetRegistry();
    final registry = FlowCrudStateRegistry();
    registry.registerInstance(bare, 'S1');
    registry.update(keyA, seededSearchState(searchBar: 'Dupe'));
    registry.registerInstance(bare, 'S2');
    registry.update(keyB, seededSearchState(searchBar: ''));
  });
  tearDown(resetRegistry);

  Future<WidgetStateContext> stateUnder(
      WidgetTester tester, String? compositeKey) async {
    late WidgetStateContext state;
    await tester.pumpWidget(MaterialApp(
      home: CrudItemContext(
        screenKey: bare,
        compositeKey: compositeKey ?? bare,
        child: Builder(builder: (context) {
          state = WidgetStateContext.of(context);
          return const SizedBox.shrink();
        }),
      ),
    ));
    return state;
  }

  testWidgets('T11: with the instance key the older screen reads its own text',
      (tester) async {
    final state = await stateUnder(tester, keyA);

    expect(state.compositeKey, keyA);
    expect(FlowCrudStateRegistry().get(state.compositeKey!)?.widgetData?['searchBar'],
        'Dupe',
        reason: 'Register on screen A is enabled by A\'s own search bar');
  });

  testWidgets('T11: with only the screen name it reads the newest instance',
      (tester) async {
    final state = await stateUnder(tester, null);

    expect(FlowCrudStateRegistry().get(state.compositeKey!)?.widgetData?['searchBar'],
        '',
        reason: 'the bare name resolves to S2, whose empty bar disables Register');
  });
}
