// T4 - RC-04 (loader window) and RC-06 (minCount 0):
// hasMinimumBeneficiaryId(min, count) is false while the count is absent, and
// true for min 0 with no count at all.
import 'package:digit_flow_builder/utils/conditional_evaluator.dart';
import 'package:digit_flow_builder/utils/function_registry.dart';
import 'package:digit_flow_builder/utils/interpolation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/unique_id_test_support.dart';

void main() {
  const popupVisible =
      "{{fn:hasMinimumBeneficiaryId(singleton.beneficiaryIdMinCount, uniqueIdPoolCount)}}==false";
  const registerVisible =
      "{{fn:hasMinimumBeneficiaryId(singleton.beneficiaryIdMinCount, uniqueIdPoolCount)}}==true";

  setUpAll(setUpUniqueIdFlow);
  setUp(resetRegistry);
  tearDown(() {
    resetRegistry();
    resetSingleton();
  });

  dynamic call(List<dynamic> args) => FunctionRegistry.call(
      'hasMinimumBeneficiaryId', args, CrudStateData({}, []));

  group('T4: direct calls', () {
    test('(10, null) -> false: no count yet means "not enough" (RC-04)', () {
      expect(call([10, null]), isFalse);
    });

    test('(10, 40) -> true', () {
      expect(call([10, 40]), isTrue);
    });

    test('(null, 40) -> false: minCount unset is never satisfied', () {
      expect(call([null, 40]), isFalse);
    });

    test('(0, null) -> TRUE: minCount 0 passes with no count at all (RC-06)',
        () {
      expect(call([0, null]), isTrue);
    });

    test("('10', '40') -> true: strings are parsed", () {
      expect(call(['10', '40']), isTrue);
    });

    test('() -> false', () {
      expect(call([]), isFalse);
    });
  });

  group('T4: through the config expression', () {
    bool popup(Map<String, dynamic> widgetData) {
      return ConditionalEvaluator.evaluate(
            popupVisible,
            evalContextWith(widgetData: widgetData),
            screenKey: 'searchBeneficiary::X',
            stateData: CrudStateData({}, []),
            widgetdata: widgetData,
          ) ==
          true;
    }

    bool register(Map<String, dynamic> widgetData) {
      return ConditionalEvaluator.evaluate(
            registerVisible,
            evalContextWith(widgetData: widgetData),
            screenKey: 'searchBeneficiary::X',
            stateData: CrudStateData({}, []),
            widgetdata: widgetData,
          ) ==
          true;
    }

    test('minCount 10: no count -> popup variant (the RC-04 window)', () {
      setSingleton(minCount: 10);
      expect(popup({'searchBar': 'John'}), isTrue);
      expect(register({'searchBar': 'John'}), isFalse);
    });

    test('minCount 10: count 40 -> no popup, direct Register', () {
      setSingleton(minCount: 10);
      expect(popup({'uniqueIdPoolCount': 40}), isFalse);
      expect(register({'uniqueIdPoolCount': 40}), isTrue);
    });

    test('minCount 10: count 5 -> popup', () {
      setSingleton(minCount: 10);
      expect(popup({'uniqueIdPoolCount': 5}), isTrue);
    });

    test('minCount unset: count 40 -> popup always', () {
      setSingleton(minCount: null);
      expect(popup({'uniqueIdPoolCount': 40}), isTrue);
      expect(register({'uniqueIdPoolCount': 40}), isFalse);
    });

    test('minCount 0: empty pool (count 0) -> direct Register, no popup (RC-06)',
        () {
      setSingleton(minCount: 0);
      expect(popup({'uniqueIdPoolCount': 0}), isFalse);
      expect(register({'uniqueIdPoolCount': 0}), isTrue);
      // And before the loader returned at all:
      expect(register({'searchBar': 'John'}), isTrue);
    });
  });
}
