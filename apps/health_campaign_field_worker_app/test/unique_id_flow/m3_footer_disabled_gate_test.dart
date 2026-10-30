// T3 - RC-02 (a): the footer "Register" button's `disabled` gate, evaluated
// exactly as ResolvedFlowWidget does. When the key it reads holds no
// searchBar (wrong instance, or wiped by RC-01) the button is disabled.
import 'package:digit_flow_builder/blocs/flow_crud_bloc.dart';
import 'package:digit_flow_builder/utils/conditional_evaluator.dart';
import 'package:digit_flow_builder/utils/interpolation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/unique_id_test_support.dart';

void main() {
  const gate = "{{searchBar}} == null || {{searchBar}} == ''";
  const key = 'searchBeneficiary::S1';

  setUpAll(setUpUniqueIdFlow);
  setUp(resetRegistry);
  tearDown(resetRegistry);

  /// Mirrors resolved_flow_widget.dart: evalContext + screenKey + widgetdata.
  dynamic disabled(Map<String, dynamic> widgetData) {
    return ConditionalEvaluator.evaluate(
      gate,
      evalContextWith(widgetData: widgetData),
      screenKey: key,
      stateData: CrudStateData({}, []),
      widgetdata: widgetData,
    );
  }

  test('T3: no searchBar in widget data -> true (disabled)', () {
    expect(disabled({}), isTrue);
    expect(disabled({'uniqueIdPoolCount': 40}), isTrue);
  });

  test("T3: searchBar 'John' -> false (enabled)", () {
    expect(disabled({'searchBar': 'John'}), isFalse);
  });

  test('T3: registry fallback - seeded key enables, a const overwrite disables',
      () {
    // Empty widgetdata makes the evaluator fall back to the registry entry
    // for screenKey (the same key the button was mapped with).
    FlowCrudStateRegistry().updateByCompositeKey(
        key, seededSearchState(searchBar: 'John'));
    expect(disabled({}), isFalse,
        reason: 'the seeded registry entry carries searchBar');

    // The RC-01 outcome: TransformerExecutor replaces the entry with
    // const FlowCrudState().copyWith(formData: ...), widgetData gone.
    FlowCrudStateRegistry().updateByCompositeKey(key, const FlowCrudState());
    expect(disabled({}), isTrue,
        reason: 'after the wipe the gate reads null and disables the button');
  });

  test("T3 (quirk, not a cause): searchBar '' -> false (enabled)", () {
    // '' is substituted verbatim, the expression becomes " == null ||  == ''",
    // the parser fails and evaluateExpression returns false.
    expect(disabled({'searchBar': ''}), isFalse);
  });
}
